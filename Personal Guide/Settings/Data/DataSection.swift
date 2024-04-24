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
        }
        
    }
}

#Preview {
    DataSection()
}
