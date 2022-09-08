//
//  SuggestionsViewController.swift
//  NotBored
//
//  Created by Francisco Caches Magis on 6/9/22.
//

import UIKit

protocol SuggestionsViewControllerDelegate {
    func sendData(activity: Activities, isRandom: Bool)
    
}

class SuggestionsViewController: BaseViewController {
    
//    var avticidadMock = Activities(activity: "Correr", accessibility: 0.2, type: "Deporte", participants: 1, price: 0.0, link: "", key: "")
    var activity: Activities?
    var isRandom: Bool = false
    var delegate: SuggestionsViewControllerDelegate?
    
    @IBOutlet weak var ActivityUILabel: UILabel!{
        
        didSet{
            
            ActivityUILabel.font = .systemFont(ofSize: 50, weight: .black)
            ActivityUILabel.isHighlighted = true
            ActivityUILabel.numberOfLines = 0
            guard let activity = activity else {
                return
            }

            ActivityUILabel.text = activity.activity
        }
    }
    
    @IBOutlet weak var ActivityInfoUILabel: UILabel!
    
    @IBOutlet weak var AnotherActivityButton: UIButton!{
        
        didSet{
            AnotherActivityButton.setTitle("Try another", for: .normal)
            AnotherActivityButton.backgroundColor = .mainColor
        }
    }
    @IBOutlet weak var AmountParticipantsUILabel: UILabel!{
        
        didSet{
            
        }
    }
    @IBOutlet weak var PriceUIlabel: UILabel!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var ActivityCategoryUILabel: UILabel!{
        
        didSet{
            ActivityCategoryUILabel.text = activity?.type
        }
    }
    
    @IBAction func NewActivity(_ sender: Any) {
            
    }
    
    @IBOutlet weak var CategoryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (isRandom){
            title = "Random"
            CategoryImage.isHidden = true
            ActivityCategoryUILabel.isHidden = true
        }else{
            title = activity?.type
        }
        guard let participants = activity?.participants,
              let price = activity?.price else {
            return
        }
        AmountParticipantsUILabel.text = String(participants)
        PriceUIlabel.text = priceRange(price)
    }
    
    func priceRange(_ price: Double) -> String{
        
        switch price {
        case 0.1...0.3:
            return("Low")
        case 0.4...0.6:
            return("Medium")
        case 0.5...1.0:
            return("High")
        default:
            return("Free")
        }
        
    }

}
