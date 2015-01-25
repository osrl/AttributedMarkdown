//
//  NSTextAttachment+Image.m
//  Pods
//
//  Created by Osman Saral on 23/01/15.
//
//

#import "NSTextAttachment+Image.h"

@implementation NSTextAttachment (Image)

-(void) loadImageWithUrl: (NSString*) url {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSURL *imageURL = [NSURL URLWithString:url];
                       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                       dispatch_sync(dispatch_get_main_queue(), ^{
                           self.image = [UIImage imageWithData:imageData];
                           [[NSNotificationCenter defaultCenter]  postNotificationName:@"imageLoadedNotification" object:nil];
                       });
                   });
}

@end
