Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BE41E9DAC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgFAF6V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39991 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLp023694;
        Mon, 1 Jun 2020 14:57:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLp023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991062;
        bh=T5tRGhmnaSONH3u55YdrjS1NdKpUcBqfkDd+Pt4a26E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yMoxx70SPX5tNjBBYi4jAnAeJhyGKKLzLkuASNu8ZJd4EPY2qZ4iwmhc1/o8rjHys
         YmlQKH6+c6WpKBrAHBuKO8wp4DxEFfuP2z4zVrHdJYpO7LZJDdSinA3KqDzSlVDUUB
         GFsls36kEb4pzegsf9XtDanPkkJ1JzcPxXLnROpjc3UO2iSdpt3wuPKXPPYxuxVZNM
         HrkkAfHTbIuc7L2echn97yRsO7Vg2hVaE9mWnv21bRSp1dmAXPV+P/JSui0O37+uwp
         Ym8nONDMJJpuM8smWLwALcM9ADLqp3W7EU3Crevq5GUm8cvzcGzIItxOYVVHTdvGfR
         HxRncNhAEiFJQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 12/37] modpost: allow to pass -i option multiple times to remove -e option
Date:   Mon,  1 Jun 2020 14:57:06 +0900
Message-Id: <20200601055731.3006266-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no difference between -i and -e, they can be unified.

Make modpost accept the -i option multiple times, then remove -e.

I will reuse -e for a different purpose.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 2 +-
 scripts/mod/modpost.c    | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 02d9f08a20a7..e527bf838954 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -50,7 +50,7 @@ MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)					\
-	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))			\
+	$(if $(KBUILD_EXTMOD),$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)))			\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 60f35b89cea2..28d8f5377c62 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2544,7 +2544,6 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	struct buffer buf = { };
-	char *kernel_read = NULL;
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
@@ -2553,13 +2552,9 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_start = NULL;
 	struct ext_sym_list **extsym_iter = &extsym_start;
 
-	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'i':
-			kernel_read = optarg;
-			external_module = 1;
-			break;
-		case 'e':
 			external_module = 1;
 			*extsym_iter = NOFAIL(calloc(1, sizeof(**extsym_iter)));
 			(*extsym_iter)->file = optarg;
@@ -2600,8 +2595,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (kernel_read)
-		read_dump(kernel_read);
 	while (extsym_start) {
 		struct ext_sym_list *tmp;
 
-- 
2.25.1

