//
//  MainCollectionViewCell.swift
//  PostsApp
//
//  Created by LP Mackbook on 25/08/2026.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titelLabel: UILabel!
    
    @IBOutlet var image: UIImageView!
    
    var screen : EnumScreens!
    var ViewModel : MainCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func Set(){
        titelLabel.text = ViewModel.title
        image.image = ViewModel.uiImage
        screen = ViewModel.screenName
    }
    


}
