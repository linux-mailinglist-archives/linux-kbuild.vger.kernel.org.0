Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155783633D9
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Apr 2021 07:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhDRFxO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Apr 2021 01:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235936AbhDRFwO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Apr 2021 01:52:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D245AC06174A;
        Sat, 17 Apr 2021 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=p/NuJi5AKfmnzTxNd2xqbqZxuvc4L7oq64az4Y0RjpE=; b=oi7RuUI+KOM8zUgPj+yE3Dmx/n
        aKkgIbJpMAVBzpYUO1V37wHpyPpIm100MgYahhZDRNp3R9/gd5NYxJ+jUWV8z8Bk1Q5ptySXsU48o
        hRSWyDJdzy3AUUPjarkXTaWwDOh/ao+8mDYKVzBTEeCQ9VoI9PEcLXVxdEqZb/E+uYYnIXI8p91EB
        o+t+1Tzqovo5OFDKA9KKCTMcj21tpzdXB6OiktaxR4RFnH0XCqIr+9kK011rBSNzjNrNHTvl6jouG
        dGwKGqiQ2h/6NWGFQYE4ov7irwNEuPeQkTnGmA6dibPsA32Yss9zmVY+cTE805tyk5zPKXXy2KaSW
        Du3GyRhg==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lY0L9-00C6rN-N1; Sun, 18 Apr 2021 05:51:32 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] kconfig: highlight gconfig 'comment' lines with '***'
Date:   Sat, 17 Apr 2021 22:51:22 -0700
Message-Id: <20210418055123.14085-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Mark Kconfig "comment" lines with "*** <commentstring> ***"
so that it is clear that these lines are comments and not some
kconfig item that cannot be modified.

This is helpful in some menus to be able to provide a menu
"sub-heading" for groups of similar config items.

This also makes the comments be presented in a way that is
similar to menuconfig and nconfig.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/kconfig/gconf.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- linux-next-20210416.orig/scripts/kconfig/gconf.c
+++ linux-next-20210416/scripts/kconfig/gconf.c
@@ -1048,8 +1048,13 @@ static gchar **fill_row(struct menu *men
 		g_free(row[i]);
 	bzero(row, sizeof(row));
 
+	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
+
 	row[COL_OPTION] =
-	    g_strdup_printf("%s %s", menu_get_prompt(menu),
+	    g_strdup_printf("%s %s %s %s",
+			    ptype == P_COMMENT ? "***" : "",
+			    menu_get_prompt(menu),
+			    ptype == P_COMMENT ? "***" : "",
 			    sym && !sym_has_value(sym) ? "(NEW)" : "");
 
 	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
@@ -1060,7 +1065,6 @@ static gchar **fill_row(struct menu *men
 	else
 		row[COL_COLOR] = g_strdup("Black");
 
-	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
 	switch (ptype) {
 	case P_MENU:
 		row[COL_PIXBUF] = (gchar *) xpm_menu;
