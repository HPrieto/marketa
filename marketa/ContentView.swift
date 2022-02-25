//
//  ContentView.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import SwiftUI
import CoreData

// <img alt="Banner Image" class="Image--image" src="https://storage.opensea.io/static/banners/dclwearables-banner.png" style="object-fit: cover;">

struct ContentView: View {
    
    private let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }

    var body: some View {
        NavigationView {
            
            VStack {
                
                ScrollView {
                    
                    AssetCollectionView(
                        imageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
                        image: UIImage(named: "decentralandLogo48")!,
                        title: "Decentraland",
                        name: "edlc",
                        description: "The first fully decentralized world, Decentraland is controlled via the DAO, which owns the most important smart contracts and assets of Decentraland. Via the DAO, you decide and vote on how the world works."
                    )
                        .onTapGesture {
                            
                        }
                    
                    AssetCollectionView(
                        imageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
                        image: UIImage(named: "decentralandLogo48")!,
                        title: "Decentraland",
                        name: "edlc",
                        description: "The first fully decentralized world, Decentraland is controlled via the DAO, which owns the most important smart contracts and assets of Decentraland. Via the DAO, you decide and vote on how the world works."
                    )
                        .onTapGesture {
                            
                        }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Collections")
                            .font(.avenirNext(.semibold, size: 24))
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }

    private func addItem() {
        
    }

    private func deleteItems(offsets: IndexSet) {
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(container: .preview)
    }
}
#endif
