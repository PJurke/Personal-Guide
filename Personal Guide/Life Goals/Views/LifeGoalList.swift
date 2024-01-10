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
    
    // Functions
    
    private func removeLifeGoal(at offsets: IndexSet) {
        
        for index in offsets {
            modelContext.delete(lifeGoals[index])
        }
        
    }
    
    // Body
    
    var body: some View {
        
        List {
            
            ForEach(lifeGoals) {
                goal in
                LifeGoalRow(lifeGoal: goal)
                    .onTapGesture {
                        selectedGoal = goal
                        isGoalSelected = true
                    }
            }
            .onDelete(perform: removeLifeGoal)
            
        }
        
    }
    
}

#Preview {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal = goals.first!
    @State var isGoalSelected = false
    
    return LifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
}
