//
//  ViewController.swift
//  sevenwonders
//
//  Created by Wayne Wen on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sevenWondersNames = [
        "The Colosseum, Rome, Italy",
        "The Great Wall of China",
        "The Taj Mahal, India",
        "Christ the Redeemer, Brazil",
        "Machu Picchu, Peru",
        "Chichén Itzá, Mexico",
        "Petra, Jordan",
    ]
    
    let sevenWondersPicNames = [
        "0-The Colosseum, Rome, Italy",
        "1-The Great Wall of China",
        "2-The Taj Mahal, India",
        "3-Christ the Redeemer, Brazil",
        "4-Machu Picchu, Peru",
        "5-Chichén Itzá, Mexico",
        "6-Petra, Jordan",
    ]
    
    
    let sevenWondersDescription = [
        "The Colosseum, also named the Flavian Amphitheater, is a large amphitheater in Rome. It was built during the reign of the Flavian emperors as a gift to the Roman people. Construction of the Colosseum began sometime between C.E. 70 and 72 under the emperor Vespasian. It opened nearly a decade later and was modified several times in the following years. The massive structure measured approximately 189 by 156 meters (620 by 513 feet), towered four stories high, and included eighty entrances to the amphitheater—seventy-six for the patrons, two for participants of events, and two exclusively for the emperor to use. The sheer number of entrances proved to be necessary: the Colosseum could hold more than 50,000 spectators at its maximum capacity.",
        "The Great Wall of China (traditional Chinese: 萬里長城; simplified Chinese: 万里长城; pinyin: Wànlǐ Chángchéng, literally 'ten thousand li wall') is a series of fortifications that were built across the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe. Several walls were built from as early as the 7th century BC,[4] with selective stretches later joined by Qin Shi Huang (220–206 BC), the first emperor of China. Little of the Qin wall remains.[5] Later on, many successive dynasties built and maintained multiple stretches of border walls. The best-known sections of the wall were built by the Ming dynasty (1368–1644).",
        "The Taj Mahal is an ivory-white marble mausoleum on the south bank of the Yamuna river in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor, Shah Jahan (reigned from 1628 to 1658), to house the tomb of his favourite wife, Mumtaz Mahal. The tomb is the centrepiece of a 17-hectare (42-acre)complex, which includes a mosque and a guest house, and is set in formal gardens bounded on three sides by a crenellated wall.",
        "Towering 2,310 feet above the city of Rio, the Christ the Redeemer statue has fascinated experts and historians for nearly a hundred years. It’s the fourth largest statue of Jesus Christ in the world, the largest Art Deco-style sculpture on the planet, and to top it all off, in 2007 the statue was deemed as one of the New Seven Wonders of the World along with Machu Picchu, the Great Wall of China and the Roman Colosseum. Perched on the summit of Mount Corcovado in Rio, the statue stands at a whopping 98 feet (or 30 metres) tall (making it two-thirds the height of New York’s Statue of Liberty), and its outstretched arms reach to 92 feet (or 28 metres) horizontally.",
        "Machu Picchu stands 2,430 m above sea-level, in the middle of a tropical mountain forest, in an extraordinarily beautiful setting. It was probably the most amazing urban creation of the Inca Empire at its height; its giant walls, terraces and ramps seem as if they have been cut naturally in the continuous rock escarpments. The natural setting, on the eastern slopes of the Andes, encompasses the upper Amazon basin with its rich diversity of flora and fauna.",
        "Chichén Itzá[nb 1] (often spelled Chichen Itza in English and traditional Yucatec Maya) was a large pre-Columbian city built by the Maya people of the Terminal Classic period. The archeological site is located in Tinúm Municipality, Yucatán State, Mexico.[1]",
        "Petra (Arabic: ٱلْبَتْرَاء, romanized: Al-Batrāʾ; Ancient Greek: Πέτρα, 'Rock', Nabataean: 𐢛𐢚𐢓𐢈‎), originally known to its inhabitants as Raqmu or Raqēmō,[3][4] is a historic and archaeological city in southern Jordan. It is adjacent to the mountain of Jabal Al-Madbah, in a basin surrounded by mountains forming the eastern flank of the Arabah valley running from the Dead Sea to the Gulf of Aqaba.[5] The area around Petra has been inhabited from as early as 7000 BC,[6] and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BC.[7] Archaeological work has only discovered evidence of Nabataean presence dating back to the second century BC,[8] by which time Petra had become their capital.[6] The Nabataeans were nomadic Arabs who invested in Petra's proximity to the incense trade routes by establishing it as a major regional trading hub",
    ]
    
    var curDescription = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevenWondersNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.sevenWonderImg.image = UIImage(named: "\(indexPath.row)")
        cell.titleText.text = sevenWondersNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        curDescription = sevenWondersDescription[indexPath.row]
        print(curDescription)
        performSegue(withIdentifier: "DetailsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            
            let detailsVC = segue.destination as! DetailsViewController
            
            detailsVC.desText = curDescription
        }
    }
}

