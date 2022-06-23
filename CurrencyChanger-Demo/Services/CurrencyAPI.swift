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
    let apiKey = "QZyVWPxRgcA9FMjdVh9fRm9WyDfrK0RM"
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
        self?.currency = currency
      } catch {
          print(self?.currency ?? "Dekoder zlyhal1")
          self?.semaphore.signal()
      }
    }
    task.resume()
    semaphore.wait()
    }
}
