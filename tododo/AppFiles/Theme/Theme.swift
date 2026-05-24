//
//  Theme.swift
//  tododo
//
//  Created by Sandesh Naik on 24/05/26.
//

import Foundation
import SwiftUI

struct Theme {
    enum Mode {
        case dark, light
    }

    enum Colors {
        static let primary = Color("primary")
        static let secondary = Color("secondary")
        static let tertiary = Color("tertiary")
        static let neutral = Color("neutral")
        
        // tab bar icon colors
        static let defaultTabBarItem = Color("default_tab_item")
        static let selectedTabBarItem = Color("selected_tab_item")
    }

}
