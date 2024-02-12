//
//  DataContainerErrorView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 06.01.24.
//

import SwiftUI

struct DataContainerErrorView: View {
    
    var body: some View {
        
        ContentUnavailableView(
            "Data.None.Title",
            systemImage: "exclamationmark.triangle",
            description: Text("Data.None.Description")
        )
        
    }
    
}

#Preview {
    DataContainerErrorView()
}
