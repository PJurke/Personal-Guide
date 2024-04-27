//
//  SettingsView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                AppColorSchemeSection()
                AppVersionSection()
                DataSection()
                DocumentationLink()
                ShareAppRow()
                
            }
            .navigationTitle("Settings.Overview.Title")
        }
        
    }
    
}

#Preview {
    SettingsView()
}
