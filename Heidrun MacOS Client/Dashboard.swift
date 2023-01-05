//
//  Dashboard.swift
//  Heidrun MacOS Client
//
//  Created by Gabriel on 04/01/23.
//

import Foundation
import SwiftUI

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

            Text(service.name)
                .font(.title)
        }
        .frame(width: 180, height: 60)
        .background(Color.init(red: 57/255, green: 63/255, blue: 73/255))
//        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct DashBoard: View {
    
    let services: [[ServicesItems]] = [
        [
            .init(name: "Lorem", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Ipsum", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Dolor", icon: "gear", status: true, addressIP: "192.168.0.86"),
        ],
        [
            .init(name: "Sit", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Amet", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Algum", icon: "gear", status: true, addressIP: "192.168.0.86"),
        ],
        [
            .init(name: "Texto", icon: "gear", status: true, addressIP: "192.168.0.86"),
            .init(name: "Teste", icon: "gear", status: true, addressIP: "192.168.0.86"),
            //.init(name: "AAAAA", icon: "gear", status: true, addressIP: "192.168.0.86"),
        ]
    ];
    var items: [GridItem] {
      Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
    }
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Dasboard")
                    .font(.title.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(services, id: \.self) { service in
                  LazyVGrid(columns: threeColumnGrid, spacing: 10) {
                      ServiceView(service: service[0]);
                      if(service.count > 1) { ServiceView(service: service[1]) }
                      if(service.count > 2) { ServiceView(service: service[2]) }
                  }
                  .padding(.horizontal)
                }
              }
            
            VStack(alignment: .center) {
                /*
                 
        
                HStack {
                    ForEach(services, id: \.self) { service in
                        ServiceView(service: service);
                    }
                }.frame(maxWidth: 600)
                 
                 */
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Trying some stuff yk")
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .background(Color.init(red: 17/255, green: 24/255, blue: 34/255))
        Spacer()
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

/*
 
 struct ContentView: View {
     let data = (1...100).map { "Item \($0)" }

     let columns = [
         GridItem(.adaptive(minimum: 80))
     ]

     var body: some View {
         ScrollView {
             LazyVGrid(columns: columns, spacing: 20) {
                 ForEach(data, id: \.self) { item in
                     Text(item)
                 }
             }
             .padding(.horizontal)
         }
         .frame(maxHeight: 300)
     }
 }
 */
