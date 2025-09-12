Return-Path: <linux-kbuild+bounces-8812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA4B54B65
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Sep 2025 13:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0DB91BC35DE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Sep 2025 11:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629BD30215E;
	Fri, 12 Sep 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK2uBJus"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19670301499;
	Fri, 12 Sep 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677595; cv=none; b=tdpTqIxt+0pOTLUpD+0VONJD2Suall7FRxUpOenXUvJMAlL9wQNjj+NKj7u7ACGFBtSLQVpaqeyy2GabXRPIpn3rL3O89nvEve97jAXDAUYFFMnGEaqh76o9iCNIw9i2M0nR4LssNGlP8VHAMapNWaC4RsAUpyw6f7pFnTPGTH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677595; c=relaxed/simple;
	bh=TTDb0yOysoY0A64ZbSZAyva+6mhJiNzjtarPkXDHNbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ha1C0xwUj6zxGqlsYgMQg+DF8fSKBMcXAOh9XAHYwvCT3hhRenZGohzLZWUrRCcZp1KzL8fdIwIGNjXUNpduVvP5NpHPz+YvIeyU911iIJ1GyXMRYm+f/obITPPTkr8qr/XZG6tG1ix1GUU49OtKW0m/Dim6sj0f5vtnlPB4quA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK2uBJus; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9916DC2BC86;
	Fri, 12 Sep 2025 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757677594;
	bh=TTDb0yOysoY0A64ZbSZAyva+6mhJiNzjtarPkXDHNbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QK2uBJusCPZRd/yrifENIcGOsFJdwl8We0VAoh7Xbh1qM42LEzx7Nc/+qZfZ4txDJ
	 WZnQNQeYi6hRa/caWIyjnldHxMU0WNK8q23yGaSuxe/7lrm7ujBXbwN5hCP9lTCM/S
	 u8AjTcg7+u3ARPzsZtvb5rp2NhBfaIuxU2vxre3pMqSZ9tEaZ6bH2R3oTPmr4VW1Hg
	 uQWRhVlqP+VTB/uIiaiFVhkE8mTFvn3j3pXMj2QBw+HfoikaK4BYp5RngirsSjDTcS
	 hNesp++7WDUN+sYr4t4hUppr9ZmWHEG9pShPdSjLjfRO0Y+1lM9DFri2EBFG5xbxJM
	 90iyXIJXhFp6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1ux2Ea-00000008Rsr-3f0A;
	Fri, 12 Sep 2025 13:46:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/18] docs: add support to build manpages from kerneldoc output
Date: Fri, 12 Sep 2025 13:46:22 +0200
Message-ID: <ef73c552ccd46f6b6d2549c5cec1d6bcf01a888a.1757677427.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1757677427.git.mchehab+huawei@kernel.org>
References: <cover.1757677427.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Generating man files currently requires running a separate
script. The target also doesn't appear at the docs Makefile.

Add support for mandocs at the Makefile, adding the build
logic inside sphinx-build-wrapper, updating documentation
and dropping the ancillary script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile                 |  3 +-
 Documentation/doc-guide/kernel-doc.rst | 29 ++++-----
 Makefile                               |  2 +-
 scripts/split-man.pl                   | 28 ---------
 tools/docs/sphinx-build-wrapper        | 81 ++++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 48 deletions(-)
 delete mode 100755 scripts/split-man.pl

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 0e1d8657a5cc..f9b6e9386a58 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -53,7 +53,7 @@ ifeq ($(HAVE_SPHINX),0)
 else # HAVE_SPHINX
 
 # Common documentation targets
-infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
+mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
 	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
 	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
 		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
@@ -106,6 +106,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  texinfodocs     - Texinfo'
 	@echo  '  infodocs        - Info'
+	@echo  '  mandocs         - Man pages'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
 	@echo  '  epubdocs        - EPUB'
diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index af9697e60165..4370cc8fbcf5 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -579,20 +579,23 @@ source.
 How to use kernel-doc to generate man pages
 -------------------------------------------
 
-If you just want to use kernel-doc to generate man pages you can do this
-from the kernel git tree::
+To generate man pages for all files that contain kernel-doc markups, run::
 
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- :^Documentation :^tools) \
-    | scripts/split-man.pl /tmp/man
+  $ make mandocs
 
