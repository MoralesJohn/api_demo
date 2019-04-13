//
//  ViewController.swift
//  api_demo
//
//  Created by John on 4/11/19.
//  Copyright © 2019 JAMorales. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    let db = DataModel()
    let cellId = "movieCell"
    var movieList: [Movie] = []
    
    @IBOutlet var movieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieList = db.movieList
        movieTable.delegate = self
        movieTable.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTable.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
        let movieData = movieList[indexPath.row]
        cell.titleLabel.text = movieData.title
        cell.dirNameLabel.text = movieData.director
        return cell
    }
    
}

