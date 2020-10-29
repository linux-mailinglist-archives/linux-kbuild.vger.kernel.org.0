Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42CF29EEBE
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 15:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgJ2OuV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 10:50:21 -0400
Received: from codesynthesis.com ([142.44.161.217]:46462 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgJ2OuV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 10:50:21 -0400
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 6B59B5F6C2;
        Thu, 29 Oct 2020 14:50:19 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 16C721A800C4; Thu, 29 Oct 2020 16:50:14 +0200 (SAST)
Date:   Thu, 29 Oct 2020 16:50:14 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     linux-kbuild@vger.kernel.org
Subject: kconfig: qconf: SIGSEGV when clicking outside edit area
Message-ID: <boris.20201029163302@codesynthesis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

After the recent qconf interface changes I've stumbled on SIGSEGV
when clicking anywhere outside an active edit area. To reproduce,
try to create a new configuration and edit a non-boot/tristate
option (int in my case) with a default value. Then, while having
the edit box active, click anywhere outside it.

The stack trace I get is as follows. This is with Qt 5.5.1. Let
me know if you need any other information.

#0  0x0000000000000018 in ?? ()
#1  0x00007f93094cfb06 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#2  0x00007f93094e97e4 in QStyledItemDelegate::setModelData(QWidget*, QAbstractItemModel*, QModelIndex const&) const () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#3  0x000000000040d343 in ConfigItemDelegate::setModelData (this=0xae42f0, editor=0xbf4140, model=0x8785f0, index=...) at /home/boris/work/build2/packaging/kconfig/kconfig/kconfig-qconf/qconf.cc:295
#4  0x00007f93094613ca in QAbstractItemView::commitData(QWidget*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#5  0x00007f9309461bc0 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#6  0x00007f9309f2fc0a in QMetaObject::activate(QObject*, int, int, void**) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f93094aad7f in QAbstractItemDelegate::commitData(QWidget*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#8  0x00007f93094ab514 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#9  0x00007f9309f01052 in QCoreApplicationPrivate::sendThroughObjectEventFilters(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#10 0x00007f930920103c in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#11 0x00007f9309206516 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#12 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#13 0x00007f9309204039 in QApplicationPrivate::setFocusWidget(QWidget*, Qt::FocusReason) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#14 0x00007f930923e72d in QWidget::setFocus(Qt::FocusReason) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#15 0x00007f93091fd9cc in QApplicationPrivate::giveFocusAccordingToFocusPolicy(QWidget*, QEvent*, QPoint) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#16 0x00007f9309208431 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#17 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#18 0x00007f9309205b32 in QApplicationPrivate::sendMouseEvent(QWidget*, QMouseEvent*, QWidget*, QWidget*, QWidget**, QPointer<QWidget>&, bool) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#19 0x00007f930925e5bb in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#20 0x00007f9309260b7b in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#21 0x00007f930920105c in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#22 0x00007f9309206516 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#23 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#24 0x00007f93098254e1 in QGuiApplicationPrivate::processMouseEvent(QWindowSystemInterfacePrivate::MouseEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#25 0x00007f93098271a5 in QGuiApplicationPrivate::processWindowSystemEvent(QWindowSystemInterfacePrivate::WindowSystemEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#26 0x00007f930980af08 in QWindowSystemInterface::sendWindowSystemEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#27 0x00007f930a290200 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#28 0x00007f93071a0197 in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#29 0x00007f93071a03f0 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#30 0x00007f93071a049c in g_main_context_iteration () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#31 0x00007f9309f576af in QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#32 0x00007f9309efea2a in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#33 0x00007f9309f06acc in QCoreApplication::exec() () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#34 0x0000000000417102 in main (ac=3, av=0x7ffe4121eb08) at /home/boris/work/build2/packaging/kconfig/kconfig/kconfig-qconf/qconf.cc:1904
