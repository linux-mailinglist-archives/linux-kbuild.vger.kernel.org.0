Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF923FE17F
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Sep 2021 19:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbhIARya (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Sep 2021 13:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbhIARy3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Sep 2021 13:54:29 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50786C061575;
        Wed,  1 Sep 2021 10:53:32 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o39-20020a05600c512700b002e74638b567so253272wms.2;
        Wed, 01 Sep 2021 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chmdazpsK/ePhDNWEYhOHO7k+euA1jvx99RRVmxt5Xw=;
        b=ev+4Jb3gtl6J2AmbiJlIUA9wzrsPaIHIKYd19RqSAm17eEfhhfuOUNGPv2vZGsx1ok
         GtbnpfsM1iN2nFTrdL/gAGfrn2z8Zz4at1Gw0AT3Zly3XOitdb0WA5ShDaByz8NiDVWE
         uTh6rr4vlMjG5UxSA6HOdtkARHSnaPzpvY4/tdGczOzTdIiiZ352lWixEYtY35+IrUZu
         fnuCpeCqg6KeyCQMTQVc5sVTU46iuugEqj9aL3qKTcZoaCbFXfaL/YlyRJJCiyW6NyF+
         mqQg6NqShRS74lL2E95EGB888efv9kjkdjv01KyZjxC3jg8wriqnl4gckcoW2C2kHsIZ
         W/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chmdazpsK/ePhDNWEYhOHO7k+euA1jvx99RRVmxt5Xw=;
        b=ZibfwSb2AQM/AXXJLUp/Q/9NP9kz8ADxYogAu1isgb4OpVAgu8Meu/oDxuo55uiZV/
         gipTTabTT/wOgQgWD0YygG3HzVZIXvJcGZ3XkpxZ1gAifD1dnTn3nFNah3QGo+yj/06J
         FUwuh23j2kOjBqtS6kvgd+XDjS8av7qNudGGtm3FS3CV1b+o/cg4JOEgtRAmLXMQ1LK3
         DwrE5ElXnaNNBOQtLirwVroAxTrZcfeXf42FAJoF5SRXcBCQ9+m9F+CVjiVYjIwTS9gK
         FSipachGG5WsaXC7LE/fORWNeFY0PWYXgdJT8U9IuCPmXifZOzjrBDhkWrwcnVLmYFBe
         bLdQ==
X-Gm-Message-State: AOAM5309o5oYk08RHg7VHHGo1ndW7Affb6nbhgAKj4Gis+cHER7QKSsz
        Z5TFpSiWiAJa6MJ9x4NNamsKnxfRKZMKfw==
X-Google-Smtp-Source: ABdhPJyEnn3hoRLrt2yqBJOdbjhyXBkwUK5Vp1DdABXWEUtH92aP7JoBC5cPyAElVm/xkKSaJ/C5Tg==
X-Received: by 2002:a05:600c:5102:: with SMTP id o2mr641658wms.104.1630518810946;
        Wed, 01 Sep 2021 10:53:30 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id 138sm258105wmb.7.2021.09.01.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 10:53:30 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
To:     masahiroy@kernel.org
Cc:     arielmarcovitch@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: Create links to main menu items in search
Date:   Wed,  1 Sep 2021 20:53:26 +0300
Message-Id: <20210901175326.568535-1-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When one searches for a main menu item, links aren't created for it like
with the rest of the symbols.

This happens because we trace the item until we get to the rootmenu, but
we don't include it in the path of the item. The rationale was probably
that we don't want to show the main menu in the path of all items,
because it is redundant.

However, when an item has only the rootmenu in its path it should be
included, because this way the user can jump to its location.

In case the item is a direct child of the rootmenu, show it in the
'Location:' section as 'Main Menu'.

This makes the 'if (i > 0)' superfluous because each item with prompt
will have at least one menu in its path.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/kconfig/menu.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 606ba8a63c24..8d7e3b07bf93 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -712,6 +712,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	int i, j;
 	struct menu *submenu[8], *menu, *location = NULL;
 	struct jump_key *jump = NULL;
+	const char *prompt = NULL;
 
 	str_printf(r, "  Prompt: %s\n", prop->text);
 
@@ -735,6 +736,13 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		if (location == NULL && accessible)
 			location = menu;
 	}
+
+	/* If we have only the root menu, show it */
+	if (i == 0) {
+		location = &rootmenu;
+		submenu[i++] = location;
+	}
+
 	if (head && location) {
 		jump = xmalloc(sizeof(struct jump_key));
 
@@ -758,21 +766,25 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		list_add_tail(&jump->entries, head);
 	}
 
-	if (i > 0) {
-		str_printf(r, "  Location:\n");
-		for (j = 4; --i >= 0; j += 2) {
-			menu = submenu[i];
-			if (jump && menu == location)
-				jump->offset = strlen(r->s);
-			str_printf(r, "%*c-> %s", j, ' ',
-				   menu_get_prompt(menu));
-			if (menu->sym) {
-				str_printf(r, " (%s [=%s])", menu->sym->name ?
-					menu->sym->name : "<choice>",
-					sym_get_string_value(menu->sym));
-			}
-			str_append(r, "\n");
+	str_printf(r, "  Location:\n");
+	for (j = 4; --i >= 0; j += 2) {
+		menu = submenu[i];
+		if (jump && menu == location)
+			jump->offset = strlen(r->s);
+
+		/* The real rootmenu prompt is ugly */
+		if (menu == &rootmenu)
+			prompt = "Main Menu";
+		else
+			prompt = menu_get_prompt(menu);
+
+		str_printf(r, "%*c-> %s", j, ' ', prompt);
+		if (menu->sym) {
+			str_printf(r, " (%s [=%s])", menu->sym->name ?
+				menu->sym->name : "<choice>",
+				sym_get_string_value(menu->sym));
 		}
+		str_append(r, "\n");
 	}
 }
 

base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
-- 
2.25.1

