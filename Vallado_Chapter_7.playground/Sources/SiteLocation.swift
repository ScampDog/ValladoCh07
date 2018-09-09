//
//  SiteLocation.swift
//
//  Created by Norm Hecht on 9/5/2018.
//  Copyright © 2018 Pearl Street Software. All rights reserved.
//

import Foundation

public func SiteLocation(phi_gd: Double, lambda: Double, h_ellp: Double) -> Vector3D {
    // Find the ECEF coordinates for the given latitude, longitude and height above geoid.
    let C_earth = R_earth/sqrt(1 - pow(e_earth*sin(phi_gd), 2))/1000
    let S_earth = C_earth*(1 - e_earth*e_earth)
    
    let r_delta = (C_earth + h_ellp/1000)*cos(phi_gd)
    let r_K = (S_earth + h_ellp/1000)*sin(phi_gd)
    let r_site = Vector3D(r_delta*cos(lambda), r_delta*sin(lambda), r_K)
    
    return r_site
}
