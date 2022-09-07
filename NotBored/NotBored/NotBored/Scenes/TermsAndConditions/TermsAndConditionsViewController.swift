//
//  TermsAndConditionsViewController.swift
//  NotBored
//
//  Created by Iara Denise Orosco on 06/09/2022.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    private lazy var termsLabel: UILabel = {
        let termsLabel = UILabel()
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.text = "Terms and Conditions"
        termsLabel.textColor = .black
        termsLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
      
        return termsLabel
    }()
    
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Not Bored"
        aLabel.font = UIFont(name: "Courier New", size: 28)
        aLabel.textColor = UIColor.init(named: "main")
       // aLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        //por defecto alineado a la izquierda
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    private lazy var textLabel: UILabel = {
        let termsLabel = UILabel()
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.text = termsAndConditionsText
        termsLabel.textColor = .black
        termsLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        termsLabel.numberOfLines = 0
        termsLabel.textAlignment = .left
        return termsLabel
    }()
    
    private lazy var closeImage: UIImageView = {
        let close = UIImageView()
        close.translatesAutoresizingMaskIntoConstraints = false
        close.image = UIImage(systemName: "xmark")
        close.tintColor = .black
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backToHome))
           close.isUserInteractionEnabled = true
           close.addGestureRecognizer(tapGestureRecognizer)

    
        return close
    }()
    
    @objc func backToHome() {
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        print("Tapped on Image")

    }
    
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        //scroll.delegate = .self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        return scroll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpConstraints()
    }
    
    
    // MARK: - View Code
    private func setUpView(){
        
        view.backgroundColor = .backgroundColor
        
        self.scrollView.addSubview(closeImage)
        self.scrollView.addSubview(termsLabel)
        self.scrollView.addSubview(titleLabel)
        self.scrollView.addSubview(textLabel)
        self.view.addSubview(scrollView)
      
    }
    
   
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            closeImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            
            closeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
            closeImage.widthAnchor.constraint(equalToConstant: 16),
            
            closeImage.heightAnchor.constraint(equalToConstant: 20),
            //------------------------------------------//
            
            termsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            
            termsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //en negativo porque son coordenadas -> en neg el lado derecho
            termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            //------------------------------------------//
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //en negativo porque son coordenadas -> en neg el lado derecho
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: termsLabel.topAnchor, constant: 40),
            
            //------------------------------------------//

            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //------------------------------------------//

            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
            
            
        ])
        
    }
    
    private var termsAndConditionsText: String = "Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec fermentum sed dictum laoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubilia senectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet, semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et eget pretium volutpat eu dictum dictumst. \n \n Praesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctor ullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncus mauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringilla ad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet mauris leo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostra quam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis. \n\n Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdum commodo montes convallis curae facilisis. Vitae diam phasellus litora ad aenean himenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis. \n\n Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per, tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque."
    
}
