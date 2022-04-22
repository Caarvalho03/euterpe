import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15
import Source 1.0
import '../dialogs'

Item {
    id:playlistPage
    property var playlistModel:[]
    property int contador:1
    focus:true

    Component.onCompleted:{
        internal.fillPlaylistsList()
        //playlistRegistrationDialog.open()
    }

    QtObject{
        id:internal
        function fillPlaylistsList(){
            var items = controller.getAll(["id","name","pathImage"])
            playlistPage.playlistModel = []
            playlistPage.playlistModel.push({"noPlaylist":"noPlaylist", "position":0})
            items.forEach(obj => {
                              obj.position = contador
                              playlistPage.playlistModel.push(obj)
                              contador++
                          })
            playlistList.model = playlistPage.playlistModel
        }
        function openDialog(){
            playlistRegistrationDialog.internal._open()
        }

        function newPlaylist(obj){
            controller.save(obj)
        }

        function updatePlaylist(obj, id){

        }

        function deletePlaylist(obj){
            console.log(controller.remove(obj))
        }
    }

    PlaylistController{
        id:controller
    }

    ListModel{
        id:playlistsModel
    }

    ListModel{
        id:moreListenedPlaylistModel
    }

    Connections{
        target: controller
        function onRefresh(){
            console.log("refresh")
            internal.fillPlaylistsList()
        }
    }

    Rectangle{
        id:background
        anchors.fill: parent
        color:"transparent"
        Text{
            id:playlistListLabel
            text: qsTr("SUAS PLAYLISTS")
            color:mainColor
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
            boundsBehavior:Flickable.StopAtBounds
            clip:true
            delegate: Loader{
                source: {if(modelData.position !== 0)
                        return "qrc:/view/components/playlistCard.qml"
                    return "qrc:/view/components/noPlaylistCard.qml" }
                onLoaded: {
                    if(modelData.position !== 0){
                        item.internal.load(modelData.id,modelData.pathImage, modelData.name)
                        item.deleteCard.connect(internal.deletePlaylist)
                    }
                    else
                        item.openDialog.connect(internal.openDialog)
                }
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
            color:mainColor
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
            clip:true
            orientation: ListView.Horizontal
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
    PlaylistRegistrationDialog{
        id:playlistRegistrationDialog
        parent: routes.parent
        anchors{
            centerIn: parent
        }
        onNewPlaylist: function(playlist){
            internal.newPlaylist(playlist)
        }
    }
}
