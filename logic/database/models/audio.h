#ifndef AUDIO_H
#define AUDIO_H
#include <QString>
#include <QVariantMap>


class Audio
{
private:

    //Attributes
    int id;
    QString name;
    QString pathAudio;
    int playlistId;

public:
    Audio(QVariantMap map);
    Audio(QString name, QString pathAudio, int playlistId, int id=0);

};

#endif // AUDIO_H
