//
//  APIClient.swift
//  Politize
//
//  Created by Fabrício Masiero on 24/06/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import Foundation

public class APIClient {
    
    static let sharedInstance: APIClient = {
        
        let session = URLSession.shared
        let baseURL = URL(string: "https://firestore.clients6.google.com/v1beta1/projects/eduk-free/databases/(default)/documents/")!
        let request = URLRequest(url: baseURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        
        let sharedManager = APIClient(session: session, request: request)
        
        return sharedManager
    }()
    
    var session: URLSession
    var request: URLRequest
    
    private init(session: URLSession, request: URLRequest) {
        self.session = session
        self.request = request
    }
    
    public func retrieveFeed(url: String, completion: @escaping ([Feed]?, Error?) -> Void) {
        guard let baseURL = self.request.url else {
            return
        }
        self.request.url = baseURL.appendingPathComponent(url)
        let feed = self.session.dataTask(with: self.request) { data, urlResponse, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Document.self, from: data)
                completion(decoded.feeds, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        feed.resume()
    }
    
    public func downloadImage(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        let image = self.session.dataTask(with: url) { data, urlResponse, error in
            guard let httpURLResponse = urlResponse as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                let mimeType = urlResponse?.mimeType,
                mimeType.hasPrefix("image"), let data = data,
                error == nil
                else {
                    return
            }
            completion(data, error)
        }
        image.resume()
    }
}
