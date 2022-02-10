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
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	
		// Make sure there is an indexPath to the selected row
		guard tableView.indexPathForSelectedRow != nil  else { return }
		
		// Get a reference to the detail ViewController
		let destinationVC = segue.destination as! DetailViewController
		
		// Get the video for the selected row
		let indexPath = tableView.indexPathForSelectedRow!.row
		let selectedVideo = videos[indexPath]
		
		// Pass the video to the detail view controller
		destinationVC.video = selectedVideo
	}
}


// MARK: - UITableView Data Source Methods

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
		
		let video = videos[indexPath.row]
		
		cell.setCell(video)
		
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

