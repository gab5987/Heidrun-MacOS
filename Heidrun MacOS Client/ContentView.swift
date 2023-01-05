//
//  ContentView.swift
//  Heidrun MacOS Client
//
//  Created by Gabriel on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Main")
                NavigationLink(destination: DashBoard()) {
                    Label("Dashboard", systemImage: "house")
                }
                
                Spacer()
                Text("Network Overview")
                NavigationLink(destination: ContentView()) {
                    Label("On the network", systemImage: "externaldrive.badge.wifi")
                }
                NavigationLink(destination: ContentView()) {
                    Label("Server Status", systemImage: "externaldrive.connected.to.line.below")
                }
                
                Divider()
                NavigationLink(destination: ServerSetup()) {
                    Label("Settings", systemImage: "gear")
                }
               
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Explore")
            //Set Sidebar Width (and height)
            .frame(minWidth: 150, idealWidth: 250, maxWidth: 300)
            .toolbar{
                //Toggle Sidebar Button
                ToolbarItem(placement: .navigation){
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            }
            DashBoard()
        }
    }
}

// Toggle Sidebar Function
func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
