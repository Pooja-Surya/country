//
//  CountryViewController.swift
//  Country
//
//  Created by C S Pooja on 27/10/23.

import UIKit

protocol CountrySelectionDelegate {
    func didSelectCountry(image: UIImage, name: String)
}

class CountryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var delegate: CountrySelectionDelegate?
    let countryArray: [Country] = [.jordan, .egypt, .palestine, .lebanon, .qatar, .uae, .algeria]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let openButton = UIBarButtonItem(image: UIImage.actions, style: .plain, target: self, action: #selector(didOpen))
        self.navigationItem.rightBarButtonItems = [openButton]
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CountrySelectionCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:  "CountrySelectionCell")
    }
    
    @objc func didOpen(){
        let alertController = UIAlertController(title: "Confirmation", message: "Do you want to close", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "CLOSE", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension CountryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountrySelectionCell", for: indexPath) as? CountrySelectionCell
        let country = countryArray[indexPath.row]
        cell?.fillCustomCell(imageIcon: country.myImage, imageText: country.text)
        cell?.myCountryImage.layer.cornerRadius = cell!.myCountryImage.frame.size.height / 2
        cell?.myCountryView.layer.cornerRadius = cell!.myCountryView.frame.height / 2
        cell?.myCountryImage.layer.borderWidth = 0.25
        let viewFrame = cell!.myCountryView.frame
        let cellFrame = viewFrame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
        cell?.myCountryView.frame = cellFrame
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell{
            cell.countryTick.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell{
            cell.countryTick.isHidden = false
            if let cell = tableView.cellForRow(at: indexPath) as? CountrySelectionCell {
                if let image = cell.myCountryImage.image, let name = cell.myCountry.text {
                    delegate?.didSelectCountry(image: image, name: name)
                }
            }
        }
    }
}
