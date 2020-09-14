Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E89268EDF
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 17:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgINPCC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 11:02:02 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:30477 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgINPAU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 11:00:20 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 08EExphA013557;
        Mon, 14 Sep 2020 23:59:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 08EExphA013557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600095592;
        bh=5lpLwEgtk3ygHU0abj0WysEGteTVMZkDJfsEz2/EVp0=;
        h=From:To:Cc:Subject:Date:From;
        b=LNY9ziEo70WUI/1P29g2DH3eu/2xNLBgAiUhs4Ff00hTLIMkltkk1pvkI5Htc3asH
         XgtiphyDY1ptIclSi76Fabo8My886qyO7PaI5TqFIbvguR1/l3BuR75hQM7MwiUEF7
         fW7vXT8uM2vKCfFNbbgro5DVNbmuxI2t2ygcUfV6Me+LOUEPwI1581hRGCGkIb004X
         pWxJhDWbJ1JtNV8x45LsA16KWeb47sIzgRAJA8h7WLWJZB52Yr4YQOBJrkYRM6ZVzY
         sSm8KQzFUcLR9mUcTBRQulGI0SKUcrJcQaVEEjFkzshptAegM01D00h1eIJuzg+pRD
         fXm6nwifw3JRA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: revive help message in the info view
Date:   Mon, 14 Sep 2020 23:59:48 +0900
Message-Id: <20200914145948.515677-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 68fd110b3e7e ("kconfig: qconf: remove redundant help in
the info view"), the help message is no longer displayed.

I intended to drop duplicated "Symbol:", "Type:", but precious info
about help and reverse dependencies was lost too.

Revive it now.

"defined at" is contained in menu_get_ext_help(), so I made sure
to not display it twice.

Fixes: 68fd110b3e7e ("kconfig: qconf: remove redundant help in the info view")
Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8638785328a7..9f306e780c2f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1108,6 +1108,11 @@ void ConfigInfoView::menuInfo(void)
 		if (showDebug())
 			stream << debug_info(sym);
 
+		struct gstr help_gstr = str_new();
+
+		menu_get_ext_help(_menu, &help_gstr);
+		stream << print_filter(str_get(&help_gstr));
+		str_free(&help_gstr);
 	} else if (_menu->prompt) {
 		stream << "<big><b>";
 		stream << print_filter(_menu->prompt->text);
@@ -1119,11 +1124,11 @@ void ConfigInfoView::menuInfo(void)
 					   expr_print_help, &stream, E_NONE);
 				stream << "<br><br>";
 			}
+
+			stream << "defined at " << _menu->file->name << ":"
+			       << _menu->lineno << "<br><br>";
 		}
 	}
-	if (showDebug())
-		stream << "defined at " << _menu->file->name << ":"
-		       << _menu->lineno << "<br><br>";
 
 	setText(info);
 }
-- 
2.25.1

