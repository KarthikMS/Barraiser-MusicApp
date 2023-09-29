//
//  Music.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

struct Music: Decodable {
    let title: String
    let artist: String
    let album: String
    let duration: String
    let mediaUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case album
        case duration
        case mediaUrl = "media_url"
    }
}
