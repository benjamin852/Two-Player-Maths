

#import "GameModel.h"
@class ViewController;

@implementation GameModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _answerString = @"";
        _currentPlayer = _playersArray[0];
        _playersArray = @[@"player1", @"player2"];
        _playerOneScore = 0;
        _playerTwoScore = 0;
        _playerOneLives = 3;
        _playerTwoLives = 3;
    }
    return self;
}

- (NSString*) generateAnswerString: (NSInteger) numberOfTags {
    NSString *numberPushed = @(numberOfTags).stringValue;
    self.answerString = [self.answerString stringByAppendingString:numberPushed];
    return self.answerString;
}






- (NSString*) generateQuestion {
    
    
    //review
    self.currentPlayerIndex +=1;
    if (self.currentPlayerIndex % 2) {
        self.currentPlayer = self.playersArray[0];
        NSLog(@"current player is player1");
    } else {
        self.currentPlayer = self.playersArray[1];
        NSLog(@"currentPlayer is player 2");
    }

    
    //review^

    NSInteger randomNumberOne = arc4random_uniform(50) + 1;
    NSInteger randomNumberTwo = arc4random_uniform(50) + 1;
    NSInteger answer = randomNumberOne + randomNumberTwo;
    self.firstValue = randomNumberOne;
    self.secondValue = randomNumberTwo;
    self.answer = answer;
    NSString *questionString = [NSString stringWithFormat:@"%@: What is %ld + %ld", self.currentPlayer, randomNumberOne, randomNumberTwo];
    return questionString;
}








-(BOOL) verifyAnswer {
    NSInteger rightAnswerInteger = [self.answerString integerValue];
    if (rightAnswerInteger == self.answer) {
        if (self.currentPlayer == self.playersArray[0]) {
            self.playerOneScore +=15;

        }
        if (self.currentPlayer == self.playersArray[1]) {
            self.playerTwoScore +=15;
        }
        return YES;
    } else {
        if (self.currentPlayer == self.playersArray[0]) {
            self.playerOneLives -=1;
            
        }
        if (self.currentPlayer == self.playersArray[1]) {
            self.playerTwoLives -=1;
        }
        return NO;
    }
}


- (NSString*) playerOneScoreMethod {
    NSString *convertedInt= [NSString stringWithFormat:@"%ld", self.playerOneScore];
    return convertedInt;
}
- (NSString*) playerTwoScoreMethod {
    NSString *convertedInt= [NSString stringWithFormat:@"%ld", self.playerTwoScore];
    return convertedInt;
}



-(NSString*) playerOneLivesMethod {
    NSString *convertedInt = [NSString stringWithFormat:@"%ld", self.playerOneLives];
    return convertedInt;
}
-(NSString*) playerTwoLivesMethod {
    NSString *convertedInt = [NSString stringWithFormat:@"%ld", self.playerTwoLives];
    return convertedInt;
}

@end



