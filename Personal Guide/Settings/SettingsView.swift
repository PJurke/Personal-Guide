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
            .navigationTitle("Settings.Label")
        }
    }
    
}

#Preview("SettingsView (EN)") {
    SettingsView()
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("SettingsView (DE)") {
    SettingsView()
        .modelContainer(previewContainer)
        .environment(\.locale, .init(identifier: "de"))
}
