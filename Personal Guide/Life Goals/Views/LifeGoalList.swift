//
//  LifeGoalList.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.isSearching) private var isSearching: Bool
    
    var lifeGoals: [LifeGoal]
    @Binding var selectedGoal: LifeGoal?
    @Binding var isGoalSelected: Bool
    
    // Body
    
    var body: some View {
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
        .overlay {
            if isSearching && lifeGoals.isEmpty {
                NoLifeGoalSearchResult(action: {})
            }
        }
        
    }
    
    // Functions
    
    private func handleTapGesture(for goal: LifeGoal) {
        selectedGoal = goal
        isGoalSelected = true
    }
    
    private func removeLifeGoal(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(lifeGoals[index])
        }
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

#Preview("LifeGoalList (EN)") {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal: LifeGoal? = goals.first
    @State var isGoalSelected = false
    
    return LifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("LifeGoalList (DE)") {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal: LifeGoal? = goals.first
    @State var isGoalSelected = false
    
    return LifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}
