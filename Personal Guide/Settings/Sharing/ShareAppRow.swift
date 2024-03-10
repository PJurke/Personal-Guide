//
//  ShareAppRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 09.03.24.
//

import SwiftUI

struct ShareAppRow: View {
    
    
    
    var body: some View {
        
        ShareLink(
            item: URL(string: "https://apps.apple.com/de/app/personal-guide/id6475791627")!) {
            Text("App.Share")
        }
        
    }
    
}

#Preview {
    Form {
        ShareAppRow()
    }
}
