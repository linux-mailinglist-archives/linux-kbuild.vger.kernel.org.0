Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B96E3491D9
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 13:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhCYM0W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 08:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhCYM0A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 08:26:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C8A561A12;
        Thu, 25 Mar 2021 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616675160;
        bh=Mih9rLFk8Lu7pk6YCxhs8apnkDBsp2cbUA1ACAodMIQ=;
        h=From:To:Cc:Subject:Date:From;
        b=DDKtCMprV/OhoLcd3P+g/Aw0mUf9X/xVj2DPCuXxz+KCn/uqmqYznjAZSjhmVc7r1
         bXt3apPl8N3hTjkW6QlIAvIzAtcvNNuIDS+tjHt5jXXI3CqzWwLrBnZk68IkyxlzG9
         bqavRHdOgvEgp9Zp/JsRanIRLds8iZMOB8luDCD/hBkx89VEKLHthFXBU317+XI+Fe
         3t8UvOsTs+RGzTBzX+pMnL952KCWoQ+7cNsZkDPovSP6yv8o1IKo0gwdmcOWwg4qzw
         T8dih66pOUhDamgN8ImikwqafSav3OB3ZW7lvhhc9oBbnyhje7DqUYgl4vDiyL0TxV
         2t4Af/Wu09drA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lPP3l-001Cdg-U6; Thu, 25 Mar 2021 13:25:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3] docs: experimental: build PDF with rst2pdf
Date:   Thu, 25 Mar 2021 13:25:56 +0100
Message-Id: <e44c1b82b38a8568af1d38ee09edb46517f03ec2.1616675031.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add an experimental PDF builder using rst2pdf.

This extension is only enabled when "pdf" builder is selected.
So, it won't interfere with normal documentation builds. I opted
to not add a try..except block, as the message is already
good enough if one tries to do a "make rst2pdf" but the extension
is missed:

	Extension error:
	Could not import extension rst2pdf.pdfbuilder (exception: No module named 'rst2pdf')

This won't affect "make pdfdocs", as it uses the "latex" builder
instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

v3:
- only enable the rst2pdf extension when required, e. g. when

    $ make rst2pdf

  is used.

 Documentation/Makefile                     |  5 +++++
 Documentation/conf.py                      | 25 ++++++++++++++++------
 Documentation/sphinx/load_config.py        | 12 +++++++++++
 Documentation/userspace-api/media/Makefile |  1 +
 Makefile                                   |  4 ++--
 5 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 9c42dde97671..42b76f25681f 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -115,6 +115,10 @@ pdfdocs: latexdocs
 
 endif # HAVE_PDFLATEX
 
+rst2pdf:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),pdf,$(var)))
+
 epubdocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
@@ -140,6 +144,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
+	@echo  '  rst2pdf         - PDF, using experimental rst2pdf support'
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
 	@echo  '  linkcheckdocs   - check for broken external links'
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 879e86dbea66..65e6afa2cf58 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -118,6 +118,16 @@ autosectionlabel_maxdepth = 2
 
 extensions.append("sphinx.ext.imgmath")
 
+# Enable experimental rst2pdf, if available
+
+for i in range(1, len(sys.argv)):
+    if sys.argv[i] == "pdf":
+        try:
+            import rst2pdf
+            extensions.append('rst2pdf.pdfbuilder')
+        except ModuleNotFoundError:
+            raise SystemMessagePropagation("can't import rst2pdf extension")
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
@@ -553,12 +563,15 @@ epub_exclude_files = ['search.html']
 #
 # See the Sphinx chapter of https://ralsina.me/static/manual.pdf
 #
-# FIXME: Do not add the index file here; the result will be too big. Adding
-# multiple PDF files here actually tries to get the cross-referencing right
-# *between* PDF files.
-pdf_documents = [
-    ('kernel-documentation', u'Kernel', u'Kernel', u'J. Random Bozo'),
-]
+
+# Add all LaTeX files to PDF documents as well
+pdf_documents = []
+for l in latex_documents:
+    doc = l[0]
+    fn = l[1].replace(".tex", "")
+    name = l[2]
+    authors = l[3]
+    pdf_documents.append((doc, fn, name, authors))
 
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index eeb394b39e2c..8266afd438aa 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -43,6 +43,18 @@ def loadConfig(namespace):
 
             namespace['latex_documents'] = new_latex_docs
 
+            new_pdf_docs = []
+            pdf_documents = namespace['pdf_documents']
+
+            for l in pdf_documents:
+                if l[0].find(dir + '/') == 0:
+                    has = True
+                    fn = l[0][len(dir) + 1:]
+                    new_pdf_docs.append((fn, l[1], l[2], l[3]))
+                    break
+
+            namespace['pdf_documents'] = new_pdf_docs
+
         # If there is an extra conf.py file, load it
         if os.path.isfile(config_file):
             sys.stdout.write("load additional sphinx-config: %s\n" % config_file)
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 81a4a1a53bce..8c6b3ac4ecb0 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -59,6 +59,7 @@ all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
 epub: all
 xml: all
+pdf: all
 latex: $(IMGPDF) all
 linkcheck:
 
diff --git a/Makefile b/Makefile
index 193ebb83c34a..741c580b3626 100644
--- a/Makefile
+++ b/Makefile
@@ -270,7 +270,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile rustfmt rustfmtcheck
+			 outputmakefile rustfmt rustfmtcheck rst2pdf
 # Installation targets should not require compiler. Unfortunately, vdso_install
 # is an exception where build artifacts may be updated. This must be fixed.
 no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
@@ -1816,7 +1816,7 @@ $(help-board-dirs): help-%:
 
 # Documentation targets
 # ---------------------------------------------------------------------------
-DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
+DOC_TARGETS := xmldocs latexdocs pdfdocs rst2pdf htmldocs epubdocs cleandocs \
 	       linkcheckdocs dochelp refcheckdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
-- 
2.30.2


