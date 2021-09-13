Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653324099CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 18:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbhIMQrB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 12:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238597AbhIMQqz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 12:46:55 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAF2C061766;
        Mon, 13 Sep 2021 09:45:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 140so3707469wma.0;
        Mon, 13 Sep 2021 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRUDddrOhBz7wPs7n2BWvnbLp1YtX5LqNskb7F4KopQ=;
        b=qFBeR2rM6nK0p+XpJivHd1bcEa+ejelC7XjFg19hOQar2ANlq1ixbE9a53f0CwFGLG
         kHJL4AXR+xO4OQJRWtdfLI/Fe21gORMp+Zi3D/LdYj17oqSfK3pBkZqYDI9dCslz9AZb
         wsx8rnKbOgqq/h6kE/xr1UtfdwV3b2FW1v/bknFFhgVEKwDVxhdEDvyJ9/41LVLHFAcs
         64Q/3wtuuYaQ6taOaVuQdhhfAurRA2X5nLT7zgDnvduTAwXlrH2kuW+Wjtmfy6awcuzy
         oh0LsD3l0K77Esv+WACeamGiM0GsOzVkNi533mxVIT6U74VWwz1yEWA+it3WboMkqjxB
         vpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRUDddrOhBz7wPs7n2BWvnbLp1YtX5LqNskb7F4KopQ=;
        b=Q9YaSAopXPZM3WfWrTTLmI1RvyPfEKxJasBSKH919r3VLIfFMGGqSIaXxkY1DF1fKK
         NfrDdEXpq7HeBqCBsGoLgwhvyTRE+tiPJvytM0uLigkEHs5g4gf7CESJh7+Tij0swYS+
         5nhXjdp4AWn2Sx8YR6N1J29wQa9NiAOJT3/If8uNzSjw85t2asDqXJkP7kW/a5Vgu6s7
         H3HzmnW916xMHoMd9yJWtanNx+9RGcq2hU0J/ZqC+JymKCqmk7kIbGVMyvsT1qH94IF3
         DQMK3UloyCIHMQ7dGVu4rxwMFZ6bbfsLu2LiA8KPNEiLeZlom5cprxcusJPSHbXynV5b
         ry3Q==
X-Gm-Message-State: AOAM532Wd3szcBi3BR26B4WZyCIOJSSgDn6S7rPeTNd5PYHuEElfyJje
        wIIxowaQfZn8uVRgqYAmWCgYs5qfTIR+Ng==
X-Google-Smtp-Source: ABdhPJwMsRQivrMwh0jTuYOf8q9vjWRDUMG7XrcnLQOMocmgrRpASUrsAc0U3/yZdeqvuEzTaOXy2g==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr1457033wmh.165.1631551527754;
        Mon, 13 Sep 2021 09:45:27 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id v10sm8091338wrg.15.2021.09.13.09.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:45:27 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ariel Marcovitch <arielmarcovitch@gmail.com>
Subject: [PATCH v2] kconfig: Create links to main menu items in search
Date:   Mon, 13 Sep 2021 19:45:14 +0300
Message-Id: <20210913164514.437972-1-arielmarcovitch@gmail.com>
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

Add a 'Main menu' entry in the 'Location:' section for the kconfig
items.

This makes the 'if (i > 0)' superfluous because each item with prompt
will have at least one menu in its path.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/kconfig/menu.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 606ba8a63c24..3d6f7cba8846 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -728,7 +728,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		get_dep_str(r, prop->visible.expr, "  Visible if: ");
 
 	menu = prop->menu->parent;
-	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
+	for (i = 0; menu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
 
 		submenu[i++] = menu;
@@ -758,21 +758,24 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
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
+		if (menu == &rootmenu)
+			/* The real rootmenu prompt is ugly */
+			str_printf(r, "%*cMain menu", j, ' ');
+		else
+			str_printf(r, "%*c-> %s", j, ' ', menu_get_prompt(menu));
+
+		if (menu->sym) {
+			str_printf(r, " (%s [=%s])", menu->sym->name ?
+				menu->sym->name : "<choice>",
+				sym_get_string_value(menu->sym));
 		}
+		str_append(r, "\n");
 	}
 }
 

base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
-- 
2.25.1

