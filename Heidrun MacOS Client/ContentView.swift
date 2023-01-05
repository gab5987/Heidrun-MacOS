//
//  ContentView.swift
//  Heidrun MacOS Client
//
//  Created by Gabriel on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
        NavigationView {
            SideBar();
            
            DashBoard();
        }
        .frame(minWidth: 1000, minHeight: 600);
        //.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
