Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9CCE884F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 13:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfJ2Min (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 08:38:43 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:33928 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfJ2Min (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 08:38:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x9TCcFU9026616;
        Tue, 29 Oct 2019 21:38:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x9TCcFU9026616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572352702;
        bh=rRs8Ed7t4bAer/X1dc9tlKv3gE2rP5G57gkcJJvIIzs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wx5lpNCAWh0/fyhSglgPtgut//wljqNN4vx7Lbqx1ZhuPpRivg83hoCLnyCcntuzu
         U9RPsoIpsytpjbkToeJY+5WYt82+HYbs0pJd3BtbJMfMcBPcgOHuPZ2a+NbVs/4KBY
         AKaFq3Ky3cZ2t+BemZLqYWnSPrH/mekrlSpwcMCUWODxeoUYzmpnP8MVzO2qdSAZdt
         s27bGUd7tePUX8QCrh9dwaykFQx/SvgZ/ao/EBBNfww0FW6fZ59oWvrTJFa6Sda5U6
         aU/iw2JlhQxBCOIFNY5eUHLyP/Je4/BknAL4de9oZJP9A5eA20yaCwVQIkIN8cP014
         Qgm4BCvojQSxw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] mospost: remove unneeded local variable in contains_namespace()
Date:   Tue, 29 Oct 2019 21:38:09 +0900
Message-Id: <20191029123809.29301-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The local variable, ns_entry, is unneeded.

While I was here, I also cleaned up the comparison with NULL or 0.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f7425f5d4ab0..f70b924f379f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
 static bool contains_namespace(struct namespace_list *list,
 			       const char *namespace)
 {
-	struct namespace_list *ns_entry;
-
-	for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
-		if (strcmp(ns_entry->namespace, namespace) == 0)
+	for (; list; list = list->next)
+		if (!strcmp(list->namespace, namespace))
 			return true;
 
 	return false;
-- 
2.17.1

