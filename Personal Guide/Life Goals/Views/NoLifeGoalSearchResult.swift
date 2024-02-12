//
//  NoLifeGoalsView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 10.02.24.
//

import SwiftUI

struct NoLifeGoalSearchResult: View {
    
    var action: () -> Void
    
    var body: some View {
        
        ContentUnavailableView(label: {
            Label("LifeGoals.Search.None.Title", systemImage: "binoculars.fill")
        }, description: {
            Text("LifeGoals.Search.None.Description")
        })
        
    }
    
}

#Preview {
    NoLifeGoalSearchResult(action: {})
}
