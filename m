Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0E151B8C8
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 May 2022 09:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343782AbiEEH37 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 May 2022 03:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343743AbiEEH34 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 May 2022 03:29:56 -0400
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA9329801;
        Thu,  5 May 2022 00:26:17 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 2457Nenm019426;
        Thu, 5 May 2022 16:23:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Nenm019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1651735425;
        bh=9vhjoHFvf7AOTb32B8E0KmlDlM3Jq1E3rFxrJ8jofQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kF3oDW6KHAoYEbwtonwsUNvqIuYlWn9T13iwniSTblpG8PITvm3eyZIaO1imofmvU
         nPaz940JxkswE343lNjuYw5S/K/vxntx0wOi8m3o+r+iGFU1QMm0jrLi7RNKkPs2l2
         D6Ou+Ge360xk/lEB9iCSufg9D2+dFjUq6VBoVQJ1rz9fWWI7CAoLfafl3gVP8ieQVM
         Fy8WE80uHKCrXsecBO4OptWTvnaIi5u1TchZzUZNPMQPb5FpFvn166zCFQsi7j6sQ4
         +98+7dJXLPsusc0rG8wWB1NxmBTFKuHbl9O+W9qIQS2RuymD3DDJ40yNzDU1Zqmfaj
         wwLBrT3apuHmg==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Nicolas Schier a <nicolas@fjasle.eu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
        linux-s390@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v3 04/15] modpost: move *.mod.c generation to write_mod_c_files()
Date:   Thu,  5 May 2022 16:22:33 +0900
Message-Id: <20220505072244.1155033-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A later commit will add more code to this list_for_each_entry loop.

Before that, move the loop body into a separate helper function.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - New patch

 scripts/mod/modpost.c | 56 ++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ae8e4a4dcfd2..78a7107fcc40 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2347,6 +2347,34 @@ static void write_if_changed(struct buffer *b, const char *fname)
 	write_buf(b, fname);
 }
 
+/* do sanity checks, and generate *.mod.c file */
+static void write_mod_c_file(struct module *mod)
+{
+	struct buffer buf = { };
+	char fname[PATH_MAX];
+	int ret;
+
+	check_modname_len(mod);
+	check_exports(mod);
+
+	add_header(&buf, mod);
+	add_versions(&buf, mod);
+	add_depends(&buf, mod);
+	add_moddevtable(&buf, mod);
+	add_srcversion(&buf, mod);
+
+	ret = snprintf(fname, sizeof(fname), "%s.mod.c", mod->name);
+	if (ret >= sizeof(fname)) {
+		error("%s: too long path was truncated\n", fname);
+		goto free;
+	}
+
+	write_if_changed(&buf, fname);
+
+free:
+	free(buf.p);
+}
+
 /* parse Module.symvers file. line format:
  * 0x12345678<tab>symbol<tab>module<tab>export<tab>namespace
  **/
@@ -2462,7 +2490,6 @@ struct dump_list {
 int main(int argc, char **argv)
 {
 	struct module *mod;
-	struct buffer buf = { };
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
@@ -2524,30 +2551,11 @@ int main(int argc, char **argv)
 		read_symbols_from_files(files_source);
 
 	list_for_each_entry(mod, &modules, list) {
-		char fname[PATH_MAX];
-		int ret;
-
-		if (mod->is_vmlinux || mod->from_dump)
-			continue;
-
-		buf.pos = 0;
-
-		check_modname_len(mod);
-		check_exports(mod);
-
-		add_header(&buf, mod);
-		add_versions(&buf, mod);
-		add_depends(&buf, mod);
-		add_moddevtable(&buf, mod);
-		add_srcversion(&buf, mod);
-
-		ret = snprintf(fname, sizeof(fname), "%s.mod.c", mod->name);
-		if (ret >= sizeof(fname)) {
-			error("%s: too long path was truncated\n", fname);
+		if (mod->from_dump)
 			continue;
-		}
 
-		write_if_changed(&buf, fname);
+		if (!mod->is_vmlinux)
+			write_mod_c_file(mod);
 	}
 
 	if (missing_namespace_deps)
@@ -2563,7 +2571,5 @@ int main(int argc, char **argv)
 		warn("suppressed %u unresolved symbol warnings because there were too many)\n",
 		     nr_unresolved - MAX_UNRESOLVED_REPORTS);
 
-	free(buf.p);
-
 	return error_occurred ? 1 : 0;
 }
-- 
2.32.0

