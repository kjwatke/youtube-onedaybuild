//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/6/22.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
	
	let signInConfig = GIDConfiguration.init(
		clientID: "929838038762-9vs96hgfqo97epfutkcumdkl0q6vnkbc.apps.googleusercontent.com",
		serverClientID: "929838038762-ml84u0ce396l7qh64gcl1msfqlgps5ds.apps.googleusercontent.com"
	)
	
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
	
	// MARK: - @IBAction methods
	@IBAction func signIn(_ sender: Any) {
		GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
			
			guard error == nil else  { return }
			
			print("Successfully signed in...")
		}
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

