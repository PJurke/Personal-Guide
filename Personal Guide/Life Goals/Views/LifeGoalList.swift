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
    
    var lifeGoals: [LifeGoal]
    @Binding var selectedGoal: LifeGoal
    @Binding var isGoalSelected: Bool
    @State private var searchText: String = ""
    
    var filteredLifeGoals: [LifeGoal] {
        guard !searchText.isEmpty else { return lifeGoals }
        
        return lifeGoals.filter { goal in
            goal.name.lowercased().contains(searchText.lowercased())
            
        }
    }
    
    // Functions
    
    private func removeLifeGoal(at offsets: IndexSet) {
        
        for index in offsets {
            modelContext.delete(lifeGoals[index])
        }
        
    }
    
    // Body
    
    var body: some View {
        
        List {
            
            ForEach(filteredLifeGoals) {
                goal in
                LifeGoalRow(lifeGoal: goal)
                    .onTapGesture {
                        selectedGoal = goal
                        isGoalSelected = true
                    }
            }
            .onDelete(perform: removeLifeGoal)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search")
        
    }
    
}

#Preview {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal = goals.first!
    @State var isGoalSelected = false
    
    return LifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
}
