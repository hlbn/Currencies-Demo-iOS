//
//  CurrencyList.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 16/06/2022.
//

import Foundation

class CurrencyAPI: ObservableObject {
    @Published var currency: Currency?
    var semaphore = DispatchSemaphore (value: 1)
    
    init(){
        fetch()
    }
    
    func fetch() {
        
    let url = "https://api.apilayer.com/currency_data/live?source=USD&currencies=EUR%2CGBP%2CCZK"
    let apiKey = "k22YfQB3q5WJA0eq166E8L8kgoHoDtWa"
    var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"
    request.addValue(apiKey, forHTTPHeaderField: "apikey")

    let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error  in
      guard let data = data, error == nil else {
        print(String(describing: error))
        return
      }
       do{
           let decoder = JSONDecoder()
        let currency = try decoder.decode(Currency.self, from: data)
        DispatchQueue.main.async {
            self?.currency = currency
        }
           print(self?.currency ?? "Nejde to")
           print(self?.currency ?? "Nejde to")
      } catch {
          print(self?.currency ?? "Nejde to")
          self?.semaphore.signal()
      }
    }
    task.resume()
    semaphore.wait()
    }
}
