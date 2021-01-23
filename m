Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B5330155B
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 14:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbhAWNOj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Jan 2021 08:14:39 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:45761 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbhAWNOh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jan 2021 08:14:37 -0500
Received: from localhost.localdomain (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10NDBvPP016300;
        Sat, 23 Jan 2021 22:11:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10NDBvPP016300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611407519;
        bh=Q7tcC4mt1Zp1/28EOjcXN8NS6DZeIM4iUSeIYyg4BP0=;
        h=From:To:Cc:Subject:Date:From;
        b=JBOL6/Ut1OXSMkNuqOkuP1mw3zKhyYpeOsl332jaZ2dhz6MaQF+1skS5IKyR0w3dX
         sIggrNvWoGTSm6rD3ezdHYmpCLST+iBpJQ9NvPhEyGXCWSuw2Fet2mUJVsjX6v5a+h
         eAQSQXm2nij2HCQhm6KCtdntWVb54GJBXngu7xr6d95uHe8bQ2xCMLuPyCgmssFVY/
         3Lb1QDjBR8QLkbkiS3Er7V/eDG0BmkYk1euTzsw9GUPU6Txfot+YAIS2ujyU5BNQxG
         DOJjOpP18RbwqOf0HgoVxoJ294CYSfJugE6ppoFBxZyLH6z4PJ5d7DxnICwXx1TqSq
         6sJeFFc7dRxmw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Robert Karszniewicz <r.karszniewicz@phytec.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] doc: gcc-plugins: drop more stale information
Date:   Sat, 23 Jan 2021 22:11:52 +0900
Message-Id: <20210123131152.734504-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[1] Drop the version information

The range of the supported GCC versions are always changing. The
current minimal GCC version is 4.9, and commit 1e860048c53e
("gcc-plugins: simplify GCC plugin-dev capability test") removed the
old code accordingly. We do not mention specific version ranges like
"all gcc versions from 4.5 to 6.0" since we often forget to update the
documentation when the minimal compiler version is raised.

[2] Drop the C compiler statements

Since commit 77342a02ff6e ("gcc-plugins: drop support for GCC <= 4.7")
the GCC plugin infrastructure only supports g++.

[3] Drop supported architectures

As of v5.11-rc4, the infrastructure supports more architectures;
arm, arm64, mips, powerpc, riscv, s390, um, and x86. (just grep
"select HAVE_GCC_PLUGINS") Again, we often forget to update this
document when a new architecture is supported. Let's just say
"only some architectures".

[4] Update the apt-get example

We are discussing to bump the minimal version to GCC 5. Change the
package example to gcc-10-plugin-dev while we are here.

[5] Update the build target

Since commit ce2fd53a10c7 ("kbuild: descend into scripts/gcc-plugins/
via scripts/Makefile"), "make gcc-plugins" is not supported.
"make scripts" builds all the enabled plugins, including some other
tools.

[6] Update the steps for adding a new plugin

At first, all CONFIG options for GCC plugins were located in arch/Kconfig.
After commit 45332b1bdfdc ("gcc-plugins: split out Kconfig entries to
scripts/gcc-plugins/Kconfig"), scripts/gcc-plugins/Kconfig became the
central place to collect plugin CONFIG options. In my understanding,
this requirement no longer exists because commit 9f671e58159a ("security:
Create "kernel hardening" config area") moved some of plugin CONFIG
options to another file. Find an appropriate place to add the new CONFIG.
I do not understand what was intended by the $(src)/ prefix. Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/gcc-plugins.rst | 30 ++++++++++++----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
index 63379d0150e3..7ea16f93db06 100644
--- a/Documentation/kbuild/gcc-plugins.rst
+++ b/Documentation/kbuild/gcc-plugins.rst
@@ -11,16 +11,13 @@ compiler [1]_. They are useful for runtime instrumentation and static analysis.
 We can analyse, change and add further code during compilation via
 callbacks [2]_, GIMPLE [3]_, IPA [4]_ and RTL passes [5]_.
 
-The GCC plugin infrastructure of the kernel supports all gcc versions from
-4.5 to 6.0, building out-of-tree modules, cross-compilation and building in a
-separate directory.
-Plugin source files have to be compilable by both a C and a C++ compiler as well
-because gcc versions 4.5 and 4.6 are compiled by a C compiler,
-gcc-4.7 can be compiled by a C or a C++ compiler,
-and versions 4.8+ can only be compiled by a C++ compiler.
+The GCC plugin infrastructure of the kernel supports building out-of-tree
+modules, cross-compilation and building in a separate directory.
+Plugin source files have to be compilable by a C++ compiler.
 
-Currently the GCC plugin infrastructure supports only the x86, arm, arm64 and
-powerpc architectures.
+Currently the GCC plugin infrastructure supports only some architectures.
+Grep "select HAVE_GCC_PLUGINS" to find out which architectures support
+GCC plugins.
 
 This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
 
@@ -53,8 +50,7 @@ $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
 $(src)/scripts/gcc-plugins/gcc-generate-rtl-pass.h**
 
 	These headers automatically generate the registration structures for
-	GIMPLE, SIMPLE_IPA, IPA and RTL passes. They support all gcc versions
-	from 4.5 to 6.0.
+	GIMPLE, SIMPLE_IPA, IPA and RTL passes.
 	They should be preferred to creating the structures by hand.
 
 
@@ -62,9 +58,9 @@ Usage
 =====
 
 You must install the gcc plugin headers for your gcc version,
-e.g., on Ubuntu for gcc-4.9::
+e.g., on Ubuntu for gcc-10::
 
-	apt-get install gcc-4.9-plugin-dev
+	apt-get install gcc-10-plugin-dev
 
 Or on Fedora::
 
@@ -76,7 +72,7 @@ Enable a GCC plugin based feature in the kernel config::
 
 To compile only the plugin(s)::
 
-	make gcc-plugins
+	make scripts
 
 or just run the kernel make and compile the whole kernel with
 the cyclomatic complexity GCC plugin.
@@ -85,7 +81,7 @@ the cyclomatic complexity GCC plugin.
 4. How to add a new GCC plugin
 ==============================
 
-The GCC plugins are in $(src)/scripts/gcc-plugins/. You can use a file or a directory
-here. It must be added to $(src)/scripts/gcc-plugins/Makefile,
-$(src)/scripts/Makefile.gcc-plugins and $(src)/arch/Kconfig.
+The GCC plugins are in scripts/gcc-plugins/. You can use a file or a directory
+here. It must be added to /scripts/gcc-plugins/Makefile,
+scripts/Makefile.gcc-plugins and a relevant Kconfig file.
 See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
-- 
2.27.0

