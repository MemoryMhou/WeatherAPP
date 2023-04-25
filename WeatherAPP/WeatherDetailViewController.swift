//
//  WeatherDetailViewController.swift
//  WeatherAPP
//
//  Created by Memory Mhou on 20/04/2023.
//

import Foundation
import UIKit

// This is a view controller that displays weather details
class WeatherDetailViewController: UIViewController {

    // MARK: - Properties
    
    // These are the labels that will display weather information
    let temperatureLabel = UILabel()
    let humidityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let descriptionLabel = UILabel()
    
    // MARK: - Lifecycle
    
    // This method is called when the view controller is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color of the view to white
        view.backgroundColor = .white
        
        // Configure the labels to display weather information
        configureLabels()
    }
    
    // MARK: - Private Methods
    
    // This method sets up the labels to display weather information
    private func configureLabels() {
        
        // Set the font size and weight for each label
        temperatureLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        humidityLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        windSpeedLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        // Set the alignment for each label
        temperatureLabel.textAlignment = .center
        humidityLabel.textAlignment = .left
        windSpeedLabel.textAlignment = .left
        descriptionLabel.textAlignment = .left
        
        // Add the labels as subviews of the view
        view.addSubview(temperatureLabel)
        view.addSubview(humidityLabel)
        view.addSubview(windSpeedLabel)
        view.addSubview(descriptionLabel)
        
        // Enable auto layout constraints for each label
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints to position the labels on the view
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            humidityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            humidityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            humidityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            windSpeedLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 10),
            windSpeedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            windSpeedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
