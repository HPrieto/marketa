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
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
            
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
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
