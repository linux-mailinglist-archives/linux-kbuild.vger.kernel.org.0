Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0010021EB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 21:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfEQTmw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 15:42:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42020 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfEQTmv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 15:42:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id 188so7274239ljf.9;
        Fri, 17 May 2019 12:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=wQk+iKLW99ybmzViynjoPTsHrL2dkz/4aXwFCGkUo6w=;
        b=BtkL+OaMB3mqZ4fEn5JhzIUernc/xxkgO55UFeu5qJtF3Q7Ni3+74PqMvPC/RMTPzS
         k+pZ9oJewomIgpwDLQIcjZ8XymYAfSq7qNx9id9hHsJTuBxVe0lWAo8+JuJNWs9O7yOH
         dHEtmZTmAj2OG132VjY6DTIICCV3Abs9lkOU+K6bg1rQxPLHiYcLHNYaBZwkwCFK15xC
         Z37Utvy0YhEyMuam106D5tSCuAjh7oiZ2cuafO27mDSlLuuevh9CCavkXpzicwgqimY7
         DktAajlDgJFww80tX69JjXxg6x+uR/R3qgPFtHqiMMMuaSq27h1PXKbNHayR6I2coUGL
         2btA==
X-Gm-Message-State: APjAAAXK9HYwPgO6KbHH3nfenPPqVUen4Ufpg7D/krXcBOpBnW7CFvef
        xLcajhZUWo8o4SdEgi6oY+E=
X-Google-Smtp-Source: APXvYqwUQ+eioY1W3wVFRU+Ic1jLcd5w5wKH7Zxv2fpvOIBxGWa/rIBOI9RwKlOX4N+y4atbmVAuVg==
X-Received: by 2002:a2e:6384:: with SMTP id s4mr29153087lje.63.1558122170085;
        Fri, 17 May 2019 12:42:50 -0700 (PDT)
Received: from localhost.localdomain ([213.87.152.51])
        by smtp.gmail.com with ESMTPSA id 12sm1738714ljf.12.2019.05.17.12.42.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 May 2019 12:42:49 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Popov <alex.popov@linux.com>
Subject: [v3 1/1] kconfig: Terminate menu blocks with a comment in the generated config
Date:   Fri, 17 May 2019 22:42:22 +0300
Message-Id: <1558122142-10683-1-git-send-email-alex.popov@linux.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently menu blocks start with a pretty header but end with nothing in
the generated config. So next config options stick together with the
options from the menu block.

Let's terminate menu blocks in the generated config with a comment and
a newline if needed. Example:

...
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y
...

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---

v3 changes:
 - rebase onto the recent rc;
 - don't print the end comment for the rootmenu to avoid breaking
   'make testconfig' (thanks to Masahiro Yamada).

---
 scripts/kconfig/confdata.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 492ac34..6006154 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -867,6 +867,7 @@ int conf_write(const char *name)
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
+	bool need_newline = false;
 
 	if (!name)
 		name = conf_get_configname();
@@ -912,12 +913,16 @@ int conf_write(const char *name)
 				     "#\n"
 				     "# %s\n"
 				     "#\n", str);
+			need_newline = false;
 		} else if (!(sym->flags & SYMBOL_CHOICE)) {
 			sym_calc_value(sym);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
+			if (need_newline) {
+				fprintf(out, "\n");
+				need_newline = false;
+			}
 			sym->flags &= ~SYMBOL_WRITE;
-
 			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
 		}
 
@@ -929,6 +934,12 @@ int conf_write(const char *name)
 		if (menu->next)
 			menu = menu->next;
 		else while ((menu = menu->parent)) {
+			if (!menu->sym && menu_is_visible(menu) &&
+			    menu != &rootmenu) {
+				str = menu_get_prompt(menu);
+				fprintf(out, "# end of %s\n", str);
+				need_newline = true;
+			}
 			if (menu->next) {
 				menu = menu->next;
 				break;
-- 
2.7.4

