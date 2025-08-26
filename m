Return-Path: <linux-kbuild+bounces-8615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249BB36692
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 15:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873FE9806A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AC5350D64;
	Tue, 26 Aug 2025 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMQkK2lt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912934F48D;
	Tue, 26 Aug 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216159; cv=none; b=GR1aPBSWwI9Sk+g/YVlFFZg2NexGvdjfBUdmk9e7Mx5esam0KP2WId1VhR6kz0uRffNRH/24e1efhTaKGTO6vmuFM7nVP7t03mNBzM5e/IkX2MyxBpFmUI9ycwviWUilwqO59UKDPF+bd47KDf/Mi0qmuMCzU+oYarwcF/asLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216159; c=relaxed/simple;
	bh=rDrE2LuCwBUXw/qV6662Y0R+FHQHPqF/g7vGGsTqNTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+n9B21oKGqDLr8DsyVqzV+WFAwJNHqW02n+dEgVoeiMN1ZWUXOB9wwo6uPd4StbGoh5R5c2A2NkDbP+t8gffgrLt3MfwfYYX2S0yefEejr2NhClQAFCyTrsU0Y2W1xhzR9D79+lJsc6LbLg3jSJOMd2VLS5BFM50tFVhtbYed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMQkK2lt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEB0C113D0;
	Tue, 26 Aug 2025 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216158;
	bh=rDrE2LuCwBUXw/qV6662Y0R+FHQHPqF/g7vGGsTqNTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMQkK2ltqDxzk200ymufi2QORcOKf2CoqCrNbBkhP3ehZW8d0qRQATQHIuJl/1Pn3
	 0G1acvsoAq4xIIsHHbd+2GyqaV3HWWt3r9E4jEBMfV8BYYnAqpCoXjkQl+EHACiNB1
	 JK9GIdyRUukB0/v6xn6KA3YKcCsjakrW6qV4nxAlntCk23Ysnk/rFR2ZYPgzteybSK
	 vWqu1Srb763+C26NJGXhmfaATmw1oxFP1NaCoVIXMPp7a4iNpOCv0MGjOYeZP9p2Fs
	 BHAzLx1yhtNnPXfSddI5rupI3Q/greVVl3PU2HyQh7fMQiz6N8Z6RKkOnQ6lT8ZDsM
	 xgKRaO/Uzcy4A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqu31-00000000Fat-0obV;
	Tue, 26 Aug 2025 15:49:15 +0200
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
Subject: [PATCH 1/1] docs: add support to build manpages from kerneldoc output
Date: Tue, 26 Aug 2025 15:49:04 +0200
Message-ID: <423d8460d5fa040d2499b5a5af341e2dc1377881.1756215924.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756215924.git.mchehab+huawei@kernel.org>
References: <cover.1756215924.git.mchehab+huawei@kernel.org>
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
 scripts/split-man.pl                   | 28 ----------
 tools/docs/sphinx-build-wrapper        | 77 ++++++++++++++++++++++++--
 5 files changed, 80 insertions(+), 49 deletions(-)
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
index eaca0900bd5c..2f06df744e27 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -79,6 +79,7 @@ TARGETS = {
     "epubdocs":      { "builder": "epub",    "out_dir": "epub" },
     "texinfodocs":   { "builder": "texinfo", "out_dir": "texinfo" },
     "infodocs":      { "builder": "texinfo", "out_dir": "texinfo" },
+    "mandocs":       { "builder": "man",     "out_dir": "man" },
     "latexdocs":     { "builder": "latex",   "out_dir": "latex" },
     "pdfdocs":       { "builder": "latex",   "out_dir": "latex" },
     "xmldocs":       { "builder": "xml",     "out_dir": "xml" },
@@ -458,6 +459,71 @@ class SphinxBuilder:
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
     def cleandocs(self, builder):
 
         shutil.rmtree(self.builddir, ignore_errors=True)
@@ -574,10 +640,13 @@ class SphinxBuilder:
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