-Some older versions of git do not support some of the variants of syntax for
-path exclusion.  One of the following commands may work for those versions::
+Or calling ``script-build-wrapper`` directly::
 
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
-    | scripts/split-man.pl /tmp/man
+  $ ./tools/docs/sphinx-build-wrapper mandocs
 
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
-    | scripts/split-man.pl /tmp/man
+The output will be at ``/man`` directory inside the output directory
+(by default: ``Documentation/output``).
+
+Optionally, it is possible to generate a partial set of man pages by
+using SPHINXDIRS:
+
+  $ make SPHINXDIRS=driver-api/media mandocs
+
+.. note::
+
+   When SPHINXDIRS={subdir} is used, it will only generate man pages for
+   the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` file.
diff --git a/Makefile b/Makefile
index 6bfe776bf3c5..9bd44afeda26 100644
--- a/Makefile
+++ b/Makefile
@@ -1800,7 +1800,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
+	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs mandocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
diff --git a/scripts/split-man.pl b/scripts/split-man.pl
deleted file mode 100755
index 96bd99dc977a..000000000000
--- a/scripts/split-man.pl
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0
-#
-# Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
-#
-# Produce manpages from kernel-doc.
-# See Documentation/doc-guide/kernel-doc.rst for instructions
-
-if ($#ARGV < 0) {
-   die "where do I put the results?\n";
-}
-
-mkdir $ARGV[0],0777;
-$state = 0;
-while (<STDIN>) {
-    if (/^\.TH \"[^\"]*\" 9 \"([^\"]*)\"/) {
-	if ($state == 1) { close OUT }
-	$state = 1;
-	$fn = "$ARGV[0]/$1.9";
-	print STDERR "Creating $fn\n";
-	open OUT, ">$fn" or die "can't open $fn: $!\n";
-	print OUT $_;
-    } elsif ($state != 0) {
-	print OUT $_;
-    }
-}
-
-close OUT;
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index d66bb337ba1f..94077b9773d8 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -47,6 +47,7 @@ the newer version.
 import argparse
 import locale
 import os
+import re
 import shlex
 import shutil
 import subprocess
@@ -55,6 +56,7 @@ import sys
 from concurrent import futures
 
 from lib.python_version import PythonVersion
+from glob import glob
 
 LIB_DIR = "../../scripts/lib"
 SRC_DIR = os.path.dirname(os.path.realpath(__file__))
@@ -77,6 +79,7 @@ TARGETS = {
     "epubdocs":      { "builder": "epub",    "out_dir": "epub" },
     "texinfodocs":   { "builder": "texinfo", "out_dir": "texinfo" },
     "infodocs":      { "builder": "texinfo", "out_dir": "texinfo" },
+    "mandocs":       { "builder": "man",     "out_dir": "man" },
     "latexdocs":     { "builder": "latex",   "out_dir": "latex" },
     "pdfdocs":       { "builder": "latex",   "out_dir": "latex" },
     "xmldocs":       { "builder": "xml",     "out_dir": "xml" },
@@ -491,6 +494,71 @@ class SphinxBuilder:
             except subprocess.CalledProcessError as e:
                 sys.exit(f"Error generating info docs: {e}")
 
+    def handle_man(self, kerneldoc, docs_dir, src_dir, output_dir):
+        """
+        Create man pages from kernel-doc output
+        """
+
+        re_kernel_doc = re.compile(r"^\.\.\s+kernel-doc::\s*(\S+)")
+        re_man = re.compile(r'^\.TH "[^"]*" (\d+) "([^"]*)"')
+
+        if docs_dir == src_dir:
+            #
+            # Pick the entire set of kernel-doc markups from the entire tree
+            #
+            kdoc_files = set([self.srctree])
+        else:
+            kdoc_files = set()
+
+            for fname in glob(os.path.join(src_dir, "**"), recursive=True):
+                if os.path.isfile(fname) and fname.endswith(".rst"):
+                    with open(fname, "r", encoding="utf-8") as in_fp:
+                        data = in_fp.read()
+
+                    for line in data.split("\n"):
+                        match = re_kernel_doc.match(line)
+                        if match:
+                            if os.path.isfile(match.group(1)):
+                                kdoc_files.add(match.group(1))
+
+        if not kdoc_files:
+                sys.exit(f"Directory {src_dir} doesn't contain kernel-doc tags")
+
+        cmd = [ kerneldoc, "-m" ] + sorted(kdoc_files)
+        try:
+            if self.verbose:
+                print(" ".join(cmd))
+
+            result = subprocess.run(cmd, stdout=subprocess.PIPE, text= True)
+
+            if result.returncode:
+                print(f"Warning: kernel-doc returned {result.returncode} warnings")
+
+        except (OSError, ValueError, subprocess.SubprocessError) as e:
+            sys.exit(f"Failed to create man pages for {src_dir}: {repr(e)}")
+
+        fp = None
+        try:
+            for line in result.stdout.split("\n"):
+                match = re_man.match(line)
+                if not match:
+                    if fp:
+                        fp.write(line + '\n')
+                    continue
+
+                if fp:
+                    fp.close()
+
+                fname = f"{output_dir}/{match.group(2)}.{match.group(1)}"
+
+                if self.verbose:
+                    print(f"Creating {fname}")
+                fp = open(fname, "w", encoding="utf-8")
+                fp.write(line + '\n')
+        finally:
+            if fp:
+                fp.close()
+
     def cleandocs(self, builder):           # pylint: disable=W0613
         """Remove documentation output directory"""
         shutil.rmtree(self.builddir, ignore_errors=True)
@@ -519,7 +587,7 @@ class SphinxBuilder:
         # Other targets require sphinx-build, so check if it exists
         #
         sphinxbuild = shutil.which(self.sphinxbuild, path=self.env["PATH"])
-        if not sphinxbuild:
+        if not sphinxbuild and target != "mandocs":
             sys.exit(f"Error: {self.sphinxbuild} not found in PATH.\n")
 
         if builder == "latex":
@@ -607,10 +675,13 @@ class SphinxBuilder:
                 output_dir,
             ]
 
-            try:
-                self.run_sphinx(sphinxbuild, build_args, env=self.env)
-            except (OSError, ValueError, subprocess.SubprocessError) as e:
-                sys.exit(f"Build failed: {repr(e)}")
+            if target == "mandocs":
+                self.handle_man(kerneldoc, docs_dir, src_dir, output_dir)
+            else:
+                try:
+                    self.run_sphinx(sphinxbuild, build_args, env=self.env)
+                except (OSError, ValueError, subprocess.SubprocessError) as e:
+                    sys.exit(f"Build failed: {repr(e)}")
 
             #
             # Ensure that each html/epub output will have needed static files
-- 
2.51.0


