//
//  LifeGoalMigrationPlan.swift
//  Personal Guide
//
//  Created by Philip Jurke on 01.03.24.
//

import Foundation
import SwiftData

enum LifeGoalMigrationPlan: SchemaMigrationPlan {
    
    static var schemas: [VersionedSchema.Type] {
        [
            LifeGoalSchemaV1.self,
            LifeGoalSchemaV2.self
        ]
    }
    
    static var stages: [MigrationStage] {
        [
            migrateV1ToV2
        ]
    }
    
    // V1 -> V2
    static let migrateV1ToV2 = MigrationStage.custom(
        fromVersion: LifeGoalSchemaV1.self,
        toVersion: LifeGoalSchemaV2.self,
        willMigrate: nil,
        didMigrate: { context in
            
            #if DEBUG
                print("Start Life Goal Migration v1 -> v2")
            #endif
            
            let goals = try? context.fetch(FetchDescriptor<LifeGoalSchemaV2.LifeGoal>())
            
            goals?.forEach { goal in
                goal.aspect = .unknown
            }
            
            try? context.save()
            
            #if DEBUG
                print("End Life Goal Migration v1 -> v2")
            #endif
            
        }
    )
    
}
