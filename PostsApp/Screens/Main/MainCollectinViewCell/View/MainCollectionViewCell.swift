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
    
    var ViewModel : MainCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //	self.ViewModel = viewModel
        
    }
    
    func Set(){
        
        titelLabel.text = ViewModel.setTitel()
        image.image = ViewModel.SetImager()
    }
    


}
