//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/7/22.
//

import Foundation

struct Video: Decodable {
	
	var videoID = ""
	var title = ""
	var description = ""
	var thumbnail = ""
	var published = ""
	
	enum CodingKeys: String, CodingKey {
		
		case snippet
		case thumbnails
		case high
		case resourceId
		
		case published = "publishedAt"
		case title
		case description
		case thumbnail = "url"
		case videoId
	}
	
	init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
		
		// Parse the title
		title = try snippetContainer.decode(String.self, forKey: .title)
		
		// Parse the description
		description = try snippetContainer.decode(String.self, forKey: .description)
		
		// Parse the publish date
		published = try snippetContainer.decode(String.self, forKey: .published)
		
		// Parse thumbnails
		let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
		
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
		
		thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
		
		// Parse Video ID
		let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
		
		videoID = try resourceIdContainer.decode(String.self, forKey: .videoId)
		
		
	}
}
