//
//  AssetView.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import SwiftUI

struct AssetCollectionDetailView: View {
    let imageUrlString: String
    
    private var imageUrl: URL? {
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
            .frame(maxHeight: 180)
            .cornerRadius(16)
            
            HStack(alignment: .top, spacing: 0) {
                
                // Left Column
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Collection Name w/ Verified Badge
                    HStack {
                        
                        Text("Decentraland")
                            .font(.avenirNext(.semibold, size: 14))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        
                        Image(uiImage: UIImage(named: "verifiedLogo")!)
                            .resizable()
                            .frame(width: 12, height: 12)
                            .aspectRatio(contentMode: .fit)
                            .offset(y: -2)
                        
                    }
                    
                    // Asset number
                    
                    Text("5465")
                        .font(.avenirNext(.semibold, size: 14))
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                // Right Column
                VStack(alignment: .trailing, spacing: 0) {
                    
                    Text("Top Bid")
                        .font(.avenirNext(.semibold, size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Text("90")
                        .font(.avenirNext(.semibold, size: 14))
                        .lineLimit(1)
                    
                    HStack(spacing: 2) {
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.gray)
                        
                        Text("3 days left")
                            .font(.avenirNext(.semibold, size: 11))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        
                    }
                    
                }
                
            }
            .padding()
            
            Divider()
            
            HStack() {
                
                Spacer()
                
                Image(systemName: "heart")
                    .frame(width: 12, height: 12)
                    .foregroundColor(.gray)
                
                Text("1.9K")
                    .foregroundColor(.gray)
                    .font(.avenirNext(.bold, size: 13))
                    .lineLimit(1)
                
            }
            .padding()
        }
        .frame(maxWidth: 180)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 0.333)
        )
        .padding(6)
    }
}

struct AssetCollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            
            VStack {
                
                HStack(spacing: 0) {
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                    
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                }
                
                HStack(spacing: 0) {
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                    
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                }
                
                HStack(spacing: 0) {
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                    
                    AssetCollectionDetailView(
                        imageUrlString: "https://lh3.googleusercontent.com/IZ5z4tppxxKfP-NHX9WgAFTyyoqFes1ReQ0M0CybiicFvKbngSbrIzkynxpccgSxkL2QILZ6qXELm-SU61j3bDHN3RDhQMTOekLr9w=w180"
                    )
                }
                
            }
            
        }
    }
}
