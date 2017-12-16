//
//  OnboardingViewModel.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct OnboardingViewModel {
    var onboardingDescription: [String: String] {
        return [
            "Welkom!": "Gelukszaaiers brengt mensen bij elkaar en daagt hen uit om elkaar oprecht gelukkig te maken!",
            "Zaai geluk!": "“Gelukkig maken, maakt gelukkig!”\nZaai geluk voor anderen in de buurt door iets aan te bieden aan andere gebruikers!",
            "Oogst geluk!": "Ga in op het aanbod van andere gebruikers en ontdek het geluk dat anderen voor je zaaien!"
        ]
    }
    
    func startButtonTitle(forIndex index: Int) -> String {
        if onboardingDescription.count == index + 1 {
           return "Ga van start!"
        }
        return "Skip intro"
    }
}
