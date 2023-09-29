//
//  Home.swift
//  SSCustomSwiftUISideMenu
//
//  Created by Parth Dumaswala on 15/11/22.
//

import SwiftUI

struct Home: View {
    
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
    
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tag(MenuItem.home)
            
            MyFriendsView()
                .tag(MenuItem.myFriends)
            
            SettingsView()
                .tag(MenuItem.setting)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Container Views..
struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            
            Text("")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle(MenuItem.home.rawValue)
        }
    }
}


struct MyFriendsView: View {
    
    var body: some View {
        
        NavigationView {
            
            Text("")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle(MenuItem.myFriends.rawValue)
        }
    }
}

struct SettingsView: View {
    
    var body: some View {
        
        NavigationView {
            
            Text("")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle(MenuItem.setting.rawValue)
        }
    }
}
