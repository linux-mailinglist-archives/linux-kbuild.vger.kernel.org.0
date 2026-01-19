Return-Path: <linux-kbuild+bounces-10676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F9D3A7E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 882B7300B99A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252143596F0;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQPLPDTr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088A1C5D5E;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=KFd0q9CPBfbxKzLOJDU7+N4ZwWoioA5249LEOgL0NKFSkUujLQhUf4wJ9NXG05TORySjUG7fW6ROv/SIaAqMiKlm8j0Rh/P9CzsNawGlrOEB9JS2Dt7AHg6/L6yFj6lB9tiMLdREpEmkX4Hz+KOnMRk8whKI89alFLrRG5aViK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=gIlHO7b2dpX1yT61k9PtOOKZE0nPF7btslse5y1Pu2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyJR9up7juJzJ8qIxgCa7aJbTQHpaTDDZAJzicloYnZ5pz8yb9cbEt0dD1fxo5/sL8+VQNzARZSnEJHT3hfEkhaCIMl3ZlIECJv71tr48jgGktqY23JpHML+pgUF+hGDQAXjwSeBYIq1iEvXl/xtxV+B+Za1rPRgsXhCiywotYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQPLPDTr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA878C19425;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=gIlHO7b2dpX1yT61k9PtOOKZE0nPF7btslse5y1Pu2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQPLPDTr9HIYOdHR/wEdulLJPp1fpkTVYYwVsquoQQPDk16XAoVJga5jcBtKxIhhH
	 xtctZVCg8p4w1gGmntAfhG5XFNdd6DmXrpk0el86rDvwRVp+Sy/gjgMPlOOq6tsMlG
	 7MRy+TppxhgzXmW4Yq0QKTKxqnucEuxHrL7LE79Du4BGlHDnug0AWDQaPUS1F8Ahty
	 UDBXW/dbOYiFSBQ/RB4hMIIZHr/9ZywTNOBuk1mhEKWQ7GU0h8Uta7pu1QvAea5FLJ
	 GvxoK00BLTRZ/L52HxqGhOfmko4ZxWKWOr8Cn4lzck97rWpm+QC0dldNFvTM7ajH6x
	 Azgkup5ORkhNQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjI-3Qjw;
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
Subject: [PATCH 3/9] docs: kdoc: ensure that comments are using our coding style
Date: Mon, 19 Jan 2026 13:04:58 +0100
Message-ID: <50e430acd333a500719205e80ab3b2d297edcd7d.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Along kernel-doc libs, we opted to have all comments starting/ending
with a blank comment line. Use the same style here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 1ebb16b9bb08..f1f3f56edeb5 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -3,7 +3,7 @@
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
 #
 # pylint: disable=C0103,R0912,R0914,R0915
-
+#
 # NOTE: While kernel-doc requires at least version 3.6 to run, the
 #       command line should work with Python 3.2+ (tested with 3.4).
 #       The rationale is that it shall fail gracefully during Kernel
@@ -12,7 +12,7 @@
 #       - no f-strings can be used on this file.
 #       - the libraries that require newer versions can only be included
 #         after Python version is checked.
-
+#
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
 #
@@ -197,8 +197,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
-
+    #
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
 
@@ -213,8 +214,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
-
+    #
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
 
@@ -235,8 +237,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
-
+    #
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
     out_fmt = out_group.add_mutually_exclusive_group()
@@ -248,8 +251,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
-
+    #
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
 
@@ -262,7 +266,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -295,9 +301,11 @@ def main():
 
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
+        #
         # Depending on Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
+        #
         if args.none:
             logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
             sys.exit(0)
@@ -307,7 +315,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -346,6 +356,8 @@ def main():
 
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0


