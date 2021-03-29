//
//  ListTableViewCell.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 28/03/2021.
//  Copyright © 2021 Magdy rizk. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeDisc: UILabel!
    @IBOutlet weak var recipeFats: UILabel!
    @IBOutlet weak var recipeCal: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    public var cellTrack : Recipes! {
        didSet {
//            self.bottomView .roundCorners(with: [.layerMinXMaxYCorner], radius: 12)
//            self.bottomView.roundCorners(with: [.layerMaxXMaxYCorner], radius: 12)
            self.recipeImg.loadImage(fromURL: cellTrack.image)
            self.recipeName.text = cellTrack.name
            self.recipeDisc.text = cellTrack.headline
            self.recipeCal.text = cellTrack.calories
            self.recipeFats.text = cellTrack.fats
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
