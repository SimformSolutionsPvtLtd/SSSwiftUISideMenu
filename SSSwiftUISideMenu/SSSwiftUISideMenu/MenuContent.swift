//
//  MenuContent.swift
//  SSSwiftUISideMenu
//
//  Created by Parth Dumaswala on 19/10/22.
//

import SwiftUI

public struct MenuContent: View {
    
    let menuItems = [
        MenuItem(name: "Home", icon: "homekit"),
        MenuItem(name: "My Friends", icon: "person.text.rectangle.fill"),
        MenuItem(name: "Settings", icon: "seal.fill"),
        MenuItem(name: "Logout", icon: "rectangle.portrait.and.arrow.right")
    ]
    
    public var body: some View {
        
        List(menuItems) { menuItemIs in
            MenuItemRow(menuItem: menuItemIs)
        }.listStyle(.plain)
    }
}

struct MenuItem: Identifiable {
    
    let id = UUID()
    let name: String
    let icon: String
}

struct MenuItemRow: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        
        HStack {
            Image(systemName: menuItem.icon)
                .foregroundColor(.black)
            Text(menuItem.name).onTapGesture {
                print("On click: \(menuItem.name)")
            }
            .padding(.leading, 2)
        }
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
