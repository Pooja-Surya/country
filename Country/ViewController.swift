//
//  ViewController.swift
//  Country
//
//  Created by C S Pooja on 26/10/23.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var changeLangText: UIButton!
    @IBOutlet weak var selectedCountryImage: UIImageView!
    @IBOutlet weak var selectedCountryName: UILabel!
    @IBOutlet weak var langTextChanged: UILabel!
    
    var selectedIdentifier: String?
    var replaceButtonWithText: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCountryImage.layer.cornerRadius = selectedCountryImage.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let navControl = segue.destination as? UINavigationController,
           let countryVC = navControl.topViewController as? CountryViewController {
            countryVC.delegate = self
        }
        
        if let navControl = segue.destination as? UINavigationController,
           let languageVC = navControl.topViewController as? LanguageViewController {
            languageVC.delegate = self
        }
    }
}

extension ViewController: CountrySelectionDelegate,LanguageSelectionDelegate{
    
    func didSelectCountry(image: UIImage, name: String){
        selectedCountryImage.image = image
        selectedCountryImage.layer.cornerRadius = selectedCountryImage.frame.size.height / 2
        selectedCountryImage.layer.borderWidth = 0.25
        selectedCountryImage.layer.masksToBounds = true
        selectedCountryName.text = name
    }
    
    func didSelectLanguage(langName: String) {
        langTextChanged.text = langName
    }
}


