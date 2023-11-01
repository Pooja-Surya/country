//
//  LanguageTableViewCell.swift
//  Country
//
//  Created by C S Pooja on 30/10/23.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var onClickChangeLanguage: UILabel!
    @IBOutlet weak var checkLanguage: UIImageView!{
        didSet{
            checkLanguage.isHidden = true
        }
    }
    
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
    
    
}
