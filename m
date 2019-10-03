Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE72C9C53
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 12:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729329AbfJCKaO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 06:30:14 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:49391 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbfJCKaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 06:30:13 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x93ATIYw014338;
        Thu, 3 Oct 2019 19:29:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x93ATIYw014338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570098560;
        bh=DlfvIJ7TNPo8SCZtpXZn6EtbMqn7kWyCU+GUqdyLtYI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DUtb3Alp1sqmTbsP8jUWlNMigWaAp8UWUZX/l65EB596ArVof+HMPAU3TiEdtu5Qf
         riXr60YjvdXoAnjnk5t4tFgmYLYyH70x5Oz3VUyd1RM/pnUfq3RfqXRmsTWosSBrHy
         uAcUMFdP60EIpT/et8LeV2D5OIat/gcQMloznmkzTQQBcMHdryGSXSfVGjKLCurLgx
         PrZxnks5kgeVl/cuCqpzJeA40XYuB8UzdDsUDHyi0pmiCOyyqtLHqyyMaGfaa36NBz
         lgwv/um1AUfO0jZZ8gkq21Ep0wgDyb9CyKPbMnl1xNclgtJ6CTHnfchU+XtvfPqVmh
         2iKj+twhd7rdw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] kbuild: do not read $(KBUILD_EXTMOD)/Module.symvers
Date:   Thu,  3 Oct 2019 19:29:14 +0900
Message-Id: <20191003102915.28301-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003102915.28301-1-yamada.masahiro@socionext.com>
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 040fcc819a2e ("kbuild: improved modversioning support for
external modules"), the external module build reads Module.symvers in
the directory of the module itself, then dumps symbols back into it.
It accumulates stale symbols in the file when you build an external
module incrementally.

The idea behind it was, as the commit log explained, you can copy
Modules.symvers from one module to another when you need to pass symbol
information between two modules. However, the manual copy of the file
sounds questionable to me, and containing stale symbols is a downside.

Some time later, commit 0d96fb20b7ed ("kbuild: Add new Kbuild variable
KBUILD_EXTRA_SYMBOLS") introduced a saner approach.

So, this commit removes the former one. Going forward, the external
module build dumps symbols into Module.symvers to be carried via
KBUILD_EXTRA_SYMBOLS, but never reads it automatically.

With the -I option removed, there is no one to set the external_module
flag unless KBUILD_EXTRA_SYMBOLS is passed. Now the -i option does it
instead.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/modules.rst | 13 +++++--------
 scripts/Makefile.modpost         |  1 -
 scripts/mod/modpost.c            |  9 ++-------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index dd1d2a0688e8..4c74f683bb2b 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -492,18 +492,15 @@ build.
 	to the symbols from the kernel to check if all external symbols
 	are defined. This is done in the MODPOST step. modpost obtains
 	the symbols by reading Module.symvers from the kernel source
-	tree. If a Module.symvers file is present in the directory
-	where the external module is being built, this file will be
-	read too. During the MODPOST step, a new Module.symvers file
-	will be written containing all exported symbols that were not
-	defined in the kernel.
+	tree. During the MODPOST step, a new Module.symvers file will be
+	written containing all exported symbols from that external module.
 
 --- 6.3 Symbols From Another External Module
 
 	Sometimes, an external module uses exported symbols from
 	another external module. Kbuild needs to have full knowledge of
 	all symbols to avoid spitting out warnings about undefined
-	symbols. Three solutions exist for this situation.
+	symbols. Two solutions exist for this situation.
 
 	NOTE: The method with a top-level kbuild file is recommended
 	but may be impractical in certain situations.
@@ -543,8 +540,8 @@ build.
 		all symbols defined and not part of the kernel.
 
 	Use "make" variable KBUILD_EXTRA_SYMBOLS
-		If it is impractical to copy Module.symvers from
-		another module, you can assign a space separated list
+		If it is impractical to add a top-level kbuild file,
+		you can assign a space separated list
 		of files to KBUILD_EXTRA_SYMBOLS in your build file.
 		These files will be loaded by modpost during the
 		initialization of its symbol tables.
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 72109d201196..01c0a992d293 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -50,7 +50,6 @@ MODPOST = scripts/mod/modpost						\
 	$(if $(CONFIG_MODVERSIONS),-m)					\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)			\
 	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)			\
-	$(if $(KBUILD_EXTMOD),-I $(modulesymfile))			\
 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 936d3ad23c83..5234555cf550 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2540,7 +2540,7 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	struct buffer buf = { };
-	char *kernel_read = NULL, *module_read = NULL;
+	char *kernel_read = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
 	int err;
@@ -2548,13 +2548,10 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:mnsT:o:awEd")) != -1) {
+	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awEd")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
-			break;
-		case 'I':
-			module_read = optarg;
 			external_module = 1;
 			break;
 		case 'e':
@@ -2599,8 +2596,6 @@ int main(int argc, char **argv)
 
 	if (kernel_read)
 		read_dump(kernel_read, 1);
-	if (module_read)
-		read_dump(module_read, 0);
 	while (extsym_start) {
 		read_dump(extsym_start->file, 0);
 		extsym_iter = extsym_start->next;
-- 
2.17.1

