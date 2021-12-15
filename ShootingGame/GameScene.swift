

import SpriteKit
import GameplayKit

var player = SKSpriteNode()
var myWeapon = SKSpriteNode()
var enemy = SKSpriteNode()
var star = SKSpriteNode()

var scoreLabel = SKLabelNode()
var mainLabel = SKLabelNode()

var playerSize = CGSize(width: 120, height: 120)
var myWeaponSize = CGSize(width: 30, height: 30)
var enemySize = CGSize(width: 120, height: 120)
var starSize = CGSize()

var gameRedColor = UIColor(red: 0.5, green: 0.2, blue: 0.2, alpha: 0.1)
var gameWhiteColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

var myWeaponRate = 0.2
var myWeaponSpeed = 0.9

var enemySpeed = 2.5
var enemySpawnRate = 1.5

var isAlive = true
var score = 0

var touchLocation = CGPoint()

struct physicsCategory {
    static let player: UInt32 = 0
    static let myWeapon: UInt32 = 1
    static let enemy: UInt32 = 2
}





class GameScene: SKScene, SKPhysicsContactDelegate {

    
    
//    private func fetchImage() {
//
//        guard let url = URL(string: url) else {
//            return
//        }
//        let getDataTask = URLSessionTask.shared.dataTask(with: url, completionHandler: {data, _, error in
//            guard let data = datea, error = nil else {
//                return
//            }
//            let image = UIImage(data: data)
//
//        })
//    }
    


    override func didMove(to view: SKView) {
        
        myPlayer()


        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b3/Sanfran-night.jpg")
            let data = NSData(contentsOf: url! as URL)
            let theImage = UIImage(data: data! as Data)
            let Texture = SKTexture(image: theImage!)
            let mySprite = SKSpriteNode(texture: Texture)
            self.addChild(mySprite)

        }
        
        
        print("Current thread is \(#function) is \(Thread.current)")

    }
    
    func myPlayer() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            player = SKSpriteNode(imageNamed: "myShip2")
            player.size = playerSize
            player.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 150)
            
            player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
            player.physicsBody?.affectedByGravity = false
            player.physicsBody?.allowsRotation = false
            player.physicsBody?.isDynamic = false
            player.physicsBody?.categoryBitMask = physicsCategory.player
            player.physicsBody?.contactTestBitMask = physicsCategory.enemy
            player.name = "playerName"
            self.addChild(player)
        }
        print("Current thread is \(#function) is \(Thread.current)")

    }
    
    func resetGameVariablesOnStart() {
        isAlive = true
        score = 0
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.location(in: player)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            player.position.x = location.x
            player.position.y = location.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
    func getImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }

}


