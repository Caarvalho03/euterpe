#ifndef INITIALIZATION_H
#define INITIALIZATION_H

#include "logic/database/database.h"
#include "logic/database/models/playlist.h"


class Initialization
{
public:
    Initialization();
    static void createDatabase();
    static void createTables();

    void test();
};

#endif // INITIALIZATION_H
