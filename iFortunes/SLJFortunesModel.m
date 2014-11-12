//
//  SLJFortunesModel.m
//  iFortunes
//
//  Created by Stanley Jackson on 9/26/14.
//  Copyright (c) 2014 Stanley Jackson. All rights reserved.
//

#import "SLJFortunesModel.h"

@interface SLJFortunesModel()

//private property
@property (strong, nonatomic) NSMutableArray *answers;
@end


@implementation SLJFortunesModel


- (id) init {
    self = [super init];
    if (self) {
        
        NSMutableArray *lottoNumbers = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 4; i++) {
            [lottoNumbers addObject:[NSNumber numberWithInteger:rand()%76]];
        }
        
        [lottoNumbers addObject:[NSNumber numberWithInteger:rand()%16]];
        NSString *lottoString = [lottoNumbers componentsJoinedByString:@", "];
        
        _answers = [[NSMutableArray alloc] initWithObjects:
                    @"A beautiful, smart, and loving person will be coming into your life.",
                    @"A dubious friend may be an enemy in camouflage.",
                    @"A smile is your personal welcome mat.",
                    @"It is worth reviewing some old lessons.",
                    @"The harder you work, the luckier you get.",
                    @"Welcome change.",
                    nil];
    
        
        _secretAnswer = [NSString stringWithFormat:@"You will win the lottery if you pick these numbers: \n"];
        _secretAnswer = [_secretAnswer stringByAppendingString:lottoString];

    }
    return self;
}



//public methods
-(NSString *) randomAnswer{
    return [self.answers objectAtIndex:random()%[self.answers count]];
}

-(NSUInteger) numberofAnswers{
    return [self.answers count];
}

-(NSString *) answerAtIndex:(NSUInteger)index{
    return self.answers[index];
}

-(void) removeAnswerAtIndex:(NSUInteger)index{
    [self.answers removeObject:self.answers[index]];
}

-(void) insertAnswer:(NSString *)answer atIndex:(NSUInteger)index{
    [self.answers insertObject:answer atIndex:index];
}

@end
