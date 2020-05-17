Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999A11D6716
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgEQJud (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:33 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38334 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LG018560;
        Sun, 17 May 2020 18:49:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LG018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708957;
        bh=3cOKyKsGmuqpr2zeueDZI3YVHjDzjgw0wEw4sjujv90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fq8BIDstruEuB67I0HFwq+pPP7mpG5a4LDFOGCzbBz6QOnbjc0wA5FEC0cwXtRNNv
         X5Noj9WW0L0Z3XX9725cWG7ncmoLONUmsz5WuOWu7WuHZo5h42s1KhjUlvr3uYVD+K
         tZUKF8leQmg27Plvv3Ek+314AeKxePh6yeFg3+x7/GBuMrfurxMT4fgYMW3V370w9L
         okYktx3Dnxe1a82Ek2oE2chZTw1wsh5ADlqjsTtwyJouIJ/NciQNoqiH+E2UvxfUik
         6BU7TUmj7BPa+ZGJI7zarRy62bCrMKeZdMf/Akird2zP7bX6WaNw/PDcUEivCFdgQ7
         Zg8c1rPAACe1A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 19/29] modpost: show warning if it fails to read symbol dump file
Date:   Sun, 17 May 2020 18:48:49 +0900
Message-Id: <20200517094859.2376211-20-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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

 Makefile              | 10 +---------
 scripts/mod/modpost.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index aeb690c692ee..27e8a0522a3c 100644
--- a/Makefile
+++ b/Makefile
@@ -1638,17 +1638,9 @@ else # KBUILD_EXTMOD
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
index 8150be00e3df..ff715623b37e 100644
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
@@ -2428,9 +2430,11 @@ static void read_dump(const char *fname)
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
 
@@ -2615,6 +2619,9 @@ int main(int argc, char **argv)
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

