//
//  Models.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/18/22.
//

import UIKit

// MARK: OSAsset

struct OSAsset: Codable {
    public var tokenId: String?
    public var numSales: Int32?
    public var imageUrl: String?
    public var imagePreviewUrl: String?
    public var imageThumbnailUrl: String?
    public var imageOriginalUrl: String?
    public var isPresale: Bool?
    public var animationUrl: String?
    public var animationOriginalUrl: String?
    public var backgroundColor: String?
    public var name: String?
    public var description: String?
    public var externalLink: String?
    public var permalink: String?
    public var lastSale: Float?
    public var collection: OSAssetCollection?
    public var traits: [OSTrait]?
    public var assetContract: OSAssetContract?
    public var owner: OSAccount?
    public var sellOrders: [OSSellOrder]?
    
    private enum CodingKeys: String, CodingKey {
        case tokenId = "token_id"
        case numSales = "num_sales"
        case imageUrl = "image_url"
        case imagePreviewUrl = "image_preview_url"
        case imageThumbnailUrl = "image_thumbnail_url"
        case imageOriginalUrl = "image_original_url"
        case isPresale = "is_presale"
        case animationUrl = "animation_url"
        case animationOriginalUrl = "animation_original_url"
        case backgroundColor = "background_color"
        case name = "name"
        case description = "description"
        case externalLink = "external_link"
        case assetContract = "asset_contract"
        case owner = "owner"
        case permalink = "permalink"
        case traits = "traits"
        case lastSale = "last_sale"
        case collection = "collection"
        case sellOrders = "sell_orders"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            tokenId = try String(container.decode(Int32.self, forKey: .tokenId))
        } catch DecodingError.typeMismatch {
            tokenId = try container.decodeIfPresent(String.self, forKey: .tokenId)
        }
        numSales = try container.decodeIfPresent(Int32.self, forKey: .numSales)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        imagePreviewUrl = try container.decodeIfPresent(String.self, forKey: .imagePreviewUrl)
        imageThumbnailUrl = try container.decodeIfPresent(String.self, forKey: .imageThumbnailUrl)
        imageOriginalUrl = try container.decodeIfPresent(String.self, forKey: .imageOriginalUrl)
        isPresale = try container.decodeIfPresent(Bool.self, forKey: .isPresale)
        animationUrl = try container.decodeIfPresent(String.self, forKey: .animationUrl)
        animationOriginalUrl = try container.decodeIfPresent(String.self, forKey: .animationOriginalUrl)
        backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        assetContract = try container.decodeIfPresent(OSAssetContract.self, forKey: .assetContract)
        owner = try container.decodeIfPresent(OSAccount.self, forKey: .owner)
        permalink = try container.decodeIfPresent(String.self, forKey: .permalink)
        traits = try container.decodeIfPresent([OSTrait].self, forKey: .traits)
        lastSale = try container.decodeIfPresent(Float.self, forKey: .lastSale)
        collection = try container.decodeIfPresent(OSAssetCollection.self, forKey: .collection)
        sellOrders = try container.decodeIfPresent([OSSellOrder].self, forKey: .sellOrders)
    }
}

// MARK: - OSAssetResponse

class OSAssetResponse: Codable {
    public var assets: [OSAsset]?
    public var success: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case success = "success"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assets = try container.decodeIfPresent([OSAsset].self, forKey: .assets)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
    }
}

// MARK: - OSAssetCollection

extension OSAsset {

    struct OSAssetCollection: Codable, Equatable {
        public var bannerImageUrl: String?
        public var description: String?
        public var hidden: Bool?
        public var imageUrl: String?
        public var name: String?
        
        private enum CodingKeys: String, CodingKey {
            case bannerImageUrl = "banner_image_url"
            case description = "description"
            case hidden = "hidden"
            case imageUrl = "image_url"
            case name = "name"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            bannerImageUrl = try container.decodeIfPresent(String.self, forKey: .bannerImageUrl)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            name = try container.decodeIfPresent(String.self, forKey: .name)
        }
    }
}

// MARK: - OSTrait

extension OSAsset {
    
    struct OSTrait: Codable {
        public var traitType: String?
        public var value: String?
        public var displayType: String?
        public var traitCount: Int32?
        public var maxValue: String?
        public var order: Int32?
        
