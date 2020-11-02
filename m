Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474252A2339
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 04:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgKBDIC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 1 Nov 2020 22:08:02 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52632 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgKBDIC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Nov 2020 22:08:02 -0500
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0A237lsd025128
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Nov 2020 12:07:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0A237lsd025128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604286467;
        bh=tk3bHSvM0txcdQYPPU7LSmv+h9wFjy4NsryCHHSeXWk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wUgpGSNNeVk08vM1CCtl9DtMFmLAcLfx4kZkfIf4Qqtbv4niHCqdeuwWyMUMt1MXL
         kxONnZRYoLQ7ejFR1pWu399pFhpHfDvRMOhZNWIi3X8J/JVIzbVd8pIBcwx1GR49Wq
         rxS6hq5lUCmK0p+NsoHRon9ey7ue0l3XKj2yEsfM02aQF4Mj/eGxHXPmhe0khKTXEV
         traLX58kfQhoy5PcvXTZLpowf8LQ+xo5FYqOTlCEID95Nn2KhcJTRh8sGkaIvBfPXJ
         lD+qH9Qtq/MghXDbUNiVOqx/mgKN28ILxQhI2DcdprC0SQ/eJKm409na4OZGCatuDd
         IQnrawP7Slbcg==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id p17so6117097pli.13
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2020 19:07:47 -0800 (PST)
X-Gm-Message-State: AOAM531cnlmyM8ZMh7VyF3WZAj/x3Ldf44bwltg1ikw+s6ReubqdNJb5
        WRQLz/NNvv6tiXH2qntXXU5nY65Y1wF5BdGKraU=
X-Google-Smtp-Source: ABdhPJy2xzLu5qxwyKtr1Xz8XzAH1DE640dz0T68sOPOL4EBntl8CHTEo6MUUhcfRx/eSfSO3I+shVAG1tOTNDDhlYA=
X-Received: by 2002:a17:902:c40f:b029:d6:16b5:4de with SMTP id
 k15-20020a170902c40fb02900d616b504demr18393475plk.1.1604286466625; Sun, 01
 Nov 2020 19:07:46 -0800 (PST)
MIME-Version: 1.0
References: <boris.20201029163302@codesynthesis.com>
In-Reply-To: <boris.20201029163302@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 12:07:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6-MNVJ-n63cqrwn89xYaRnAnbgV46ExgqS-VghYaTdQ@mail.gmail.com>
Message-ID: <CAK7LNAQ6-MNVJ-n63cqrwn89xYaRnAnbgV46ExgqS-VghYaTdQ@mail.gmail.com>
Subject: Re: kconfig: qconf: SIGSEGV when clicking outside edit area
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 29, 2020 at 11:50 PM Boris Kolpackov
<boris@codesynthesis.com> wrote:
>
> After the recent qconf interface changes I've stumbled on SIGSEGV
> when clicking anywhere outside an active edit area. To reproduce,
> try to create a new configuration and edit a non-boot/tristate
> option (int in my case) with a default value. Then, while having
> the edit box active, click anywhere outside it.


I cannot reproduce this problem.


For example,

I visited "General setup" -> "Default hostname".

I double-clicked "(none)", then
the edit box was activated.

I clicked outside of the edit box,
and the edit box got deactivated.
I saw no problem.




> The stack trace I get is as follows. This is with Qt 5.5.1. Let
> me know if you need any other information.


My Qt version 5.12.8


>
> #0  0x0000000000000018 in ?? ()
> #1  0x00007f93094cfb06 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #2  0x00007f93094e97e4 in QStyledItemDelegate::setModelData(QWidget*, QAbstractItemModel*, QModelIndex const&) const () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #3  0x000000000040d343 in ConfigItemDelegate::setModelData (this=0xae42f0, editor=0xbf4140, model=0x8785f0, index=...) at /home/boris/work/build2/packaging/kconfig/kconfig/kconfig-qconf/qconf.cc:295
> #4  0x00007f93094613ca in QAbstractItemView::commitData(QWidget*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #5  0x00007f9309461bc0 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #6  0x00007f9309f2fc0a in QMetaObject::activate(QObject*, int, int, void**) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #7  0x00007f93094aad7f in QAbstractItemDelegate::commitData(QWidget*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #8  0x00007f93094ab514 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #9  0x00007f9309f01052 in QCoreApplicationPrivate::sendThroughObjectEventFilters(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #10 0x00007f930920103c in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #11 0x00007f9309206516 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #12 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #13 0x00007f9309204039 in QApplicationPrivate::setFocusWidget(QWidget*, Qt::FocusReason) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #14 0x00007f930923e72d in QWidget::setFocus(Qt::FocusReason) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #15 0x00007f93091fd9cc in QApplicationPrivate::giveFocusAccordingToFocusPolicy(QWidget*, QEvent*, QPoint) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #16 0x00007f9309208431 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #17 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #18 0x00007f9309205b32 in QApplicationPrivate::sendMouseEvent(QWidget*, QMouseEvent*, QWidget*, QWidget*, QWidget**, QPointer<QWidget>&, bool) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #19 0x00007f930925e5bb in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #20 0x00007f9309260b7b in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #21 0x00007f930920105c in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #22 0x00007f9309206516 in QApplication::notify(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
> #23 0x00007f9309f0126b in QCoreApplication::notifyInternal(QObject*, QEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #24 0x00007f93098254e1 in QGuiApplicationPrivate::processMouseEvent(QWindowSystemInterfacePrivate::MouseEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
> #25 0x00007f93098271a5 in QGuiApplicationPrivate::processWindowSystemEvent(QWindowSystemInterfacePrivate::WindowSystemEvent*) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
> #26 0x00007f930980af08 in QWindowSystemInterface::sendWindowSystemEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
> #27 0x00007f930a290200 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
> #28 0x00007f93071a0197 in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #29 0x00007f93071a03f0 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #30 0x00007f93071a049c in g_main_context_iteration () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #31 0x00007f9309f576af in QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #32 0x00007f9309efea2a in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #33 0x00007f9309f06acc in QCoreApplication::exec() () from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
> #34 0x0000000000417102 in main (ac=3, av=0x7ffe4121eb08) at /home/boris/work/build2/packaging/kconfig/kconfig/kconfig-qconf/qconf.cc:1904



-- 
Best Regards
Masahiro Yamada
