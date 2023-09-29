//
//  MockApiManager.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

struct MockMusicData {
    
    static let musicList = [
        Music(
            title: "Music 1",
            artist: "Artist 1",
            album: "Album 1",
            duration: "500",
            mediaUrl: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
        ),
        Music(
            title: "Music 2",
            artist: "Artist 2",
            album: "Album 2",
            duration: "500",
            mediaUrl: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav"
        )
    ]
    
}

final class MockApiManager: ApiManaging {
    
    func execute<Response: Decodable>(_ request: Request<Response>, completionHanlder: @escaping (Result<Response, APIError>) -> Void) {
     
        if request.endPoint == "/list" {
            completionHanlder(.success(MockMusicData.musicList as! Response))
        }
        
    }
    
}
