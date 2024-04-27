//
//  AppVersionSection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppVersionSection: View {
    
    // View
    
    var body: some View {
        
        Section("Settings.Versioning.Section") {
            AppVersionRow()
            AppBuildRow()
        }
        
    }
    
}

#Preview("AppVersionSection (EN)") {
    Form {
        AppVersionSection()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("AppVersionSection (DE)") {
    Form {
        AppVersionSection()
    }
    .environment(\.locale, .init(identifier: "de"))
}
