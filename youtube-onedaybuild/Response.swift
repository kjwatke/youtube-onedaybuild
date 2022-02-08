//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Kevin  Watke on 2/8/22.
//

import Foundation

struct Response: Decodable {
	
	var items: [Video]?
	
	enum CodingKeys: String, CodingKey {
		
		case items
		
	}
	
	
	init(from decoder: Decoder) {
		
		do {
			
			let container = try decoder.container(keyedBy: CodingKeys.self)
			items = try container.decode([Video].self, forKey: .items)
			
		}
		catch {
			print("error in the response object")
		}
	}
}
