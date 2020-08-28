Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64A1255FAE
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 19:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgH1R0j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1R0f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 13:26:35 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7DDC061264;
        Fri, 28 Aug 2020 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=FeG1hvttidIcOS7Z9Hv2M8Hv7WD6HzpOgFJIOZcif+0=; b=ueTQImzYDXcWJotKh+O1+x45TY
        nZYeRFqvt8RhLUOnEGAqXpFuq/U1qHWiiEC51fBX7PxVyorhL7NE/r9946LQDq29yYD9v5WR0zwAo
        XGdt1CGI5YQuqZSPy1pIyMO3WgVfbhqej+juz/b2ZsLX0bqnwIAMJ0xu25uEg0oDMZX72dIMJW10i
        BnXgsych2yf1KW+p2KrD/B2DcQd+S3mb585KUTh0ZcukrQ/q6dxyFL0oxpoQglnAbVGh6/RnWP8Ow
        E24CsGnu6vp0ql1O6BpwKDaIDV7nr6GmZFBSxhho4+x1sfWLNV7OabloIcoPliNRL0c5Gsdz+UN0c
        L7VGXg8Q==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBi91-00071C-OK; Fri, 28 Aug 2020 17:26:32 +0000
To:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: Documentation: clean up makefiles.rst
Message-ID: <9fea5110-680e-2876-f014-c1e9f0484179@infradead.org>
Date:   Fri, 28 Aug 2020 10:26:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

This is a general cleanup of kbuild/makefiles.rst:

* Use "Chapter" for major heading references and use "section" for
  the next-level heading references, for consistency.
* Section 3.8 was deleted long ago.
* Drop the ending ':' in section names in the contents list.
* Correct some section numbering references.
* Correct verb agreement typo.
* Fix run-on sentence punctuation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 Documentation/kbuild/makefiles.rst |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- linux-next-20200828.orig/Documentation/kbuild/makefiles.rst
+++ linux-next-20200828/Documentation/kbuild/makefiles.rst
@@ -16,7 +16,7 @@ This document describes the Linux kernel
 	   --- 3.5 Library file goals - lib-y
 	   --- 3.6 Descending down in directories
 	   --- 3.7 Compilation flags
-	   --- 3.8 Command line dependency
+	   --- 3.8 <deleted>
 	   --- 3.9 Dependency tracking
 	   --- 3.10 Special Rules
 	   --- 3.11 $(CC) support functions
@@ -39,8 +39,8 @@ This document describes the Linux kernel
 
 	=== 7 Architecture Makefiles
 	   --- 7.1 Set variables to tweak the build to the architecture
-	   --- 7.2 Add prerequisites to archheaders:
-	   --- 7.3 Add prerequisites to archprepare:
+	   --- 7.2 Add prerequisites to archheaders
+	   --- 7.3 Add prerequisites to archprepare
 	   --- 7.4 List directories to visit when descending
 	   --- 7.5 Architecture-specific boot images
 	   --- 7.6 Building non-kbuild targets
@@ -129,7 +129,7 @@ The preferred name for the kbuild files
 be used and if both a 'Makefile' and a 'Kbuild' file exists, then the 'Kbuild'
 file will be used.
 
-Section 3.1 "Goal definitions" is a quick intro, further chapters provide
+Section 3.1 "Goal definitions" is a quick intro; further chapters provide
 more details, with real examples.
 
 3.1 Goal definitions
@@ -965,7 +965,7 @@ When kbuild executes, the following step
 		KBUILD_LDFLAGS         := -m elf_s390
 
 	Note: ldflags-y can be used to further customise
-	the flags used. See chapter 3.7.
+	the flags used. See section 3.7.
 
     LDFLAGS_vmlinux
 	Options for $(LD) when linking vmlinux
@@ -1121,7 +1121,7 @@ When kbuild executes, the following step
 
 	In this example, the file target maketools will be processed
 	before descending down in the subdirectories.
-	See also chapter XXX-TODO that describe how kbuild supports
+	See also chapter XXX-TODO that describes how kbuild supports
 	generating offset header files.
 
 
@@ -1261,7 +1261,7 @@ When kbuild executes, the following step
 	always be built.
 	Assignments to $(targets) are without $(obj)/ prefix.
 	if_changed may be used in conjunction with custom commands as
-	defined in 6.8 "Custom kbuild commands".
+	defined in 7.8 "Custom kbuild commands".
 
 	Note: It is a typical mistake to forget the FORCE prerequisite.
 	Another common pitfall is that whitespace is sometimes
@@ -1411,7 +1411,7 @@ When kbuild executes, the following step
 	that may be shared between individual architectures.
 	The recommended approach how to use a generic header file is
 	to list the file in the Kbuild file.
-	See "7.2 generic-y" for further info on syntax etc.
+	See "8.2 generic-y" for further info on syntax etc.
 
 7.11 Post-link pass
 -------------------
@@ -1601,4 +1601,4 @@ is the right choice.
 
 - Describe how kbuild supports shipped files with _shipped.
 - Generating offset header files.
-- Add more variables to section 7?
+- Add more variables to chapters 7 or 9?

