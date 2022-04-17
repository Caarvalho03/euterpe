#include "initialization.h"
#include "../viniciusql/viniciusql.h""

Initialization::Initialization()
{

}

void Initialization::createDatabase()
{
    Database::createConnection();
}
