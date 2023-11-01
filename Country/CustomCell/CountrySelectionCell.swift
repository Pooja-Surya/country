//
//  CountrySelectionCell.swift
//  Country
//
//  Created by C S Pooja on 26/10/23.
//

import UIKit

class CountrySelectionCell: UITableViewCell {
  
    @IBOutlet weak var myCountryView: UIView!
    @IBOutlet weak var countryTick: UIImageView! {
        didSet{
            countryTick.isHidden = true
        }
    }
    @IBOutlet weak var myCountry: UILabel!
    @IBOutlet weak var myCountryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 22
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        let viewFrame = contentView.frame
        let cellFrame = viewFrame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        contentView.frame = cellFrame
        
    }
    func fillCustomCell(imageIcon: String, imageText: String){
        self.myCountryImage.image = UIImage(named: imageIcon)
        self.myCountry.text = imageText
    }
    
}
