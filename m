Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3981E9DB9
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgFAF6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40023 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaMD023694;
        Mon, 1 Jun 2020 14:57:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaMD023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991072;
        bh=X2mnKq0uk81/TUNdPVJWiFn594T+YFAh//6L+SaEZQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G5sI2+GE6eHDaWKyPaqqolF5xseS8aqXop3Ua0vqPqDX32O97iHniebnV3AAnljqv
         VO7XOp1pc+2YuUGnOSTNdn5Cy+UUct24G6uxfcLNNwvZ37HKjPT4vHZNMGism+X8qE
         ONvMr27EvHLetEEMQx8vGaJ5pi2oFNUl70CjU15JHPmU0ExiYzIePt9mhswqcPgUth
         Q+y00l/b+ASctOmkF6hxuMdg5deNeXRVLLbyJDgjOj/meh7u+23QG6pvPbgToIg7mG
         jHeIX3EcGMqqgHgIO1rh5kVfKBP+n3H5BatGPSk6cbLC7o4Tms/jYwQdDbh/G4m6gc
         DBd3JFxfKfjbA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 34/37] modpost: set have_vmlinux in new_module()
Date:   Mon,  1 Jun 2020 14:57:28 +0900
Message-Id: <20200601055731.3006266-34-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Set have_vmlinux flag in a single place.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 925c1a1856aa..b317328ae21b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -192,6 +192,9 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
+	if (mod->is_vmlinux)
+		have_vmlinux = 1;
+
 	return mod;
 }
 
@@ -2012,9 +2015,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
@@ -2470,8 +2470,6 @@ static void read_dump(const char *fname)
 		mod = find_module(modname);
 		if (!mod) {
 			mod = new_module(modname);
-			if (mod->is_vmlinux)
-				have_vmlinux = 1;
 			mod->from_dump = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
-- 
2.25.1

