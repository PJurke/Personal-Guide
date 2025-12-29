//
//  LifeAspectPicker.swift
//  Personal Guide
//
//  Created by Philip Jurke on 08.03.24.
//

import SwiftUI

struct LifeAspectPicker: View {
    
    @Binding var selection: LifeAspect
    
    var body: some View {
    
        Picker("Aspect", selection: $selection) {
            ForEach(LifeAspect.allCases, id: \.self) { aspect in
                Text(aspect.localized)
                    .fixedSize()
                    .tag(aspect)
            }
        }
        
    }
    
}

#Preview("LifeAspectPicker (EN)") {
    LifeAspectPicker(selection: .constant(.general))
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("LifeAspectPicker (DE)") {
    LifeAspectPicker(selection: .constant(.general))
        .environment(\.locale, .init(identifier: "de"))
}
