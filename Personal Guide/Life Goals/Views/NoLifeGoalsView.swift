//
//  NoLifeGoalsView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftUI

struct NoLifeGoalsView: View {
    
    var action: () -> Void
    
    var body: some View {
        
        ContentUnavailableView(label: {
            Label("LifeGoals.None.Title", systemImage: "flag.slash.fill")
        }, description: {
            Text("LifeGoals.None.Description")
        }, actions: {
            Button(action: action) {
                Text("LifeGoals.None.Action")
            }
        })
        
    }
    
}

#Preview {
    NoLifeGoalsView(action: {})
}
