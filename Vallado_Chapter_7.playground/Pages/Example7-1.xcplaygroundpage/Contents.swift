//: [Previous](@previous)

import Foundation

// Algorithm 51: Site-Track, starting on page 430, with example on page 431

// location of observing station
let phi_gd = 39.007*pi/180 // radians
let lambda = -104.883*pi/180 // radians, negative because it's west longitude
let h_ellp = 2187.0 // m

// data from sensor
let rho = 604.68 // distance from sensor to object, km
let beta = 205.6*pi/180 // azimuth, degrees
let el = 30.7*pi/180 // elevation, radians
let rho_dot = 2.08 // m/s
let beta_dot = 0.15*pi/180 // radians/s
let el_dot = 0.17*pi/180 // radians/s

// Find the ECEF coordinates of the observing station
let r_site = SiteLocation(phi_gd: phi_gd, lambda: lambda, h_ellp: h_ellp)

// Find the object's coordinates in the SEZ (south, east, up) frame
let r_SEZ = Vector3D(-rho*cos(el)*cos(beta), rho*cos(el)*sin(beta), rho*sin(el))
let x_dot_SEZ = -rho_dot*cos(el)*cos(beta)+rho*sin(el)*cos(beta)*el_dot+rho*cos(el)*sin(beta)*beta_dot
let y_dot_SEZ =  rho_dot*cos(el)*sin(beta)-rho*sin(el)*sin(beta)*el_dot+rho*cos(el)*cos(beta)*beta_dot
let z_dot_SEZ =  rho_dot*sin(el) + rho*cos(el)*el_dot
let rDot_SEZ = Vector3D(x_dot_SEZ, y_dot_SEZ, z_dot_SEZ)

let row1 = Vector3D( sin(phi_gd)*cos(lambda), -sin(lambda), cos(phi_gd)*cos(lambda))
let row2 = Vector3D(sin(phi_gd)*sin(lambda), +cos(lambda), cos(phi_gd)*sin(lambda))
let row3 = Vector3D(-cos(phi_gd), 0, sin(phi_gd))
let ECEFfromSEZ = [row1, row2, row3]
let r_ECEF = Vector3D(dot(row1, r_SEZ), dot(row2, r_SEZ), dot(row3, r_SEZ))
let rDot_ECEF = Vector3D(dot(row1, rDot_SEZ), dot(row2, rDot_SEZ), dot(row3, rDot_SEZ))

//: [Next](@next)
