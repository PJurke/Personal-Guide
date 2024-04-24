//
//  GenerateCSVDocument.swift
//  Personal Guide
//
//  Created by Philip Jurke on 24.04.24.
//

import Foundation

func generateCSVDocument() -> CSVDocument {
    
    let heading = "Name, Aspect, Is Achieved\n"
    let rows = goals.map { "\($0.name),\($0.aspect),\($0.isAchieved)" }
    let csvString = heading + rows.joined(separator: "\n")
    
    return CSVDocument(text: csvString)
}
