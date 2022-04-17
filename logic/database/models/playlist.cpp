#include "playlist.h"

QString Playlist::table_name = "playlist";
Viniciusql Playlist::table = Viniciusql(table_name);

Playlist::Playlist(QString name, QString pathImage)
{
    this->name = name;
    this->pathImage = pathImage;
}

Playlist::Playlist(QVariantMap map)
{
    this->name = map.count("name")? map.value("name").toString() : "";
    this->pathImage = map.count("pathImage")? map.value("pathImage").toString() : "";
}

int Playlist::save()
{
    return table.insert(this->toMap());
}

bool Playlist::update()
{

}

bool Playlist::destroy()
{

}

QVariantMap Playlist::toMap()
{
    QVariantMap map;
    map.insert("name", this->name);
    map.insert("pathImage", byteArrayFromPath(this->pathImage));
    return map;
}

void Playlist::fromMap(QVariantMap map)
{
    this->name = map.value("name").toString();
    this->pathImage = pathFromByteArray(map.value("pathIamge").toByteArray());
}

QString Playlist::pathFromByteArray(QByteArray data)
{
    return "data:image/png;base64," + data.toBase64();
}

QByteArray Playlist::byteArrayFromPath(QString path)
{
    QByteArray data;
    QFile file(QUrl(path).toLocalFile());
    if(file.open(QIODevice::ReadOnly))
        data = file.readAll();
    else
        qDebug() << "Erro ao abrir imagem";
    return data;

}

bool Playlist::createTable()
{
    table.setSql("olá");
}


