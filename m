Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFF81DFFFF
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgEXPno (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:44 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19703 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV6017561;
        Mon, 25 May 2020 00:42:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV6017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334970;
        bh=KHh+BSwRlADizaSAtVn/IKwNyrI5ND5xIQck+rI67PU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cVF76f03qix7oAV0cNqU2YTknpL1vEgjggeuxEzNCwewG5+cZm1NH+GF7Jz3v7SII
         Dtqo+48Ciapv6e4tHvTxdO9sFw4ntu27DPWLhhxHBebP9KWym1axo0JincXzcQe3NE
         8V1LA94tZyDo0STc3EXtNNL02z0Vwv/hgmSnotYYj4VjhATLWzc9M0/p3XfJaVf8hg
         EWT+CT7z+NImLja3Npvvuhp0uYxLJ7EQY7GHd4BwMgKDIENoYNAfvEOLmgptjnYxj6
         Zu83nBGd5HUIiNI1IXUm4ljW2nSgovTTE4Xv79SkbUB51RVbs/7tKUYnJ6mMwuAIko
         aBqwwOQG/aOBA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/29] modpost: remove -s option
Date:   Mon, 25 May 2020 00:42:27 +0900
Message-Id: <20200524154235.380482-22-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -s option was added by commit 8d8d8289df65 ("kbuild: do not do
section mismatch checks on vmlinux in 2nd pass").

Now that the second pass does not parse vmlinux, this option is
unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost |  2 +-
 scripts/mod/modpost.c    | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 1c597999b6a0..67db4bba2d45 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -63,7 +63,7 @@ __modpost:
 else
 
 # modpost options for modules (both in-kernel and external)
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s \
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N) \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 34f2aa3a021f..7a108bec933b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -30,8 +30,6 @@ static int have_vmlinux = 0;
 static int all_versions = 0;
 /* If we are modposting external module set to 1 */
 static int external_module = 0;
-/* Warn about section mismatch in vmlinux if set to 1 */
-static int vmlinux_section_warnings = 1;
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
 /* How a symbol is exported */
@@ -2078,8 +2076,7 @@ static void read_symbols(const char *modname)
 		}
 	}
 
-	if (!is_vmlinux(modname) || vmlinux_section_warnings)
-		check_sec_ref(mod, modname, &info);
+	check_sec_ref(mod, modname, &info);
 
 	if (!is_vmlinux(modname)) {
 		version = get_modinfo(&info, "version");
@@ -2568,7 +2565,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2591,9 +2588,6 @@ int main(int argc, char **argv)
 		case 'a':
 			all_versions = 1;
 			break;
-		case 's':
-			vmlinux_section_warnings = 0;
-			break;
 		case 'T':
 			files_source = optarg;
 			break;
-- 
2.25.1

