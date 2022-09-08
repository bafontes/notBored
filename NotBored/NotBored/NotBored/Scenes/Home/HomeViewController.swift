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
    @IBOutlet weak var textfield: UITextField! {
        didSet {
            textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.setTitle("Start", for: .normal)
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
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
    @IBOutlet weak var picker: UIPickerView! {
        didSet {
            picker.dataSource = self
            picker.delegate = self
        }
    }
    
    let pickerData: [PriceRanges] = [.free, .low, .medium, .high]
    var rangeSelected: PriceRanges = .free
    var cantParticipants: Int = 0
    //    MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = .backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
//    MARK: - actions
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let vc: TabBarViewController = TabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func termsAndConditionsButtonAction(_ sender: Any) {
        let vc: TermsAndConditionsViewController = TermsAndConditionsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let cantParticipants: Int = Int(textfield.text ?? ""), cantParticipants > 0  else {
            textfield.layer.borderColor = UIColor.red.cgColor
            textfield.layer.borderWidth = 2
            textfield.layer.cornerRadius = 10
            textfield.textColor = .red
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
            return
        }
        nextButton.isEnabled = true
        nextButton.backgroundColor = .mainColor
        self.cantParticipants = cantParticipants
        textfield.layer.borderWidth = 0
        textfield.textColor = .black
    }
}
//    MARK: - Extensions

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.rangeSelected = pickerData[row]
    }
}

extension HomeViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
