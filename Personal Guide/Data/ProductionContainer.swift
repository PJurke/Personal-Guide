//
//  ProductionContainer.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

/// Creates a model container for the application.
/// - Returns: An optional ModelContainer if successful, `nil` otherwise.
func createProductionContainer() -> ModelContainer? {
    
    // Create schema based on existing data models
    let schema = Schema([
        LifeGoal.self
    ])
    
    // Set up model configuration which includes the underlying schema and additional settings
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    
    // Try to find or create the container, including scheme, migration plans and the configurations
    do {
        
        let container = try ModelContainer(
            for: schema,
            //migrationPlan: LifeGoalMigrationPlan.self,
            configurations: [modelConfiguration])
        
        return container
        
    } catch {
        print("Failed to create container")
        return nil
    }
    
}

