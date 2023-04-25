import UIKit
import Foundation

class WeatherViewController: UIViewController, UITableViewDataSource {
    // Create a table view and an array to store weather data
    let tableView = UITableView()
    var weatherData: [WeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the table view to the view controller and set its properties
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        // Register the table view cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Fetch weather data from the OpenWeatherMap API
        fetchWeatherData()
    }
    
    // This function fetches weather data from the OpenWeatherMap API
    func fetchWeatherData() {
        // Define the URL for the API request
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Windhoek&appid=c432f96a889eb9105cc7b47b10398329"
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        // Create a URL session task to fetch data from the API
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            // Handle errors and check for data
            guard let data = data else {
                print("Error: did not receive data")
                return
            }
            
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            
            // Decode the JSON data into a WeatherAPIResult object
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(WeatherAPIResult.self, from: data)
                // Store the weather data in the array and update the table view on the main thread
                self?.weatherData = result.list
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch {
                print("Error: \(error)")
            }
        }
        // Start the URL session task
        task.resume()
    }
    
    // MARK: - UITableViewDataSource
    
    // Return the number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    // Configure the table view cells with the weather data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = weatherData[indexPath.row]
        cell.textLabel?.text = "\(data.dt): \(data.main.temp)°C"
        return cell
    }
}
struct WeatherAPIResult: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [WeatherData]
    let city: City
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}


