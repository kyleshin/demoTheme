//
//  Theme.swift
//  themeDemo
//
//  Created by Kyle Shin on 4/11/18.
//  Copyright © 2018 Kyle Hongkai Shin. All rights reserved.
//

import UIKit

/** Use this to modify themed colors.
 */
enum Theme: Int {
    case light, dark, dubs
    
    private enum Keys {
        static let currentTheme = "CurrentTheme"
    }
    
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.currentTheme)
        return Theme(rawValue: storedTheme) ?? .light
    }
    
    func apply(){
        UserDefaults.standard.set(rawValue, forKey: Keys.currentTheme)
        UINavigationBar.appearance().tintColor = standardTintColor
        UINavigationBar.appearance().barTintColor = viewControllerBackgroundColor

    }
    
    var standardTextColor: UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        case .dubs:
            return UIColor.yellow
        }
    }
    
    var standardBackgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.black
        case .dubs:
            return UIColor.blue
        }
    }
    
    var standardTintColor:UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        case .dubs:
            return UIColor.goldenYellow
        }
    }
    
    var viewControllerBackgroundColor: UIColor {
        switch self{
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.darkGray
        case .dubs:
            return UIColor.warriorsRoyalBlue
        }
    }
}

