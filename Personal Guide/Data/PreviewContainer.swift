//
//  SampleData.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

@MainActor
let previewContainer: ModelContainer = {
    
    do {
        let schema = Schema([ LifeGoal.self ])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [config])
        
        // Inserts
        container.mainContext.insert(LifeGoal("Go Skydiving", isAchieved: true))
        container.mainContext.insert(LifeGoal("Marry My Soulmate", isAchieved: false))
        container.mainContext.insert(LifeGoal("Plant One Tree", isAchieved: false))
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
    
}()
