

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet var Title: UILabel!
    @IBOutlet var SubTitle: UILabel!
    var viewModel : ContentCellViewModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func Set(){
        self.Title.text = viewModel.title
        self.SubTitle.text = viewModel.subTitle
        self.reloadInputViews()
    }
    

    
}
