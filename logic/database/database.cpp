#include "database.h"
#include <QDebug>

Database::Database()
{
}

void Database::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("euterpe.db");
    if(db.open())
        qDebug() << "Sucesso ao abrir banco";
    else
        qDebug() << "Erro ao abrir banco";

}
