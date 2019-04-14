//
//  ViewController.swift
//  api_demo
//
//  Created by John on 4/11/19.
//  Copyright © 2019 JAMorales. All rights reserved.
//

import UIKit

class MovieTableViewController: UIViewController {
    let db = DataModel()
    var movieList: [Movie] = []
    
    @IBOutlet var movieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.delegate = self
        movieTable.dataSource = self
        let notificationName = Consts.notificationName
        NotificationCenter.default.addObserver(self, selector: #selector(receivedData), name: notificationName, object: nil)
    }
    
    @objc func receivedData() {
        print("in rec'd data")
        movieList = db.movieList
        DispatchQueue.main.async {
            self.movieTable.reloadData()
        }
    }

    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // common way of dealing with optional variables
        guard let ndx = sender as? IndexPath
            , let detailVC = segue.destination as? MovieDetailViewController
            else { return }
        
        let movieData = movieList[ndx.row]
        detailVC.movieData = movieData
    }
    
}

// MARK: - tableView
extension MovieTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTable.dequeueReusableCell(withIdentifier: Consts.cellId, for: indexPath) as! MovieTableViewCell
        let movieData = movieList[indexPath.row]
        cell.titleLabel.text = movieData.title
        cell.dirNameLabel.text = movieData.director
        return cell
    }
    
}

extension MovieTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Consts.segueId, sender: indexPath)
    }
    
}

// MARK: - UI settings
extension MovieTableViewController {
    
    func setUI() {
        
    }
    
    func formatCell(_ cell: MovieTableViewCell) {
        
    }
}
