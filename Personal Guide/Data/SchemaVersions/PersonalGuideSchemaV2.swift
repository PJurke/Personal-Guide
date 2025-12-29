//
//  PersonalGuideSchemaV2.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.12.25.
//

import SwiftData
import Foundation

enum PersonalGuideSchemaV2: VersionedSchema {
    
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [LifeGoal.self]
    }
    
    // V2 uses the shared LifeGoal definition from the project
}
