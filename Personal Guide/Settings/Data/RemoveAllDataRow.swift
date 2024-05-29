//
//  RemoveAllDataRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.04.24.
//

import SwiftUI

struct RemoveAllDataRow: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var isDeleting: Bool = false
    @State private var showErrorMessage: Bool = false
    
    func removeAllData() {
        do {
            try modelContext.delete(model: LifeGoal.self)
        } catch {
            showErrorMessage = true
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
    }
    
    var body: some View {
        
        SettingsRow(iconName: "trash.fill", color: .red) {
            
            Button("Data.Operations.RemoveAll.Label", role: .destructive, action: {
                isDeleting = true
            })
            .alert("Data.Operations.RemoveAll.Confirmation.Headline", isPresented: $isDeleting) {
                Button("Data.Operations.RemoveAll.Confirmation.Button", role: .destructive) {
                    removeAllData()
                }
                Button("Cancel", role: .cancel) {}
            }
            .alert("Data.Operations.RemoveAll.Error.Headline", isPresented: $showErrorMessage) {
                Button("Okay", role: .cancel) {}
            } message: {
                Text("Data.Operations.RemoveAll.Error.Description")
            }
            
        }
        
    }
    
}

#Preview("RemoveAllDataRow (EN)") {
    Form {
        RemoveAllDataRow()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("RemoveAllDataRow (DE)") {
    Form {
        RemoveAllDataRow()
    }
    .environment(\.locale, .init(identifier: "de"))
}
