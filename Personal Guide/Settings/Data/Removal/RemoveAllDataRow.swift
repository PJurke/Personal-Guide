//
//  RemoveAllDataRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.04.24.
//

import SwiftUI

struct RemoveAllDataRow: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var showRemovalAlert: Bool = false
    @State private var showSuccessfulAlert: Bool = false
    @State private var showErrorAlert: Bool = false
    
    func removeAllData() {
        do {
            try modelContext.delete(model: LifeGoal.self)
            showSuccessfulAlert = true
        } catch {
            showErrorAlert = true
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
    }
    
    var body: some View {
        
        SettingsRow(iconName: "trash.fill", color: .red) {
            
            Button("Data.Operations.RemoveAll.Label", role: .destructive, action: {
                showRemovalAlert = true
            })
            .removalConfirmation(isAlertPresented: $showRemovalAlert, onConfirmRemoval: removeAllData)
            .removalSuccessful(isAlertPresented: $showSuccessfulAlert)
            .removalError(isAlertPresented: $showErrorAlert)
            
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
