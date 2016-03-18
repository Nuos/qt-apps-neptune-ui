/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: http://www.qt.io/ or http://www.pelagicore.com/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL3-PELAGICORE$
** Commercial License Usage
** Licensees holding valid commercial Pelagicore Neptune IVI UI
** licenses may use this file in accordance with the commercial license
** agreement provided with the Software or, alternatively, in accordance
** with the terms contained in a written agreement between you and
** Pelagicore. For licensing terms and conditions, contact us at:
** http://www.pelagicore.com.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU General Public License version 3 requirements will be
** met: http://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0
import io.qt.ApplicationManager 1.0

import controls 1.0
import utils 1.0

UIPanel {
    id: root
    hspan: 10
    vspan: 8

    signal showFullscreen()

    scale: area.pressed?0.85:1.0

    QtObject {
        id: musicControl

        property var currentTrack: {}
        property string currentTime: "00:00"
        property string durationTime: "00:00"
        property bool playing: false

        signal previousTrack()
        signal nextTrack()
        signal play()
        signal pause()

        Component.onCompleted: {
            ApplicationManager.registerApplicationInterfaceExtension(musicControl, "com.pelagicore.music.control", {})
        }
    }

    Behavior on scale {
        NumberAnimation {}
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: root.showFullscreen()
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: Style.padding

        Spacer {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: 0

            Spacer {
                width: Style.hspan(0.5)
            }

            ColumnLayout {
                spacing: Style.paddingXS

                Label {
                    vspan: 1
                    Layout.fillWidth: true
                    text: musicControl.currentTrack ? qsTr('%1 / %2').arg(musicControl.currentTrack.artist).arg(musicControl.currentTrack.album) : ""
                    font.pixelSize: Style.fontSizeS
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                }

                Label {
                    Layout.fillWidth: true
                    vspan: 1
                    text: musicControl.currentTrack ? musicControl.currentTrack.track : ""
                    font.pixelSize: Style.fontSizeL
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                }

                Label {
                    Layout.fillWidth: true
                    vspan: 1
                    text: qsTr('%1 / %2').arg(musicControl.currentTime).arg(musicControl.durationTime)
                    font.pixelSize: Style.fontSizeL
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                }
            }

            Spacer {
                width: Style.hspan(0.25)
            }
        }

        RowLayout {
            spacing: Style.hspan(1)

            Tool {
                name: "prev"
                vspan: 2
                Layout.fillWidth: true
                onClicked: musicControl.previousTrack()
            }
            Tool {
                vspan: 2
                Layout.fillWidth: true
                name: "play"
                onClicked: musicControl.play()
                active: musicControl.playing
            }
            Tool {
                vspan: 2
                Layout.fillWidth: true
                name: "pause"
                onClicked: musicControl.pause()
                active: !musicControl.playing
            }
            Tool {
                vspan: 2
                Layout.fillWidth: true
                name: "next"
                onClicked: musicControl.nextTrack()
            }
        }
    }
}
