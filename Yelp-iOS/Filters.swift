//
//  Filters.swift
//  Yelp-iOS
//
//  Created by Keith Smyth on 29/10/2016.
//  Copyright © 2016 Keith Smyth. All rights reserved.
//

import Foundation

class Filters {
    static let sharedInstance = Filters()
    
    var sections = [FilterSection]()
    var dealSection: FilterSection
    var distanceSection: FilterSection
    var sortSection: FilterSection
    var categorySection: FilterSection
    
    private init() {
        // deals
        dealSection = FilterSection(title: "Deals")
        dealSection.filters.append(Filter(name: "Offering a Deal", code: true))
        sections.append(dealSection)
        
        // distance
        distanceSection = FilterSection(title: "Distance")
        distanceSection.filters.append(Filter(name: "Auto", code: ""))
        distanceSection.filters.append(Filter(name: "0.3 miles", code: 483))
        distanceSection.filters.append(Filter(name: "1 mile", code: 1609))
        distanceSection.filters.append(Filter(name: "5 miles", code: 8047))
        distanceSection.filters.append(Filter(name: "20 miles", code: 32187))
        sections.append(distanceSection)
        // sort
        sortSection = FilterSection(title: "Sort by")
        sortSection.filters.append(Filter(name: "Best match", code: 0))
        sortSection.filters.append(Filter(name: "Distance", code: 1))
        sortSection.filters.append(Filter(name: "Highest rated", code: 2))
        sections.append(sortSection)
        
        // categories
        categorySection = FilterSection(title: "Categories")
        categorySection.filters.append(Filter(name: "Afghan", code: "afghani"))
        categorySection.filters.append(Filter(name: "African", code: "african"))
        categorySection.filters.append(Filter(name: "Senegalese", code: "senegalese"))
        categorySection.filters.append(Filter(name: "South African", code: "southafrican"))
        categorySection.filters.append(Filter(name: "American (New)", code: "newamerican"))
        categorySection.filters.append(Filter(name: "American (Traditional)", code: "tradamerican"))
        categorySection.filters.append(Filter(name: "Arabian", code: "arabian"))
        categorySection.filters.append(Filter(name: "Argentine", code: "argentine"))
        categorySection.filters.append(Filter(name: "Armenian", code: "armenian"))
        categorySection.filters.append(Filter(name: "Asian Fusion", code: "asianfusion"))
        categorySection.filters.append(Filter(name: "Australian", code: "australian"))
        categorySection.filters.append(Filter(name: "Austrian", code: "austrian"))
        categorySection.filters.append(Filter(name: "Bangladeshi", code: "bangladeshi"))
        categorySection.filters.append(Filter(name: "Barbeque", code: "bbq"))
        categorySection.filters.append(Filter(name: "Basque", code: "basque"))
        categorySection.filters.append(Filter(name: "Belgian", code: "belgian"))
        categorySection.filters.append(Filter(name: "Brasseries", code: "brasseries"))
        categorySection.filters.append(Filter(name: "Brazilian", code: "brazilian"))
        categorySection.filters.append(Filter(name: "Breakfast & Brunch", code: "breakfast_brunch"))
        categorySection.filters.append(Filter(name: "British", code: "british"))
        categorySection.filters.append(Filter(name: "Buffets", code: "buffets"))
        categorySection.filters.append(Filter(name: "Burgers", code: "burgers"))
        categorySection.filters.append(Filter(name: "Burmese", code: "burmese"))
        categorySection.filters.append(Filter(name: "Cafes", code: "cafes"))
        categorySection.filters.append(Filter(name: "Themed Cafes", code: "themedcafes"))
        categorySection.filters.append(Filter(name: "Cafeteria", code: "cafeteria"))
        categorySection.filters.append(Filter(name: "Cajun/Creole", code: "cajun"))
        categorySection.filters.append(Filter(name: "Cambodian", code: "cambodian"))
        categorySection.filters.append(Filter(name: "Caribbean", code: "caribbean"))
        categorySection.filters.append(Filter(name: "Dominican", code: "dominican"))
        categorySection.filters.append(Filter(name: "Haitian", code: "haitian"))
        categorySection.filters.append(Filter(name: "Puerto Rican", code: "puertorican"))
        categorySection.filters.append(Filter(name: "Trinidadian", code: "trinidadian"))
        categorySection.filters.append(Filter(name: "Catalan", code: "catalan"))
        categorySection.filters.append(Filter(name: "Cheesesteaks", code: "cheesesteaks"))
        categorySection.filters.append(Filter(name: "Chicken Shop", code: "chickenshop"))
        categorySection.filters.append(Filter(name: "Chicken Wings", code: "chicken_wings"))
        categorySection.filters.append(Filter(name: "Chinese", code: "chinese"))
        categorySection.filters.append(Filter(name: "Cantonese", code: "cantonese"))
        categorySection.filters.append(Filter(name: "Dim Sum", code: "dimsum"))
        categorySection.filters.append(Filter(name: "Hainan", code: "hainan"))
        categorySection.filters.append(Filter(name: "Shanghainese", code: "shanghainese"))
        categorySection.filters.append(Filter(name: "Szechuan", code: "szechuan"))
        categorySection.filters.append(Filter(name: "Comfort Food", code: "comfortfood"))
        categorySection.filters.append(Filter(name: "Creperies", code: "creperies"))
        categorySection.filters.append(Filter(name: "Cuban", code: "cuban"))
        categorySection.filters.append(Filter(name: "Czech", code: "czech"))
        categorySection.filters.append(Filter(name: "Delis", code: "delis"))
        categorySection.filters.append(Filter(name: "Diners", code: "diners"))
        categorySection.filters.append(Filter(name: "Dinner Theater", code: "dinnertheater"))
        categorySection.filters.append(Filter(name: "Ethiopian", code: "ethiopian"))
        categorySection.filters.append(Filter(name: "Fast Food", code: "hotdogs"))
        categorySection.filters.append(Filter(name: "Filipino", code: "filipino"))
        categorySection.filters.append(Filter(name: "Fish & Chips", code: "fishnchips"))
        categorySection.filters.append(Filter(name: "Fondue", code: "fondue"))
        categorySection.filters.append(Filter(name: "Food Court", code: "food_court"))
        categorySection.filters.append(Filter(name: "Food Stands", code: "foodstands"))
        categorySection.filters.append(Filter(name: "French", code: "french"))
        categorySection.filters.append(Filter(name: "Mauritius", code: "mauritius"))
        categorySection.filters.append(Filter(name: "Reunion", code: "reunion"))
        categorySection.filters.append(Filter(name: "Gastropubs", code: "gastropubs"))
        categorySection.filters.append(Filter(name: "German", code: "german"))
        categorySection.filters.append(Filter(name: "Gluten-Free", code: "gluten_free"))
        categorySection.filters.append(Filter(name: "Greek", code: "greek"))
        categorySection.filters.append(Filter(name: "Halal", code: "halal"))
        categorySection.filters.append(Filter(name: "Hawaiian", code: "hawaiian"))
        categorySection.filters.append(Filter(name: "Himalayan/Nepalese", code: "himalayan"))
        categorySection.filters.append(Filter(name: "Hong Kong Style Cafe", code: "hkcafe"))
        categorySection.filters.append(Filter(name: "Hot Dogs", code: "hotdog"))
        categorySection.filters.append(Filter(name: "Hot Pot", code: "hotpot"))
        categorySection.filters.append(Filter(name: "Hungarian", code: "hungarian"))
        categorySection.filters.append(Filter(name: "Iberian", code: "iberian"))
        categorySection.filters.append(Filter(name: "Indian", code: "indpak"))
        categorySection.filters.append(Filter(name: "Indonesian", code: "indonesian"))
        categorySection.filters.append(Filter(name: "Irish", code: "irish"))
        categorySection.filters.append(Filter(name: "Italian", code: "italian"))
        categorySection.filters.append(Filter(name: "Calabrian", code: "calabrian"))
        categorySection.filters.append(Filter(name: "Sardinian", code: "sardinian"))
        categorySection.filters.append(Filter(name: "Tuscan", code: "tuscan"))
        categorySection.filters.append(Filter(name: "Japanese", code: "japanese"))
        categorySection.filters.append(Filter(name: "Izakaya", code: "izakaya"))
        categorySection.filters.append(Filter(name: "Ramen", code: "ramen"))
        categorySection.filters.append(Filter(name: "Teppanyaki", code: "teppanyaki"))
        categorySection.filters.append(Filter(name: "Korean", code: "korean"))
        categorySection.filters.append(Filter(name: "Kosher", code: "kosher"))
        categorySection.filters.append(Filter(name: "Laotian", code: "laotian"))
        categorySection.filters.append(Filter(name: "Latin American", code: "latin"))
        categorySection.filters.append(Filter(name: "Colombian", code: "colombian"))
        categorySection.filters.append(Filter(name: "Salvadoran", code: "salvadoran"))
        categorySection.filters.append(Filter(name: "Venezuelan", code: "venezuelan"))
        categorySection.filters.append(Filter(name: "Live/Raw Food", code: "raw_food"))
        categorySection.filters.append(Filter(name: "Malaysian", code: "malaysian"))
        categorySection.filters.append(Filter(name: "Mediterranean", code: "mediterranean"))
        categorySection.filters.append(Filter(name: "Falafel", code: "falafel"))
        categorySection.filters.append(Filter(name: "Mexican", code: "mexican"))
        categorySection.filters.append(Filter(name: "Tacos", code: "tacos"))
        categorySection.filters.append(Filter(name: "Middle Eastern", code: "mideastern"))
        categorySection.filters.append(Filter(name: "Egyptian", code: "egyptian"))
        categorySection.filters.append(Filter(name: "Lebanese", code: "lebanese"))
        categorySection.filters.append(Filter(name: "Modern European", code: "modern_european"))
        categorySection.filters.append(Filter(name: "Mongolian", code: "mongolian"))
        categorySection.filters.append(Filter(name: "Moroccan", code: "moroccan"))
        categorySection.filters.append(Filter(name: "New Mexican Cuisine", code: "newmexican"))
        categorySection.filters.append(Filter(name: "Nicaraguan", code: "nicaraguan"))
        categorySection.filters.append(Filter(name: "Noodles", code: "noodles"))
        categorySection.filters.append(Filter(name: "Pakistani", code: "pakistani"))
        categorySection.filters.append(Filter(name: "Pan Asian", code: "panasian"))
        categorySection.filters.append(Filter(name: "Persian/Iranian", code: "persian"))
        categorySection.filters.append(Filter(name: "Peruvian", code: "peruvian"))
        categorySection.filters.append(Filter(name: "Pizza", code: "pizza"))
        categorySection.filters.append(Filter(name: "Polish", code: "polish"))
        categorySection.filters.append(Filter(name: "Pop-Up Restaurants", code: "popuprestaurants"))
        categorySection.filters.append(Filter(name: "Portuguese", code: "portuguese"))
        categorySection.filters.append(Filter(name: "Poutineries", code: "poutineries"))
        categorySection.filters.append(Filter(name: "Russian", code: "russian"))
        categorySection.filters.append(Filter(name: "Salad", code: "salad"))
        categorySection.filters.append(Filter(name: "Sandwiches", code: "sandwiches"))
        categorySection.filters.append(Filter(name: "Scandinavian", code: "scandinavian"))
        categorySection.filters.append(Filter(name: "Scottish", code: "scottish"))
        categorySection.filters.append(Filter(name: "Seafood", code: "seafood"))
        categorySection.filters.append(Filter(name: "Singaporean", code: "singaporean"))
        categorySection.filters.append(Filter(name: "Slovakian", code: "slovakian"))
        categorySection.filters.append(Filter(name: "Soul Food", code: "soulfood"))
        categorySection.filters.append(Filter(name: "Soup", code: "soup"))
        categorySection.filters.append(Filter(name: "Southern", code: "southern"))
        categorySection.filters.append(Filter(name: "Spanish", code: "spanish"))
        categorySection.filters.append(Filter(name: "Sri Lankan", code: "srilankan"))
        categorySection.filters.append(Filter(name: "Steakhouses", code: "steak"))
        categorySection.filters.append(Filter(name: "Supper Clubs", code: "supperclubs"))
        categorySection.filters.append(Filter(name: "Sushi Bars", code: "sushi"))
        categorySection.filters.append(Filter(name: "Syrian", code: "syrian"))
        categorySection.filters.append(Filter(name: "Taiwanese", code: "taiwanese"))
        categorySection.filters.append(Filter(name: "Tapas Bars", code: "tapas"))
        categorySection.filters.append(Filter(name: "Tapas/Small Plates", code: "tapasmallplates"))
        categorySection.filters.append(Filter(name: "Tex-Mex", code: "tex-mex"))
        categorySection.filters.append(Filter(name: "Thai", code: "thai"))
        categorySection.filters.append(Filter(name: "Turkish", code: "turkish"))
        categorySection.filters.append(Filter(name: "Ukrainian", code: "ukrainian"))
        categorySection.filters.append(Filter(name: "Uzbek", code: "uzbek"))
        categorySection.filters.append(Filter(name: "Vegan", code: "vegan"))
        categorySection.filters.append(Filter(name: "Vegetarian", code: "vegetarian"))
        categorySection.filters.append(Filter(name: "Vietnamese", code: "vietnamese"))
        categorySection.filters.append(Filter(name: "Waffles", code: "waffles"))
        categorySection.filters.append(Filter(name: "Wraps", code: "wraps"))
        sections.append(categorySection)
    }
}

class FilterSection {
    let title: String
    var filters = [Filter]()
    
    init(title: String) {
        self.title = title
    }
}

class Filter {
    let name: String
    let code: Any
    var isOn = false
    
    init(name: String, code: Any) {
        self.name = name
        self.code = code
    }
}
