//
//  LifeGoalDetailView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftData
import SwiftUI

enum LifeGoalDetailMode {
    case create, edit
}

struct LifeGoalDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var lifeGoal: LifeGoal? = nil
    var sheetMode: LifeGoalDetailMode
    
    @State private var lifeGoalExample: LocalizedStringKey = ""
    @State private var isAchieved: Bool = false
    @State private var lifeAspect: LifeAspect = LifeAspect.unknown
    @State private var name: String = ""
    
    // Computed Properties
    
    private var navigationTitle: LocalizedStringKey {
        sheetMode == .create ? LocalizedStringKey("LifeGoals.New") : LocalizedStringKey("LifeGoals.Edit")
    }
    
    private var confirmationLabel: LocalizedStringKey {
        sheetMode == .create ? LocalizedStringKey("LifeGoals.Operations.Add") : LocalizedStringKey("LifeGoals.Operations.Save")
    }
    
    private var isDismissalDisabled: Bool {
        sheetMode == .edit
    }
    
    // Body
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField(lifeGoalExample, text: $name)
                        .autoFocused()
                } footer: {
                    Text("LifeGoals.Properties.Name.Description")
                }
                
                Section {
                    LifeAspectPicker(selection: $lifeAspect)
                }
                
                Toggle("LifeGoals.Properties.IsAchieved", isOn: $isAchieved)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
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
                lifeGoalExample = LifeGoal.getRandomExample()
            }
            .interactiveDismissDisabled(isDismissalDisabled)
        }
    }
    
    // Functions
    
    private func save() {
        
        // Check if name is empty. If yes, set default value
        let goalName = name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? String(localized:  "LifeGoals.Properties.Name.NewDefault") : name
        
        if sheetMode == .create {
            let newGoal = LifeGoal(
                goalName,
                aspect: lifeAspect,
                isAchieved: isAchieved
            )
            modelContext.insert(newGoal)
        } else if (sheetMode == .edit) { // The life goal variable will always be not nil when being called (new -> empty, edit -> selected)
            lifeGoal!.aspect = lifeAspect
            lifeGoal!.isAchieved = isAchieved
            lifeGoal!.name = goalName
        }
    }
    
}

#Preview("LifeGoalDetailView (create, EN)") {
    LifeGoalDetailView(sheetMode: .create)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("LifeGoalDetailView (create, DE)") {
    LifeGoalDetailView(sheetMode: .create)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}

#Preview("LifeGoalDetailView (edit, EN)") {
    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
    
    return LifeGoalDetailView(lifeGoal: goal, sheetMode: .edit)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("LifeGoalDetailView (edit, DE)") {
    let goal = try! previewContainer.mainContext.fetch(FetchDescriptor<LifeGoal>()).first!
    
    return LifeGoalDetailView(lifeGoal: goal, sheetMode: .edit)
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}
