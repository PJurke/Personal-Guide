//
//  PersonalGuideMigrationPlan.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.12.25.
//

import SwiftData
import Foundation

enum PersonalGuideMigrationPlan: SchemaMigrationPlan {
    
    static var schemas: [any VersionedSchema.Type] {
        [PersonalGuideSchemaV1.self, PersonalGuideSchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    static var migrateV1toV2: MigrationStage {
        MigrationStage.lightweight(
            fromVersion: PersonalGuideSchemaV1.self,
            toVersion: PersonalGuideSchemaV2.self
        )
    }
}
