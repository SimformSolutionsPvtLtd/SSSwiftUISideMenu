//
//  SSMenuConfig.swift
//  SSSwiftUISideMenuDemo
//
//  Created by Parth Dumaswala on 31/10/23.
//

import Foundation
import SwiftUI

public enum Directions {
    case left, right
}

public struct SSMenuConfig {
    
    private(set) var topPadding: CGFloat
    
    private(set) var leftIconPadding: CGFloat
    
    private(set) var imageToTitlePadding: CGFloat
    
    private(set) var rowPadding: CGFloat
    
    private(set) var iconTintColor: Color
    
    private(set) var iconHeight: CGFloat
    
    private(set) var iconWidth: CGFloat
    
    private(set) var titleFont: Font
    
    private(set) var titleColor: Color
    
    private(set) var selectedTitleColor: Color
    
    private(set) var backgroundColor: Color
    
    private(set) var menuWidth: CGFloat
    
    private(set) var animationType: Animation
    
    private(set) var menuDirection: Directions
    
    public init(
        topPadding: CGFloat = 10,
        leftIconPadding: CGFloat = 0,
        imageToTitlePadding: CGFloat = 15,
        rowPadding: CGFloat = 12,
        iconTintColor: Color = .pink,
        iconHeight: CGFloat = 35,
        iconWidth: CGFloat = 35,
        titleFont: Font = .headline,
        titleColor: Color = .black,
        selectedTitleColor: Color = .black,
        backgroundColor: Color = .white,
        menuWidth: CGFloat = 280,
        animationType: Animation = .default,
        menuDirection: Directions = .left
    ) {
        self.topPadding = topPadding
        self.leftIconPadding = leftIconPadding
        self.imageToTitlePadding = imageToTitlePadding
        self.rowPadding = rowPadding
        self.iconTintColor = iconTintColor
        self.iconHeight = iconHeight
        self.iconWidth = iconWidth
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.selectedTitleColor = selectedTitleColor
        self.backgroundColor = backgroundColor
        self.menuWidth = menuWidth
        self.animationType = animationType
        self.menuDirection = menuDirection
    }
}
