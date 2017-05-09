
#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic) NSString *playerName;
@property (nonatomic) NSInteger playerScore;
- (instancetype) initWithName:(NSString*)playerName withCurrentPlayer:(NSInteger)currentPlayer withPlayerLives:(NSInteger)playerLives;

@property (nonatomic) NSInteger lives;

@end
