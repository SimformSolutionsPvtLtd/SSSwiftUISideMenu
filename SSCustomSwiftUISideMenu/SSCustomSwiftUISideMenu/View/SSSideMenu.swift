//
//  SSSideMenu.swift
//  SSCustomSwiftUISideMenu
//
//  Created by Parth Dumaswala on 15/11/22.
//

import SwiftUI

struct SSSideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    @Binding var isOpen: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15, content: {
            
            //Menu items..
            VStack(alignment: .leading, spacing: 10) {
             
                TabButton(image: "house", title: MenuItem.home.rawValue, animation: animation, selectedTab: $selectedTab, isOpen: $isOpen)
                
                TabButton(image: "person.text.rectangle.fill", title: MenuItem.myFriends.rawValue, animation: animation, selectedTab: $selectedTab, isOpen: $isOpen)
                
                TabButton(image: "gearshape.fill", title: MenuItem.setting.rawValue, animation: animation, selectedTab: $selectedTab, isOpen: $isOpen)
                
                TabButton(image: "rectangle.portrait.and.arrow.right", title: "Logout", animation: animation, selectedTab: $selectedTab, isOpen: $isOpen)
            }
            .padding(.leading, -15)
            .padding(.top, 20)
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SSSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
