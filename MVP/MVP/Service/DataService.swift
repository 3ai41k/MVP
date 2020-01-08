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
        
        let films = [Film(name: "Матч-пойнт",
                          imageName: "Матч-пойнт",
                          year: 2005,
                          description: "Некогда известный теннисист Крис переживает не лучшие времена. Надо как-то устраиваться в жизни...",
                          raiting: 7.6),
                     Film(name: "Аванпост",
                          imageName: "Аванпост",
                          year: 2019,
                          description: "В недалеком будущем что-то произошло. Связь с большей частью населенных пунктов Земли оборвалась...",
                          raiting: 6.2),
                     Film(name: "Добро пожаловать в Zомбилэнд",
                          imageName: "Добро_пожаловать_в_Zомбилэнд",
                          year: 2009,
                          description: "После нашествия зомби в США небольшая группа выживших скитается по стране от побережья к побережью...",
                          raiting: 7.3),
                     Film(name: "Начало",
                          imageName: "Начало",
                          year: 2010,
                          description: "Кобб — талантливый вор, лучший из лучших в опасном искусстве извлечения: он крадет ценные секреты из глубин подсознания во время сна...",
                          raiting: 8.7),
                     Film(name: "Однажды в Голливуде",
                          imageName: "Однажды_в_Голливуде",
                          year: 2019,
                          description: "Фильм повествует о череде событий, произошедших в Голливуде в 1969 году, на закате его «золотого века». По сюжету, известный ТВ актер Рик Далтон и его дублер Клифф Бут пытаются найти свое место в стремительно меняющемся мире киноиндустрии...",
                          raiting: 7.6),]
        result(.success(films))
        
    }
    
}
