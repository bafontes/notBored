//
//  ActivitiesService.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import Foundation
import Alamofire

struct ActivitiesService {
    
    typealias ActivitiesCompletion = (_ activities: Activities) -> Void
    typealias ErrorHandler = (_ errorData: String) -> Void

    public func getActivity(participants: Int, priceRange: (String, String), category: String?, onSuccess: @escaping ActivitiesCompletion, onError: @escaping ErrorHandler){
        
        var url = "http://www.boredapi.com/api/activity"
        url.append(contentsOf: "?participants=\(participants)")

        let priceRangeString = "&minprice=\(priceRange.0)&maxprice=\(priceRange.1)"
        url.append(contentsOf: priceRangeString)
        
        if let category = category {
            url.append(contentsOf: "&type=\(category)")
        }
        
        let requestApi = AF.request(url, encoding: URLEncoding.default)
        requestApi.responseDecodable(of: Activities.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let dataResponse):
                onSuccess(dataResponse)
            case .failure(let errorData):
                print(errorData)
                onError(errorData.errorDescription ?? "Error")
            }
        }
    }
}