        private enum CodingKeys: String, CodingKey {
            case traitType = "trait_type"
            case value = "value"
            case displayType = "display_type"
            case traitCount = "trait_count"
            case maxValue = "max_value"
            case order = "order"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            traitType = try container.decodeIfPresent(String.self, forKey: .traitType)
            do {
                value = try String(container.decode(Int32.self, forKey: .value))
            } catch DecodingError.typeMismatch {
                value = try container.decodeIfPresent(String.self, forKey: .value)
            }
            displayType = try container.decodeIfPresent(String.self, forKey: .displayType)
            traitCount = try container.decodeIfPresent(Int32.self, forKey: .traitCount)
            maxValue = try container.decodeIfPresent(String.self, forKey: .maxValue)
            order = try container.decodeIfPresent(Int32.self, forKey: .order)
        }
    }
}

// MARK: - OSAssetContract

extension OSAsset {
    
    struct OSAssetContract: Codable {
        public var address: String?
        public var name: String?
        public var symbol: String?
        public var imageUrl: String?
        public var description: String?
        public var externalLink: String?
        
        private enum CodingKeys: String, CodingKey {
            case address = "address"
            case name = "name"
            case symbol = "symbol"
            case imageUrl = "image_url"
            case description = "description"
            case externalLink = "external_link"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            address = try container.decodeIfPresent(String.self, forKey: .address)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        }
    }
}

// MARK: - OSAccount

extension OSAsset {
    
    struct OSAccount: Codable {
        public var address: String?
        public var profileImageUrl: String?
        public var user: OSUser?
        public var config: String?
        
        private enum CodingKeys: String, CodingKey {
            case address = "address"
            case profileImageUrl = "profile_img_url"
            case user = "user"
            case config = "config"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            address = try container.decodeIfPresent(String.self, forKey: .address)
            profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
            user = try container.decodeIfPresent(OSUser.self, forKey: .user)
            config = try container.decodeIfPresent(String.self, forKey: .config)
        }
    }
}

// MARK: - OSSellOrder

extension OSAsset {
    
    struct OSSellOrder: Codable {
        public var createdDate: String?
        public var closingDate: String?
        public var closingExtendable: Bool?
        public var expirationTime: Double?
        public var listingTime: Double?
        public var orderHash: String?
        public var exchange: String?
        public var currentPrice: String?
        public var currentBounty: String?
        public var bountyMultiple: String?
        public var makerRelayerFee: String?
        public var makerProtocolFee: String?
        public var takerProtocolFee: String?
        public var makerReferrerFee: String?
        public var feeMethod: Int?
        public var side: Int?
        public var saleKind: Int?
        public var target: String?
        public var howToCall: Int?
        public var callData: String?
        public var replacementPattern: String?
        public var staticTarget: String?
        public var staticExtradata: String?
        public var paymentToken: String?
        public var basePrice: String?
        public var extra: String?
        public var quantity: String?
        public var salt: String?
        public var v: Int?
        public var r: String?
        public var s: String?
        public var approvedOnChain: Bool?
        public var cancelled: Bool?
        public var finalized: Bool?
        public var markedInvalid: Bool?
        public var prefixedHash: String?
        public var paymentTokenContract: OSPaymentTokenContract?

