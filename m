Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7541F183E4
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 04:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfEICqw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 May 2019 22:46:52 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:56164 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfEICqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 22:46:52 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x492kmTZ029459;
        Thu, 9 May 2019 11:46:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x492kmTZ029459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557370008;
        bh=uXy5/UiF1swtqsJpsUwHRe7piBDRUoPRSI7xFniuH6U=;
        h=From:To:Cc:Subject:Date:From;
        b=S5VIpydnPuNFN6DfgFSYIuD6AtDVXoJEEbGGJftN/4BitKZ/vdvKKAB2I8jPALNih
         15PdRmWmQFtSOor4uUPT4h8o5OE7kq/OpK2A8v7OHL1831PloMLLHFPNCfNOoW1Tyn
         WjHQ55B/bzhbHFwrPNem612aqz5E3+WfKiCwhyXzF5pqg0bObz2sPdPynWCGhcXw94
         anLS4SGcd7RX1zstzYJtWDvRiPeuTz6V3PR7IHwHI1IzW7xrZQG7Ns+PT+TvKU8kyi
         f2zrTZt9H2QNwt7COY1/6SzObVkGkSRMD2Rjvyzeb4Ytn1FKdACqgRymzq/S2aZ6n1
         WEOpxoj/fXv9Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: remove trailing whitespaces
Date:   Thu,  9 May 2019 11:46:31 +0900
Message-Id: <20190509024631.14406-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are still some trailing whitespaces under scripts/kconfig/tests/,
but they must be kept. Otherwise, "make testconfig" would break.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/gconf.c                  | 2 +-
 scripts/kconfig/lxdialog/BIG.FAT.WARNING | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5d4ecf309ee4..e36b342f1065 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -638,7 +638,7 @@ on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
-	const gchar *intro_text = 
+	const gchar *intro_text =
 	    "Welcome to gkc, the GTK+ graphical configuration tool\n"
 	    "For each option, a blank box indicates the feature is disabled, a\n"
 	    "check indicates it is enabled, and a dot indicates that it is to\n"
diff --git a/scripts/kconfig/lxdialog/BIG.FAT.WARNING b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
index a8999d82bdb3..7cb5a7ec93d2 100644
--- a/scripts/kconfig/lxdialog/BIG.FAT.WARNING
+++ b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
@@ -1,4 +1,4 @@
 This is NOT the official version of dialog.  This version has been
 significantly modified from the original.  It is for use by the Linux
-kernel configuration script.  Please do not bother Savio Lam with 
+kernel configuration script.  Please do not bother Savio Lam with
 questions about this program.
-- 
2.17.1

