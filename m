Return-Path: <linux-kbuild+bounces-8679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D22B3EB18
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 17:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0A164856CF
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 15:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C352DF155;
	Mon,  1 Sep 2025 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBc1VU8E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46F2DF140;
	Mon,  1 Sep 2025 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756740838; cv=none; b=Q5sEFKrdvy7kHoqTVxG0LZhjRUS49K2X6CKSd1IFto7QYTwkUb1YhdlxSSsFo9QvfSK9rOL5ALwzgqZGovAbJm31SI3fyxTM/etfEIPMBAFVhyUyldj0ttyuVJKrD9puBS8X/Xn1Qzv7BIk8dYne1M3lrr6BaFFb/Qxr1G3ZWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756740838; c=relaxed/simple;
	bh=ns7DJA82/e6Ob35Yqd44aeEBJ4lyhEECsaqn+k5IhSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJgfSSA7g8DoZEyPWD1Nh0fSXZ1nni+pouy97yfgXyDqKoJxRnTQzywffSMdhjrFOn+g1kSJGx56PAWb5QFWmS9o9MrwXEB3CgqGvyP5AsSt6L7vGws/ITlgoFoRLG1eEF0r3Aq5KDQGkwBXabCH4rBvqjCh2yob3ZLzyD/PDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBc1VU8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B877C19425;
	Mon,  1 Sep 2025 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756740837;
	bh=ns7DJA82/e6Ob35Yqd44aeEBJ4lyhEECsaqn+k5IhSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OBc1VU8E9d97bGmx97yhQXup/GDYG2yxTinkx+GUwYQnKNRTwNcUgay4wF0IeqM/W
	 KMDpfG/ZHldp4rm1svSMD8h+S1StplLfwTH6i8ZqeeCFJZIm2NoPo/jkU6Umtp/Lq7
	 wamc8G86jWKxDjW8eqMNiwj3aPSHZ4IIN1HZj1VwZc//0WZZHfSOEGAuFVGn9MRB51
	 azUYb2p9W9aEFtvSobJqdxgRPKAKgwn52N6aa7vO48p+KLNIJx+x8fn+UEdZ3MlIru
	 T7jRvQz/SsuK4adbZ7AERRD/atDx4dnIvZuFAvlNhBY87LjdDmgxM1cXZW+qjMXUYZ
	 MeNl3f25kYUUw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1ut6Xb-00000003HMU-3op5;
	Mon, 01 Sep 2025 17:33:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3 14/15] docs: add support to build manpages from
  kerneldoc output
Date: Mon,  1 Sep 2025 17:33:49 +0200
Message-ID: <ac7d1293de2ae907abdfbe30f10e974c2321503a.1756740314.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756740314.git.mchehab+huawei@kernel.org>
References: <cover.1756740314.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Generating man files currently requires running a separate=0D
script. The target also doesn't appear at the docs Makefile.=0D
=0D
Add support for mandocs at the Makefile, adding the build=0D
logic inside sphinx-build-wrapper, updating documentation=0D
and dropping the ancillary script.=0D
=0D
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>=0D
---=0D
 Documentation/Makefile                 |  3 +-=0D
 Documentation/doc-guide/kernel-doc.rst | 29 ++++-----=0D
 Makefile                               |  2 +-=0D
 scripts/split-man.pl                   | 28 ---------=0D
 tools/docs/sphinx-build-wrapper        | 81 ++++++++++++++++++++++++--=0D
 5 files changed, 95 insertions(+), 48 deletions(-)=0D
 delete mode 100755 scripts/split-man.pl=0D
=0D
diff --git a/Documentation/Makefile b/Documentation/Makefile=0D
index 3e1cb44a5fbb..22e39e5ed07d 100644=0D
--- a/Documentation/Makefile=0D
+++ b/Documentation/Makefile=0D
@@ -53,7 +53,7 @@ ifeq ($(HAVE_SPHINX),0)=0D
 else # HAVE_SPHINX=0D
 =0D
 # Common documentation targets=0D
-infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:=0D
+mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckd=
ocs:=0D
 	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check=0D
 	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \=0D
 		--sphinxdirs=3D"$(SPHINXDIRS)" --conf=3D$(SPHINX_CONF) \=0D
@@ -104,6 +104,7 @@ dochelp:=0D
 	@echo  '  htmldocs        - HTML'=0D
 	@echo  '  texinfodocs     - Texinfo'=0D
 	@echo  '  infodocs        - Info'=0D
+	@echo  '  mandocs         - Man pages'=0D
 	@echo  '  latexdocs       - LaTeX'=0D
 	@echo  '  pdfdocs         - PDF'=0D
 	@echo  '  epubdocs        - EPUB'=0D
diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-gui=
de/kernel-doc.rst=0D
index af9697e60165..4370cc8fbcf5 100644=0D
--- a/Documentation/doc-guide/kernel-doc.rst=0D
+++ b/Documentation/doc-guide/kernel-doc.rst=0D
@@ -579,20 +579,23 @@ source.=0D
 How to use kernel-doc to generate man pages=0D
 -------------------------------------------=0D
 =0D
