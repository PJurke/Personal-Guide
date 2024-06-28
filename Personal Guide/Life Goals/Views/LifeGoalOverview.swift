//
//  LifeGoalOverview.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalOverview: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var lifeGoals: [LifeGoal]
    @State private var isSheetVisible: Bool = false
    @State private var selectedGoal: LifeGoal?
    
    // Functions
    
    private func showSheet() {
        isSheetVisible = true
    }
    
    // Body
    
    var body: some View {
        NavigationStack {
            VStack {
                if lifeGoals.isEmpty {
                    NoLifeGoalsView(action: showSheet)
                } else {
                    lifeGoalList
                }
            }
            .navigationTitle("LifeGoals.Label")
            .toolbar {
                addLifeGoalButton
            }
            .sheet(isPresented: $isSheetVisible) {
                LifeGoalDetailView(lifeGoal: selectedGoal)
            }
            
        }
        
    }
    
    // Computed Properties
    
    private var addLifeGoalButton: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button(action: {
                selectedGoal = nil
                showSheet()
            }) {
                Image(systemName: "plus")
            }
        }
    }
    
    private var lifeGoalList: some View {
        SearchableLifeGoalList(
            lifeGoals: lifeGoals,
            selectedGoal: $selectedGoal,
            isGoalSelected: $isSheetVisible
        )
    }
    
}

#Preview("LifeGoalOverview (EN)") {
    LifeGoalOverview()
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("LifeGoalOverview (DE)") {
    LifeGoalOverview()
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}
