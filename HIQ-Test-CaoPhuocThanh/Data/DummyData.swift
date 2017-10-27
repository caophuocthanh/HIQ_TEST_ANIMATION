//
//  DummyData.swift
//  HIQ-Test-CaoPhuocThanh
//
//  Created by Cao Phuoc Thanh on 10/26/17.
//  Copyright © 2017 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class DummyData {
    
    static var dumpImage: String {
        get {
            let imageUrls = [
                "https://s-media-cache-ak0.pinimg.com/236x/14/b6/e2/14b6e2791e19809613e3ad67f636dc24.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/90/d0/3f/90d03fc5ab177f876db613703c6b97e3.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/93/89/17/938917a98b1aeb2e32daf6a1f8b5f3b4.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/ff/e8/5f/ffe85feb88087d62571eef2cc2d9cfa9.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/16/c9/37/16c9371d6188227a4a7a8c6f5df86816.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/4d/d6/b8/4dd6b87b7fba7448edc64656223482a9.jpg",
                "https://s-media-cache-ak0.pinimg.com/564x/f6/6c/a4/f66ca4288f5fce57992bd13db742c8d2.jpg",
                "https://s-media-cache-ak0.pinimg.com/564x/ee/47/be/ee47be7b84b4002ebf500e77d03380ab.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/3c/8e/8f/3c8e8f8e545df7b67436f0f593f20311.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/f6/ed/9e/f6ed9e479ee7eb73ff11639bfe4d6d60.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/04/0f/01/040f01e8516e6f744e032c6b7f77b20d.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/f8/32/56/f83256ea536efa88ca9ab31050143b7e.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/c9/be/aa/c9beaa2c1b86b95e142974f7380328c5.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/c3/d8/3a/c3d83a9fc71ccc18b1a23e3921aa6b67.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/1e/da/dc/1edadc73cfef8d474bf7d9221397ebd6.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/ce/d7/ff/ced7ffdaa782e78476c9286c49bb4ef1.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/3b/71/94/3b7194fb3262c22e2f0a77d72baecadc.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/75/03/01/7503014b6ee579e5abcfd914eb1c2450.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/85/0b/d3/850bd33a042d9bea2a463284fc0b9aa7.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/7f/0f/d3/7f0fd3c7af42dc0b13a99e39e5e2f601.jpg",
                "https://s-media-cache-ak0.pinimg.com/564x/74/c6/18/74c6188602aa1dec287d11fdcbd91695.jpg",
                "https://s-media-cache-ak0.pinimg.com/474x/7b/b2/77/7bb277b615d35bb3ed4a5a16d47ad9a6.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/66/b8/7c/66b87cdab4570920021a2bdf162d6aca.jpg",
                "https://s-media-cache-ak0.pinimg.com/236x/ed/ba/5e/edba5e26c521826fbe5c1acf35d35f5c.jpg"
            ]
            let diceRoll = Int(arc4random_uniform(UInt32(imageUrls.count)))
            return imageUrls[diceRoll]
        }
    }
}
