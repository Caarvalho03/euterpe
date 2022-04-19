#include "initialization.h"


Initialization::Initialization()
{

}

void Initialization::createDatabase()
{
    Database::createConnection();
}

void Initialization::createTables()
{
    Playlist::createTable();
}

void Initialization::createTypes()
{
    qmlRegisterType<PlaylistController>("Source", 1, 0, "PlaylistController");

}