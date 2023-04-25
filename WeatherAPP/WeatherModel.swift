//
//  WeatherModel.swift
//  WeatherAPP
//
//  Created by Memory Mhou on 20/04/2023.
//

import Foundation
import Foundation


class WeatherService {
    
    private let apiKey = "c432f96a889eb9105cc7b47b10398329"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    
    func getDailyWeatherData(for city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let urlString = "\(baseUrl)forecast?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let dailyWeatherData = try decoder.decode(WeatherData.self, from: data)
                completion(.success(dailyWeatherData))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getWeatherDetailData(for city: String, date: Date, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let dateString = "\(Int(date.timeIntervalSince1970))"
        let urlString = "\(baseUrl)weather?q=\(city)&dt=\(dateString)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let weatherDetailData = try decoder.decode(WeatherData.self, from: data)
                completion(.success(weatherDetailData))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}

enum NetworkError: Error {
    case badUrl
    case badData
}
