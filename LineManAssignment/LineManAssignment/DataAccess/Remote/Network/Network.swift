//
//  Network.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Combine
import Foundation
import Alamofire

protocol NetworkProtocal {
 
    func run<T: Decodable>(_ api: DataAPI) -> AnyPublisher<NetworkResponse<T>, Error>

}

struct Network: NetworkProtocal {
    private let session: Session = NetworkManager.shared.session
    private let decoder = JSONDecoder()

    public init() {}

    public func run<T: Decodable>(_ api: DataAPI) -> AnyPublisher<NetworkResponse<T>, Error> {
        guard let url = URL(string: api.urlString) else {
            return Fail(error: APIError.failedToMakeURL(api.urlString)).eraseToAnyPublisher()
        }
        return session
            .request(url,
                     method: api.method,
                     encoding: api.encoding)
            .responseString { result in
                print("debug: url: \(url.absoluteString)")

            }
            .validate(statusCode: 200..<300)
            .publishResponse(using: DataResponseSerializer())
            .tryMap { result -> NetworkResponse<T> in
                print("debug: responseCode: \(String(describing: result.response?.statusCode))")
             
                guard
                    let statusCode = result.response?.statusCode,
                    (200..<300).contains(statusCode)
                else {
                    throw APIError.noCorrectStatusCode(result.response?.statusCode)
                }

                guard
                    let data = result.data,
                    let response = result.response
                else {
                    throw APIError.noResponseData
                }

                let value = try decoder.decode(T.self, from: data)
                return NetworkResponse(value: value, response: response)
            }
            .eraseToAnyPublisher()
    }
}
