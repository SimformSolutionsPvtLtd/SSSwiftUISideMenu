//
//  SSSwiftUISideMenu.swift
//  SSSwiftUISideMenu
//
//  Created by Parth Dumaswala on 31/10/23.
//

import SwiftUI

public struct MenuItem : Hashable {
    
    var title : String
    var icon : String
}

public struct SSSwiftUISideMenu: View {
    
    @Binding var openSideMenu: Bool
    @Binding var selectedIndex: Int
    @State var menuItems: [MenuItem]
    let menuConfig: SSMenuConfig
    
    public init(
        openSideMenu: Binding<Bool>,
        selectedIndex: Binding<Int>,
        menuItems: [MenuItem],
        menuConfig: SSMenuConfig = SSMenuConfig()
    ) {
        self._openSideMenu = openSideMenu
        self._selectedIndex = selectedIndex
        self.menuItems = menuItems
        self.menuConfig = menuConfig
    }
    
    public var body: some View {
        
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.openSideMenu ? 1.0 : 0.0)
            .animation(menuConfig.animationType.delay(0.25), value: 0)
            
            HStack {
                
                VStack {
                    VStack(alignment: .leading, spacing: menuConfig.rowPadding) {
                        
                        ForEach(0..<menuItems.count, id: \.self) { value in
                            
                            Button(action: {
                                withAnimation(.spring()) {
                                    self.selectedIndex = value
                                    self.openSideMenu.toggle()
                                }
                            }, label: {
                                HStack(spacing: menuConfig.imageToTitlePadding) {
                                    Image(menuItems[value].icon)
                                        .renderingMode(.template)
                                        .foregroundColor(menuConfig.iconTintColor)
                                        .frame(width: menuConfig.iconWidth, height: menuConfig.iconHeight)
                                    Text(menuItems[value].title)
                                        .font(menuConfig.titleFont)
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(selectedIndex == value ? menuConfig.selectedTitleColor : menuConfig.titleColor)
                                .padding(.vertical, menuConfig.rowPadding)
                                .padding(.horizontal, menuConfig.leftIconPadding)
                                .frame(maxWidth: UIScreen.main.bounds.width - 170, alignment: .leading)
                            })
                            
                        }
                    }
                    .padding(.top, menuConfig.topPadding)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                .frame(width: menuConfig.menuWidth)
                .background(menuConfig.backgroundColor)
                .offset(x: self.openSideMenu ? 0 : -menuConfig.menuWidth)
                .animation(menuConfig.animationType, value: openSideMenu)
                Spacer()
            }
        }
    }
}
