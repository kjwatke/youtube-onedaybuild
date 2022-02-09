//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/9/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

	var video: Video?
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var webView: WKWebView!
	@IBOutlet weak var textView: UITextView!
	
	
    override func viewDidLoad() {
		
        super.viewDidLoad()

    }

	
	override func viewWillAppear(_ animated: Bool) {
		
		// Check if there is a video
		guard video != nil else { return }
		
		// Create the embed URL
		let embedURLString = Constants.YT_EMBED_URL + video!.videoID
		
		// Load it into the webview
		let url = URL(string: embedURLString)
		let request = URLRequest(url: url!)
		webView.load(request)
		
		// Set the title
		titleLabel.text = video!.title
		
		// Set the date
		let df = DateFormatter()
		df.dateFormat = "EEEE, MMM d, yyyy"
		dateLabel.text = df.string(from: video!.published)
		
		// Set the description
		textView.text = video!.description
	}

}
