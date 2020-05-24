Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0073A1E0013
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387874AbgEXPoR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:17 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19687 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV4017561;
        Mon, 25 May 2020 00:42:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV4017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334969;
        bh=O8rZjrlo4KRUg3AHCM34rz9nJ4LMB42FbHfZ71ZGWag=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KaVjgz4Yvq7xcJyFTTGF0bWso8VR3hOd1S2IwNOYl5cRDs28K7AJbNWm38kkJoFqe
         5PkvufAi0sWjwglo7nncNpor6EBBzfx7ikPxMuNeaLCPpg/4U1Ee+KQPvIUdMae0mz
         fRyZRR1NvNF5X3x/EQ9K2KuX5wSqFGOLZZTWGGZbPZZx6XnhFRlVKuIg4RLHRguLKK
         V/qBZ7SucHiH+wU5bdAZmT6G86yrxdJlgdNW3pRUdFPBtad0q8vUp5Ex9Th18vTv+T
         BFzlxgsrMpAoNOcRqBHi2t2eULLpbaPoPr1+7ePvbhN0osiFevefnvGbYTnsqhZYCP
         aFYOUPZ7eB7Dg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/29] modpost: show warning if it fails to read symbol dump file
Date:   Mon, 25 May 2020 00:42:25 +0900
Message-Id: <20200524154235.380482-20-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If modpost fails to load a symbol dump file, it cannot check unresolved
symbols, hence module dependency will not be added. Nor CRCs can be added.

Currently, external module builds check only $(objtree)/Module.symvers,
but it should check files specified by KBUILD_EXTRA_SYMBOLS as well.

Print the warnings in modpost. The warning in Makefile is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 Makefile              | 10 +---------
 scripts/mod/modpost.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 48a2dfaf3bf3..3b25a51132ea 100644
--- a/Makefile
+++ b/Makefile
@@ -1641,17 +1641,9 @@ else # KBUILD_EXTMOD
 # We are always building modules
 KBUILD_MODULES := 1
 
-PHONY += $(objtree)/Module.symvers
-$(objtree)/Module.symvers:
-	@test -e $(objtree)/Module.symvers || ( \
-	echo; \
-	echo "  WARNING: Symbol version dump $(objtree)/Module.symvers"; \
-	echo "           is missing; modules will have no dependencies and modversions."; \
-	echo )
-
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: descend $(objtree)/Module.symvers
+modules: descend
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 638c45d35292..34f2aa3a021f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -41,6 +41,8 @@ static int sec_mismatch_fatal = 0;
 static int ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
 static int allow_missing_ns_imports;
+/* Set when at list one dump file is missing */
+static int missing_dump_file;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -2438,9 +2440,11 @@ static void read_dump(const char *fname)
 	char *buf, *pos, *line;
 
 	buf = read_text_file(fname);
-	if (!buf)
-		/* No symbol versions, silently ignore */
+	if (!buf) {
+		warn("failed to read '%s'\n", fname);
+		missing_dump_file = 1;
 		return;
+	}
 
 	pos = buf;
 
@@ -2625,6 +2629,9 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	if (missing_dump_file)
+		warn("Symbol dump file is missing. Modules may not have dependencies or movversions.\n");
+
 	/*
 	 * When there's no vmlinux, don't print warnings about
 	 * unresolved symbols (since there'll be too many ;)
-- 
2.25.1

