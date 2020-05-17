Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2911D66F8
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgEQJtr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:49:47 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38336 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgEQJth (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:37 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LI018560;
        Sun, 17 May 2020 18:49:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LI018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708958;
        bh=Jq5KPdK2SrGwy3yG8IpxZntWGCJlXQt0dlxR4EZDgY0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0aM9P/Q2Jj0ICohSgvk6LhuPCkKoMKUzgHzJFE1TJ4oaOB17sPDeQKp1tOwEXEHVZ
         zf2b3PhEkOKtPf0CQhTGVuZ1cie42bBjuPzO9StJ5SnBqkPceUp6auKrAyxrBadhvf
         zUt5aD0f+cEPh+1cpBIqXw9/s+3Ia4YOHizMSntGxNs9v22DW2PlpJChnugzZe62im
         Zfu6esaPiYMlsN+P/PKnGvA2YpuAs0NvXCbWGeyOoGfhzdSA+rZRbE6NJGrirRKyhc
         HXkeOMXdTFomY1J4y+HFyNOrbfJi7tlDReZo1+BCQTBiZ786qEaMwQiSI2HsKQs7ng
         WXAb9GzEl7sTA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 21/29] modpost: remove -s option
Date:   Sun, 17 May 2020 18:48:51 +0900
Message-Id: <20200517094859.2376211-22-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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
index ff715623b37e..c6e1a349421c 100644
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
@@ -2068,8 +2066,7 @@ static void read_symbols(const char *modname)
 		}
 	}
 
-	if (!is_vmlinux(modname) || vmlinux_section_warnings)
-		check_sec_ref(mod, modname, &info);
+	check_sec_ref(mod, modname, &info);
 
 	if (!is_vmlinux(modname)) {
 		version = get_modinfo(&info, "version");
@@ -2558,7 +2555,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2581,9 +2578,6 @@ int main(int argc, char **argv)
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

