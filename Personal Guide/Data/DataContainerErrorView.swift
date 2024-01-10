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
            "Data Unavailable",
            systemImage: "exclamationmark.triangle",
            description: Text("We are having trouble accessing the necessary data. Please give me some time to fix the error. Please keep your app updated.")
        )
        
    }
    
}

#Preview {
    DataContainerErrorView()
}
