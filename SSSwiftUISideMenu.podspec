
#
# Be sure to run `pod lib lint SSSwiftUISideMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SSSwiftUISideMenu'
    s.version          = '0.0.1'
    s.summary          = 'SSSwiftUISideMenu is a custom Side Menu with customisable UI as per your choice.'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    'SSSwiftUISideMenu is highly customisable and easy to use Side menu control for iOS Applications. It support the SideMenu operations from left / right panel. user can navigate through the container views that added with the SideMenu MenuItems. It allows user to customise UI and animation style of their choice.'
    DESC

    s.homepage         = 'https://github.com/mobile-simformsolutions/SSSwiftUISideMenu'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Parth Dumaswala' => 'parth.du@simformsolutions.com' }
    s.source           = { :git => 'https://github.com/mobile-simformsolutions/SSSwiftUISideMenu.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.ios.deployment_target = '13.0'

    s.source_files = '**/Sources/SSSwiftUISideMenu/**/*'
    s.swift_version = '5.0'

    # s.resource_bundles = {
    #   'SSSwiftUISideMenu' => ['SSSwiftUISideMenu/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'MapKit', 'SwiftUI'
    # s.dependency 'AFNetworking', '~> 2.3'
end

