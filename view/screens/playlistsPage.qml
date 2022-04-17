import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
    id:playlistPage

    ListModel{
        id:moreListenedPlaylistModel
    }

    ListModel{
        id:suggestionsPlaylistModel
    }

    Component.onCompleted:{
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
//        moreListenedPlaylistModel.append({"color":"red"})
    }

    Rectangle{
        id:background
        anchors.fill: parent
        Text{
            id:moreListenedPlaylistListLabel
            text: qsTr("SUAS PLAYLISTS")
            font{
                pixelSize: 25
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
                top: parent.top
                left: parent.left
                leftMargin: 21
                topMargin: 60
            }
        }

        Text{
            id:suggestionsPlaylistListLabel
            text: qsTr("MAIS OUVIDAS")
            font{
                pixelSize: 25
            }
            anchors{
                left: suggestionsPlaylistList.left
                bottom: suggestionsPlaylistList.top
                bottomMargin: 5
            }
        }
        ListView{
            id:suggestionsPlaylistList
            spacing:20
            width: 1317
            height: 345
            orientation: ListView.Horizontal
            clip:true
            boundsBehavior:Flickable.StopAtBounds
            model:suggestionsPlaylistModel
            delegate: Loader{
                source: "qrc:/view/components/playlistCard.qml"
            }
            anchors{
                top: moreListenedPlaylistList.bottom
                left: parent.left
                leftMargin: 21
                topMargin: 60
            }
        }

    }

}
