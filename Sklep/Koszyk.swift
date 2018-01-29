//
//  Koszyk.swift
//  Sklep
//
//  Created by Rafael Takaka on 28.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import Foundation

struct Koszyk
{
    
    var nazwaArray = [String]()
    var cenaArray = [Int]()
    
    mutating func addItem (nazwa:String, cena:Int)
    {
        nazwaArray.append(nazwa)
        cenaArray.append(cena)
    }
    
    func getNazwa (id:Int) -> String
    {
        return nazwaArray[id]
    }
    
    func getCena (id:Int) -> Int
    {
        return cenaArray[id]
    }
    
    mutating func deleteItem (id:Int)
    {
        nazwaArray.remove(at: id)
        cenaArray.remove(at: id)
    }
    
    func getSuma () -> Int
    {
        if cenaArray.count > 0
        {
            let sum = cenaArray.reduce(0, +)
            return sum
        }
        else
        {
            return 0
        }
    }
    
    func getIlosc () -> Int
    {
        return nazwaArray.count
    }
}
