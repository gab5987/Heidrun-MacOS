//
//  Dashboard.swift
//  Heidrun MacOS Client
//
//  Created by Gabriel on 04/01/23.
//

import Foundation
import SwiftUI

// constants
let servicesPopWidth: CGFloat = 330;
let servicesPopHeight: CGFloat = 80;

struct ServicesItems: Hashable {
    let name: String;
    let icon: String;
    
    let status: Bool;
    let addressIP: String;
}

struct ServiceView: View {
    let service: ServicesItems;
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .inset(by: 1)
                .fill(Color.init(red: 39/255, green: 45/255, blue: 55/255))
                .cornerRadius(10)
            
            HStack {
                Image(systemName: service.icon)
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Spacer().frame(width: 10)
                
                VStack(alignment: .leading) {
                    Text("Hostname:").foregroundColor(Color.gray);
                    Text("Status:").foregroundColor(Color.gray);
                    Text("Address:").foregroundColor(Color.gray);
                }
                
                Spacer().frame(width: 100)
                
                VStack(alignment: .trailing) {
                    Text(service.name);
                    
                    if(service.status) {
                        Text("· ONLINE").foregroundStyle(.green);
                    } else {
                        Text("· OFFLINE").foregroundStyle(.red);
                    }
                    
                    Text(service.addressIP).font(.caption).foregroundColor(Color.gray)
                }.frame(alignment: .trailing)
            }
            
        }
        .frame(width: servicesPopWidth, height: servicesPopHeight)
        .background(Color.init(red: 57/255, green: 63/255, blue: 73/255))
//        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct DashBoard: View {
    
    let services: [[ServicesItems]] = [
        [
            .init(name: "Server", icon: "server.rack", status: true, addressIP: "192.168.0.86"),
            .init(name: "Actuator", icon: "gear", status: false, addressIP: "192.168.0.86"),
            .init(name: "Cloud Storage", icon: "cloud.fill", status: true, addressIP: "192.168.0.86"),
        ],
        [
            .init(name: "Power Actuator", icon: "powerplug", status: false, addressIP: "192.168.0.86"),
            .init(name: "Actuator", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Internet Access", icon: "network", status: true, addressIP: "192.168.0.86"),
        ],
        [
            .init(name: "Sensor 1", icon: "sensor", status: false, addressIP: "192.168.0.86"),
            .init(name: "Sensor 2", icon: "sensor", status: true, addressIP: "192.168.0.86"),
            //.init(name: "AAAAA", icon: "gear", status: true, addressIP: "192.168.0.86"),
        ]
    ];

    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        // frame begin
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Dasboard")
                    .font(.title.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            
            VStack(alignment: .center) {
                ForEach(services, id: \.self) { service in
                    LazyVGrid(columns: threeColumnGrid, spacing: 10) {
                        ServiceView(service: service[0]);
                        if(service.count > 1) { ServiceView(service: service[1]) }
                        if(service.count > 2) { ServiceView(service: service[2]) }
                    }.padding(.horizontal)
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Trying some stuff yk")
            }
        }
        .frame(
              minWidth: windowMinWidth,
              maxWidth: .infinity,
              minHeight: windowMinHeight,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .background(customColors_bgColor)
        Spacer()
        //frame end
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

