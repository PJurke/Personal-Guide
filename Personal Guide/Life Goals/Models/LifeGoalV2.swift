//
//  LifeGoalV1.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

enum LifeGoalSchemaV2: VersionedSchema {
    
    /*
         Schema Versioning:
         - First digit: Major changes, backward-incompatible updates
         - Second digit: Minor changes, backward-compatible features
         - Third digit: Patches, bug fixes
     */
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [LifeGoal.self]
    }
    
    @Model final class LifeGoal: Identifiable {
        
        // Properties
        
        var aspect: LifeAspect
        var isAchieved: Bool
        var name: String
        @Attribute(.unique) var id: UUID
        
        // Initializer
        
        init(_ name: String = String(localized: "LifeGoals.Properties.Name.Default"), aspect: LifeAspect = .unknown, isAchieved: Bool = false) {
            self.aspect = aspect
            self.id = UUID()
            self.isAchieved = isAchieved
            self.name = name
        }
        
    }
    
}

typealias LifeGoal = LifeGoalSchemaV2.LifeGoal
