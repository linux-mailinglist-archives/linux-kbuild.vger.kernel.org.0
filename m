Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A67F12E068
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jan 2020 21:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgAAUlz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jan 2020 15:41:55 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42393 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgAAUlz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jan 2020 15:41:55 -0500
Received: by mail-qk1-f195.google.com with SMTP id z14so28906084qkg.9;
        Wed, 01 Jan 2020 12:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53gqaIkhdPDG+u+oV+ISxw8yEYT3I4k9lzpCvtjaHqY=;
        b=W835bjdbTWigFwq/mSqvuaTMe0xmIZ42mhzwe3KqGKrX7fY5aSFwEMku987BSFfyGB
         jNFoDpWNL0hXOcWv2rju5vs7DazBHwNe1fIzup/wrG0GSzLy5125XSXQtMGT7HGuFShF
         qEKe9TEM5LDcQySFGVp9S3yEm3bDznUzURMG8GG/kw5SQYndflLGRQGlklSV+mc38nCD
         FxbEkoMlXrRmmG3kZ52RN9SURdehUPVTFaNqi5c0Fi668VeAOMIOZk2Xtp9vXbhFs1a5
         O3G3mG+nvG2HZZJ7p+wLaD4rPfDl1baWRStnsADxDgF9opGvWdF8FJf65SKfiG8jemNY
         ABag==
X-Gm-Message-State: APjAAAUsHcVaCHfkz6uq6Mg9Ts1fOR6I1yQq5mYYoonRxG58D8Rdx12O
        jVfZqZB/W7ApehDb4aEipVg=
X-Google-Smtp-Source: APXvYqz0TGO5dUu2D5tCBLPAiPrbc1kkzP8sbTKHFEkCKhfxMVkn1iCXpCELrAbMqeXAQJ2YkNrulw==
X-Received: by 2002:a05:620a:48e:: with SMTP id 14mr63236816qkr.292.1577911314122;
        Wed, 01 Jan 2020 12:41:54 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id v24sm16239302qtq.14.2020.01.01.12.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 12:41:53 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Al Viro <viro@zeniv.linux.org.uk>, Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] menuconfig: restore prompt dependencies in help text
Date:   Wed,  1 Jan 2020 15:41:52 -0500
Message-Id: <20200101204152.402906-1-nivedita@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231055839.GG4203@ZenIV.linux.org.uk>
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
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
	  Visible if: MULTIUSER [=y] && EXPERT [=y]
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
index d9d16469859a..c323ab4ac7c7 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -706,6 +706,12 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct jump_key *jump = NULL;
 
 	str_printf(r, "Prompt: %s\n", prop->text);
+	if (!expr_is_yes(prop->visible.expr)) {
+		str_append(r, "  Visible if: ");
+		expr_gstr_print(prop->visible.expr, r);
+		str_append(r, "\n");
+	}
+
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
-- 
2.24.1

