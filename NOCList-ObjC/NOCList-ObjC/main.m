//
//  main.m
//  NOCList-ObjC
//
//  Created by Joshua Rutkowski on 5/20/20.
//  Copyright © 2020 Rutkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIAgent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LSIAgent * ethan = [[LSIAgent alloc] initWithCoverName:@"Ethan Hunt" realName:@"Tom Cruise" accessLevel:8 compromised:NO];
        LSIAgent * jim = [[LSIAgent alloc] initWithCoverName:@"Jim Phelps" realName:@"Jon Voight" accessLevel:9 compromised:YES];
        LSIAgent * claire = [[LSIAgent alloc] initWithCoverName:@"Claire Phelps"  realName:@"Emmanuelle Beart" accessLevel:5 compromised:NO];
        LSIAgent * eugene = [[LSIAgent alloc] initWithCoverName:@"Eugene Kittridge" realName:@"Henry Czerny" accessLevel:10 compromised: YES];
        LSIAgent * franz = [[LSIAgent alloc] initWithCoverName:@"Franz Krieger"  realName:@"Jean Reno" accessLevel:4 compromised:NO];
        LSIAgent * luther = [[LSIAgent alloc] initWithCoverName:@"Luther Stickell"  realName:@"Ving Rhames" accessLevel:4 compromised:NO];
        LSIAgent * sarah = [[LSIAgent alloc] initWithCoverName:@"Sarah Davies"  realName:@"Kristin Scott Thomas" accessLevel:5 compromised:YES];
        LSIAgent * max = [[LSIAgent alloc] initWithCoverName:@"Max RotGrab"  realName:@"Vanessa Redgrave" accessLevel:4 compromised:NO];
        LSIAgent * hannah = [[LSIAgent alloc] initWithCoverName:@"Hannah Williams" realName:@"Ingeborga Dapkūnaitė" accessLevel:5 compromised:YES];
        LSIAgent * jack = [[LSIAgent alloc] initWithCoverName:@"Jack Harmon" realName:@"Emilio Estevez" accessLevel:6 compromised:YES];
        LSIAgent * frank = [[LSIAgent alloc] initWithCoverName:@"Frank Barnes" realName:@"Dale Dye" accessLevel:9 compromised:NO];
        
        NSMutableArray * agents = [[NSMutableArray alloc] initWithObjects:ethan, jim, claire, eugene, franz, luther, sarah, max, hannah, jack, frank, nil];
        
        int compromisedAgents = 0;
        int cleanAgents = 0;
        int lowLevelAgents = 0;
        int midLevelAgents = 0;
        int highLevelAgents = 0;
        
        for (LSIAgent * agent in agents) {
            if (agent.compromised.boolValue == YES) {
                compromisedAgents++;
                NSLog(@"Agent is compromised: %@", agent.coverName);
            }
        }
        
        for (LSIAgent * agent in agents) {
            if (agent.compromised.boolValue == NO) {
                cleanAgents++;
                NSLog(@"Agent is clean: %@", agent.coverName);
            }
        }
        
        for (LSIAgent * agent in agents) {
            
            int agentAccessLevel = agent.accessLevel.intValue;
            BOOL agentISCompromised = agent.compromised.boolValue;
            NSString * realName = agent.realName;
            
            if (agentAccessLevel > 8 && agentISCompromised == YES) {
                NSLog(@"%@, level: %d WARNING COMPROMISED", realName, agentAccessLevel);
            } else if (agentAccessLevel > 8) {
                NSLog(@"%@, level: %d", realName, agentAccessLevel);
            }
        }
        
        for (LSIAgent * agent in agents ) {
            int agentAccessLevel = agent.accessLevel.intValue;
            
            if (agentAccessLevel > 7) {
                highLevelAgents++;
            } else if (agentAccessLevel > 4) {
                midLevelAgents++;
            } else {
                lowLevelAgents++;
            }
        }
        
        NSLog(@"Number of compromised agents: %d", compromisedAgents);
        NSLog(@"Number of clean agents: %d", cleanAgents);
        NSLog(@"%d low level agents, %d mid level agents and %d high level agents.", lowLevelAgents, midLevelAgents, highLevelAgents);
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"accessLevel" ascending:YES];
        [agents sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        for (LSIAgent * agent in agents ) {
            NSLog(@"%@, level: %@", agent.coverName, agent.accessLevel);
        }
    }
    
    return 0;
}
