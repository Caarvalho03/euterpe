#ifndef PLAYLIST_H
#define PLAYLIST_H

#include <QString>
#include <QByteArray>
#include <QFile>
#include <QUrl>
#include <QDebug>
#include "../viniciusql/viniciusql.h"


class Playlist
{
private:
    //Atributtes
    int id;
    QString name;
    QString pathImage;
    int played;
    int quantity_musics;

    //Entity DB
    static Viniciusql table;
    static QString table_name;

public:
    //Constructors
    Playlist(QString name, QString pathImage);
    Playlist(QVariantMap map);

    //CRUD
    int save();
    bool update();
    bool destroy();

    //Conversions
    QVariantMap toMap();
    void fromMap(QVariantMap);

    static QString pathFromByteArray(QByteArray data);
    static QByteArray byteArrayFromPath(QString path);

    //Table
    static bool createTable();
    static bool dropTable();
    static bool clearTable();





};

#endif // PLAYLIST_H
