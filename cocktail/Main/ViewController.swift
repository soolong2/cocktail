//
//  ViewController.swift
//  cocktail
//
//  Created by so on 2022/06/09.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var searchController = UISearchController()
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var cocktailModel : [CockatilModel] = []
    var dumy = ["칵테일","칵테일2","칵테일3","칵테일4","칵테일5","칵테일6","칵테일7","칵테일8","칵테일9"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cocktailModel.count
        return dumy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CocktailCollectionViewCell", for: indexPath) as? CocktailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cocktailName.text = dumy[indexPath.row]
        cell.cocktailImage.image = UIImage(named: "mblogthumb-phinf.pstatic.net")
//        let data = cocktailModel[indexPath.row]
//        print(data)
        cell.cocktailImage.layer.cornerRadius = 15
        cell.cocktailImage.backgroundColor = .red
        cell.backgroundColor = .blue
        cell.layer.cornerRadius = 15
        collectionView.backgroundColor = .yellow
        print(cocktailModel)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "찾아보기"
        searchController.searchBar.scopeButtonTitles = [ "All", "A", "B", "C","D","E", "F", "G" ,"H", "I", "J", "K" ,"L", "N", "M", "O","P", "Q", "R", "S","T", "N", "M", "O" ]
        searchController.searchBar.scopeButtonTitles
        searchController.searchBar.showsScopeBar = true
        self.navigationItem.searchController = searchController
        
    movieApi()
//        print(cocktailModel.count)
    }
    
    func movieApi() {
        DrinksApi.getData() {result in
//            self.cocktailModel.append(CockatilModel(strDrink: result.drinks, strCategory: result.drinks, strAlcoholic: result.drinks))
//            self.cocktailModel.append(CockatilModel(strDrink: result.drinks["strDrink": "Margarita"], strCategory: result.Drinks[0].strCategory, strAlcoholic: result.Drinks[0].strAlcoholic))
            
            self.collectionView.reloadData()
           
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "subViewController") as? subViewController else {return}
        navigationController?.pushViewController(viewController, animated: true)
        
        print("넘어가는거니?")
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }
}

