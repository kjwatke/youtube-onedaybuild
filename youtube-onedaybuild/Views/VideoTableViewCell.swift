//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/9/22.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

	@IBOutlet weak var thumbnail: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	var video: Video?
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	
	func setCell(_ v: Video) {
		
		video = v
		
		guard video != nil else { return }
		
		// Set the title and date label
		titleLabel.text = video?.title
		
		let df = DateFormatter()
		df.dateFormat = "EEEE, MMM d, yyyy"
		dateLabel.text = df.string(from: video!.published)
		
		// Set the thumbnail
		guard video?.thumbnail != nil else { return }
		
		// CHeck Cache before download data
		if let cachedData = CacheManager.getVideoCache(video!.thumbnail) {
			
			// Set the thumbnail
			thumbnail.image = UIImage(data: cachedData)
			return
		}
		
		// Download the thumbnail data
		let url = URL(string: video!.thumbnail)
		
		// Get the shared URL Session object
		let session = URLSession.shared
		
		// Create a data task
		let dataTask = session.dataTask(with: url!) { data, response, error in
			
			
			if error == nil && data != nil {
				
				// Cache the image
				CacheManager.setVideoCache(url!.absoluteString, data)
				
				// Check that the downloaded url matche the video thumbnail url that this cell is currently set to display
				if url?.absoluteString != self.video?.thumbnail {
					
					// Video cell has been recylced for another video and doesn't match thumbnail that was downloaded
					return
				}
				
				// Create the image object
				let image = UIImage(data: data!)
				
				// Set the imageview
				DispatchQueue.main.async {
					
					self.thumbnail.image = image
					
				}
			}
		}
		
		dataTask.resume()
		
	}
}
