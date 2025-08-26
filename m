Return-Path: <linux-kbuild+bounces-8617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84739B36EFE
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 17:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A821BC4680
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 15:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136552D061C;
	Tue, 26 Aug 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUlV2HVd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596637058A;
	Tue, 26 Aug 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756223358; cv=none; b=FUH1KKstlSjywCQNaztwKKM5l8AqEAWGjGaZpIZD0doOnEFDaBTlOjLZGOmkg94cZPTINy3Pm3v5gH789DAsvT+f0dyWXhlVAg/NwUbELadqLf/4Ou6CPblUgeX7dsHzfVDlkXmOfSelJ6TwZPqp353cZ7lUqZ6GlzHTKocbBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756223358; c=relaxed/simple;
	bh=X9s6npeijzx2e8RuWVsfHp0sMZM4hSTDc6YhzlO/O2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDWNLnplvifOpuT6U2DTPKnbLvKVfFhUDpwcjq2X4M2K0mvhlwERk0vQvcrDGSkUBMFFXFyhcBDLh+nWQeue/ZqAKsdlxnDcJSvyGpmF7l/ZIMDo3PjqeWPgz/FRV8/C5xRAN2GGRaKZl9DFjxnfiR+PshiPMg+fdAUxZgoIjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUlV2HVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4636DC116D0;
	Tue, 26 Aug 2025 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756223357;
	bh=X9s6npeijzx2e8RuWVsfHp0sMZM4hSTDc6YhzlO/O2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QUlV2HVdZw+1q0B9EtylJgKw2UjPiPGTXcN7kuOu7itm8agTwhI84cm+4iR21z7Hp
	 AODalPPUBxdadG6JogzF+q5lcSXNyamPJozei1eexofm3z450GyykGjfP/8wh4f9Ug
	 CBVzEy5Ra9PYfBsE+ISlO3R6xhygdOguCL2XKQf+n4sM7+8LnJpZpDrCO7v2Z/UU3l
	 kkAQUK0TsgJtq6fW6X59/9GGcSFoZx3jja+ydrNzs21BUTc2VeYfwJicm4cKLU/r06
	 778C6zE5Ub6KX095KkLuLfLNhMOo6qW5Su16L///IhVyXgevQfOYkViu+YRn8aUs+l
	 AkxrJTwpjwAAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqvv9-00000000JRz-0chJ;
	Tue, 26 Aug 2025 17:49:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <mchehab+huawei@kernel.org>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] docs: add support to build manpages from kerneldoc output
Date: Tue, 26 Aug 2025 17:49:02 +0200
Message-ID: <f97691336abb744b0c84c4369e4cb63ad993a1d8.1756222182.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756222182.git.mchehab+huawei@kernel.org>
References: <cover.1756222182.git.mchehab+huawei@kernel.org>
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
 Documentation/doc-guide/kernel-doc.rst | 19 ++-----
 Makefile                               |  2 +-
 scripts/split-man.pl                   | 28 ---------
 tools/docs/sphinx-build-wrapper        | 78 ++++++++++++++++++++++++--
 5 files changed, 81 insertions(+), 49 deletions(-)
 delete mode 100755 scripts/split-man.pl

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 3e1cb44a5fbb..22e39e5ed07d 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -53,7 +53,7 @@ ifeq ($(HAVE_SPHINX),0)
 else # HAVE_SPHINX
 
 # Common documentation targets
-infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
+mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
 	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
 	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
 		--sphinxdirs="$(SPHINXDIRS)" --conf=$(SPHINX_CONF) \
@@ -104,6 +104,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  texinfodocs     - Texinfo'
 	@echo  '  infodocs        - Info'
+	@echo  '  mandocs         - Man pages'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
 	@echo  '  epubdocs        - EPUB'
diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index af9697e60165..d85dcb08c87d 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -579,20 +579,9 @@ source.
 How to use kernel-doc to generate man pages
 -------------------------------------------
 
-If you just want to use kernel-doc to generate man pages you can do this
-from the kernel git tree::
+Generating man pages is a makefile target. Just run::
 
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- :^Documentation :^tools) \
-    | scripts/split-man.pl /tmp/man
+  $ make mandocs
 
-Some older versions of git do not support some of the variants of syntax for
-path exclusion.  One of the following commands may work for those versions::
-
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
-    | scripts/split-man.pl /tmp/man
-
-  $ scripts/kernel-doc -man \
-    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
-    | scripts/split-man.pl /tmp/man
+The output will be at ``/man`` directory inside the output directory
+(by default: ``Documentation/output``).
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
index c884022ad733..6dd6a73194bf 100755
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
@@ -77,6 +78,7 @@ TARGETS = {
     "epubdocs":      { "builder": "epub",    "out_dir": "epub" },
     "texinfodocs":   { "builder": "texinfo", "out_dir": "texinfo" },
     "infodocs":      { "builder": "texinfo", "out_dir": "texinfo" },
+    "mandocs":       { "builder": "man",     "out_dir": "man" },
     "latexdocs":     { "builder": "latex",   "out_dir": "latex" },
     "pdfdocs":       { "builder": "latex",   "out_dir": "latex" },
     "xmldocs":       { "builder": "xml",     "out_dir": "xml" },
@@ -455,6 +457,71 @@ class SphinxBuilder:
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
@@ -572,10 +639,13 @@ class SphinxBuilder:
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


