//
//  LifeGoalOverview.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalOverview: View {
    
    @Environment(\.isSearching) private var isSearching: Bool
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    @Query private var lifeGoals: [LifeGoal]
    @State private var sheetMode: LifeGoalDetailMode = .create
    @State private var selectedGoal: LifeGoal?
    @State private var searchText: String = ""
    
    // Body
    
    var body: some View {
        NavigationStack {
            VStack {
                if lifeGoals.isEmpty {
                    NoLifeGoalsView(action: showNewLifeGoalSheet)
                } else {
                    List {
                        ForEach(lifeGoals) { goal in
                            LifeGoalRow(lifeGoal: goal)
                                .onTapGesture {
                                    handleTapGesture(for: goal)
                                }
                                .swipeActions(edge: .leading) {
                                    toggleAchievementButton(for: goal)
                                }
                        }
                        .onDelete(perform: removeLifeGoal)
                    }
                    .searchable(text: $searchText, prompt: "LifeGoals.Search.Label")
                }
            }
            .overlay {
                if isSearching && lifeGoals.isEmpty {
                    NoLifeGoalSearchResult(action: {})
                }
            }
            .navigationTitle("LifeGoals.Label")
            .toolbar {
                addLifeGoalButton
            }
            .sheet(item: $selectedGoal) { goal in
                LifeGoalDetailView(lifeGoal: goal, sheetMode: sheetMode)
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
    
    // Functions
    
    private func handleTapGesture(for goal: LifeGoal) {
        sheetMode = .edit
        selectedGoal = goal
    }
    
    private func removeLifeGoal(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(lifeGoals[index])
        }
    }
    
    private func showNewLifeGoalSheet() {
        sheetMode = .create
        selectedGoal = LifeGoal()
    }
    
    private func toggleAchievementButton(for goal: LifeGoal) -> some View {
        Button {
            goal.isAchieved.toggle()
        } label: {
            Label("Achieve", systemImage: "checkmark.circle")
        }
        .tint(.green)
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
