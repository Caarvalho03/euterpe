#include "initialization.h"

Initialization::Initialization()
{

}

void Initialization::createDatabase()
{
    Database::createConnection();
}
