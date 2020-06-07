//
//  LSIAgent.h
//  NOCList-ObjC
//
//  Created by Shawn James on 6/7/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIAgent : NSObject

// @property (attributes) type variableName;
@property NSString *coverName;
@property NSString *realName;
@property NSNumber *accessLevel;
@property NSNumber *compromised;

@end

NS_ASSUME_NONNULL_END
