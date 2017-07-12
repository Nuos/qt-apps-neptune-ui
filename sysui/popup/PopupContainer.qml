/****************************************************************************
**
** Copyright (C) 2017 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.6
import QtQuick.Controls 2.0
import utils 1.0
import controls 1.0
import models.popup 1.0

MouseArea {
    id: root

    width: Style.hspan(8)
    height: Style.vspan(6)

    visible: opacity > 0

    scale: PopupModel.popupVisible ? 1 : 0
    Behavior on scale { NumberAnimation { duration: 200 } }

    opacity: PopupModel.popupVisible ? 1 : 0
    Behavior on opacity { NumberAnimation { duration: 200 } }

    property int timeout: 0
    property bool contentAvailable: root.popupContent !== undefined

    property var popupContent: PopupModel.currentPopup.summary
    property var popupBody: PopupModel.currentPopup.body
    property real progressValue: PopupModel.currentPopup.progressValue
    property var buttonsModel: PopupModel.buttonModel

    Rectangle {
        anchors.fill: parent
        color: '#000'
        opacity: 0.85
    }

    PopupHeader {
        id: popupHeader
        width: root.width
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        title: root.contentAvailable && root.popupBody !== undefined && root.popupBody.title !== undefined ? root.popupBody.title : ""
        subtitle: root.contentAvailable && root.popupBody !== undefined && root.popupBody.subtitle !== undefined ? root.popupBody.subtitle : ""
    }

    Label {
        id: body

        width: parent.width
        height: paintedHeight
        anchors.top: popupHeader.bottom
        anchors.topMargin: 10
        font.pixelSize: Style.fontSizeM
        text: root.contentAvailable && root.popupContent !== undefined ? root.popupContent.toString() : ""
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        wrapMode: Text.WordWrap
    }

    ProgressBar {
        id: progressBar

        width: parent.width - Style.screenMargin
        height: 50
        anchors.top: body.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        visible: root.progressValue > 0.0

        opacity: visible ? 1.0 : 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }

        from: 0
        to: 100
        value: root.contentAvailable && root.popupContent !== undefined ? root.progressValue : ""
    }

    PopupFooter {
        id: buttonsRow

        popupWidth: root.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        model: root.buttonsModel

        onButtonClicked: PopupModel.buttonPressed(buttonIndex)
    }
}
