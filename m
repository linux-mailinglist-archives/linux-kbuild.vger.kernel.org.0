Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E11F1222F7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfLQEOo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:14:44 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49223 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQEOo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:44 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAB024524;
        Tue, 17 Dec 2019 13:14:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAB024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556067;
        bh=j6pJQEI+9SUQgaZj03Qn5Zj+CocBybtzStd3IOhT2/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TH7cDtp6PHazyZ1a9gTMUxBi3lB/HCyHQZ8wUbiUFvMfukSGWLNYAV+fGOApU+gBe
         kSZXh7n0xIOBa913XnJK6S1TRdEsN5AFnGl5Ex+0+3/d2q9V90EBoHaEHOdOde8vZy
         y8VGuiXuEHY5YWAAHlm8DD4n7t4K7w6st2C+R/yErwOui37g4+p8WnbGv6hVE3I03w
         GrmR8oZO3wwuU79rgPlLaiyyiWw1h7d71+hPTiYhKP+TG/7H7sOgf/K+pvZ2cUwFrW
         kvH5z+k8pSj3i2AgP6SlyvIWIvSwNTo/2A+hg2LqoniPamlphhnnbILINGHAlprK/t
         KY+YFC5FpsOeg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] kconfig: remove the rootmenu check in menu_add_prop()
Date:   Tue, 17 Dec 2019 13:14:16 +0900
Message-Id: <20191217041424.29285-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit ba6ff60d5eb4 ("kconfig: don't emit warning upon
rootmenu's prompt redefinition").

At that time, rootmenu.prompt was always set first, then it was set
again if a "mainmenu" statement was specified in the Kconfig file.

This is no longer the case since commit 0724a7c32a54 ("kconfig: Don't
leak main menus during parsing"). Remove the unneeded check.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..b1b1ee8cf987 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -138,7 +138,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 			while (isspace(*prompt))
 				prompt++;
 		}
-		if (current_entry->prompt && current_entry != &rootmenu)
+		if (current_entry->prompt)
 			prop_warn(prop, "prompt redefined");
 
 		/* Apply all upper menus' visibilities to actual prompts. */
-- 
2.17.1

