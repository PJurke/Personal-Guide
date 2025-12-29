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
    
    var aspect: LifeAspect = LifeAspect.general
    var createdAt: Date = Date()
    var isAchieved: Bool = false
    var name: String = String(localized: "LifeGoal.Label")
    var id: UUID = UUID()
    
    // Initializer
    
    init(_ name: String = String(localized: "LifeGoals.Properties.Name.Default"), aspect: LifeAspect = .general, isAchieved: Bool = false) {
        self.aspect = aspect
        self.createdAt = Date()
        self.id = UUID()
        self.isAchieved = isAchieved
        self.name = name
    }
    
    // Functions
    
    // Returns a random life goal example
    static func getRandomExample() -> LocalizedStringKey {
        let examples : [LocalizedStringKey] = [
            "LifeGoals.Example.Marathon",
            "LifeGoals.Example.Skydiving",
            "LifeGoals.Example.TeamLeading",
            "LifeGoals.Example.Tree",
            "LifeGoals.Example.WorldTour"
        ]
        
        return examples.randomElement()!
    }
    
}
