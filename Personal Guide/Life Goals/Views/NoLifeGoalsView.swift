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
            Label("No Life Goals", systemImage: "flag.slash.fill")
        }, description: {
            Text("There are no life goals stored currently.")
        }, actions: {
            Button(action: action) {
                Text("Add your first life goal")
            }
        })
        
    }
    
}

#Preview {
    NoLifeGoalsView(action: {})
}
