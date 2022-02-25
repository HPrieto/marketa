//
//  DropdownView.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/7/22.
//

import SwiftUI

struct DropdownView<Content>: View where Content: View {
    let systemName: String
    let title: String
    let subView: Content
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            HStack(spacing: 12) {
                
                Image(systemName: self.systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Text(self.title)
                    .font(.avenirNext(.semibold, size: 16))
                
                Spacer()
                
//                Image(systemName: "chevron.down")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 12, height: 12)
//                    .font(Font.title.weight(.bold))
//                .foregroundColor(.black)
            }
            .padding()
            
            if Content.self != EmptyView.self {
                Divider()
                
                subView
                    .frame(maxWidth: .infinity)
                    .background(.background)
            }
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 0.33)
        )
    }
    
    public init(systemName: String, title: String, @ViewBuilder subView: () -> Content) {
        self.systemName = systemName
        self.title = title
        self.subView = subView()
    }
    
    public init(systemName: String, title: String) {
        self.systemName = systemName
        self.title = title
        self.subView = EmptyView() as! Content
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DropdownView(systemName: "arrow.up.arrow.down", title: "Item Activity") {
                Text("Testing...")
            }
            
            DropdownView(systemName: "", title: "Testing") { }
        }
    }
}
