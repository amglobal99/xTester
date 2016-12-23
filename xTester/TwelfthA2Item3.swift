//
//  TwelfthA2Item3.swift
//  xTester
//
//  Created by Dad on 12/23/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

import Foundation


class TwelfthA2Item3  {
  
  let bikeID: Int
  let statusValue: String
  let stAddress1: String
  var stationName: String
  let availBikes: Int
  
  
  init(bikeID: Int, statusValue: String, stAddress1: String, stationName: String, availBikes: Int) {
    self.bikeID = bikeID
    self.statusValue =  statusValue
    self.stAddress1 = stAddress1
    self.stationName = stationName
    self.availBikes =  availBikes
  }

  
}


extension TwelfthA2Item3: Equatable {}


func == (lhs:TwelfthA2Item3, rhs: TwelfthA2Item3) -> Bool  {
  return lhs.bikeID == rhs.bikeID
}

