//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/7/22.
//

import Foundation


class Model {
	
	func getVideos() {
		
		// Create a URL object
		let url = URL(string: Constants.API_URL)
		
		guard url != nil else {
			return
		}
		
		// Get a URLSession
		let session = URLSession.shared
		
		// Get a data task from the URLSession object
		let dataTask = session.dataTask(with: url!) { data, response, error in
			
			// Check for error
			if error != nil || data == nil {
				
				return
			}
			
			
		}
		
		// Kick off the task
		dataTask.resume()
	}
}
