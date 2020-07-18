Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A299D224D97
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Jul 2020 21:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgGRTYc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Jul 2020 15:24:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50118 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726837AbgGRTYc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Jul 2020 15:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595100270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u6ND5MXNI3pG9DIwaU62hTv7ycSOCT4u+y0Yy4U0d3Q=;
        b=PQcIEmy3sGFnKM6gxlUmYa6pX/vijD9uwlmTNqBnwhBwXqwUq8anpl3ShGLsTVhq2oiruW
        1ImhV/IDq+D8PUFGbNOP8POHoguwhg/6/FeaUo0Os6xxhAO5nz7ZDxHRnRjOsgz0OJoefV
        mgGwp2vLPza8lOW5YnIXzq6YevtLJxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-sEQ4OMhIPpK3vZmIDfDdtA-1; Sat, 18 Jul 2020 15:24:28 -0400
X-MC-Unique: sEQ4OMhIPpK3vZmIDfDdtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA9E1800D42;
        Sat, 18 Jul 2020 19:24:27 +0000 (UTC)
Received: from starship (unknown [10.35.206.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D96BC75573;
        Sat, 18 Jul 2020 19:24:25 +0000 (UTC)
Message-ID: <e73f817c5274789d7aa59080455cf24b62acf50a.camel@redhat.com>
Subject: Re: [PATCH v3 6/7] kconfig: qconf: don't show goback button on
 splitMode
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 18 Jul 2020 22:24:24 +0300
In-Reply-To: <d0a5ad7ddf090ff50aa486d874a8e5ab3840ea11.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
         <d0a5ad7ddf090ff50aa486d874a8e5ab3840ea11.1593498345.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2020-06-30 at 08:26 +0200, Mauro Carvalho Chehab wrote:
> the goback button does nothing on splitMode. So, why display
> it?
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kconfig/qconf.cc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index e43fe4dcd4e7..6a327b69ff5f 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
>  	if (rootEntry != &rootmenu && (mode == singleMode ||
>  	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
>  		item = (ConfigItem *)topLevelItem(0);
> -		if (!item)
> +		if (!item && mode != symbolMode) {
>  			item = new ConfigItem(this, 0, true);
> -		last = item;
> +			last = item;
> +		}
>  	}
>  	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
>  	    rootEntry->sym && rootEntry->prompt) {

I finally found some time to debug this.

This patch make xconfig crash when you try to select a menu that opens a submenu.

This is the backtrace:

#0  0x000000000041d196 in ConfigItem::testUpdateMenu(bool) ()
#1  0x000000000041e2f8 in ConfigList::updateList(ConfigItem*) ()
#2  0x0000000000420e3a in ConfigList::setRootMenu(menu*) ()
#3  0x00007ffff7
0f1fb0 in void doActivate<false>(QObject*, int, void**) () at /lib64/libQt5Core.so.5
#4  0x000000000041bd22 in ConfigList::menuSelected(menu*) ()
#5  0x0000000000425eb0 in
ConfigList::mouseDoubleClickEvent(QMouseEvent*) ()
#6  0x00007ffff7a9fcd1 in QWidget::event(QEvent*) () at /lib64/libQt5Widgets.so.5
#7  0x00007ffff7b483b2 in QFrame::event(QEvent*) () at
/lib64/libQt5Widgets.so.5
#8  0x00007ffff70c2d2e in QCoreApplicationPrivate::sendThroughObjectEventFilters(QObject*, QEvent*) () at /lib64/libQt5Core.so.5
#9  0x00007ffff7a5e052 in
QApplicationPrivate::notify_helper(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#10 0x00007ffff7a63891 in QApplication::notify(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#11
0x00007ffff70c2fc0 in QCoreApplication::notifyInternal2(QObject*, QEvent*) () at /lib64/libQt5Core.so.5
#12 0x00007ffff7a6278a in QApplicationPrivate::sendMouseEvent(QWidget*, QMouseEvent*, QWidget*,
QWidget*, QWidget**, QPointer<QWidget>&, bool, bool) ()
    at /lib64/libQt5Widgets.so.5
#13 0x00007ffff7ab7f82 in QWidgetWindow::handleMouseEvent(QMouseEvent*) () at /lib64/libQt5Widgets.so.5
#14
0x00007ffff7abadde in QWidgetWindow::event(QEvent*) () at /lib64/libQt5Widgets.so.5
#15 0x00007ffff7a5e063 in QApplicationPrivate::notify_helper(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#16
0x00007ffff70c2fc0 in QCoreApplication::notifyInternal2(QObject*, QEvent*) () at /lib64/libQt5Core.so.5
#17 0x00007ffff74a7142 in
QGuiApplicationPrivate::processMouseEvent(QWindowSystemInterfacePrivate::MouseEvent*) () at /lib64/libQt5Gui.so.5
#18 0x00007ffff748915b in
QWindowSystemInterface::sendWindowSystemEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at /lib64/libQt5Gui.so.5
#19 0x00007fffe6ecdc9e in xcbSourceDispatch(_GSource*, int (*)(void*), void*) () at
/lib64/libQt5XcbQpa.so.5
#20 0x00007ffff605b7af in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#21 0x00007ffff605bb38 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
#22
0x00007ffff605bc03 in g_main_context_iteration () at /lib64/libglib-2.0.so.0
#23 0x00007ffff710eb73 in QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at
/lib64/libQt5Core.so.5
#24 0x00007ffff70c191b in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at /lib64/libQt5Core.so.5
#25 0x00007ffff70c95a6 in QCoreApplication::exec() () at
/lib64/libQt5Core.so.5
#26 0x000000000040e553 in main ()




For example:
'Input device support'->'Keyboards'

Maybe we shoudld just revert it? I tried to understand the code a little bit,
but no luck yet to understand how the whole thing works.

Best regards,
	Maxim Levitsky


