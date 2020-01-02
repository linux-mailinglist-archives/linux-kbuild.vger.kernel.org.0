Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3117212F1B1
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 00:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgABXOE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jan 2020 18:14:04 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36011 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgABXOE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 18:14:04 -0500
Received: by mail-qk1-f194.google.com with SMTP id a203so32914818qkc.3;
        Thu, 02 Jan 2020 15:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8XxaXjSkhsNEq88yHyI55+nl1NneR/5BQXJWdBH8eks=;
        b=aPCcQuVcTJ9C0GvET70tfVOO52fdogtt45Ti/AlGSMA/Si32M5he5y/389IQx25+sl
         DIUfwMsTINLOCS8A6MrWm+q5kfq3zBCcdVHfsL5m6E68y2dX5ifxy7I0UQ23+KB/67Kk
         7gDodjDv9gzWpDaPPhWqnI0qTbXO1i/qWGtX3fobsFsuQSmtD10hr/l07NSM3Kkjczsk
         yCjhjNzVQ2VW6lNCeqOTvDwPz4nJUk6mLRzxW4n+pq3nOd6yfT32qVX0c9Zh4d5i6BFG
         9exyQglo5k/Gd1q/+fLqhLM+4Zabu2W/PoXbiVX/dj+kM+2PtEn9562IW7jkX/C7OjhF
         xTFA==
X-Gm-Message-State: APjAAAWVu+jhDgmLg0CgTr8UOw/0CmZ4S19fN62S4LhSMgdS9LB6eeBg
        VYoj73m7ld0OMsYK1M20e3U=
X-Google-Smtp-Source: APXvYqyoEGvziciuWD4DGuvfEZRhqtM9H1ZAVdiRT6f0pT0U5+wNIpZ6YQnP97qPvMo13y2j8rMfFA==
X-Received: by 2002:a05:620a:23a:: with SMTP id u26mr66830107qkm.426.1578006843314;
        Thu, 02 Jan 2020 15:14:03 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id g81sm15547949qkb.70.2020.01.02.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 15:14:02 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: restore prompt dependencies in help text
Date:   Thu,  2 Jan 2020 18:14:02 -0500
Message-Id: <20200102231402.1052657-1-nivedita@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
References: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
prompts") moved some code from get_prompt_str to get_symbol_str so that
dependency information for symbols without prompts could be shown.

This code would be better copied rather than moved, as the change had
the side-effect of not showing any extra dependencies that the prompt
might have over the symbol.

Put back a copy of the dependency printing code in get_prompt_str.

The following is an example for NAMESPACES:

Before:
	Symbol: NAMESPACES [=y]
	Type  : bool
	Prompt: Namespaces support
	  Location:
	(2) -> General setup
	  Defined at init/Kconfig:1064
	  Depends on: MULTIUSER [=y]

After:
	Symbol: NAMESPACES [=y]
	Type  : bool
	Prompt: Namespaces support
	  Editable if: MULTIUSER [=y] && EXPERT [=y]
	  Location:
	(2) -> General setup
	  Defined at init/Kconfig:1064
	  Depends on: MULTIUSER [=y]

Fixes: bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
---
 scripts/kconfig/menu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..6fbbe41302dc 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -706,6 +706,12 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct jump_key *jump = NULL;
 
 	str_printf(r, "Prompt: %s\n", prop->text);
+	if (!expr_is_yes(prop->visible.expr)) {
+		str_append(r, "  Editable if: ");
+		expr_gstr_print(prop->visible.expr, r);
+		str_append(r, "\n");
+	}
+
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
-- 
2.24.1

