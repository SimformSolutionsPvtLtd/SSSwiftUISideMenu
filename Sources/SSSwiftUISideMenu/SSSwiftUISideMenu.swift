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
    
    public init(title: String, icon: String) {
        self.title = title
        self.icon = icon
    }
    
}

@available(iOS 16.0, *)
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
    
    private var viewWidth = UIScreen.main.bounds.width
    public var body: some View {
        
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.black.opacity(0.2))
            .opacity(self.openSideMenu ? 1.0 : 0.0)
            .animation(menuConfig.animationType.delay(0.25), value: 0)
            
            HStack {
                
                VStack {
                    VStack(alignment: .leading, spacing: menuConfig.rowPadding) {
                        List {
                            ForEach(0..<menuItems.count, id: \.self) { value in
                                
                                Button(action: {
                                    withAnimation(.spring()) {
                                        self.selectedIndex = value
                                        if menuConfig.tapToClose { return }
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
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init())
                            .buttonStyle(.plain)
                            .listRowBackground(Color.clear)
                        }
                        .scrollIndicators(.hidden)
                        .listStyle(.plain)
                    }
                    .padding(.top, menuConfig.topPadding)
                    
                    if menuConfig.showAppVersion {
                        VStack() {
                            Text(menuConfig.versionText)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: menuConfig.versionAlignment)
                                .foregroundStyle(menuConfig.versionTitleColor)
                                .font(menuConfig.versionFont)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .frame(width: menuConfig.menuWidth)
                .background(menuConfig.backgroundColor)
                .offset(x: self.openSideMenu ? menuConfig.menuDirection == .left ? 0 : viewWidth - menuConfig.menuWidth : menuConfig.menuDirection == .left ? -menuConfig.menuWidth : viewWidth)
                .animation(menuConfig.animationType, value: openSideMenu)
                Spacer()
            }
            
        }.gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
            .onEnded { value in
                if !menuConfig.swipeToClose { return }
                let horizontalAmount = value.translation.width
                let verticalAmount = value.translation.height
                
                if abs(horizontalAmount) > abs(verticalAmount) {
                    if menuConfig.menuDirection == .left && horizontalAmount < 0 {
                        self.openSideMenu.toggle()
                    } else if menuConfig.menuDirection == .right && horizontalAmount > 0 {
                        self.openSideMenu.toggle()
                    }
                }
            })
        .gesture(
            TapGesture()
                .onEnded { _ in
                    if !menuConfig.tapToClose { return }
                    self.openSideMenu.toggle()
                }
        )
    }
    
}
