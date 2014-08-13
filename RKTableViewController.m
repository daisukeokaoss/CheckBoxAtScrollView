//
//  RKTableViewController.m
//  Example
//
//  Created by おかやん on 2014/08/13.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "RKTableViewController.h"

@implementation RKTableViewController{
    NSMutableArray *_dataArray;
    NSArray *StateArray;
}

-(id)init
{
    self = [super init];
    if(self){
        NSLog(@"%s",__func__);
        _dataArray = [[NSMutableArray alloc] init];
        for(int i=0;i<10 ;i++){
            NSDictionary *data = @{@"title":[NSString stringWithFormat:@"title-%d",i],
                                   @"description":[NSString stringWithFormat:@"Description-%d",i]};
            [_dataArray addObject:data];
        }
    }
    
    
    
    /*   NSTableColumn* colmun = [ m_table tableColumnWithIdentifier: @"TITLE" ];
     NSButtonCell* cell = [[NSButtonCell alloc ] initTextCell:@""];
     [cell setEditable: NO];
     [cell setButtonType: NSSwitchButton];
     [column setDataCell: cell ];*/
    
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView*)tableView
{
    NSLog(@"%s",__func__);
    return _dataArray.count;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSDictionary *data = [_dataArray objectAtIndex:row];
    if([[tableColumn identifier] isEqualToString:@"TITLE"]){
        return [data objectForKey:@"description"];
        
    }else if([[tableColumn identifier] isEqualToString:@"DESCRIPTION"]){
        
        NSTableColumn* colmun = [ tableView tableColumnWithIdentifier: @"DESCRIPTION" ];
        NSButtonCell* cell = [[NSButtonCell alloc ] initTextCell:[data objectForKey:@"title"]];
        [cell setEditable: YES];
        [cell setButtonType: NSSwitchButton];
        [cell setState:1];
        [colmun setDataCell: cell ];
        
        

      
        return cell;
    }else{
        return @"nil";
    }
    
    return nil;
    
}

@end
