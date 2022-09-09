//
//  SuggestionsViewController.swift
//  NotBored
//
//  Created by Francisco Caches Magis on 6/9/22.
//

import UIKit

class SuggestionsViewController: BaseViewController {
    
    let activitiesViewModel = ActivitiesViewModel()
    var participants: Int?
    var priceRange: PriceRanges?
    var currentCategory: String?
    var activity: Activities?
    var isRandom: Bool = false
    
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
        activitiesViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isRandom {
            getActivity(participants: participants ?? 1, priceRange: priceRange ?? .free, category: nil)
        }
    }
    
    public func getActivity(participants: Int, priceRange: PriceRanges, category: String?){
        self.participants = participants
        self.priceRange = priceRange
        if let _ = category {
            isRandom = false
        } else {
            isRandom = true
        }
        activitiesViewModel.getActivity(participants: participants , priceRange: priceRange , category: category)
    }
    
    private func updateView(){
        if (isRandom){
            tabBarController?.navigationItem.title = "Random"
            CategoryImage.isHidden = true
            ActivityCategoryUILabel.isHidden = true
        }else{
            title = activity?.type.capitalized
        }
        guard let participants = activity?.participants,
              let price = activity?.price else {
            return
        }
        AmountParticipantsUILabel.text = String(participants)
        PriceUIlabel.text = priceRange(price)
        ActivityUILabel.text = activity?.activity
        ActivityCategoryUILabel.text = activity?.type
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
    
    @IBAction func anotherButtonAction(_ sender: Any) {
        if isRandom {
            getActivity(participants: participants ?? 1, priceRange: priceRange ?? .free, category: nil)
        } else {
            getActivity(participants: participants ?? 1, priceRange: priceRange ?? .free, category: activity?.type)
        }
    }
    
}

extension SuggestionsViewController: ActivitiesDelegateProtocol {
    func activityLoaded(activity: Activities) {
        self.activity = activity
        updateView()
    }
    
    func errorHandler(error: String) {
        print("error")
    }
}
