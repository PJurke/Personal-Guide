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
    
    func removeAllData() {
        do {
            try modelContext.delete(model: LifeGoal.self)
        } catch {
            #if DEBUG
            print(error.localizedDescription)
            #endif
        }
    }
    
    var body: some View {
        
        Button("Data.Operations.RemoveAll.Label", role: .destructive, action: {
            isDeleting = true
        })
        .alert("Data.Operations.RemoveAll.Confirmation.Headline", isPresented: $isDeleting) {
            Button("Data.Operations.RemoveAll.Confirmation.Button", role: .destructive) {
                removeAllData()
            }
            Button("Cancel", role: .cancel) {}
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
