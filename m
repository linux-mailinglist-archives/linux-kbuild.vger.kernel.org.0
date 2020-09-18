Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2845327088B
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 23:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRVul (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 17:50:41 -0400
Received: from mga18.intel.com ([134.134.136.126]:52818 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726064AbgIRVul (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 17:50:41 -0400
IronPort-SDR: gxdJjfIq5FiVU2tR2anLVqhgbQNjbGignlwcBq3BkxHE5neOLVac0auMFEeZdqdDn/g+py5PQy
 qwFqIdn6Dejg==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="147788364"
X-IronPort-AV: E=Sophos;i="5.77,276,1596524400"; 
   d="scan'208";a="147788364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 14:50:32 -0700
IronPort-SDR: XYVmYjmO90sXANEXvQ0f5aRsogpF6JfBZo/VkvAEq522JRidVcPSUabodTRiPmUTY8d/9CUyLg
 32NyyNqwjTOw==
X-IronPort-AV: E=Sophos;i="5.77,276,1596524400"; 
   d="scan'208";a="347180777"
Received: from hseinige-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com) ([10.251.16.71])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 14:50:29 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Filipe Brandenburger <filbranden@google.com>,
        Greg Thelen <gthelen@google.com>,
        Michael Davidson <md@google.com>,
        Eugene Surovegin <surovegin@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] modpost: allow modpost to fail on warnings
Date:   Fri, 18 Sep 2020 16:50:10 -0500
Message-Id: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Filipe Brandenburger <filbranden@google.com>

Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
kbuild fail when modpost generates any warnings. This will avoid
misses such as [1] where the SOF CI did not catch a missing module
license.

This was initially contributed in 2016 [2], rebase/clean-ups and tests
by Pierre Bossart.

Test example:
$ KBUILD_MODPOST_FAIL_ON_WARNINGS=1 make
  GEN     Makefile
  DESCEND  objtool
  CALL    sof-dev/scripts/atomic/check-atomics.sh
  CALL    sof-dev/scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  MODPOST Module.symvers
Kernel: arch/x86/boot/bzImage is ready  (#13)
WARNING: modpost: missing MODULE_LICENSE() in sound/soc/intel/boards/snd-soc-sof-sdw.o
make[2]: *** [sof-dev/scripts/Makefile.modpost:114: Module.symvers] Error 2

[1] https://lkml.org/lkml/2020/9/17/2343
[2] https://patchwork.kernel.org/patch/8343431/

Signed-off-by: Filipe Brandenburger <filbranden@google.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Michael Davidson <md@google.com>
Cc: Eugene Surovegin <surovegin@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/kbuild/kbuild.rst |  5 +++++
 scripts/Makefile.modpost        |  5 ++++-
 scripts/mod/modpost.c           | 12 +++++++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 2d1fc03d346e..cc102aad8619 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -229,6 +229,11 @@ KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
 symbols in the final module linking stage. It changes such errors
 into warnings.
 
+KBUILD_MODPOST_FAIL_ON_WARNINGS
+-------------------------------
+KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to turn all warnings into
+errors in the final module linking stage.
+
 KBUILD_MODPOST_NOFINAL
 ----------------------
 KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f54b6ac37ac2..69297cd6f8ce 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -34,6 +34,8 @@
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
 # symbols in the final module linking stage
+# KBUILD_MODPOST_FAIL_ON_WARNINGS can be set to fail whenever modpost
+# generates warnings
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles
 
@@ -47,7 +49,8 @@ MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
-	$(if $(KBUILD_MODPOST_WARN),-w) \
+	$(if $(KBUILD_MODPOST_WARN),-w)							\
+	$(if $(KBUILD_MODPOST_FAIL_ON_WARNINGS),-F)					\
 	-o $@
 
 ifdef MODPOST_VMLINUX
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 69341b36f271..422f1cfca289 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -39,6 +39,9 @@ static int sec_mismatch_fatal = 0;
 static int ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
 static int allow_missing_ns_imports;
+/* Turn warnings into errors */
+static int fail_on_warnings;
+static int warnings_count;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -59,6 +62,7 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
 	switch (loglevel) {
 	case LOG_WARN:
 		fprintf(stderr, "WARNING: ");
+		warnings_count++;
 		break;
 	case LOG_ERROR:
 		fprintf(stderr, "ERROR: ");
@@ -2559,7 +2563,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awEFNd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2588,6 +2592,9 @@ int main(int argc, char **argv)
 		case 'w':
 			warn_unresolved = 1;
 			break;
+		case 'F':
+			fail_on_warnings = 1;
+			break;
 		case 'E':
 			sec_mismatch_fatal = 1;
 			break;
@@ -2671,5 +2678,8 @@ int main(int argc, char **argv)
 
 	free(buf.p);
 
+	if (fail_on_warnings && warnings_count)
+		err |= 2;
+
 	return err;
 }
-- 
2.25.1

