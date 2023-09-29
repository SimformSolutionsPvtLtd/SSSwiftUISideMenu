//
//  ContentView.swift
//  SSSwiftUISideMenu
//
//  Created by Parth Dumaswala on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen: Bool = false
    
    var body: some View {
        
        ZStack {
            if !self.isOpen {
                
                VStack {
                    Button(action: {
                        
                        //Open side menu.
                        self.openMenu()
                        
                    }, label: {
                        Text("Open Side menu")
                    })
                }
            }
            
            //Replace or modify MenuContent as per the requirement UI.
            
            SSSideMenu(menuContent: AnyView(MenuContent()), isOpen: self.isOpen, menuClose: self.openMenu)
            
            ZStack {
                
            }
        }
    }
    
    func openMenu() {
        self.isOpen.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