        private enum CodingKeys: String, CodingKey {
            case createdDate = "created_date"
            case closingDate = "closing_date"
            case closingExtendable = "closingExtendable"
            case expirationTime = "expiration_time"
            case listingTime = "listing_time"
            case orderHash = "order_hash"
            case exchange = "exchange"
            case currentPrice = "current_price"
            case currentBounty = "current_bounty"
            case bountyMultiple = "bounty_multiple"
            case makerRelayerFee = "maker_relayer_fee"
            case makerProtocolFee = "maker_protocol_fee"
            case takerProtocolFee = "taker_protocol_fee"
            case makerReferrerFee = "maker_referrer_fee"
            case feeMethod = "fee_method"
            case side = "side"
            case saleKind = "sale_kind"
            case target = "target"
            case howToCall = "how_to_call"
            case callData = "call_data"
            case replacementPattern = "replacement_pattern"
            case staticTarget = "static_target"
            case staticExtradata = "static_extradata"
            case paymentToken = "payment_token"
            case basePrice = "base_price"
            case extra = "extra"
            case quantity = "quantity"
            case salt = "salt"
            case v = "v"
            case r = "r"
            case s = "s"
            case approvedOnChain = "approved_on_chain"
            case cancelled = "cancelled"
            case finalized = "finalized"
            case markedInvalid = "marked_invalid"
            case prefixedHash = "prefixed_hash"
            case paymentTokenContract = "payment_token_contract"
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
            closingDate = try container.decodeIfPresent(String.self, forKey: .closingDate)
            closingExtendable = try container.decodeIfPresent(Bool.self, forKey: .closingExtendable)
            expirationTime = try container.decodeIfPresent(Double.self, forKey: .expirationTime)
            listingTime = try container.decodeIfPresent(Double.self, forKey: .listingTime)
            orderHash = try container.decodeIfPresent(String.self, forKey: .orderHash)
            exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
            currentPrice = try container.decodeIfPresent(String.self, forKey: .currentPrice)
            currentBounty = try container.decodeIfPresent(String.self, forKey: .currentBounty)
            bountyMultiple = try container.decodeIfPresent(String.self, forKey: .bountyMultiple)
            makerRelayerFee = try container.decodeIfPresent(String.self, forKey: .makerRelayerFee)
            feeMethod = try container.decodeIfPresent(Int.self, forKey: .feeMethod)
            side = try container.decodeIfPresent(Int.self, forKey: .side)
            saleKind = try container.decodeIfPresent(Int.self, forKey: .saleKind)
            target = try container.decodeIfPresent(String.self, forKey: .target)
            howToCall = try container.decodeIfPresent(Int.self, forKey: .howToCall)
            callData = try container.decodeIfPresent(String.self, forKey: .callData)
            replacementPattern = try container.decodeIfPresent(String.self, forKey: .replacementPattern)
            staticTarget = try container.decodeIfPresent(String.self, forKey: .staticTarget)
            staticExtradata = try container.decodeIfPresent(String.self, forKey: .staticExtradata)
            paymentToken = try container.decodeIfPresent(String.self, forKey: .paymentToken)
            basePrice = try container.decodeIfPresent(String.self, forKey: .basePrice)
            extra = try container.decodeIfPresent(String.self, forKey: .extra)
            quantity = try container.decodeIfPresent(String.self, forKey: .quantity)
            salt = try container.decodeIfPresent(String.self, forKey: .salt)
            v = try container.decodeIfPresent(Int.self, forKey: .v)
            r = try container.decodeIfPresent(String.self, forKey: .r)
            s = try container.decodeIfPresent(String.self, forKey: .s)
            approvedOnChain = try container.decodeIfPresent(Bool.self, forKey: .approvedOnChain)
            cancelled = try container.decodeIfPresent(Bool.self, forKey: .cancelled)
            finalized = try container.decodeIfPresent(Bool.self, forKey: .finalized)
            markedInvalid = try container.decodeIfPresent(Bool.self, forKey: .markedInvalid)
            prefixedHash = try container.decodeIfPresent(String.self, forKey: .prefixedHash)
            paymentTokenContract = try container.decodeIfPresent(OSPaymentTokenContract.self, forKey: .paymentTokenContract)
        }
    }
}

// MARK: - OSPaymentTokenContract

extension OSAsset.OSSellOrder {
    
    struct OSPaymentTokenContract: Codable {
        public var id: Int32?
        public var symbol: String?
        public var address: String?
        public var imageUrl: String?
        public var name: String?
        public var decimals: Int32?
        public var ethPrice: String?
        public var usdPrice: String?
        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case symbol = "symbol"
            case address = "address"
            case imageUrl = "image_url"
            case name = "name"
            case decimals = "decimals"
            case ethPrice = "eth_price"
            case usdPrice = "usd_price"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(Int32.self, forKey: .id)
            symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
            address = try container.decodeIfPresent(String.self, forKey: .address)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            decimals = try container.decodeIfPresent(Int32.self, forKey: .decimals)
            ethPrice = try container.decodeIfPresent(String.self, forKey: .ethPrice)
            usdPrice = try container.decodeIfPresent(String.self, forKey: .usdPrice)
        }
    }
}

// MARK: - OSUser

extension OSAsset.OSAccount {
    
    struct OSUser: Codable {
        public var username: String?
        
        private enum CodingKeys: String, CodingKey {
            case username = "username"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            username = try container.decodeIfPresent(String.self, forKey: .username)
        }
    }
}
