import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.1
import '../components'

Dialog {
    id:dialog
    modal:true
    closePolicy: Popup.NoAutoClose
    height:480
    width: 400

    property alias internal:internal
    property bool editingMode:false

    property string editableFileUrl

    property var playlist: {
        "id": 0,
        "name": "",
        "pathImage": ""
    }

    signal newPlaylist(var obj)
    signal updatePlaylist(var obj)

    QtObject{
        id:internal
        function fullImage(){
            colorOverlay.visible = false
            imageField.anchors.fill = imageField.parent
        }

        function setImage(url){
            editableFileUrl = url
            imageField.source = editableFileUrl
        }

        function defaultImage(){
            imageField.anchors.fill = undefined
            imageField.height = 50
            imageField.width = 50
            imageField.anchors.centerIn = imageField.parent
            imageField.source = "qrc:/view/assets/images/image.svg"
        }

        function _open(){
            console.log(fileDialog.fileUrl)
            dialog.open()
            background.state = "open"
        }

        function fillForm(){
            playlistTitleField.text = playlist.name
            imageField.source = ""
            internal.fullImage()
            imageField.source = playlist.pathImage
        }

        function openEditMode(obj){
            playlist  = obj
            dialog.editingMode = true
            fillForm()
            _open()
        }

        function _close(){
            background.state = "close"
            closeTimer.start()

        }
        function fillObject(){
            removeWarningText()
            if(playlistTitleField.text != "")
                playlist.name = playlistTitleField.text
            else
                setWarningText(" Título inválido")
            if(imageField.source != "qrc:/view/assets/images/image.svg")
                playlist.pathImage = editableFileUrl
            else
                setWarningText(" \nImagem inválida ")
            console.log("name " + playlist.name !== "")
            console.log("imagepath " + playlist.pathImage !== "")
            if(playlistTitleField.text !== "" && imageField.source != "qrc:/view/assets/images/image.svg"){
                if(editingMode)
                    updatePlaylist(playlist)
                else
                    newPlaylist(playlist)
                internal._close()
            }
        }

        function clearObject(){
            playlist.id = 0
            playlist.name = ""
            playlist.pathImage = ""
            playlist.played = 0
            playlist.quantity_musics = 0
        }

        function setWarningText(text){
            warningText.text += text;
            warningText.visible = true
        }

        function removeWarningText(){
            warningText.text = ""
            warningText.visible = false
        }

        function resetForm(){
            editingMode = false
            colorOverlay.visible = true
            playlistTitleField.text = ""
            editableFileUrl = ""
            defaultImage()
            removeWarningText()
            clearObject()
        }
    }

    Timer{
        id:closeTimer
        interval: 250
        onTriggered: {internal.resetForm(); dialog.close();}
    }

    background: Rectangle{
        id:background
        width: 300
        height: 300
        state: "close"
        states:[
            State{
                name:"open"
                PropertyChanges{
                    target: background
                    width:400
                    height:480
                }
                PropertyChanges {
                    target: itemBackground
                    opacity:1
                }
            },
            State{
                name:"close"
                PropertyChanges {
                    target: itemBackground
                    opacity:0
                }
                PropertyChanges{
                    target: background
                    width:0
                    height:0
                }
            }
        ]

        transitions: [
            Transition {
                from: "close"
                to: "open"
                SequentialAnimation{
                    NumberAnimation{
                        target: background
                        duration: 100
                        properties: "height, width"
                        easing.type: Easing.Linear
                    }
                    NumberAnimation{
                        target: itemBackground
                        duration: 500
                        properties:"opacity"
                        easing.type: Easing.Linear
                    }
                }
            },
            Transition {
                from: "open"
                to: "close"
                SequentialAnimation{
                    NumberAnimation{
                        target: itemBackground
                        duration: 150
                        properties:"opacity"
                        easing.type: Easing.Linear
                    }
                    NumberAnimation{
                        target: background
                        duration: 100
                        properties: "height, width"
                        easing.type: Easing.Linear
                    }

                }
            }
        ]
        anchors.centerIn: parent
        gradient: Gradient{
            GradientStop{position:0.2 ; color: grayGradientColor}
            GradientStop{position:1.0 ; color: secondColor}
        }
        radius:10
    }
    Item{
        id:itemBackground
        opacity: 0
        anchors.fill: parent
        Image{
            id:closeImage
            width: 35
            height: 35
            source: "qrc:/view/assets/images/close_rounded.svg"
            anchors{
                top: parent.top
                right: parent.right
                topMargin: 0
                rightMargin: 0
            }
            ColorOverlay{
                source: parent
                anchors.fill: parent
                color: mainColor
            }
            MouseArea{
                id:closeArea
                anchors.fill: parent
                onClicked: {internal._close(); internal.resetForm()}
            }
        }

        V_TextField{
            id:playlistTitleField
            labelText: qsTr("Título")
            anchors{
                top: parent.top
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle{
            id:imageContainer
            height: 213
            width: 345
            color: "transparent"
            radius:10
            border{
                color:mainColor
                width: 2
            }
            anchors{
                top: playlistTitleField.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            Image{
                id:imageField
                width: 50
                height: 50
                anchors.centerIn:parent
                fillMode: Image.Stretch
                source: "qrc:/view/assets/images/image.svg"
                ColorOverlay{
                    id:colorOverlay
                    anchors.fill: parent
                    source: parent
                    color: mainColor
                }
            }

            MouseArea{
                id:imageArea
                anchors.fill: parent
                onClicked: fileDialog.open()
            }
        }

        V_Button{
            id:submitButton
            height: 40
            width:100
            buttonText: editingMode?  qsTr("EDITAR "):qsTr("SALVAR")
            anchors{
                top: imageContainer.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            onClicked: internal.fillObject()
        }
        Text{
            id:warningText
            visible: false
            color: mainColor
            anchors{
                bottom: parent.bottom
                bottomMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
            font{
                pixelSize: 15
                family: openSans.name
            }
        }
        FileDialog{
            id:fileDialog
            folder: shortcuts.pictures
            nameFilters: ["*.png *.jfif *.jpg"]
            onAccepted: {
                internal.setImage(fileUrl)
                internal.fullImage()
            }
        }
    }
}
