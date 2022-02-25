//
//  RootViewModifier.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/24/22.
//

import SwiftUI
import Combine

struct RootViewAppearance: ViewModifier {
    
    @Environment(\.injected) private var injected: DIContainer
    @State private var isActive: Bool = false
    internal let inspection = Inspection<Self>()
    
    func body(content: Content) -> some View {
        content
            .blur(radius: isActive ? 0 : 10)
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }
    
    
}
