//
//  Networking.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation

class NetworkHandler {
    
    func loadSampleData<T>(model: T.Type, completion: @escaping (T?,Error?)->Void) where T: BaseResponse {
            guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(model, from: data)
                        DispatchQueue.main.async {
                            print(decodedResponse)
                            completion(decodedResponse,nil)
                        }
                        return
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil,error)
                        }
                        print(error)
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
            .resume()
        }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
