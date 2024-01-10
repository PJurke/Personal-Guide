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
        container.mainContext.insert(LifeGoal("First Life Goal", isAchieved: true))
        container.mainContext.insert(LifeGoal("Second Life Goal"))
        container.mainContext.insert(LifeGoal("Third Life Goal", isAchieved: true))
        container.mainContext.insert(LifeGoal("Fourth Life Goal"))
        container.mainContext.insert(LifeGoal("Fifth Life Goal", isAchieved: true))
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
    
}()
