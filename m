Return-Path: <linux-kbuild+bounces-10680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71179D3A7EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA03630402EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377AC359F81;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ+pWdo0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ADF329C6C;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=lJNjv2FRFNV65C2uVTeQWi+NOvY2EaY/Z5xX+R1FXM9t/trKthyBkPCxRPM5+4tEdzJbagPVR/Z3WRybNonZ1BftIkveezV4OU92Oam8+M5dJ5PAZqYkCctQk3AZY0JfsYXiOY3meW/j83cdXPwSeD0aSDAJU5cSIW2pIhfMlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=uAgz6NVwdL1fSgq++5Vdt7SvGll1o/f20D2+Kc+Gl6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Type; b=FMvwbkfGHuV1KQXgr4FVMjwtdyarIwKHBPHm7+pr46x1tA41I518KTD9S0ify4V/zEu7QP4ng86uUG+le8EQNIprA1QAFuIHYvxl3g1RENLX8F3trPcWALt+NqRrEkZdIzeXi/vd8PwZv3NQqJKJqUrVBmeulGd8kEqa2YpjElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ+pWdo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64FCC4AF09;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=uAgz6NVwdL1fSgq++5Vdt7SvGll1o/f20D2+Kc+Gl6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJ+pWdo0Tq59ur1/vDvnzdzAODQB+0BpPcPaKhE1BlTE+naH79rJGPzNzNg/1DYRO
	 ZUV4usc7G0oiHnnc1nCJ8BmhHcuFIAQi+U5TMFh7g5ea+Xf8vkV9wJoKQK3pamzf2H
	 zRHfcHC0k3jFnAGzcMMtz+gowPOz/+p9rhsVfx6r5mnkcWWTg8x4E6jg+esUdgcWQ8
	 VTxgxE7AAhpegUBy4MuwntcrXHF/92n4BwbmyFfo60gXGUPlaB35qqPKwb4JZgUuJm
	 UynONt/lasjE6wBmtpgJZawth73DeUtHznc6z4v8o49JqNtDuMDsCanfOxRibMSXAH
	 /Wvx5ONH91W8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjM-3Xkg;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 4/9] docs: kdoc: some fixes to kernel-doc comments
Date: Mon, 19 Jan 2026 13:04:59 +0100
Message-ID: <ec08727f22ad35e6c58519c1f425f216f14b701c.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some typos and English errors in the comments of kernel‑doc.py.

Locate them with the help of an LLM (gpt‑oss 14B), executed locally
with this prompt:

        review English grammar and syntax at the comments on the code below:
        <cat scripts/kernel-doc.py>

While LLM worked fine for the task of doing an English grammar review
for strings, being able to distinguish them from the actual code, it
was not is perfect: some things required manual work to fix.

-

While here, replace:

    "/**" with: ``/**``

As, if we ever rename this script to kernel_doc.py and add it to
Sphinx ext autodoc, we want to avoid this warning:

    scripts/kernel_doc.py:docstring of kernel_doc:10: WARNING: Inline strong start-string without end-string. [docutils]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index f1f3f56edeb5..4e3b9cfe3fd7 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -9,9 +9,9 @@
 #       The rationale is that it shall fail gracefully during Kernel
 #       compilation with older Kernel versions. Due to that:
 #       - encoding line is needed here;
-#       - no f-strings can be used on this file.
-#       - the libraries that require newer versions can only be included
-#         after Python version is checked.
+#       - f-strings cannot be used in this file.
+#       - libraries that require newer versions can only be included
+#         after the Python version has been checked.
 #
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
@@ -88,16 +88,13 @@
 #    Yujie Liu <yujie.liu@intel.com>
 
 """
-kernel_doc
-==========
-
-Print formatted kernel documentation to stdout
+Print formatted kernel documentation to stdout.
 
 Read C language source or header FILEs, extract embedded
 documentation comments, and print formatted documentation
 to standard output.
 
-The documentation comments are identified by the "/**"
+The documentation comments are identified by the ``/**``
 opening comment mark.
 
 See Documentation/doc-guide/kernel-doc.rst for the
@@ -134,13 +131,13 @@ May be used multiple times.
 """
 
 EXPORT_DESC = """
-Only output documentation for the symbols that have been
+Only output documentation for symbols that have been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
 
 INTERNAL_DESC = """
-Only output documentation for the symbols that have NOT been
+Only output documentation for symbols that have NOT been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
@@ -163,7 +160,7 @@ Header and C source files to be parsed.
 """
 
 WARN_CONTENTS_BEFORE_SECTIONS_DESC = """
-Warns if there are contents before sections (deprecated).
+Warn if there are contents before sections (deprecated).
 
 This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
@@ -171,7 +168,7 @@ neither here nor at the original Perl script.
 
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings on a similar way to kernel-doc.pl"""
+    """Helper class to format warnings in a similar way to kernel-doc.pl."""
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
@@ -273,7 +270,7 @@ def main():
                         help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
-                        action='store_true', help="Don't outputt DOC sections")
+                        action='store_true', help="Don't output DOC sections")
 
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
@@ -302,12 +299,12 @@ def main():
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
         #
-        # Depending on Kernel configuration, kernel-doc --none is called at
+        # Depending on the Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
         #
         if args.none:
-            logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
+            logger.error("Python 3.6 or later is required by kernel-doc. Skipping checks")
             sys.exit(0)
 
         sys.exit("Python 3.6 or later is required by kernel-doc. Aborting.")
@@ -316,7 +313,7 @@ def main():
         logger.warning("Python 3.7 or later is required for correct results")
 
     #
-    # Import kernel-doc libraries only after checking Python version
+    # Import kernel-doc libraries only after checking the Python version
     #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
-- 
2.52.0


