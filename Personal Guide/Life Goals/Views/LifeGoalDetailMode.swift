//
//  LifeGoalDetailMode.swift
//  Personal Guide
//
//  Created by Philip Jurke on 09.01.24.
//

import Foundation
import SwiftUI

enum LifeGoalDetailMode: String {
    
    case add, edit
    
    var localized: LocalizedStringKey {
        switch self {
        case .add:
            return "LifeGoals.New"
        case .edit:
            return "LifeGoals.Edit"
        }
    }
    
}
