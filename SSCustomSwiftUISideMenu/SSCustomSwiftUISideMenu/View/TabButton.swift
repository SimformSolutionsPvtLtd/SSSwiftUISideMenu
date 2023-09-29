//
//  TabButton.swift
//  SSCustomSwiftUISideMenu
//
//  Created by Parth Dumaswala on 15/11/22.
//

import SwiftUI

enum MenuItem: String {
    case home = "Home"
    case myFriends = "My Friends"
    case setting = "Settings"
}

struct TabButton: View {
    
    var image: String
    var title: String
    var animation: Namespace.ID
    
    @Binding var selectedTab: String
    @Binding var isOpen: Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
                self.isOpen.toggle()
            }
            
        }, label: {
            
            HStack(spacing: 15) {
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? .black : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            //Max frame..
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            
            .background(
                ZStack {
                    if selectedTab == title {
                        
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 12))
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
