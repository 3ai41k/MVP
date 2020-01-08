//
//  DataService.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation

struct DataService {
    
    public func getFilms(result: (Result<Array<Film>, Error>) -> Void) {
        
        let titles = ["Матч-пойнт", "Аванпост", "Добро пожаловать в Zомбилэнд", "Начало", "Однажды в Голливуде"]
        let imageNames = ["Матч-пойнт", "Аванпост", "Добро_пожаловать_в_Zомбилэнд", "Начало", "Однажды_в_Голливуде"]
        let years = [2005, 2019, 2009, 2010, 2019]
        let descriptions = [
            "Некогда известный теннисист Крис переживает не лучшие времена. Надо как-то устраиваться в жизни...",
            "В недалеком будущем что-то произошло. Связь с большей частью населенных пунктов Земли оборвалась...",
            "После нашествия зомби в США небольшая группа выживших скитается по стране от побережья к побережью...",
            "Кобб — талантливый вор, лучший из лучших в опасном искусстве извлечения: он крадет ценные секреты из глубин подсознания во время сна...",
            "Фильм повествует о череде событий, произошедших в Голливуде в 1969 году, на закате его «золотого века». По сюжету, известный ТВ актер Рик Далтон и его дублер Клифф Бут пытаются найти свое место в стремительно меняющемся мире киноиндустрии..."
        ]
        let raitings = [7.6, 6.2, 7.3, 8.7, 7.6]
        let filmNames = ["LocalVideo1", "LocalVideo2", "LocalVideo3", "LocalVideo4", "LocalVideo5"]
        
        
        var films: Array<Film> = Array()
        for (index, filmName) in filmNames.enumerated() {
            let urlPath = Bundle.main.path(forResource: filmName, ofType: "MOV")!
            let url = URL(fileURLWithPath: urlPath)
            
            let name = titles[index]
            let imageName = imageNames[index]
            let year = years[index]
            let description = descriptions[index]
            let raiting = raitings[index]
            let film = Film(name: name,
                            imageName: imageName,
                            year: year,
                            description: description,
                            raiting: raiting,
                            url: url)
            films.append(film)
        }
        
        result(.success(films))
        
    }
    
}
