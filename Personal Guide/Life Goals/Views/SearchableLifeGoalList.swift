//
//  SearchableLifeGoalList.swift
//  Personal Guide
//
//  Created by Philip Jurke on 10.02.24.
//

import SwiftUI
import SwiftData

struct SearchableLifeGoalList: View {
    
    var lifeGoals: [LifeGoal]
    @Binding var selectedGoal: LifeGoal?
    @Binding var isGoalSelected: Bool
    @State private var searchText: String = ""
    
    var filteredLifeGoals: [LifeGoal] {
        guard !searchText.isEmpty else { return lifeGoals }
        
        return lifeGoals.filter { goal in
            goal.name.lowercased().contains(searchText.lowercased())
            
        }
    }
    
    // View
    
    var body: some View {
        
        LifeGoalList(
            lifeGoals: filteredLifeGoals,
            selectedGoal: $selectedGoal,
            isGoalSelected: $isGoalSelected
        )
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "LifeGoals.Search.Label"
        )
        
    }
    
}

#Preview("SearchableLifeGoalList (EN)") {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal: LifeGoal? = goals.first
    @State var isGoalSelected = false
    
    return SearchableLifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("SearchableLifeGoalList (DE)") {
    let goals = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>())
    @State var firstGoal: LifeGoal? = goals.first
    @State var isGoalSelected = false
    
    return SearchableLifeGoalList(lifeGoals: goals, selectedGoal: $firstGoal, isGoalSelected: $isGoalSelected)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}
