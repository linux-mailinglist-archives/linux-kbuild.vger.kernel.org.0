Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CB51E0000
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbgEXPnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:45 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19712 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728564AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV0017561;
        Mon, 25 May 2020 00:42:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV0017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334967;
        bh=P3Qv1z0zgKjuZ3WCh10Ov8B8BC+PfGx7hBhH7ci8pxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kmEK0vM4ivml2OScf3Psi9Hko0+Gd7QXueYfTJMyYOaponvM7zPlu6Ce3WU19xg7g
         PlWg/xPlLgd+JQ81ztFLneLjG9wHh/oEwTAOmLfiD2DZujyHVRT/1r5CUR0uUiio47
         +QBiGnYUg8+YCntpCxRCwppsbH3FNQpkH4jWrZu1nfZVX96j4r8z9mBHN16gv3jJZt
         saRMGiRQXFcYvjSJV4lzf/Os8IcRIv/VQJ8MRQ2Pt9Wj3+DXopwLsfgNjX6qT8ndhs
         3g94r4bwOAEYW8nrwEDXtF7ADBlxAVTJw8k6KkKJ35UarYpTn13oXm0/Ck63K/EMGP
         PizcBMTC8I/8g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/29] modpost: allow to pass -i option multiple times remove -e option
Date:   Mon, 25 May 2020 00:42:21 +0900
Message-Id: <20200524154235.380482-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that there is no difference in the functionality of -i and -e,
they can be unified.

Make modpost accept the -i option multiple times, then remove -e.

I will reuse -e for a different purpose.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost | 2 +-
 scripts/mod/modpost.c    | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8321068abb31..a316095c843c 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -82,7 +82,7 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 # modpost options for external modules
 MODPOST += \
 	-i Module.symvers \
-	$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)) \
+	$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)) \
 	-o $(KBUILD_EXTMOD)/Module.symvers
 
 endif
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 76599dd44bae..2ecf72a176cf 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2558,7 +2558,6 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	struct buffer buf = { };
-	char *kernel_read = NULL;
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
@@ -2567,13 +2566,9 @@ int main(int argc, char **argv)
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
@@ -2614,8 +2609,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (kernel_read)
-		read_dump(kernel_read);
 	while (extsym_start) {
 		struct ext_sym_list *tmp;
 
-- 
2.25.1

