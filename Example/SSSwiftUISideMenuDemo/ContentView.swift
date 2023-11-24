//
//  ContentView.swift
//  SSSwiftUISideMenu
//
//  Created by Parth Dumaswala on 31/10/23.
//

import SwiftUI
import SSSwiftUISideMenu

struct ContentView: View {

    //MARK: - Properties
    
    @State private var openSideMenu: Bool = false
    
    @State private var selectedIndex: Int = 0
    
    @State private var menuConfig = SSMenuConfig()
    
    private var menuItems = [
        MenuItem(title: "Home", icon: "home"),
        MenuItem(title: "My Friends", icon: "friends"),
        MenuItem(title: "Settings", icon: "setting"),
        MenuItem(title: "Logout", icon: "logout")
    ]

    var body: some View {
        ZStack {
            
            TabView(selection: $selectedIndex) {
                
                Home(presentSideMenu: $openSideMenu, objMenuConfig: $menuConfig)
                    .tag(0)
                
                MyFriends(presentSideMenu: $openSideMenu)
                    .tag(1)
                
                Settings(presentSideMenu: $openSideMenu)
                    .tag(2)
            }

            SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
        }
    }
}

#Preview {
    ContentView()
}
