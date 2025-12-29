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
    case general = "LifeAspect.General"
    
    var localized: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }
    
    // Custom decoding to handle legacy "Unknown" case
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue {
        case "LifeAspect.Unknown":
            self = .general
        default:
            // Attempt to initialize from the raw value, defaulting to .general if unknown
            self = LifeAspect(rawValue: rawValue) ?? .general
        }
    }
}
