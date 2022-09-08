//
//  ActivitiesViewModel.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 08/09/2022.
//

import Foundation

protocol ActivitiesDelegateProtocol {
    func activityLoaded(activity: Activities)
    func errorHandler(error: String)
}

public class ActivitiesViewModel {
    var itemsActivities: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    
    let activityService = ActivitiesService()
    var delegate: ActivitiesDelegateProtocol?
    
    func getActivity(participants: Int, priceRange: PriceRanges, category: String?) {
        var minPrice = "0"
        var maxPrice = "0"

        switch priceRange {
        case .free:
            break
        case .low:
            minPrice = "0.1"
            maxPrice = "0.3"
        case .medium:
            minPrice = "0.4"
            maxPrice = "0.6"
        case .high:
            minPrice = "0.7"
            maxPrice = "1.0"
        }
                
        activityService.getActivity(participants: participants, priceRange: (minPrice, maxPrice), category: category) { activities in
            self.delegate?.activityLoaded(activity: activities)
        } onError: { errorData in
            self.delegate?.errorHandler(error: errorData)
        }
    }
}
