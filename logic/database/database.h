#ifndef DATABASE_H
#define DATABASE_H
#include <QSqlDatabase>
#include <QSqlQuery>

class Database
{
public:
    Database();
    static void createConnection();
};

#endif // DATABASE_H
