Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4062BFF3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 05:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgKWEzd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Nov 2020 23:55:33 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:27317 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgKWEzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 23:55:19 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0AN4sGHh016676;
        Mon, 23 Nov 2020 13:54:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0AN4sGHh016676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107260;
        bh=UaokmMy66noPBcllqXh/sjDOT6CGTkZW3p03cwQ7oPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UTyJutcuEhCq7ktGgTSJJWNN4w5yvfmuMF946o9s4IidT48CZMmWZvuSY7GSevRZm
         lMWeIAaEo7pirj+cCxVO25BkgYg34bxUwzQUabGbdadM8LMskcJ4O5Oa63WBk7mvuR
         6gzynMBJwQqKIaPcX6+fpsfRaCa3DiPCGpN/OnA4ih1xk4fhLVoQWVuJPPCKYThOjE
         E6sELHdj3oDD7whhI8R2nx6SXRwv67GI7LHDN0XW2IS+QPIXbFmW48HHmNqDcELK41
         0i+FuzWs46cgFkPHhvcQOmGjSj9eIBNw7elatlxv/qt/y2qizqqSkUitWAt87BN4om
         2GKFVAUXwXx3g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] kbuild: doc: split if_changed explanation to a separate section
Date:   Mon, 23 Nov 2020 13:54:01 +0900
Message-Id: <20201123045403.63402-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123045403.63402-1-masahiroy@kernel.org>
References: <20201123045403.63402-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The if_changed macro is currently explained in the section
"Commands useful for building a boot image", but the use of
if_changed is not limited to the boot image.

It is often used together with custom rules. Let's split it as a
separate section, and insert it after the "Custom Rules" section.

I slightly reworded the explanation, re-numbered to fill the <deleted>
section, and also fixed the broken indentation of the Note: part.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 94 +++++++++++++++++-------------
 1 file changed, 52 insertions(+), 42 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index f5a983709df7..49afcb1d3695 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -16,9 +16,9 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.5 Library file goals - lib-y
 	   --- 3.6 Descending down in directories
 	   --- 3.7 Compilation flags
-	   --- 3.8 <deleted>
-	   --- 3.9 Dependency tracking
-	   --- 3.10 Custom Rules
+	   --- 3.8 Dependency tracking
+	   --- 3.9 Custom Rules
+	   --- 3.10 Command change detection
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
 	   --- 3.13 Script Invocation
@@ -410,7 +410,7 @@ more details, with real examples.
 		AFLAGS_iwmmxt.o      := -Wa,-mcpu=iwmmxt
 
 
-3.9 Dependency tracking
+3.8 Dependency tracking
 -----------------------
 
 	Kbuild tracks dependencies on the following:
@@ -422,8 +422,8 @@ more details, with real examples.
 	Thus, if you change an option to $(CC) all affected files will
 	be re-compiled.
 
-3.10 Custom Rules
-------------------
+3.9 Custom Rules
+----------------
 
 	Custom rules are used when the kbuild infrastructure does
 	not provide the required support. A typical example is
@@ -499,6 +499,52 @@ more details, with real examples.
 
 	will be displayed with "make KBUILD_VERBOSE=0".
 
+3.10 Command change detection
+-----------------------------
+
+	When the rule is evaluated, timestamps are compared between the target
+	and its prerequisite files. GNU Make updates the target when any of the
+	prerequisites is newer than that.
+
+	The target should be rebuilt also when the command line has changed
+	since the last invocation. This is not supported by Make itself, so
+	Kbuild achieves this by a kind of meta-programming.
+
+	if_changed is the macro used for this purpose, in the following form::
+
+		quiet_cmt_<command> = ...
+		      cmd_<command> = ...
+
+		<target>: <source(s)> FORCE
+			$(call if_changed,<command>)
+
+	Any target that utilizes if_changed must be listed in $(targets),
+	otherwise the command line check will fail, and the target will
+	always be built.
+
+	If the target is already listed in the recognized syntax such as
+	obj-y/m, lib-y/m, extra-y/m, hostprogs, userprogs, Kbuild automatically
+	add it to $(targets). Otherwise, the target must be explicitly added
+	to $(targets).
+
+	Assignments to $(targets) are without $(obj)/ prefix. if_changed may be
+	used in conjunction with custom rules as defined in "3.9 Custom Rules".
+
+	Note: It is a typical mistake to forget the FORCE prerequisite.
+	Another common pitfall is that whitespace is sometimes significant; for
+	instance, the below will fail (note the extra space after the comma)::
+
+		target: source(s) FORCE
+
+	**WRONG!**	$(call if_changed, objcopy)
+
+	Note:
+		if_changed should not be used more than once per target.
+		It stores the executed command in a corresponding .cmd
+		file and multiple calls would result in overwrites and
+		unwanted results when the target is up to date and only the
+		tests on changed commands trigger execution of commands.
+
 3.11 $(CC) support functions
 ----------------------------
 
@@ -1287,42 +1333,6 @@ When kbuild executes, the following steps are followed (roughly):
     Kbuild provides a few macros that are useful when building a
     boot image.
 
-    if_changed
-	if_changed is the infrastructure used for the following commands.
-
-	Usage::
-
-		target: source(s) FORCE
-			$(call if_changed,ld/objcopy/gzip/...)
-
-	When the rule is evaluated, it is checked to see if any files
-	need an update, or the command line has changed since the last
-	invocation. The latter will force a rebuild if any options
-	to the executable have changed.
-	Any target that utilises if_changed must be listed in $(targets),
-	otherwise the command line check will fail, and the target will
-	always be built.
-	Assignments to $(targets) are without $(obj)/ prefix.
-	if_changed may be used in conjunction with custom rules as
-	defined in "3.10 Custom Rules".
-
-	Note: It is a typical mistake to forget the FORCE prerequisite.
-	Another common pitfall is that whitespace is sometimes
-	significant; for instance, the below will fail (note the extra space
-	after the comma)::
-
-		target: source(s) FORCE
-
-	**WRONG!**	$(call if_changed, ld/objcopy/gzip/...)
-
-        Note:
-	      if_changed should not be used more than once per target.
-              It stores the executed command in a corresponding .cmd
-
-        file and multiple calls would result in overwrites and
-        unwanted results when the target is up to date and only the
-        tests on changed commands trigger execution of commands.
-
     ld
 	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
 
-- 
2.25.1

