//
//  ExportDataRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 23.04.24.
//

import SwiftData
import SwiftUI

struct ExportDataRow: View {
    
    @Query private let goals: [LifeGoal]
    @State private var showingExporter = false
    @State private var didError = false
    
    // View
    
    var body: some View {
        
        Button("App.Export.Action") {
            showingExporter = true
        }
        .fileExporter(
            isPresented: $showingExporter,
            document: generateCSVDocument(),
            contentType: .commaSeparatedText,
            defaultFilename: "Life Goals") { handleExportResult($0)}
            .alert("App.Export.Failed.Title", isPresented: $didError) {
                Button("App.Export.Failed.Confirm", role: .cancel) {}
            } message: {
                Text("App.Export.Failed.Message")
            }
    
    }
    
    // Helper Functions
    
    private func generateCSVDocument() -> CSVDocument {
        
        let heading = "Name, Aspect, Is Achieved\n"
        let rows = goals.map { "\($0.name),\($0.aspect),\($0.isAchieved)" }
        let csvString = heading + rows.joined(separator: "\n")
        
        return CSVDocument(text: csvString)
        
    }
    
    private func handleExportResult(_ result: Result<URL, Error>) {
        
        switch result {
            
        case .success(let url):
            #if DEBUG
            print("Exported successfully to \(url)")
            #endif
            
        case .failure(let error):
            #if DEBUG
            print("Exported successfully to \(error)")
            #endif
            didError = true
            
        }
    }
    
}

#Preview("ExportDataRow (EN)") {
    Form {
        ExportDataRow()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("ExportDataRow (DE)") {
    Form {
        ExportDataRow()
    }
    .environment(\.locale, .init(identifier: "de"))
}
