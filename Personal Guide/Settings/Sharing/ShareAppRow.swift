//
//  ShareAppRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 09.03.24.
//

import SwiftUI

struct ShareAppRow: View {
    
    var body: some View {
        
        SettingsRow(iconName: "square.and.arrow.up.fill", color: .orange) {
            
            ShareLink(
                item: URL(string: "https://apps.apple.com/de/app/personal-guide/id6475791627")!,
                subject: Text("App.Share.Subject"),
                message: Text("App.Share.Message")) {
                    
                    Text("App.Share")
                    
            }
            .foregroundStyle(.primary)
            
        }
        
    }
    
}

#Preview("ShareAppRow (EN)") {
    Form {
        ShareAppRow()
    }
    .environment(\.locale, .init(identifier: "en"))
}

#Preview("ShareAppRow (DE)") {
    Form {
        ShareAppRow()
    }
    .environment(\.locale, .init(identifier: "de"))
}
