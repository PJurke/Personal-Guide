//
//  LifeAspect.swift
//  Personal Guide
//
//  Created by Philip Jurke on 01.03.24.
//

import Foundation
import SwiftUI

enum LifeAspect: String, CaseIterable, Codable {
    case me = "LifeAspect.Me"
    case family = "LifeAspect.Family"
    case friends = "LifeAspect.Friends"
    case work = "LifeAspect.Work"
    case society = "LifeAspect.Society"
    case unknown = "LifeAspect.Unknown"
    
    var localized: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }
}
