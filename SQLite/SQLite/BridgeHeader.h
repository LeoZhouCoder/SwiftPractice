//
//  BridgeHeader.h
//  SQLite
//
//  Created by Leo Zhou on 2019/3/10.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

#ifndef BridgeHeader_h
#define BridgeHeader_h


#endif /* BridgeHeader_h */

#include "sqlite3.h"

var db :COpaquePointer = nil
// 資料庫檔案的路徑
let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
let sqlitePath = urls[urls.count - 1].absoluteString + "sqlite3.db"
