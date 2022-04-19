import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15
import Source 1.0
import '../dialogs'

Item {
    id:playlistPage

    QtObject{
        id:internal
        function fillPlaylistsList(){
            var items = controller.getAll(["id","name","pathImage"])
            playlistsModel.clear()
            playlistsModel.append({"noPlaylist":"noPlaylist"})
            items.forEach(obj => {playlistsModel.append(obj)})

        }
    }

    PlaylistRegistrationDialog{
        id:playlistRegistrationDialog
        parent: routes.parent
        anchors{
            centerIn: parent
        }
    }

    ListModel{
        id:playlistsModel
    }

    ListModel{
        id:moreListenedPlaylistModel
    }

    PlaylistController{
        id:controller
    }

    Component.onCompleted:{
        internal.fillPlaylistsList()
    }

    Rectangle{
        id:background
        anchors.fill: parent
        Text{
            id:playlistListLabel
            text: qsTr("SUAS PLAYLISTS")
            font{
                pixelSize: 25
                family: openSans.name
            }
            anchors{
                left: playlistList.left
                bottom: playlistList.top
                bottomMargin: 5
            }
        }
        ListView{
            id:playlistList
            spacing:20
            width: 1317
            height: 345
            orientation: ListView.Horizontal
            clip:true
            boundsBehavior:Flickable.StopAtBounds
            model:playlistsModel
            delegate: Loader{
                source: { if(index !== 0)
                        return "qrc:/view/components/playlistCard.qml"
                    return "qrc:/view/components/noPlaylistCard.qml" }
                onLoaded: {
                    if(index !== 0)
                        item.internal.load(playlistsModel.get(index).id, playlistsModel.get(index).pathImage, playlistsModel.get(index).name)}
            }
            anchors{
                top: parent.top
                left: parent.left
                leftMargin: 21
                topMargin: 60
            }
        }

        Text{
            id:moreListenedPlaylistListLabel
            text: qsTr("MAIS OUVIDAS")
            font{
                pixelSize: 25
                family: openSans.name
            }
            anchors{
                left: moreListenedPlaylistList.left
                bottom: moreListenedPlaylistList.top
                bottomMargin: 5
            }
        }
        ListView{
            id:moreListenedPlaylistList
            spacing:20
            width: 1317
            height: 345
            orientation: ListView.Horizontal
            clip:true
            boundsBehavior:Flickable.StopAtBounds
            model:moreListenedPlaylistModel
            delegate: Loader{
                source: "qrc:/view/components/playlistCard.qml"
            }
            anchors{
                top: playlistList.bottom
                left: parent.left
                leftMargin: 21
                topMargin: 60
            }
        }

    }

}
