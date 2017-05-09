
#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

- (IBAction)buttonPush:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerMessage;

@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;


@property (weak, nonatomic) IBOutlet UILabel *playerOneLives;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoLives;


@property (nonatomic) GameModel *gameModel;
- (IBAction)submitButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@property (nonatomic) Player *playerInstance;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameModel = [[GameModel alloc] init];
    self.questionLabel.text = [self.gameModel generateQuestion];
    self.playerInstance = [[Player alloc] init];
    self.playerOneLives.text = [NSString stringWithFormat:@"%ld", self.gameModel.playerOneLives];
    self.playerTwoLives.text = [NSString stringWithFormat:@"%ld", self.gameModel.playerTwoLives];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)buttonPush:(UIButton *)sender {
    self.answerLabel.text = [self.gameModel generateAnswerString:sender.tag];
    
}



- (IBAction)submitButton:(UIButton *)sender {
    if ([self.gameModel verifyAnswer]==YES) {
        self.answerMessage.text = [NSString stringWithFormat:@"You're right!"];
        self.gameModel.answerString = @"";
        self.answerLabel.text = [NSString stringWithFormat:@""];
        
        self.playerOneScore.text = [self.gameModel playerOneScoreMethod];
        self.playerTwoScore.text = [self.gameModel playerTwoScoreMethod];
        
    } else {
        self.answerMessage.text = [NSString stringWithFormat:@"Your Wrong!"];
        self.gameModel.answerString = @"";
        self.answerLabel.text = [NSString stringWithFormat:@""];
        self.playerOneLives.text = [self.gameModel playerOneLivesMethod];
        self.playerTwoLives.text = [self.gameModel playerTwoLivesMethod];
    }
    
    self.questionLabel.text = [self.gameModel generateQuestion];
}

- (IBAction)cancelButton:(UIButton *)sender {
    self.gameModel.answerString = @"";
    self.answerLabel.text = [NSString stringWithFormat:@""];
}


@end
