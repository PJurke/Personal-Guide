//
//  AppColorScheme.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import Foundation
import SwiftUI

enum AppColorScheme: String, CaseIterable, Codable {
    case system = "System"
    case dark = "Dark"
    case light = "Light"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
