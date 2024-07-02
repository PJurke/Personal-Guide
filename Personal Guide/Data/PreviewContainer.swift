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
        container.mainContext.insert(LifeGoal("Going skydiving", aspect: .me, isAchieved: true))
        container.mainContext.insert(LifeGoal("Plant one tree", aspect: .society, isAchieved: false))
        container.mainContext.insert(LifeGoal("Run a marathon", aspect: .me, isAchieved: false))
        
        return container
    } catch let error {
        fatalError("Failed to create container \(error.localizedDescription)")
    }
    
}()
