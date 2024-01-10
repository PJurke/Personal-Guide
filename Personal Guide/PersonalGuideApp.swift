//
//  PersonalGuideApp.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftUI
import SwiftData

@main
struct Personal_GuideApp: App {
    
    private var modelContainer: ModelContainer
    
    init() {
        
        if let container = createProductionContainer() {
            modelContainer = container
        } else {
            fatalError("Failed to initialize model container.")
        }
        
    }

    var body: some Scene {
        
        WindowGroup {
            LifeGoalOverview()
                .modelContainer(modelContainer)
        }
        
    }
    
}
