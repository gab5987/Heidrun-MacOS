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
            
            MainContent();
        }
        .frame(minWidth: 600, minHeight: 400);
        //.padding()
    }
}

struct MainContent: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Trying some stuff yk")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
