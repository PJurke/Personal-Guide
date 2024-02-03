//
//  DocumentationLink.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct DocumentationLink: View {
    
    var body: some View {
        
        Link("Open Documentation", destination: URL(string: "https://personal-guide.gitbook.io/documentation/")!)
        
    }
    
}

#Preview {
    DocumentationLink()
}
