//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/6/22.
//

import Foundation

struct Constants {
	// You will need your own API key.
	static let API_KEY = Keys.API_KEY
	static let PLAYLIST_ID = "UUecPJBL6E1PVky1-gj6KH5g"
	static let API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
	static let VIDEOCELL_ID = "videoCell"
	static let YT_EMBED_URL = "https://www.youtube.com/embed/"
}
