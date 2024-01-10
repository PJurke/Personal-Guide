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
                        TextField("Going Skydiving", text: $lifeGoal.name)
                            .textInputAutocapitalization(.words)
                    } footer: {
                        Text("When choosing a name, opt for one or two easy-to-remember words. A combination of a verb and a noun usually works best.")
                    }
                    
                    Section {
                        Toggle("Achieved", isOn: $lifeGoal.isAchieved)
                    } header: {
                        Text("Achievement")
                    }
                    
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
                            Text("Cancel")
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        onComplete(lifeGoal)
                    }) {
                        Text(mode == .add ? "Add" : "Done")
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
