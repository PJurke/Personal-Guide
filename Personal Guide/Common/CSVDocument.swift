//
//  CSVDocument.swift
//  Personal Guide
//
//  Created by Philip Jurke on 24.04.24.
//

import SwiftUI
import UniformTypeIdentifiers

struct CSVDocument: FileDocument {
    
    var text: String
    
    static var readableContentTypes: [UTType] { [.commaSeparatedText] }

    init(text: String = "") {
        self.text = text
    }
    
    init(configuration: ReadConfiguration) throws {
        
        if let data = configuration.file.regularFileContents,
           let string = String(data: data, encoding: .utf8) {
            text = string
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        
        let data = text.data(using: .utf8)!
        return FileWrapper(regularFileWithContents: data)
        
    }
    
}
