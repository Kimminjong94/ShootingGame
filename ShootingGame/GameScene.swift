

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
    

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "desertBackground")
        DispatchQueue.global(qos: .background).async {
            background.zPosition = -1
            background.size = self.frame.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
//            background.size = CGSize(width: self.size.width, height: self.size.height)
            self.addChild(background)
            self.physicsWorld.contactDelegate = self
        }
        myPlayer()
        print("Current thread is \(#function) is \(Thread.current)")

    }
    
    func myPlayer() {
        
        DispatchQueue.main.async {
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
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

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

}


