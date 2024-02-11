//
//  AppColorScheme.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import Foundation
import SwiftUI

enum AppColorScheme: String, CaseIterable, Codable {
    case system = "Settings.ColorScheme.System"
    case dark = "Settings.ColorScheme.Dark"
    case light = "Settings.ColorScheme.Light"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
