//
//  PersonalGuideSchemaV1.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.12.25.
//

import SwiftData
import Foundation

enum PersonalGuideSchemaV1: VersionedSchema {
    
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [LifeGoal.self]
    }
    
    @Model
    final class LifeGoal {
        var aspect: LifeAspect = LifeAspect.general // Using current LifeAspect type as it is compatible
        var isAchieved: Bool = false
        var name: String = ""
        var id: UUID = UUID()
        
        init(name: String, aspect: LifeAspect, isAchieved: Bool) {
            self.name = name
            self.aspect = aspect
            self.isAchieved = isAchieved
            self.id = UUID()
        }
    }
}
