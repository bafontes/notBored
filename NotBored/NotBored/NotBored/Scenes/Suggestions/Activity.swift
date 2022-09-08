//
//  Activity.swift
//  NotBored
//
//  Created by Francisco Caches Magis on 6/9/22.
//

import Foundation
import Alamofire


class Activity{
    
    let name: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: Int
    
    init(name: String, accessability: Double, type: String, participants: Int, price: Double, link: String, key: Int){
        
        self.name = name
        self.accessibility = accessability
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.key = key
        
    }
    
    func prueba(){
        
        let request = AF.request(" ")
    }
    
}
