//: [Previous](@previous)

import Foundation

// Algorithm 52, starting page 442.  Example with data on page 447
// let angleData = [ [333.028738,  -2.022317], [345.235515,   7.648921], [  0.939913,  18.667717], [ 21.235600,  29.086871], [ 45.025748,  35.664741], [ 67.886655,  36.996583]]
// in the format alpha, delta (right ascension, declination)
let angleData = [[0.939913*pi/180,  18.667717*pi/180], [45.025748*pi/180,  35.664741*pi/180], [ 67.886655*pi/180,  36.996583*pi/180]]

let tau_1 = -8.0 // minutes
let tau_3 = +4.0 // minutes

// Observing Site Location
let phi_gd = 40*pi/180 // geometric latitude
let lambda = -110.0*pi/180 // longitude
let h_ellp = 2000.0 // m
let r_site = SiteLocation(phi_gd: phi_gd, lambda: lambda, h_ellp: h_ellp)

var L = [Vector3D.i, Vector3D.j, Vector3D.k] // arbitrary data to set up L with the correct size
for i in 0...2 {
    L[i] = Vector3D(cos(angleData[i][1])*cos(angleData[i][0]), cos(angleData[i][1])*sin(angleData[i][0]), sin(angleData[i][1]))
}

//: [Next](@next)
