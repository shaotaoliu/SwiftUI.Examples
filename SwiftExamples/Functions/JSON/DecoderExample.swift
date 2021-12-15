import Foundation

class DecoderExample: ObservableObject {
    static func run() {
        if let weather = Weather.loadFrom(from: "weather.json") {
            print(weather.latitude)
            print(weather.longitude)
            print(weather.temperature)
            print(weather.humidity)
            print(weather.windSpeed)
            print(weather.info[0].description)
            print(weather.info[0].icon)
            print(weather.sys.sunrise)
            print(weather.sys.sunset)
        }
    }
}

extension Weather {
    static func loadFrom(from: String) -> Weather? {
        guard let file = Bundle.main.url(forResource: from, withExtension: nil) else {
            print("File not found: \(from)")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            let data = try Data(contentsOf: file)
            return try decoder.decode(Weather.self, from: data)
        }
        catch {
            print("Decoing failed: \(error)")
            return nil
        }
    }
}

struct Weather: Decodable {
    let latitude: Double
    let longitude: Double
    let temperature: Double
    let humidity: Double
    let windSpeed: Double
    let info: [WeatherInfo]
    let sys: WeatherSys
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case weather
        case main
        case sys
    }
    
    enum MainKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
        case wind_speed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        info = try container.decode([WeatherInfo].self, forKey: .weather)
        sys = try container.decode(WeatherSys.self, forKey: .sys)
        
        let mainContainer = try container.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
        temperature = try mainContainer.decode(Double.self, forKey: .temperature)
        humidity = try mainContainer.decode(Double.self, forKey: .humidity)
        windSpeed = try mainContainer.decode(Double.self, forKey: .wind_speed)
    }
    
    struct WeatherInfo: Decodable {
        let description: String
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case description
            case icon
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            description = try container.decode(String.self, forKey: .description)
            icon = try container.decode(String.self, forKey: .icon)
        }
    }
    
    struct WeatherSys: Decodable {
        let sunrise: Date
        let sunset: Date
        
        enum CodingKeys: String, CodingKey {
            case sunrise
            case sunset
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            sunrise = try container.decode(Date.self, forKey: .sunrise)
            sunset = try container.decode(Date.self, forKey: .sunset)
        }
    }
}
