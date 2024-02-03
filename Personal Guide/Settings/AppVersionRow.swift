//
//  AppVersionRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppVersionRow: View {
    
    // View
    
    var body: some View {
        
        LabeledContent("Version") {
            Text("\(getAppVersion())")
        }
        
    }
    
    // Func
    
    func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Unavailable"
    }
    
}

#Preview {
    AppVersionRow()
}
