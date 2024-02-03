//
//  SettingsView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        Form {
            
            AppVersionSection()
            DocumentationLink()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Settings")
        
    }
    
}

#Preview {
    SettingsView()
}
