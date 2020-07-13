//
//  main.m
//  NOCList-ObjC
//
//  Created by Nonye on 7/13/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIAgent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LSIAgent *agent1 = [[LSIAgent alloc] initWithCoverName:@"Ethan Hunt" realName:@"Tom Cruise" accessLevel: 8 compromised: YES];
        LSIAgent *agent2 = [[LSIAgent alloc] initWithCoverName:@"Jim Phelps" realName:@"Jon Voight" accessLevel: 8 compromised: YES];
        LSIAgent *agent3 = [[LSIAgent alloc] initWithCoverName:@"Claire Phelps" realName:@"Emmanuelle Beart" accessLevel: 8 compromised: YES];
        LSIAgent *agent4 = [[LSIAgent alloc] initWithCoverName:@"Eugene Kittridge" realName:@"Henry Czerny" accessLevel: 8 compromised: YES];
        LSIAgent *agent5 = [[LSIAgent alloc] initWithCoverName:@"Franz Krieger" realName:@"Jean Reno" accessLevel: 8 compromised: YES];
        LSIAgent *agent6 = [[LSIAgent alloc] initWithCoverName:@"Luther Stickell" realName:@"Ving Rhames" accessLevel: 8 compromised: YES];
        LSIAgent *agent7 = [[LSIAgent alloc] initWithCoverName:@"Sarah Davies" realName:@"Kristin Scott Thomas" accessLevel: 8 compromised: YES];
        LSIAgent *agent8 = [[LSIAgent alloc] initWithCoverName:@"Max RotGrab" realName:@"Vanessa Redgrave" accessLevel: 8 compromised: YES];
        LSIAgent *agent9 = [[LSIAgent alloc] initWithCoverName:@"Hannah Williams" realName:@"Ingeborga Dapkūnaitė" accessLevel: 8 compromised: YES];
        LSIAgent *agent10 = [[LSIAgent alloc] initWithCoverName:@"Jack Harmon" realName:@"Emilio Estevez" accessLevel: 8 compromised: YES];
        LSIAgent *agent11 = [[LSIAgent alloc] initWithCoverName:@"Frank Barnes" realName:@"Dale Dye" accessLevel: 8 compromised: YES];
        
        NSArray *agents =@[agent1,
                           agent2,
                           agent3,
                           agent4,
                           agent5,
                           agent6,
                           agent7,
                           agent8,
                           agent9,
                           agent10,
                           agent11];
        int compromisedAgents = 0;
        for(LSIAgent *agent in agents) {
            if ([agent compromised] == [NSNumber numberWithBool:YES]) {
                compromisedAgents += 1;
            }
        }
        NSLog(@"%i agents have been compromised!", compromisedAgents);
        int cleanAgents = 0;
        for(LSIAgent *agent in agents) {
            if ([agent compromised] == [NSNumber numberWithBool:NO]) {
                cleanAgents += 1;
            }
        }
        NSLog(@"%i agents are clean!", cleanAgents);
        
        for(LSIAgent *agent in agents) {
            if ([agent compromised] == [NSNumber numberWithBool:YES]) {
                if ([[agent accessLevel] isGreaterThanOrEqualTo: [NSNumber numberWithInt:8]]) {
                    compromisedAgents += 1;
                    NSLog(@"%@, level %@ *WARNING COMPROMISED*", [agent realName], [agent accessLevel]);
                }
            }
        }
        int lowLevelAgents = 0;
        int midLevelAgents = 0;
        int highLevelAgents = 0;
        for(LSIAgent *agent in agents) {
            if ([[agent accessLevel] isGreaterThan:  [NSNumber numberWithInt:4]] && ([[agent accessLevel] isLessThanOrEqualTo:[NSNumber numberWithInt:7]])) {
                midLevelAgents += 1;
            }
            if ([[agent accessLevel] isLessThanOrEqualTo: [NSNumber numberWithInt:4]]) {
                lowLevelAgents += 1;
            } else {
                highLevelAgents += 1;
            }
        }
        NSLog(@"Low level agents: %d, mid level agents: %d, high level agents: %d", lowLevelAgents, midLevelAgents, highLevelAgents);
        
    }
    return 0;
}
