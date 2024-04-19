//
//  LifeGoalDetailView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var lifeGoal: LifeGoal
    var mode: LifeGoalDetailMode
    var onComplete: (LifeGoal) -> Void
    
    // Body
    
    var body: some View {
            
        NavigationStack {
            VStack {
                
                Form {
                    
                    Section {
                        TextField("LifeGoals.Example.Name", text: $lifeGoal.name)
                            .textInputAutocapitalization(.words)
                    } footer: {
                        Text("LifeGoals.Properties.Name.Description")
                    }
                    
                    Section {
                        LifeAspectPicker(selection: $lifeGoal.aspect)
                    }
                    
                    Toggle("LifeGoals.Properties.IsAchieved", isOn: $lifeGoal.isAchieved)
                    
                }
                
            }
            .navigationTitle(mode.description)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if mode == .add {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("LifeGoals.Operations.Cancel")
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        onComplete(lifeGoal)
                    }) {
                        Text(mode == .add ? "LifeGoals.Operations.Add" : "LifeGoals.Operations.Done")
                    }
                }
        }
        }
        
    }
    
}

#Preview {
    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
    
    return LifeGoalDetailView(
        lifeGoal: .constant(goal),
        mode: .edit,
        onComplete: { _ in }
    )
}
