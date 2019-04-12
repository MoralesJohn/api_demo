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

public class DataModel {
    var movieList: [Movie] = []
    
    init() {
        defaultData()
    }
    
    func defaultData() {
        var results: [Movie] = []
        let titles = ["Duck Soup", "The Big Sleep", "Blazing Saddles"]
        let dirs = ["Leo McCarey", "Howard Hawks", "Mel Brooks"]
        for ndx in 0..<titles.count {
            let movie = Movie(title: titles[ndx], director: dirs[ndx])
            results.append(movie)
        }
        self.movieList = results
    }
}
