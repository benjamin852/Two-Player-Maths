
#import "Player.h"

@implementation Player
- (instancetype) initWithName:(NSString*)playerName withCurrentPlayer:(NSInteger)currentPlayer withPlayerLives:(NSInteger)playerLives {
    self = [super init];
    if (self) {
        _playerName = playerName;
        _playerScore = playerLives;
        _lives = 3;
    }
    return self;
}
@end
