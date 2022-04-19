#ifndef INITIALIZATION_H
#define INITIALIZATION_H

#include "logic/database/database.h"
#include "../viniciusql/viniciusql.h"
#include <QQmlEngine>

#include "logic/database/models/playlist.h"

#include "logic/database/controllers/playlistcontroller.h"

class Initialization
{
public:
    Initialization();
    static void createDatabase();
    static void createTables();
    static void createTypes();

    void test();
};

#endif // INITIALIZATION_H
