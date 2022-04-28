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
    Playlist(QString name, QString pathImage, int id=0);
    Playlist(QVariantMap map);

    //CRUD
    bool save();
    bool update();
    bool destroy();

    //Conversions
    QVariantMap toMap();
    void fromMap(QVariantMap);

    static QString pathFromByteArray(QByteArray data);
    static QByteArray byteArrayFromPath(QString path);

    //Search
    static QVariantList getAll(QStringList columns);
    static QVariantList getByProperty(QStringList columns, QString property, QVariant value);

    //Table
    static bool createTable();
    static bool dropTable();
    static bool clearTable();

    //Gettes e Setters
    int getId() const;
    void setId(int newId);
    const QString &getName() const;
    void setName(const QString &newName);
    const QString &getPathImage() const;
    void setPathImage(const QString &newPathImage);
    int getPlayed() const;
    int getQuantity_musics() const;
};

#endif // PLAYLIST_H
