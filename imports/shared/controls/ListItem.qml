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
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

import controls 1.0
import utils 1.0

// TODO: Convert to use QQC2 ItemDelegate
// TODO: Convert to use RowLayout
// TODO: Remove this as it is never used
Control {
    id: root

    property alias iconName: image.source
    property alias titleText: titleLabel.text
    property alias iconFit: image.fit

    signal clicked()

    Row {
        anchors.verticalCenter: parent.verticalCenter

        Icon {
            id: image

            width: Style.hspan(2)
            height: Style.vspan(2)
            opacity: 0.6
        }

        Label {
            id: titleLabel

            width: Style.hspan(8); height: Style.vspan(2)
        }

        Icon {
            id: childIndicator

            width: Style.hspan(1); height: Style.vspan(2)
            source: Style.icon("cloud_arrow")
        }
    }

    Divider {
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -5
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
