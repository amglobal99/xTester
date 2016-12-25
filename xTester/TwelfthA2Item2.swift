//
//  TwelfthA2Item3.swift
//  xTester
//
//  Created by Dad on 12/23/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation


class TwelfthA2Item2 {
  
  let bikeID: String
  let statusValue: String
  let stAddress1: String
  var stationName: String
  let availableBikes: String
  let statusKey: String
  
  
  init(bikeID: String, statusValue: String, stAddress1: String, stationName: String, availableBikes: String, statusKey: String) {
    self.bikeID = bikeID
    self.statusValue =  statusValue
    self.stAddress1 = stAddress1
    self.stationName = stationName
    self.availableBikes =  availableBikes
    self.statusKey = statusKey
  }

  
}


extension TwelfthA2Item2: Equatable {}


func == (lhs:TwelfthA2Item2, rhs: TwelfthA2Item2) -> Bool  {
  return lhs.bikeID == rhs.bikeID
}

