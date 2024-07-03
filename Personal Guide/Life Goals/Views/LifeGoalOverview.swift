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
    @State private var searchText: String = ""
    
    // Body
    
    var body: some View {
        NavigationStack {
            VStack {
                if lifeGoals.isEmpty {
                    NoLifeGoalsView(action: showNewLifeGoalSheet)
                } else {
                    lifeGoalList
                        .searchable(text: $searchText, prompt: "LifeGoals.Search.Label")
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
            Button(action: showNewLifeGoalSheet) {
                Image(systemName: "plus")
            }
        }
    }
    
    var filteredLifeGoals: [LifeGoal] {
        guard !searchText.isEmpty else { return lifeGoals }
        
        return lifeGoals.filter { goal in
            goal.name.lowercased().contains(searchText.lowercased())
            
        }
    }
    
    private var lifeGoalList: some View {
        LifeGoalList(
            lifeGoals: filteredLifeGoals,
            selectedGoal: $selectedGoal
        )
    }
    
    // Functions
    
    private func showNewLifeGoalSheet() {
        selectedGoal = nil
        isSheetVisible = true
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
