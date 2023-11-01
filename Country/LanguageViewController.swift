//
//  LanguageViewController.swift
//  Country
//
//  Created by C S Pooja on 31/10/23.
//

import UIKit

protocol LanguageSelectionDelegate {
    func didSelectLanguage(langName: String)
}

class LanguageViewController: UIViewController {
    
    @IBOutlet weak var languageTableView: UITableView!
    @IBAction func onTapClose(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var delegate: LanguageSelectionDelegate?
    let chooseLangData:[CountryLanguageModel] = [.english, .arabic]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LanguageTableViewCell", bundle: nil)
        languageTableView.register(nib, forCellReuseIdentifier: "LanguageTableViewCell")
    }
}

extension LanguageViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chooseLangData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = languageTableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as? LanguageTableViewCell
        let language = chooseLangData[indexPath.row]
        cell?.onClickChangeLanguage.text = language.text
        cell?.layer.cornerRadius = cell!.frame.height / 2
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = languageTableView.cellForRow(at: indexPath) as? LanguageTableViewCell{
            cell.onClickChangeLanguage.isHidden = true
        }
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? LanguageTableViewCell{
            cell.checkLanguage.isHidden = false
        }
    }
}
