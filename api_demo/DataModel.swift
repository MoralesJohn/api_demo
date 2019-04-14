//
//  DataModel.swift
//  api_demo
//
//  Created by John on 4/11/19.
//  Copyright © 2019 JAMorales. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var title: String
    var director: String
}

struct MovieWrapper: Decodable {
    var results: [Movie]
}

public class DataModel {
    let apiUrl = URL(string: "https://swapi.co/api/films")
    let notificationName = NSNotification.Name("didReceiveData")
    var movieList: [Movie] = []
    
    init() {
        requestData()
    }
    
    func requestData() {
        guard let url = apiUrl else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, err) in
            guard err == nil else {
                print("Session Error:", err?.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data received!")
                return
            }
            do {
                let movieListData = try JSONDecoder().decode(MovieWrapper.self, from: data)
                self.movieList = movieListData.results
                NotificationCenter.default.post(name: self.notificationName, object: nil)
            } catch let err {
                print("Decode error:", err)
            }
        }.resume()
    }

}
