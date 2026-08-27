//
//  UserPostTodoTableViewCell.swift
//  PostsApp
//
//  Created by LP Mackbook on 26/08/2026.
//

import UIKit

class UserPostTodoTableViewCell: UITableViewCell {
    
    public var id = -1;

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}
