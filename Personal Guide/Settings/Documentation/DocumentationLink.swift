//
//  DocumentationLink.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct DocumentationLink: View {
    
    var body: some View {
        
        SettingsRow(iconName: "doc.text.fill", color: .brown) {
            Link("Documentation.Operations.Open", destination: URL(string: "https://personal-guide.gitbook.io/documentation/")!)
        }
        
    }
    
}

#Preview("DocumentationLink (EN)") {
    Form {
        DocumentationLink()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("DocumentationLink (DE)") {
    Form {
        DocumentationLink()
    }
    .environment(\.locale, .init(identifier: "de"))
}
