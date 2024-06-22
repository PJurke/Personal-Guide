//
//  LifeGoalDetailView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

struct LifeGoalDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var lifeGoal: LifeGoal?
    
    @State private var isAchieved: Bool = false
    @State private var lifeAspect: LifeAspect = LifeAspect.unknown
    @State private var name: String = ""
    
    // Computed Properties
    
    private var navigationTitle: String {
        lifeGoal == nil ? String(localized: "LifeGoals.New") : String(localized: "LifeGoals.Edit")
    }
    
    private var confirmationLabel: String {
        lifeGoal == nil ? String(localized: "LifeGoals.Operations.Add") : String(localized: "LifeGoals.Operations.Save")
    }
    
    // Body
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section {
                    TextField("LifeGoals.Example.Name", text: $name)
                        .autoFocused()
                } footer: {
                    Text("LifeGoals.Properties.Name.Description")
                }
                
                Section {
                    LifeAspectPicker(selection: $lifeAspect)
                }
                
                Toggle("LifeGoals.Properties.IsAchieved", isOn: $isAchieved)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(navigationTitle)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(confirmationLabel) {
                        withAnimation {
                            save()
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("LifeGoals.Operations.Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let lifeGoal {
                    isAchieved = lifeGoal.isAchieved
                    lifeAspect = lifeGoal.aspect
                    name = lifeGoal.name
                }
            }
        }
    }
    
    // Functions
    
    private func save() {
        if let lifeGoal {
            lifeGoal.aspect = lifeAspect
            lifeGoal.isAchieved = isAchieved
            lifeGoal.name = name
        } else {
            let newGoal = LifeGoal(
                name,
                aspect: lifeAspect,
                isAchieved: isAchieved
            )
            modelContext.insert(newGoal)
        }
    }
    
}

#Preview("LifeGoalDetailView (add, EN)") {
    LifeGoalDetailView(lifeGoal: nil)
        .environment(\.locale, .init(identifier: "en"))
}

//#Preview("LifeGoalDetailView (add, DE)") {
//    LifeGoalDetailView(lifeGoal: nil)
//        .environment(\.locale, .init(identifier: "de"))
//}
//
//#Preview("LifeGoalDetailView (edit, EN)") {
//    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
//    
//    return LifeGoalDetailView(
//        lifeGoal: nil // To do
//    )
//    .environment(\.locale, .init(identifier: "en"))
//}
//
//#Preview("LifeGoalDetailView (edit, DE)") {
//    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
//    
//    return LifeGoalDetailView(
//        lifeGoal: nil // To do
//    )
//    .environment(\.locale, .init(identifier: "de"))
//}
