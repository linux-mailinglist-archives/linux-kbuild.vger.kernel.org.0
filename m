Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF253F0FBE
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbhHSA7X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:23 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60444 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbhHSA7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:19 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4o017219;
        Thu, 19 Aug 2021 09:57:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4o017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334670;
        bh=aFQt+IVlSY7VLNtdSb4DtL9wrHmQt9RjdrLQzGtwW6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jXmbQ+3NQYTpjLgAXW5VhO4u/wFf6hZrg/rxg8hrD7UGWLLF9l6Npdw8OGdiQ2H/g
         ++1fE+NwuZ+L3uq+IkkpkVrqL9BJRxh3J0NIY+rKQAlJf2TiLUaidypx07KneIyfXa
         DW2VMVTpMAfOk3jm+LaTm7NE+65r+hq5avA5kaSH5boFYFlDrPE6iTxpI9rks5UC14
         vUOwMMnpzH5mZVdxC/SzNAJ37TKzBkKxRUeHRsdxr/LZDx1cTopDaODWrpHKQTaKnJ
         4WGKWF688N+hj5FtlencfSqHU5Pt7MQsgVRhEduYG55PpnA9BTY8clFkeOhRG91GCs
         Ofp+lPuCXTlfg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 05/13] kbuild: remove stale *.symversions
Date:   Thu, 19 Aug 2021 09:57:36 +0900
Message-Id: <20210819005744.644908-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cmd_update_lto_symversions merges all the existing *.symversions, but
some of them might be stale.

If the last EXPORT_SYMBOL is removed from a C file, the *.symversions
file is not deleted or updated. It contains stale CRCs, which will be
used for linking the vmlinux or modules.

It is not a big deal when the EXPORT_SYMBOL is really removed. However,
when the EXPORT_SYMBOL is moved to another file, the same __crc_<symbol>
will appear twice in the merged *.symversions, possibly with different
CRCs if the function argument is changed at the same time. It would
cause potential breakage of module versioning.

If no EXPORT_SYMBOL is found, let's remove *.symversions explicitly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 279363266455..585dae34746a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -177,6 +177,8 @@ cmd_modversions_c =								\
 	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
 		$(call cmd_gensymtypes_c,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
 		    > $@.symversions;						\
+	else									\
+		rm -f $@.symversions;						\
 	fi;
 else
 cmd_modversions_c =								\
-- 
2.30.2

