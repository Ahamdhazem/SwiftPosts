//
//  DetailsTableViewCell.swift
//  PostsApp
//
//  Created by LP Mackbook on 10/09/2026.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var view: UIView!
    @IBOutlet var feaildName: UILabel!
    @IBOutlet var feaildValue: UILabel!

    func set(_ key : String , _ value : String){
        self.feaildName?.text = key
        self.feaildValue?.text = value
        selectionStyle = .none
        if(key.isEmpty) {
            feaildName.isHidden = false
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        view.layer.cornerRadius = 30
    
    }
    
}
