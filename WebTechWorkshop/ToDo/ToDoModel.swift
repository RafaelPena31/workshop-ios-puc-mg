//
//  ToDoModel.swift
//  WebTechWorkshop
//
//  Created by Rafael Pena on 09/05/24.
//

import Foundation

struct ToDoModel: Identifiable, Encodable, Decodable {
    let id: UUID
    let description: String
    let createAt: Date
}
