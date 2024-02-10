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
            Label("No Life Goals Found", systemImage: "binoculars.fill")
        }, description: {
            Text("There are no life goals stored currently.")
        })
        
    }
    
}

#Preview {
    NoLifeGoalSearchResult(action: {})
}
