#include "playlistcontroller.h"

PlaylistController::PlaylistController(QObject *parent)
    : QObject{parent}
{

}

bool PlaylistController::save(QVariantMap map)
{
    Playlist playlist(map);
    return playlist.save();
}

bool PlaylistController::update(QVariantMap map)
{
    Playlist playlist(map);
    return playlist.update();
}

bool PlaylistController::destroy(QVariantMap map)
{
    Playlist playlist(map);
    return playlist.destroy();
}

QVariantList PlaylistController::getAll(QStringList columns)
{
    return Playlist::getAll(columns);
}
QVariantList PlaylistController::getByProperty(QStringList columns, QString property, QVariant value)
{
    return Playlist::getByProperty(columns, property, value);
}
