//
//  Home.swift
//  SSSwiftUISideMenuDemo
//
//  Created by Parth Dumaswala on 31/10/23.
//

import SwiftUI

struct Home: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            Spacer()
            Text("Home")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
