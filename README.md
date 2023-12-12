![ScreenShot](/Resources/banner.png)

# SSSwiftUISideMenu

[![Version](https://img.shields.io/cocoapods/v/SSSwiftUISideMenu.svg?style=flat)](https://cocoapods.org/pods/SSSwiftUISideMenu)
[![Platform](https://img.shields.io/cocoapods/p/SSSwiftUISideMenu.svg?style=flat)](https://cocoapods.org/pods/SSSwiftUISideMenu)
[![Swift Version][swift-image]][swift-url]
[![PRs Welcome][PR-image]][PR-url]
[![Twitter](https://img.shields.io/badge/Twitter-@simform-blue.svg?style=flat)](https://twitter.com/simform)

SwiftUI package for creating custom sidemenu with animation and flexible design as per your choice.

![Example of SSSwiftUISideMenu](GIFs/MainGif.gif)<br/>
*An example of Custom SideMenu created with this library*

**About SSSwiftUISideMenu**<br/>
SSSwiftUISideMenu is highly customisable and easy to use Side menu control for iOS Applications. It support the SideMenu operations from left / right panel. user can navigate through the container views that added with the SideMenu MenuItems. It allows user to customise UI and animation style of their choice.

### Prerequisites
- iOS 13.0+
- Xcode 11.0+
- [CocoaPods](http://cocoapods.org/)

## Example

![ScreenShot](/Resources/SSSwiftUISideMenu_example.gif)

- To run the example project, clone the repo, and run `pod install` from the Example directory first.

# Installation
#### CocoaPods

- You can use CocoaPods to install `SSSwiftUISideMenu` by adding it to your Podfile:

       use_frameworks!
       pod 'SSSwiftUISideMenu'

- Import SSSwiftUISideMenu in your file:

       import SSSwiftUISideMenu

**Manually**
- Download and drop **SSSwiftUISideMenu/Sources** folder in your project.
- Grab yourself a cold 🍺.

#### Swift Package Manager (SPM)
-   When using Xcode 11 or later, you can install `SSSwiftUISideMenu` by going to your Project settings > `Swift Packages` and add the repository by providing the GitHub URL. Alternatively, you can go to `File` > `Swift Packages` > `Add Package Dependencies...`

         dependencies: [
             .package(url: "https://github.com/mobile-simformsolutions/SSSwiftUISideMenu.git", from: "1.0.0")
         ]

# Usage Examples

- Import the package in the file you would like to use it: 

```swiftui
import SSSwiftUISideMenu
```

- This library shares one View which you can use as a sidemenu with many customizations like UI, animation, direction and many more.
Basic example:

```swift
    @State private var openSideMenu: Bool = false
    
    @State private var selectedIndex: Int = 0
    
    private var menuItems = [
        MenuItem(title: "item_1", icon: "icon_1"),
        MenuItem(title: "item_2", icon: "icon_2"),
        MenuItem(title: "item_3", icon: "icon_3"),
        MenuItem(title: "item_4", icon: "icon_4")
    ]

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems)
}
```
The results of any interaction from sidemenu item will available in declared selectedIndex state variable. Also sidemnu open / close toggle value will be available in the openSideMenu state variable.

# Customizations

- You can customize almost every main thing in this library.
- For Customizations you have to pass another value of `menuConfig` during call of SSSwiftUISideMenu. This menuConfig argument is optional as well as Every arguments in `SSMenuConfig` is also Optional. So, you need to add only those arguments which yo wanted to customize. Here's the examples :

## Change in Style
-----
*An example of customisation of styles*

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(titleColor: .black, 
                selectedTitleColor: .secondary, 
                backgroundColor: .white))
}
```

## Change SideMenu direction - Left / Right
-----
*An example of change sidemenu direction. left direction is default*

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(menuDirection: .right))
}
```

## Add animation to your sidemenu
-----
*An example of applying a animation type to the sidemenu*

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(animationType: .easeOut))
}
```

# Other Customizations

#### SideMenu width
----
*You can change the menu width of your choice with the menuWidth. By default is '280'.*<br/>

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(menuWidth: MENU_SIZE))
}
```

#### Icon color and customizations
-------

- You can add leftIconPadding argument to change the icon padding from the left side of the sidemenu view.<br/>
- You can add imageToTitlePadding argument for adding a padding between a icon and title.<br/>
- You can add iconTintColor argument to change the icon tint color of your choice.<br/>
- You can add iconHeight and iconWidth argument change the size of the row icons.<br/>

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(leftIconPadding: 20, 
                imageToTitlePadding: 15, 
                iconTintColor: .black, 
                iconHeight: 30, 
                iconWidth: 30))
}
```

#### Show App Version
-------
*An example of showing your app version at bottom of the sidemenu. you can configure its style and color. All are optionally configured.*

- Add showAppVersion argument to weather to show app versio or not. Default is false<br/>
- Add versionText argument for adding a pass the text of the version.<br/>
- Add versionTitleColor, versionAlignment or versionFont argument to change the font style and color of the version string.<br/>

```swift

var body: some Scene {
    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, 
        menuConfig: SSMenuConfig(showAppVersion: true, 
                versionText: "1.0.0", 
                versionTitleColor: .gray, 
                versionAlignment: .center))
}
```

## Coming Soon

- Pass custom view directly to the sidemenu to create sidemenu of your choice.<br/>

**Up for a suggestions. Give suggestions for more features and customisations.**

## 🤝 How to Contribute

Whether you're helping us fix bugs, improve the docs, or a feature request, we'd love to have you! :muscle:

Check out our [**Contributing Guide**](CONTRIBUTING.md) for ideas on contributing.

## Find this example useful? ❤️

Give a ⭐️ if this project helped you!

## Check out our other Libraries

<h3><a href="https://github.com/SimformSolutionsPvtLtd/Awesome-Mobile-Libraries"><u>🗂 Simform Solutions Libraries→</u></a></h3>

## MIT License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

[PR-image]:https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat
[PR-url]:http://makeapullrequest.com
[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
