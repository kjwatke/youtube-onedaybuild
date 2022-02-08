//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/6/22.
//

import UIKit

class ViewController: UIViewController {

	var model = Model()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		model.getVideos()
	}


}

