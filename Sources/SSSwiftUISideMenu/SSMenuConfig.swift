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
    
    /** Menu view top padding from the view. Default is: 10**/
    private(set) var topPadding: CGFloat
    /** Item icon leading space. Default is: 0**/
    private(set) var leftIconPadding: CGFloat
    /** Space between Icon and title. Default is: 15**/
    private(set) var imageToTitlePadding: CGFloat
    /** Space between items (Vertically). Default is: 15**/
    private(set) var rowPadding: CGFloat
    /** Item Icon tint color. Default is: Pink**/
    private(set) var iconTintColor: Color
    /** Icon imageView Height. Default is: 35**/
    private(set) var iconHeight: CGFloat
    /** Icon imageView Width. Default is: 35**/
    private(set) var iconWidth: CGFloat
    /** Font style of the title. Default is: headline**/
    private(set) var titleFont: Font
    /** Title color of menu item. Default is: black**/
    private(set) var titleColor: Color
    /** Selected title color of menu item. Default is: black**/
    private(set) var selectedTitleColor: Color
    /** background color of the menu view. Default is: white**/
    private(set) var backgroundColor: Color
    /** Total width of the SieMenu. Default is: 280**/
    private(set) var menuWidth: CGFloat
    /** Open / Close animation of the sidemenu. Default animation is there.**/
    private(set) var animationType: Animation
    /** Specify the Sidemenu direction form open . Default is: left**/
    private(set) var menuDirection: Directions
    /** Boolean for whether you want the menu close on swipe gesture . Default is: Enabled**/
    private(set) var swipeToClose: Bool
    /** Boolean for whether you want to show App version . Default is: False**/
    private(set) var showAppVersion: Bool
    /** Specify the App version string . Default is: Empty**/
    private(set) var versionText: String
    /** Specify the App version string font style. Default is: caption**/
    private(set) var versionFont: Font
    /** Specify the App version string title color. Default is: gray**/
    private(set) var versionTitleColor: Color
    /** Specify the App version string alignment. Default is: centre**/
    private(set) var versionAlignment: Alignment
    
    public init(
        topPadding: CGFloat = 10,
        leftIconPadding: CGFloat = 0,
        imageToTitlePadding: CGFloat = 15,
        rowPadding: CGFloat = 15,
        iconTintColor: Color = .pink,
        iconHeight: CGFloat = 35,
        iconWidth: CGFloat = 35,
        titleFont: Font = .headline,
        titleColor: Color = .black,
        selectedTitleColor: Color = .black,
        backgroundColor: Color = .white,
        menuWidth: CGFloat = 280,
        animationType: Animation = .default,
        menuDirection: Directions = .left,
        swipeToClose: Bool = true,
        showAppVersion: Bool = false,
        versionText: String = "",
        versionFont: Font = .caption,
        versionTitleColor: Color = .gray,
        versionAlignment: Alignment = .center
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
        self.swipeToClose = swipeToClose
        self.showAppVersion = showAppVersion
        self.versionText = versionText
        self.versionFont = versionFont
        self.versionTitleColor = versionTitleColor
        self.versionAlignment = versionAlignment
    }
}
