//
//  NetworkManager.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation
import Combine

class NetworkManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case invalidAPIKey
        case inValidURL
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[❌] Bad URL Response from URL: \(url)"
            case .invalidAPIKey: return "[🔴] Invalid API key: You must be granted a valid key."
            case .inValidURL:  return "[❌] invalid URL"
            }
        }
    }
    
    static func get(url: URL) -> AnyPublisher<Data, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponses(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    static func handleURLResponses(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode != 401 else {
            throw NetworkingError.invalidAPIKey
        }
        return output.data
    }
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: break;
        case .failure(let error): print(error.localizedDescription)
        }
    }
}
