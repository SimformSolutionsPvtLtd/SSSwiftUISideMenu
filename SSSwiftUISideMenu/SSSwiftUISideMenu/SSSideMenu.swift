//
//  SideMenu.swift
//  SSSwiftUISideMenu
//
//  Created by Parth Dumaswala on 19/10/22.
//

import SwiftUI

public enum sideMenuPlacement{
    case left, right
}

public enum menuAnimationType{
    case defaultStyle, easeIn, easeOut
}

public struct SSSideMenu: View {
    
    var menuContent: AnyView
    let width: CGFloat
    let isOpen: Bool
    var menuPlacement:sideMenuPlacement = .left
    var animationType:menuAnimationType = .defaultStyle
    let menuClose: () -> Void
    
    public init(menuContent:AnyView, width: CGFloat = 280, isOpen: Bool, menuPlacement: sideMenuPlacement = .left, animationType: menuAnimationType = .defaultStyle, menuClose: @escaping () -> Void) {
        
        self.menuContent = menuContent
        self.width = width
        self.isOpen = isOpen
        self.menuPlacement = menuPlacement
        self.animationType = animationType
        self.menuClose = menuClose
    }
    
    public var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(.easeIn.delay(0.25), value: 0)
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                menuContent
                .frame(width: self.width)
                .background(Color.white)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)
                Spacer()
            }
        }
    }
}
