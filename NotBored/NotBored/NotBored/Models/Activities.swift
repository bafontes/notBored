//
//  Activities.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import Foundation

enum PriceRanges: String {
    case free = "Free"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

struct Activities: Codable {
    
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    
}

struct ActivitesError: Codable {
    let error: String
}
