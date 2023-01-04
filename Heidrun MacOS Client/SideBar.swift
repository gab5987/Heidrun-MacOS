//
//  SideBar.swift
//  Heidrun MacOS Client
//
//  Created by Gabriel on 04/01/23.
//

import Foundation
import SwiftUI

struct SideBarItens: Hashable {
    let name: String;
    let icon: String;
}

struct SideBar: View {
    let sidebarItens: [SideBarItens] = [
        .init(name: "Home", icon: "house"),
        .init(name: "Settings", icon: "gear"),
    ]
    
    var body: some View {
        VStack {
            ForEach(sidebarItens, id: \.self) { Iten in
                HStack {
                    Image(systemName: Iten.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                    Text(Iten.name);
                    Spacer();
                }
                .padding(6);
            }
            Spacer();
        }
        .padding(5);
    }
}
