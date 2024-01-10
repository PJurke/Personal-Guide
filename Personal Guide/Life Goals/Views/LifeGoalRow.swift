//
//  LifeGoalRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalRow: View {
    
    var lifeGoal: LifeGoal
    
    var body: some View {
        
        HStack {
            
            Text(lifeGoal.name)
            
            Spacer()
            
            if lifeGoal.isAchieved {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            }
            
        }
        .contentShape(Rectangle())
        
    }
    
}

#Preview {
    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
    
    return LifeGoalRow(lifeGoal: goal)
        .modelContainer(previewContainer)
}
