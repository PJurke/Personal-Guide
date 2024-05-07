//
//  LifeGoalV3.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI
    
@Model final class LifeGoal: Identifiable {
    
    // Properties
    
    var aspect: LifeAspect = LifeAspect.unknown
    var isAchieved: Bool = false
    var name: String = String(localized: "LifeGoal.Label")
    var id: UUID = UUID()
    
    // Initializer
    
    init(_ name: String = String(localized: "LifeGoals.Properties.Name.Default"), aspect: LifeAspect = .unknown, isAchieved: Bool = false) {
        self.aspect = aspect
        self.id = UUID()
        self.isAchieved = isAchieved
        self.name = name
    }
    
}
