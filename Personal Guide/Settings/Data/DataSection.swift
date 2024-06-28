//
//  DataSection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 23.04.24.
//

import SwiftUI

struct DataSection: View {
    
    var body: some View {
        
        Section("Data") {
            ExportDataRow()
            RemoveAllDataRow()
        }
        
    }
}

#Preview("DataSection (EN)") {
    Form {
        DataSection()
    }
    .modelContainer(previewContainer)
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("DataSection (DE)") {
    Form {
        DataSection()
    }
    .modelContainer(previewContainer)
    .environment(\.locale, .init(identifier: "de"))
}