-If you just want to use kernel-doc to generate man pages you can do this=0D
-from the kernel git tree::=0D
+To generate man pages for all files that contain kernel-doc markups, run::=
=0D
 =0D
-  $ scripts/kernel-doc -man \=0D
-    $(git grep -l '/\*\*' -- :^Documentation :^tools) \=0D
-    | scripts/split-man.pl /tmp/man=0D
+  $ make mandocs=0D
 =0D
-Some older versions of git do not support some of the variants of syntax f=
or=0D
-path exclusion.  One of the following commands may work for those versions=
::=0D
+Or calling ``script-build-wrapper`` directly::=0D
 =0D
-  $ scripts/kernel-doc -man \=0D
-    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \=0D
-    | scripts/split-man.pl /tmp/man=0D
+  $ ./tools/docs/sphinx-build-wrapper mandocs=0D
 =0D
-  $ scripts/kernel-doc -man \=0D
-    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools"=
) \=0D
-    | scripts/split-man.pl /tmp/man=0D
+The output will be at ``/man`` directory inside the output directory=0D
+(by default: ``Documentation/output``).=0D
+=0D
+Optionally, it is possible to generate a partial set of man pages by=0D
+using SPHINXDIRS:=0D
+=0D
+  $ make SPHINXDIRS=3Ddriver-api/media mandocs=0D
+=0D
+.. note::=0D
+=0D
+   When SPHINXDIRS=3D{subdir} is used, it will only generate man pages for=
=0D
+   the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` file=
.=0D
diff --git a/Makefile b/Makefile=0D
index 6bfe776bf3c5..9bd44afeda26 100644=0D
--- a/Makefile=0D
+++ b/Makefile=0D
@@ -1800,7 +1800,7 @@ $(help-board-dirs): help-%:=0D
 # Documentation targets=0D
 # ------------------------------------------------------------------------=
---=0D
 DOC_TARGETS :=3D xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \=0D
-	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs=0D
+	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs mandocs=0D
 PHONY +=3D $(DOC_TARGETS)=0D
 $(DOC_TARGETS):=0D
 	$(Q)$(MAKE) $(build)=3DDocumentation $@=0D
diff --git a/scripts/split-man.pl b/scripts/split-man.pl=0D
deleted file mode 100755=0D
index 96bd99dc977a..000000000000=0D
--- a/scripts/split-man.pl=0D
+++ /dev/null=0D
@@ -1,28 +0,0 @@=0D
-#!/usr/bin/env perl=0D
-# SPDX-License-Identifier: GPL-2.0=0D
-#=0D
-# Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>=0D
-#=0D
-# Produce manpages from kernel-doc.=0D
-# See Documentation/doc-guide/kernel-doc.rst for instructions=0D
-=0D
-if ($#ARGV < 0) {=0D
-   die "where do I put the results?\n";=0D
-}=0D
-=0D
-mkdir $ARGV[0],0777;=0D
-$state =3D 0;=0D
-while (<STDIN>) {=0D
-    if (/^\.TH \"[^\"]*\" 9 \"([^\"]*)\"/) {=0D
-	if ($state =3D=3D 1) { close OUT }=0D
-	$state =3D 1;=0D
-	$fn =3D "$ARGV[0]/$1.9";=0D
-	print STDERR "Creating $fn\n";=0D
-	open OUT, ">$fn" or die "can't open $fn: $!\n";=0D
-	print OUT $_;=0D
-    } elsif ($state !=3D 0) {=0D
-	print OUT $_;=0D
-    }=0D
-}=0D
-=0D
-close OUT;=0D
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrap=
per=0D
index c884022ad733..932b1b675274 100755=0D
--- a/tools/docs/sphinx-build-wrapper=0D
+++ b/tools/docs/sphinx-build-wrapper=0D
@@ -47,6 +47,7 @@ the newer version.=0D
 import argparse=0D
 import locale=0D
 import os=0D
+import re=0D
 import shlex=0D
 import shutil=0D
 import subprocess=0D
@@ -55,6 +56,7 @@ import sys=0D
 from concurrent import futures=0D
 =0D
 from lib.python_version import PythonVersion=0D
+from glob import glob=0D
 =0D
 LIB_DIR =3D "../../scripts/lib"=0D
 SRC_DIR =3D os.path.dirname(os.path.realpath(__file__))=0D
@@ -77,6 +79,7 @@ TARGETS =3D {=0D
     "epubdocs":      { "builder": "epub",    "out_dir": "epub" },=0D
     "texinfodocs":   { "builder": "texinfo", "out_dir": "texinfo" },=0D
     "infodocs":      { "builder": "texinfo", "out_dir": "texinfo" },=0D
+    "mandocs":       { "builder": "man",     "out_dir": "man" },=0D
     "latexdocs":     { "builder": "latex",   "out_dir": "latex" },=0D
     "pdfdocs":       { "builder": "latex",   "out_dir": "latex" },=0D
     "xmldocs":       { "builder": "xml",     "out_dir": "xml" },=0D
@@ -455,6 +458,71 @@ class SphinxBuilder:=0D
             except subprocess.CalledProcessError as e:=0D
                 sys.exit(f"Error generating info docs: {e}")=0D
 =0D
+    def handle_man(self, kerneldoc, docs_dir, src_dir, output_dir):=0D
+        """=0D
+        Create man pages from kernel-doc output=0D
+        """=0D
+=0D
+        re_kernel_doc =3D re.compile(r"^\.\.\s+kernel-doc::\s*(\S+)")=0D
+        re_man =3D re.compile(r'^\.TH "[^"]*" (\d+) "([^"]*)"')=0D
+=0D
+        if docs_dir =3D=3D src_dir:=0D
+            #=0D
+            # Pick the entire set of kernel-doc markups from the entire tr=
ee=0D
+            #=0D
+            kdoc_files =3D set([self.srctree])=0D
+        else:=0D
+            kdoc_files =3D set()=0D
+=0D
+            for fname in glob(os.path.join(src_dir, "**"), recursive=3DTru=
e):=0D
+                if os.path.isfile(fname) and fname.endswith(".rst"):=0D
+                    with open(fname, "r", encoding=3D"utf-8") as in_fp:=0D
+                        data =3D in_fp.read()=0D
+=0D
+                    for line in data.split("\n"):=0D
+                        match =3D re_kernel_doc.match(line)=0D
+                        if match:=0D
+                            if os.path.isfile(match.group(1)):=0D
+                                kdoc_files.add(match.group(1))=0D
+=0D
+        if not kdoc_files:=0D
+                sys.exit(f"Directory {src_dir} doesn't contain kernel-doc =
tags")=0D
+=0D
+        cmd =3D [ kerneldoc, "-m" ] + sorted(kdoc_files)=0D
+        try:=0D
+            if self.verbose:=0D
+                print(" ".join(cmd))=0D
+=0D
+            result =3D subprocess.run(cmd, stdout=3Dsubprocess.PIPE, text=
=3D True)=0D
+=0D
+            if result.returncode:=0D
+                print(f"Warning: kernel-doc returned {result.returncode} w=
arnings")=0D
+=0D
+        except (OSError, ValueError, subprocess.SubprocessError) as e:=0D
+            sys.exit(f"Failed to create man pages for {src_dir}: {repr(e)}=
")=0D
+=0D
+        fp =3D None=0D
+        try:=0D
+            for line in result.stdout.split("\n"):=0D
+                match =3D re_man.match(line)=0D
+                if not match:=0D
+                    if fp:=0D
+                        fp.write(line + '\n')=0D
+                    continue=0D
+=0D
+                if fp:=0D
+                    fp.close()=0D
+=0D
+                fname =3D f"{output_dir}/{match.group(2)}.{match.group(1)}=
"=0D
+=0D
+                if self.verbose:=0D
+                    print(f"Creating {fname}")=0D
+                fp =3D open(fname, "w", encoding=3D"utf-8")=0D
+                fp.write(line + '\n')=0D
+        finally:=0D
+            if fp:=0D
+                fp.close()=0D
+=0D
     def cleandocs(self, builder):           # pylint: disable=3DW0613=0D
         """Remove documentation output directory"""=0D
         shutil.rmtree(self.builddir, ignore_errors=3DTrue)=0D
@@ -483,7 +551,7 @@ class SphinxBuilder:=0D
         # Other targets require sphinx-build, so check if it exists=0D
         #=0D
         sphinxbuild =3D shutil.which(self.sphinxbuild, path=3Dself.env["PA=
TH"])=0D
-        if not sphinxbuild:=0D
+        if not sphinxbuild and target !=3D "mandocs":=0D
             sys.exit(f"Error: {self.sphinxbuild} not found in PATH.\n")=0D
 =0D
         if builder =3D=3D "latex":=0D
@@ -572,10 +640,13 @@ class SphinxBuilder:=0D
                 output_dir,=0D
             ]=0D
 =0D
-            try:=0D
-                self.run_sphinx(sphinxbuild, build_args, env=3Dself.env)=0D
-            except (OSError, ValueError, subprocess.SubprocessError) as e:=
=0D
-                sys.exit(f"Build failed: {repr(e)}")=0D
+            if target =3D=3D "mandocs":=0D
+                self.handle_man(kerneldoc, docs_dir, src_dir, output_dir)=
=0D
+            else:=0D
+                try:=0D
+                    self.run_sphinx(sphinxbuild, build_args, env=3Dself.en=
v)=0D
+                except (OSError, ValueError, subprocess.SubprocessError) a=
s e:=0D
+                    sys.exit(f"Build failed: {repr(e)}")=0D
 =0D
             #=0D
             # Ensure that each html/epub output will have needed static fi=
les=0D
-- =0D
2.51.0=0D
=0D

