//
//  CocktailCollectionViewCell.swift
//  cocktail
//
//  Created by so on 2022/06/21.
//

import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cocktailName: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!

    
    func cockailModel(_ model: CockatilModel) {
        cocktailName.text = model.strDrink

    }
}
