//
//  NetworkManager.swift
//  ERP Codebase
//
//  Created by Frank Castle on 04/04/20.
//  Copyright © 2020 Code Bew. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var results = [Repo]()
    
    func fetchRequest()  {
        
        if let url = URL(string: "https://leadapi.code-brew.com/webhookLogs?json=12") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {  (data, response, error) in
                
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let tempresults = try decoder.decode(GitRepo.self, from: safeData)
                            DispatchQueue.main.async {
                                self.results = tempresults.data
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
}


struct GitRepo : Decodable {
    let data : [Repo]
    
    
}

struct Repo : Decodable ,Identifiable{
        var createdAt : String?
        var displayName : String?
        var id : Int?
        var newName : String?
        var newTargetAuthor : String?
        var oldName : String?
        var oldTargetAuthor : String?
        var owner : String?
        var repo : String?
}


/*
import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"

        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
*/
