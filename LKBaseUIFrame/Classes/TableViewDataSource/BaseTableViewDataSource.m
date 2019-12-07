//
//  BaseTableViewDataSource.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseTableViewDataSource.h"
#import "BaseTableViewCell.h"

@implementation BaseTableViewDataSource
- (NSString *)identifierBy:(NSIndexPath *)indexPath{
    return self.identifiers[indexPath.section];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
    
    if (self.identifiers.count!=0) {
        
        BaseTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:[self identifierBy:indexPath] forIndexPath:indexPath];
        id item =[[self.datas objectAtIndex:indexPath.section].items objectAtIndex:indexPath.item];
        //        YYLog(@"%@",item);
        self.configureCellBlock(cell, item);
        return cell;
    } else {
        BaseTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
        id item =[[self.datas objectAtIndex:indexPath.section].items objectAtIndex:indexPath.row];
        self.configureCellBlock(cell, item);
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas objectAtIndex:section].items.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}



@end


