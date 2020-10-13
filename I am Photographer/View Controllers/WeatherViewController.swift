//
//  WeatherViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 3/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var feelTemp: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
 
    
    
    
    
    // Location
    
    let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation?
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=62950fc52ac4876297cf81acac9cd9a1") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                    guard let weatherDetails = json["weather"] as? [[String: Any]], let weatherMain = json["main"] as? [String: Any], let weatherSys = json["sys"] as? [String: Any] else { return }
                    let temp = Int(weatherMain["temp"] as? Double ?? 0)
                    let feelT = Int(weatherMain["feels_like"] as? Double ?? 0)
                    let humidity = Int(weatherMain["humidity"] as? Double ?? 0)
                    let description = (weatherDetails.first?["description"] as? String)
                    let sunriseTime = (weatherSys["sunrise"] as? Double ?? 0)
                    let sunsetTime = (weatherSys["sunset"] as? Double ?? 0)
                    let timezone = json["timezone"] as? Double ?? 0
                    let location = json["name"] as? String
                    
                    DispatchQueue.main.async {
                        self.setWeather(weather: weatherDetails.first?["main"] as? String, description: description, temp: temp, feelT: feelT, humidity: humidity, sunrise: sunriseTime, sunset: sunsetTime, timezone: timezone, location: location)
                    }
                } catch {
                    print("error retriving weather")
                }
            }
        }
        task.resume()
    }
    
    func setWeather(weather: String?, description: String?, temp: Int, feelT: Int, humidity: Int, sunrise: Double, sunset: Double, timezone: Double, location: String?) {
        
        let sunriseTime = NSDate(timeIntervalSince1970: sunrise)
        let sunsetTime = NSDate(timeIntervalSince1970: sunset)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
        let sunriseTimeFormatted = dateFormatter.string(from: sunriseTime as Date)
        let sunsetTimeFormatted = dateFormatter.string(from: sunsetTime as Date)
        
        weatherDescription.text = description ?? "..."
        temperature.text = "\(temp - 273)"
        sunriseLabel.text = "\(sunriseTimeFormatted)"
        sunsetLabel.text = "\(sunsetTimeFormatted)"
        locationLabel.text = location
        feelTemp.text = "\(feelT - 273)°"
        humidityLabel.text = "\(humidity)%"
        
        
        
        switch weather {
        case "Clear":
            weatherImage.image = UIImage(named: "clear")
        case "Clouds":
            weatherImage.image = UIImage(named: "clouds")
        case "Rain":
            weatherImage.image = UIImage(named: "rain")
        case "Thunderstorm":
            weatherImage.image = UIImage(named: "thunderstorm")
        default:
            weatherImage.image = UIImage(named: "snow")
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
