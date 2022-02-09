//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/6/22.
//

import UIKit

class ViewController: UIViewController {
	
	var model = Model()
	var videos = [Video]()
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		model.delegate = self
		
		model.getVideos()
	}
}


// MARK: - UITableView Data Source Methods

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseId, for: indexPath)
		
		let title = videos[indexPath.row].title
		
		cell.textLabel?.text = title
		
		return cell
	}
	
	
}

// MARK: - UITableView Delegate Methods

extension ViewController: UITableViewDelegate {
	
}


// MARK: - ModelDelegate methods

extension ViewController: ModelDelegate {
	
	func videosFetched(_ videos: [Video]) {
		
		// Set the returned videos to our video property
		self.videos = videos
		
		// Refresh the table view
		tableView.reloadData()
		
	}
	
}

