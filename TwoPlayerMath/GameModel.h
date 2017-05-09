

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject
@property (nonatomic) NSInteger firstValue;
@property (nonatomic) NSInteger secondValue;
@property (nonatomic) NSInteger answer;


@property (nonatomic) NSString *answerString;
@property (nonatomic) NSInteger playerOneScore;
@property (nonatomic) NSInteger playerTwoScore;

@property (nonatomic) NSInteger playerOneLives;
@property (nonatomic) NSInteger playerTwoLives;


@property (nonatomic) NSArray *playersArray;
@property (nonatomic) Player *currentPlayer;
@property (nonatomic) NSInteger currentPlayerIndex;


- (NSString*) generateAnswerString: (NSInteger) numberOfTags;
-(BOOL) verifyAnswer;

- (NSString*) generateQuestion;




- (NSString*) playerOneScoreMethod;
- (NSString*) playerTwoScoreMethod;


-(NSString*) playerOneLivesMethod;
-(NSString*) playerTwoLivesMethod;

@end
