//
//  FeedViewController.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var feed: [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeeds()
        tableViewConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func getFeeds() {
        APIClient.sharedInstance.retrieveFeed(url: "politize-feed") { feedList, error in
            if let feed = feedList {
                self.feed = feed
                self.updateScreen()
            }
        }
    }
    
    private func updateScreen() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    private func tableViewConfiguration() {
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 500
//        tableView.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FeedViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = self.feed[indexPath.row]
        
        let alertController = UIAlertController(title: feed.fields.title.value, message: feed.fields.summary.value, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FeedTableViewCell
        
        let feed = self.feed[indexPath.row]
        
        cell.configureCell(feed: feed)
        return cell
    }
    
    
}
