//
//  SuggestionsViewController.swift
//  NotBored
//
//  Created by Francisco Caches Magis on 6/9/22.
//

import UIKit

class SuggestionsViewController: UIViewController {

    
    @IBOutlet weak var ActivityUILabel: UILabel!{
        
        didSet{
            
            ActivityUILabel.font = .systemFont(ofSize: 50, weight: .black)
            ActivityUILabel.isHighlighted = true
            
        }
        
    }
    
    @IBOutlet weak var ActivityInfoUILabel: UILabel!
    
    
    @IBOutlet weak var AnotherActivityButton: UIButton!{
        
        didSet{
            AnotherActivityButton.configuration?.title = "Try another"
            AnotherActivityButton.configuration?.baseBackgroundColor = .mainColor
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

}
