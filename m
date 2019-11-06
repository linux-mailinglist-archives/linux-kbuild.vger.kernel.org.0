Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB38F1501
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 12:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbfKFLZV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 06:25:21 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:47954 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfKFLZV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 06:25:21 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xA6BO1Em018531;
        Wed, 6 Nov 2019 20:24:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xA6BO1Em018531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573039442;
        bh=rLZcOrok9PdZlKG4VRBTQujCqfo2C2HipVKQXAB7ZNc=;
        h=From:To:Cc:Subject:Date:From;
        b=pkbFRrG7vHWYHM1pshA3Ue0PBy3/uE1m+zP1ucyA47F9KzYFOotOL6eexS7TnejYE
         ZZozWyll4V5rXUTCogyxXfrNOvS6RvCFk3W8bPnF7wXohalB42Wg9uzIUby2FeQinx
         dWibk0Yx0vGo0ATJBme0jcGKqeKucr0lTIiVjDYhg30ZWHd0BKHifgaFjJSBNf+72l
         7GPoN6/nOariFEnqJP/Ftz11zjC1F2A2bOB3qI+iAGRAH89AUU2eEaQzQZgDFCr0M+
         Jv8bQvAkzWQQw0iR2irr4/VO2Rd1O+eFrsgptLDQy8yi4xDMhlQS9JyKgH8V6OZI9B
         5jZAZupTC33qQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jeff Moyer <jmoyer@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Vishal Verma <vishal.l.verma@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: add an option to suppress 'exported twice' warnings
Date:   Wed,  6 Nov 2019 20:23:57 +0900
Message-Id: <20191106112357.29053-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit "modpost: do not set ->preloaded for symbols from
Module.symvers", the modpost always warns about symbols exported
multiple times.

Generally, I believe it is a good thing to show a warning when the
same symbol name is exported twice. This avoids the accidental symbol
conflict.

However, in some cases, we build an external module to provide a
different version/variant of the in-kernel module, overriding the
same set of exported symbols.

At least, there is one use-case in the upstream code;
tools/testing/nvdimm/libnvdimm.ko replaces drivers/nvdimm/libnvdimm.ko
in order to link it against mocked version of core kernel symbols.

Now, this emits a lots of 'exported twice' warnings:

  https://lkml.org/lkml/2019/10/31/627

To suppress those, add a new option KBUILD_DUPLICATED_EXPORTS_NO_WARN.

If you intentionally override the existing symbols, you can pass it
from the command line:

  make M=tools/testing/nvdimm KBUILD_DUPLICATED_EXPORTS_NO_WARN=1

Or, more conveniently, you can add it to the module Makefile, so
you can still do:

  make M=tools/testing/nvdimm

without sprinkling the warnings.

Reported-by: Jeff Moyer <jmoyer@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Jeff Moyer,
Dan Williams,

Please check if this patch solves the nvdimm build issue.


 Documentation/kbuild/kbuild.rst | 7 +++++++
 scripts/Makefile.modpost        | 1 +
 scripts/mod/modpost.c           | 9 +++++++--
 tools/testing/nvdimm/Kbuild     | 4 ++++
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index f1e5dce86af7..8ff0935f9e7f 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -223,6 +223,13 @@ KBUILD_SIGN_PIN
 This variable allows a passphrase or PIN to be passed to the sign-file
 utility when signing kernel modules, if the private key requires such.
 
+KBUILD_DUPLICATED_EXPORTS_NO_WARN
+---------------------------------
+This variable can be set to suppress warnings about symbols exported
+multiple times. This is useful when you are building an external module
+to provide a different version of an in-tree module.
+
+
 KBUILD_MODPOST_WARN
 -------------------
 KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8359f8af5ee6..52e50ac45688 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -53,6 +53,7 @@ MODPOST = scripts/mod/modpost						\
 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
+	$(if $(KBUILD_DUPLICATED_EXPORTS_NO_WARN),-W)			\
 	$(if $(KBUILD_MODPOST_WARN),-w)
 
 ifdef MODPOST_VMLINUX
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f70b924f379f..858568f4edb4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,6 +33,8 @@ static int external_module = 0;
 static int vmlinux_section_warnings = 1;
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
+/* Warn about symbols exported multiple times */
+static int warn_duplicated_exports = 1;
 /* How a symbol is exported */
 static int sec_mismatch_count = 0;
 static int sec_mismatch_fatal = 0;
@@ -382,7 +384,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	if (!s) {
 		s = new_symbol(name, mod, export);
 	} else {
-		if (!s->preloaded) {
+		if (warn_duplicated_exports && !s->preloaded) {
 			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
 			     mod->name, name, s->module->name,
 			     is_vmlinux(s->module->name) ? "" : ".ko");
@@ -2559,7 +2561,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awEd:")) != -1) {
+	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awWEd:")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -2594,6 +2596,9 @@ int main(int argc, char **argv)
 		case 'w':
 			warn_unresolved = 1;
 			break;
+		case 'W':
+			warn_duplicated_exports = 0;
+			break;
 		case 'E':
 			sec_mismatch_fatal = 1;
 			break;
diff --git a/tools/testing/nvdimm/Kbuild b/tools/testing/nvdimm/Kbuild
index c4a9196d794c..c848374f3b0b 100644
--- a/tools/testing/nvdimm/Kbuild
+++ b/tools/testing/nvdimm/Kbuild
@@ -93,4 +93,8 @@ libnvdimm-y += dimm_devs.o
 libnvdimm-y += libnvdimm_test.o
 libnvdimm-y += config_check.o
 
+# This intentionally overrides the original libnvdimm.ko
+# Suppress 'exported twice' warnings from the modpost.
+KBUILD_DUPLICATED_EXPORTS_NO_WARN := 1
+
 obj-m += test/
-- 
2.17.1

