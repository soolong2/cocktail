//
//  ViewController.swift
//  cocktail
//
//  Created by so on 2022/06/09.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let co: [String] = ["술", "맥주", "소주"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return co.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CocktailCollectionViewCell", for: indexPath) as? CocktailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cocktailName.text = co[indexPath.row]
        cell.cocktailImage 
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

