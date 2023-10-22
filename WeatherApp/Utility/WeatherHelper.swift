//
//  WeatherHelper.swift
//  WeatherApp
//
//  Created by Mideveloper on 22/10/2023.
//

import Foundation

struct WeatherHelper {
    static func getWeatherIcon(condition: Int) -> String {
      if (condition < 300) {
        return "🌩"
      } else if (condition < 400) {
        return "🌧"
      } else if (condition < 600) {
        return "☔️"
      } else if (condition < 700) {
        return "☃️"
      } else if (condition < 800) {
        return "🌫"
      } else if (condition == 800) {
        return "☀️"
      } else if (condition <= 804) {
        return "☁️"
      } else {
        return "🤷‍"
      }
    }

    static func getMessage(temp: Int) -> String {
      if (temp > 25) {
        return "It\'s 🍦 time"
      } else if (temp > 20) {
        return "Time for shorts and 👕"
      } else if (temp < 10) {
        return "You\'ll need 🧣 and 🧤"
      } else {
        return "Bring a 🧥 just in case"
      }
    }
}
