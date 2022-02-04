//
//  AssetDetailView.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/4/22.
//

import SwiftUI

struct AssetDetailView: View {
    var imageUrlString: String
    var title: String
    var id: String
    var numberOfLikes: String
    var owner: String
    var numberOfFavorites: String
    
    var imageUrl: URL? {
        URL(string: self.imageUrlString)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Title
//                        HStack(spacing: 4) {
//
//                            Text(self.title)
//                                .font(.avenirNext(.medium, size: 18))
//                                .foregroundColor(.blue)
//
//                            Image(uiImage: UIImage(named: "verifiedLogo")!)
//                                .resizable()
//                                .frame(width: 24, height: 24)
//
//                        }
//
//                        Text(self.id)
//                            .font(.avenirNext(.bold, size: 30))
                        
                        // Image with like button
                        VStack(spacing: 0) {
                            
                            HStack(spacing: 6) {
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(.gray)
                                
                                Text(self.numberOfLikes)
                                    .font(.avenirNext(.semibold, size: 12))
                                    .foregroundColor(.gray)
                            }
                            .padding(12)
                            
                            // Image
                            AsyncImage(url: self.imageUrl) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                                    .foregroundColor(.white)
                            }
                            .frame(width: geometryReader.size.width - 32, height: geometryReader.size.width - 32)
                            .background(.gray)
                            .cornerRadius(15)


                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray, lineWidth: 0.333)
                        )
                        
                        // Creator Info
                        HStack(spacing: 16) {
                            
                            HStack(spacing: 4) {
                                Text("Owned by")
                                    .foregroundColor(.gray)
                                    .font(.avenirNext(.medium, size: 14))
                                
                                Text(self.owner)
                                    .foregroundColor(.blue)
                                    .font(.avenirNext(.medium, size: 14))
                                
                                Image(uiImage: UIImage(named: "verifiedLogo")!)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                            }
                            
                            HStack {
                                
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.gray)
                                    .aspectRatio(contentMode: .fit)
                                
                                Text("\(self.numberOfFavorites) favorites")
                                    .font(.avenirNext(.medium, size: 14))
                                    .foregroundColor(.gray)
                                
                            }
                            
                        }
                        
                        // Asset Detail Group
                        
                        VStack(spacing: 5) {
                            Group {
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    
                                    // Sale duration
                                    HStack {
                                        
                                        Image(systemName: "clock")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.gray)
                                        
                                        Spacer()
                                        
                                        Text("Sale ends July 8, 2022 at 10:59am PST")
                                            .foregroundColor(.gray)
                                            .font(.avenirNext(.medium, size: 16))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "questionmark.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding()
                                    
                                    Divider()
                                    
                                    // Eth price, Fiat price, bid button
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        Text("Top bid -- Reserve Price not met.")
                                            .foregroundColor(.gray)
                                            .font(.avenirNext(.medium, size: 14))
                                        
                                        HStack {
                                            
                                            Text("30")
                                                .font(.avenirNext(.bold, size: 30))
                                            
                                            Text("($88,780.80)")
                                                .foregroundColor(.gray)
                                                .font(.avenirNext(.semibold, size: 15))
                                            
                                            Image(systemName: "arrow.up.right.circle.fill")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            
                                        }
                                        
                                        Button {
                                            print("Bidding...")
                                        } label: {
                                            HStack(spacing: 12) {
                                                
                                                Spacer()
                                                
                                                Image(systemName: "folder.fill.badge.plus")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(.white)
                                                    .frame(width: 24, height: 24)
                                                
                                                Text("Place bid")
                                                    .foregroundColor(.white)
                                                    .font(.avenirNext(.bold, size: 16))
                                                
                                                Spacer()
                                                
                                            }
                                        }
                                        .padding()
                                        .frame(width: .infinity)
                                        .background(.blue)
                                        .cornerRadius(8)
                                        
                                    }
                                    .padding()

                                    
                                }
                                
                                // Listings section
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: "tag.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Listings")
                                        .font(.avenirNext(.semibold, size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("Showing listings...")
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 12, height: 12)
                                            .font(Font.title.weight(.bold))
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                                .padding()
                                
                                // Offers
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: "list.bullet")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Offers")
                                        .font(.avenirNext(.semibold, size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("Showing offers...")
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 12, height: 12)
                                            .font(Font.title.weight(.bold))
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                                .padding()
                                
                                // Price History
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: "chart.xyaxis.line")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Price History")
                                        .font(.avenirNext(.semibold, size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("Showing price history...")
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 12, height: 12)
                                            .font(Font.title.weight(.bold))
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                                .padding()
                                
                                // Description
                                VStack(alignment: .leading, spacing: 0) {
                                    
                                    HStack(spacing: 12) {
                                        
                                        Image(systemName: "chart.xyaxis.line")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                        
                                        Text("Description")
                                            .font(.avenirNext(.semibold, size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            print("Description...")
                                        } label: {
                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 12, height: 12)
                                                .font(Font.title.weight(.bold))
                                        }
                                        .foregroundColor(.black)
                                        
                                    }
                                    .padding()
                                    
                                    Divider()
                                    
                                    HStack(spacing: 4) {
                                        
                                        Text("Created by")
                                            .font(.avenirNext(.medium, size: 14))
                                            .foregroundColor(.gray)
                                        
                                        Text("Decentraland")
                                            .font(.avenirNext(.medium, size: 14))
                                            .foregroundColor(.blue)
                                        
                                        Image(uiImage: .verifiedLogo)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding()
                                    
                                    Divider()
                                    
                                    // Properties
                                    HStack(spacing: 12) {
                                        
                                        Image(systemName: "tag.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                        
                                        Text("Properties")
                                            .font(.avenirNext(.semibold, size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            print("Showing properties...")
                                        } label: {
                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 12, height: 12)
                                                .font(Font.title.weight(.bold))
                                        }
                                        .foregroundColor(.black)
                                        
                                    }
                                    .padding()
                                    
                                    Divider()
                                    
                                    // Details
                                    HStack(spacing: 12) {
                                        
                                        Image(systemName: "list.bullet.rectangle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                        
                                        Text("Details")
                                            .font(.avenirNext(.semibold, size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            print("Showing details...")
                                        } label: {
                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 12, height: 12)
                                                .font(Font.title.weight(.bold))
                                        }
                                        .foregroundColor(.black)
                                        
                                    }
                                    .padding()
                                }
                                
                                // Item Activity
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: "arrow.up.arrow.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Item Activity")
                                        .font(.avenirNext(.semibold, size: 16))
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("Showing details...")
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 12, height: 12)
                                            .font(Font.title.weight(.bold))
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                                .padding()
                                
                            }
                            .frame(width: geometryReader.size.width - 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray, lineWidth: 0.333)
                            )
                        }
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                print("Going back...")
                            } label: {
                                Label("Back", systemImage: "chevron.left")
                                    .font(Font.body.weight(.medium))
                            }
                            .foregroundColor(.black)
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Text("Decentraland")
                                    .font(.avenirNext(.medium, size: 16))
                                    .foregroundColor(.blue)
                                
                                Image(uiImage: .verifiedLogo)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text(self.id)
                                    .font(.avenirNext(.bold, size: 16))
                                    .foregroundColor(.black)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                print("elipse")
                            } label: {
                                Label("share", systemImage: "square.and.arrow.up")
                                    .font(Font.body.weight(.medium))
                            }
                            .foregroundColor(.black)
                        }
                    }
                    .padding(16)
                }
            }
        }
    }
}

struct AssetDetailView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        AssetDetailView(
            imageUrlString: "https://lh3.googleusercontent.com/OPQBv0C_c5MYhocYTZsFAq-r8-NqGDYv1qipHiiAD3gLTeoM_qWcLDVLKWcNpzCHoLMkMHBykLacsSUTzutlMwJohXjq_iFP26h9=w600",
            title: "Decentraland",
            id: "#5448",
            numberOfLikes: "1.3K",
            owner: "Jimipapi",
            numberOfFavorites: "1.3K"
        )
    }
}

/**
 <img class="Image--image" src="https://lh3.googleusercontent.com/OPQBv0C_c5MYhocYTZsFAq-r8-NqGDYv1qipHiiAD3gLTeoM_qWcLDVLKWcNpzCHoLMkMHBykLacsSUTzutlMwJohXjq_iFP26h9=w600" style="width: auto; height: auto; max-width: 100%; max-height: 100%; border-radius: initial;">
 }*/
