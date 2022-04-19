#ifndef PLAYLISTCONTROLLER_H
#define PLAYLISTCONTROLLER_H

#include <QObject>
#include "../models/playlist.h"

class PlaylistController : public QObject
{
    Q_OBJECT
public:
    explicit PlaylistController(QObject *parent = nullptr);
    //CRUD
    Q_INVOKABLE bool save(QVariantMap map);
    Q_INVOKABLE bool update(QVariantMap map);
    Q_INVOKABLE bool destroy(QVariantMap map);
    Q_INVOKABLE QVariantList getAll(QStringList columns);
    Q_INVOKABLE QVariantList getByProperty(QStringList columns, QString property, QVariant value);

signals:
    void refresh();


};

#endif // PLAYLISTCONTROLLER_H
