//
//  AppColorSchemeSection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppColorSchemeSection: View {
    
    @AppStorage("appColorScheme") private var appColorScheme: AppColorScheme = .system
    
    var body: some View {
        
        Section("Settings.ColorScheme.Section") {
            SettingsRow(iconName: "paintpalette.fill", color: .purple) {
                Picker("Settings.ColorScheme.Label", selection: $appColorScheme) {
                    ForEach(AppColorScheme.allCases, id: \.self) { value in
                        Text(value.localizedName)
                    }
                }
            }
        }
        
    }
    
}

#Preview("AppColorSchemeSection (EN)") {
    Form {
        AppColorSchemeSection()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("AppColorSchemeSection (DE)") {
    Form {
        AppColorSchemeSection()
    }
    .environment(\.locale, .init(identifier: "de"))
}
