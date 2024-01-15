//
//  LifeGoalDetailMode.swift
//  Personal Guide
//
//  Created by Philip Jurke on 09.01.24.
//

import Foundation

enum LifeGoalDetailMode: String {
    
    case add, edit
    
    var description: String {
        switch self {
        case .add:
            return String(localized: "New Life Goal")
        case .edit:
            return String(localized: "Edit Life Goal")
        }
    }
    
}
