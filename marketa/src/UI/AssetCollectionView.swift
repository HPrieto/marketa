//
//  AssetCollectionView.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import SwiftUI

struct AssetCollectionView: View {
    public var imageUrlString: String
    public var image: UIImage
    public var title: String
    public var name: String
    public var description: String
    
    public var imageUrl: URL? {
        URL(string: self.imageUrlString)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            AsyncImage(url: self.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            VStack(spacing: 4) {
                
                // collection profile image
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(24)
                    .overlay(Circle().stroke(.white, lineWidth: 4))
                    .padding(6)
                
                
                VStack(spacing: 2) {
                    HStack(spacing: 2) {
                        
                        Text(self.title)
                            .font(.avenirNext(.bold, size: 16))
                        
                        Image(uiImage: UIImage(named: "verifiedLogo")!)
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    
                    HStack(spacing: 4) {
                        Text("by")
                            .font(.avenirNext(.semibold, size: 14))
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 2) {
                            
                            Text(self.name)
                                .font(.avenirNext(.semibold, size: 14))
                                .foregroundColor(.blue)
                            
                            Image(uiImage: UIImage(named: "verifiedLogo")!)
                                .resizable()
                                .frame(width: 15, height: 15)
                            
                        }
                    }
                }
                .padding(.top)
                
                Text(self.description)
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .font(.avenirNext(.medium, size: 16))
                    .padding(.top)

            }
            .offset(y: -32)
            .padding(.leading)
            .padding(.trailing)
        }
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
        )
        .padding()
    }
}

struct AssetCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            AssetCollectionView(
                imageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
                image: UIImage(named: "decentralandLogo48")!,
                title: "Bored Ape Yacht Club",
                name: "BoredApeYachtClub",
                description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs - unique digital"
            )
            
            AssetCollectionView(
                imageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
                image: UIImage(named: "decentralandLogo48")!,
                title: "Bored Ape Yacht Club",
                name: "BoredApeYachtClub",
                description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs - unique digital"
            )
            
            AssetCollectionView(
                imageUrlString: "https://storage.opensea.io/static/banners/dclwearables-banner.png",
                image: UIImage(named: "decentralandLogo48")!,
                title: "Bored Ape Yacht Club",
                name: "BoredApeYachtClub",
                description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs - unique digital"
            )
        }
    }
}
