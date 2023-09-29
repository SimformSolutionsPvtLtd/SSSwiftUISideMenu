//
//  MainView.swift
//  SSCustomSwiftUISideMenu
//
//  Created by Parth Dumaswala on 15/11/22.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab = MenuItem.home.rawValue
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        ZStack {
            Color(.brown)
                .ignoresSafeArea()
            
            //Side menu..
            SSSideMenu(selectedTab: $selectedTab, isOpen: $showMenu)
                
            ZStack {
                Home(selectedTab: $selectedTab)
                NavigationView {
                    Text("")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .navigationTitle($selectedTab)
                }
            }
            
            //Scale and Move view..
            .scaleEffect(showMenu ? 1: 1)
            .offset(x: showMenu ? getRect().width - 100 : 0)
            .ignoresSafeArea()
            .overlay(
                
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                }, label: {
                    Text(showMenu ? "" : "Open Side Menu")
                })
                .padding()
            )
        }.gesture(drag)
            .onTapGesture {
                withAnimation {
                    self.showMenu = false
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
