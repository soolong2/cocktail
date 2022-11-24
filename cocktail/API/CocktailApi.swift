//
//  CocktailApi.swift
//  cocktail
//
//  Created by so on 2022/11/21.
//

import Foundation

class DrinksApi {
    class func getData(completion: @escaping (Cocktail) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=s") else {
            print("URL is nil")
            return
        }
        let request = URLRequest(url: url)
        let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print("Error occur: \(String(describing: error))")
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Cocktail.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                    print(result.drinks)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
