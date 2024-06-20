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
    
    @State private var addSheetVisible = false
    @State private var selectedGoal: LifeGoal = LifeGoal()
    @State private var isGoalSelected = false
    
    // Functions
    
    private func addLifeGoalOnAdd(newGoal: LifeGoal) {
        
        addSheetVisible = false
        
        if newGoal.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            newGoal.name = String(localized: "LifeGoals.Properties.Name.NewDefault")
        }
        
        modelContext.insert(newGoal)
        
    }
    
    private func editLifeGoalViewOnDone(editedGoal: LifeGoal) {
        isGoalSelected = false
        
        if editedGoal.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            editedGoal.name = String(localized:"LifeGoals.Properties.Name.EditDefault")
        }
    }
    
    private func showAddSheet() {
        self.addSheetVisible = true
    }
    
    // Body
    
    var body: some View {
        NavigationStack {
            VStack {
                if lifeGoals.isEmpty {
                    NoLifeGoalsView(action: showAddSheet)
                } else {
                    lifeGoalList
                }
            }
            .navigationTitle("LifeGoals.Label")
            .toolbar {
                addLifeGoalButton
            }
            .sheet(isPresented: $addSheetVisible) {
                addLifeGoalSheet
            }
            
        }
        
    }
    
    // Sub Views
    
    private var lifeGoalList: some View {
        SearchableLifeGoalList(
            lifeGoals: lifeGoals,
            selectedGoal: $selectedGoal,
            isGoalSelected: $isGoalSelected
        )
        .sheet(isPresented: $isGoalSelected) {
            LifeGoalDetailView(
                lifeGoal: $selectedGoal,
                mode: .edit,
                onComplete: editLifeGoalViewOnDone
            )
            .interactiveDismissDisabled()
        }
    }
    
    private var addLifeGoalButton: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            NavigationBarButton(
                action: showAddSheet,
                systemImage: "plus"
            )
        }
    }
    
    private var addLifeGoalSheet: some View {
        LifeGoalDetailView(
            lifeGoal: .constant(LifeGoal()),
            mode: .add,
            onComplete: addLifeGoalOnAdd
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
