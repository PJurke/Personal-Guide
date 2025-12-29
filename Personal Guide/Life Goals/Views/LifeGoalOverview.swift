//
//  LifeGoalOverview.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalOverview: View {
    
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    @Query private var lifeGoals: [LifeGoal]
    @State private var isSearching: Bool = false
    @State private var searchText: String = ""
    @State private var selectedTokens: [LifeAspect] = []
    @State private var selectedGoal: LifeGoal?
    @State private var sheetMode: LifeGoalDetailMode = .create
    
    // Body
    
    var body: some View {
        NavigationStack {
            VStack {
                if lifeGoals.isEmpty {
                    NoLifeGoalsView(action: showNewLifeGoalSheet)
                } else {
                    List {
                        ForEach(filteredLifeGoals) { goal in
                            LifeGoalRow(lifeGoal: goal)
                                .onTapGesture {
                                    handleTapGesture(for: goal)
                                }
                                .swipeActions(edge: .leading) {
                                    toggleAchievementButton(for: goal)
                                }
                                .swipeActions(edge: .trailing) {
                                    removeGoalButton(goal: goal)
                                }
                        }
                    }
                    .listStyle(.plain)
                    .background(Color(.systemGroupedBackground))
                    .background(Color(.systemGroupedBackground))
                    .searchable(text: $searchText, tokens: $selectedTokens, suggestedTokens: .constant(LifeAspect.allCases), isPresented: $isSearching, prompt: "LifeGoals.Search.Label") { token in
                        Text(token.localized)
                    }
                }
            }
            .overlay {
                if isLifeGoalSearchResult {
                    NoLifeGoalSearchResult(action: {})
                }
            }
            .navigationTitle("LifeGoals.Label")
            .toolbar {
                addLifeGoalButton
            }
            .sheet(item: $selectedGoal) { goal in
                LifeGoalDetailView(lifeGoal: goal, sheetMode: $sheetMode)
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
    
    private var filteredLifeGoals: [LifeGoal] {
        var result = lifeGoals
        
        // Filter by Search Text (AND)
        if !searchText.isEmpty {
            result = result.filter { goal in
                goal.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        // Filter by Tokens (OR logic within tokens)
        if !selectedTokens.isEmpty {
            result = result.filter { goal in
                selectedTokens.contains(goal.aspect)
            }
        }
        
        return result
    }
    
    private var isLifeGoalSearchResult: Bool {
        isSearching && filteredLifeGoals.isEmpty
    }
    
    // Functions
    
    private func handleTapGesture(for goal: LifeGoal) {
        sheetMode = .edit
        selectedGoal = goal
    }
    
    private func showNewLifeGoalSheet() {
        sheetMode = .create
        selectedGoal = LifeGoal()
    }
    
    private func toggleAchievementButton(for goal: LifeGoal) -> some View {
        Button {
            goal.isAchieved.toggle()
        } label: {
            Image(systemName: "checkmark.circle")
        }
        .tint(.green)
    }
    
    private func removeGoalButton(goal: LifeGoal) -> some View {
        Button {
            modelContext.delete(goal)
        } label: {
            Image(systemName: "trash")
        }
        .tint(.red)
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
