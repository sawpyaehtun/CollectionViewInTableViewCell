//
//  CollectionViewHolderTableViewCell.swift
//  CollectionViewInTableViewCell
//
//  Created by SawPyaeHtun on 12/28/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewHolderTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(farm_id : String, sever_id : String, id : String, secret : String){
        //let placeHolderimg = UIImage(named: "placeholder")
         let imgResource = createImageUrl(farm_id: farm_id, sever_id: sever_id, id: id, secret: secret)
        myImageView.kf.setImage(with: imgResource)
//        guard let imgUrl = URL (string: "https://farm4.staticflickr.com3900/14716057796_8f583a73eb.jpg") else {return}
//        let imgResourece = ImageResource(downloadURL: imgUrl)
//        myImageView.kf.setImage(with: <#T##Resource?#>)(with: imgUrl)
    }
    
    private func createImageUrl(farm_id : String, sever_id : String, id : String, secret : String) -> ImageResource{
        let imgUrl = URL(string: "https://farm"+farm_id+".staticflickr.com/"+sever_id+"/"+id+"_"+secret+".jpg")
        let imgResource = ImageResource(downloadURL: imgUrl!, cacheKey: String(describing: imgUrl))
        return imgResource
    }
}
