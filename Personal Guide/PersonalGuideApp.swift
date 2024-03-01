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
    
    private var modelContainer: ModelContainer?
    
    init() {
        
        do {
            modelContainer = try createProductionContainer()
        } catch {
            print("Failed to initialize model container: \(error.localizedDescription)")
            modelContainer = nil
        }
        
    }

    var body: some Scene {
        
        WindowGroup {
            
            if let container = modelContainer {
                
                LifeGoalOverview()
                    .modifier(AppColorSchemeModifier())
                    .modelContainer(container)
                
            } else {
                
                DataContainerErrorView()
                
            }
            
            
        }
        
    }
    
}
