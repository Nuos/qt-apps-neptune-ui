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

import controls 1.0
import utils 1.0
import climate 1.0
import statusbar 1.0
import notification 1.0
import popup 1.0
import windowoverview 1.0

import models.system 1.0

Item {
    id: root

    width: 1280
    height: 800

    // Background Elements

    // Content Elements
    StatusBar {
        id: statusBar
    }

    LaunchController {
        id: launcher
        anchors.top: statusBar.bottom
    }

    About {
        id: about
    }

    // Foreground Elements

    ClimateBar {
    }

    Loader {
        id: toolBarMonitorLoader
        width: parent.width
        height: 200
        anchors.bottom: parent.bottom
        active: SystemModel.toolBarMonitorVisible
        source: "dev/ToolBarMonitor.qml"
    }

    WindowOverview {
        id: windowOverview
        anchors.fill: parent
    }

    PopupContainer {
        id: popupContainer
        anchors.centerIn: parent
    }

    NotificationContainer {
        id: notificationContainer
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Loader {
        id: keyboardLoader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "Keyboard.qml"
    }
}
