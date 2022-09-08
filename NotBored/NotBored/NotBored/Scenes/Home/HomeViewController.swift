//
//  HomeViewController.swift
//  NotBored
//
//  Created by Bruno Andres Fontes on 6/9/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Not Bored"
            titleLabel.textColor = .mainColor
            titleLabel.font = UIFont(name: "Courier New", size: 35)
        }
    }
    @IBOutlet weak var subtitleLabel: UILabel! {
        didSet {
            subtitleLabel.text = "Participants"
            subtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.setTitle("Start", for: .normal)
            nextButton.backgroundColor = .mainColor
            nextButton.tintColor = .white
            nextButton.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var termsAndConditionsButton: UIButton! {
        didSet {
            termsAndConditionsButton.tintColor = .black
            let attributes: [NSAttributedString.Key: Any] = [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            ]
            let attributeString = NSMutableAttributedString(string: "Terms and conditions", attributes: attributes)
            termsAndConditionsButton.setAttributedTitle(attributeString, for: .normal)
        }
    }
//    MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
    }
//    MARK: - actions
    
    @IBAction func nextButtonAction(_ sender: Any) {
        guard let cantParticipants: Int = Int(textfield.text ?? "") else {
            textfield.layer.borderColor = UIColor.red.cgColor
            textfield.layer.borderWidth = 2
            textfield.layer.cornerRadius = 10
            textfield.textColor = .red
            return
        }
        print(cantParticipants)
        textfield.layer.borderWidth = 0
        textfield.textColor = .black
//        TODO: make redirection with cantParticipant
    }
    @IBAction func termsAndConditionsButtonAction(_ sender: Any) {
        let vc: TermsAndConditionsViewController = TermsAndConditionsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
}
