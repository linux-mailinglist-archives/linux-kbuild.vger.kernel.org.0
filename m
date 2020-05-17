Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C34A1D6715
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgEQJud (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:33 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38318 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgEQJtg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:36 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LC018560;
        Sun, 17 May 2020 18:49:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LC018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708954;
        bh=EH6Tl9YafH5Uj3o4QwAgcCL2CdVbpltrRpGmnprwbPY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jjWXr8/G5Mre+10DI0OtdfIOh7FYZk7jkwsOb+HgjVd2xghOEYi5HLBOpNszt8thm
         rn0Ukft7gRtLgXUw3Sii2GCC6nZ/c+6FrAlI/2bi/Woc73+lKht/VmajXieSzQK8Oj
         QsZEibGOpnsks+PHy24JLuDNRb0BWncLT82Cq5ht/yDQOGtGQZ0mcISuMPjiUiaAtg
         54d6FlZ86ieMIY3uQNoRSTFrFOU8m+TvMr7I/ebLBMVGZGnLrfWhgHGYrEge5p+ppG
         i6OJHqMcv3zyLW8qxoz07WWMA6xsJmY6iGcKQSCpEAL01kQZNTugAPJedQKHYFmrvr
         bRuag0YZ9HSrA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/29] modpost: allow to pass -i option multiple times remove -e option
Date:   Sun, 17 May 2020 18:48:45 +0900
Message-Id: <20200517094859.2376211-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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
index 340b88647e94..d3141b217b57 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2548,7 +2548,6 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	struct buffer buf = { };
-	char *kernel_read = NULL;
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
@@ -2557,13 +2556,9 @@ int main(int argc, char **argv)
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
@@ -2604,8 +2599,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (kernel_read)
-		read_dump(kernel_read);
 	while (extsym_start) {
 		struct ext_sym_list *tmp;
 
-- 
2.25.1

