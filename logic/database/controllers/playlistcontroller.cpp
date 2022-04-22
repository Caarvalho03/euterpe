#include "playlistcontroller.h"

PlaylistController::PlaylistController(QObject *parent)
    : QObject{parent}
{

}

bool PlaylistController::save(QVariantMap map)
{
    Playlist playlist(map);
    if(playlist.save()){
        emit refresh();
        return true;
    }
    return false;
}

bool PlaylistController::update(QVariantMap map)
{
    Playlist playlist(map);
    if (playlist.update()){
        emit refresh();
        return true;
    }
    return false;
}

bool PlaylistController::remove(QVariantMap map)
{
    Playlist playlist(map);
    if(playlist.destroy()){
        emit refresh();
        return true;
    }
    return false;
}

QVariantList PlaylistController::getAll(QStringList columns)
{
    return Playlist::getAll(columns);
}
QVariantList PlaylistController::getByProperty(QStringList columns, QString property, QVariant value)
{
    return Playlist::getByProperty(columns, property, value);
}
