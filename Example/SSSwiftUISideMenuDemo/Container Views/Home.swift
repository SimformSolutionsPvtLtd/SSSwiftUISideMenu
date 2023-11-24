//
//  Home.swift
//  SSSwiftUISideMenuDemo
//
//  Created by Parth Dumaswala on 31/10/23.
//

import SwiftUI
import SSSwiftUISideMenu

enum AnimationType: String, CaseIterable {
    case defaultType = "Default"
    case bouncy = "Bouncy"
    case spring = "Spring"
    case easeIn = "EaseIn"
    case easeOut = "EaseOut"
    case easeInOut = "EaseInOut"
    case linear = "Linear"
}

struct Home: View {
    
    // MARK: - Properties
    
    // Binding to control the presentation of the side menu
    @Binding var presentSideMenu: Bool
    
    // Binding to customise the sidemenu
    @Binding var objMenuConfig: SSMenuConfig
    
    // State variables for various configuration options
    @State private var menuDirection = 0
    @State private var swipeToClose = true
    @State private var titleColor: Color = .black
    @State private var iconTintColor: Color = .pink
    @State private var backgroundColor: Color = .white
    @State private var selectedTitleColor: Color = .black
    @State private var selectedAnimation: Animation = .default
    @State private var animationType: AnimationType = .defaultType
    
    // Computed property to update viewModel.menuConfig
    var updatedMenuConfig: SSMenuConfig {
        SSMenuConfig(
            iconTintColor: iconTintColor,
            titleColor: titleColor,
            selectedTitleColor: selectedTitleColor,
            backgroundColor: backgroundColor,
            animationType: selectedAnimation,
            menuDirection: menuDirection == 0 ? .left : .right,
            swipeToClose: swipeToClose
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // Button to toggle the side menu
                    Button {
                        objMenuConfig = updatedMenuConfig
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                // Form for configuring menu settings
                Form {
                    Section(header: Text("Menu Settings")) {
                        // Picker for menu direction
                        Picker("Menu direction", selection: $menuDirection) {
                            Text("Left").tag(0)
                            Text("Right").tag(1)
                        }
                        .pickerStyle(.menu)
                        
                        // Toggle for swipe to close menu
                        Toggle("Swipe to close menu", isOn: $swipeToClose)
                    }
                    
                    Section(header: Text("Animation Settings")) {
                        // Picker for animation type
                        Picker("Animation", selection: $animationType) {
                            ForEach(AnimationType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(.menu)
                        .onChange(of: animationType) {
                            switch animationType {
                                case .defaultType:
                                    selectedAnimation = .default
                                case .bouncy:
                                    selectedAnimation = .bouncy
                                case .spring:
                                    selectedAnimation = .spring
                                case .easeIn:
                                    selectedAnimation = .easeIn
                                case .easeOut:
                                    selectedAnimation = .easeOut
                                case .easeInOut:
                                    selectedAnimation = .easeInOut
                                case .linear:
                                    selectedAnimation = .linear
                            }
                        }
                    }
                    
                    Section(header: Text("UI Customisation")) {
                        // Color pickers for customizing UI colors
                        ColorPicker("Title color", selection: $titleColor)
                        ColorPicker("Selected title color", selection: $selectedTitleColor)
                        ColorPicker("Background color", selection: $backgroundColor)
                        ColorPicker("Icon tint color", selection: $iconTintColor)
                    }
                }
                .padding(.horizontal, -20)
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("SSSwiftUI SideMenu", displayMode: .inline)
        }
        .padding(.horizontal, 24)
    }
}
