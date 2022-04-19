#include "playlist.h"

QString Playlist::table_name = "playlist";
Viniciusql Playlist::table = Viniciusql(table_name);

Playlist::Playlist(QString name, QString pathImage, int id)
{
    this->name = name;
    this->pathImage = pathImage;
    this->played = 0;
    this->quantity_musics = 0;
    this->id = id;
}

Playlist::Playlist(QVariantMap map)
{
    this->name = map.count("name")? map.value("name").toString() : "";
    this->pathImage = map.count("pathImage")? map.value("pathImage").toString() : "";
    this->id =  map.count("id")? map.value("id").toInt() : 0;
    this->played = 0;
    this->quantity_musics = 0;
}

bool Playlist::save()
{
    return table.insert(this->toMap())->finish();
}

bool Playlist::update()
{
    return table.update(this->toMap())->equals("id", this->id)->finish();
}

bool Playlist::destroy()
{
    return table.destroy()->equals("id", this->id)->finish();
}

QVariantMap Playlist::toMap()
{
    QVariantMap map;
    map.insert("name", this->name);
    map.insert("pathImage", byteArrayFromPath(this->pathImage));
    map.insert("played", this->played);
    map.insert("quantity_musics", this->quantity_musics);
    return map;
}

void Playlist::fromMap(QVariantMap map)
{
    this->name = map.value("name").toString();
    this->pathImage = pathFromByteArray(map.value("pathIamge").toByteArray());
    this->played = map.value("player").toInt();
    this->quantity_musics = map.value("quantity_musics").toInt();
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

QList<QVariantMap> Playlist::getAll(QStringList columns)
{
    return table.select(columns)->finishSelect();
}

QList<QVariantMap> Playlist::getByProperty(QStringList columns, QString property, QVariant value)
{
    return table.select(columns)->equals(property, value)->finishSelect();
}

bool Playlist::createTable()
{
    table.setSql(QString("create table if not exists %1("
                         "id integer primary key autoincrement,"
                         "name text not null,"
                         "pathImage blob not null,"
                         "played integer not null,"
                         "quantity_musics integer not null"
                         ")").arg(table_name));
    return table.finish();

}


