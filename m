Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9C32253BB
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jul 2020 21:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgGSTqM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Jul 2020 15:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgGSTqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jul 2020 15:46:12 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC82C0619D2;
        Sun, 19 Jul 2020 12:46:11 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 594B4BC086;
        Sun, 19 Jul 2020 19:46:08 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     masahiroy@kernel.org, michal.lkml@markovi.net, corbet@lwn.net,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] kbuild: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 21:46:02 +0200
Message-Id: <20200719194602.61387-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/kbuild/Kconfig.recursion-issue-02 |  2 +-
 Documentation/kbuild/kconfig-language.rst       | 14 +++++++-------
 Documentation/kbuild/llvm.rst                   |  2 +-
 scripts/package/mkdebian                        |  2 +-
 scripts/package/mkspec                          |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
index b9fd56c4b57e..df245fd7670d 100644
--- a/Documentation/kbuild/Kconfig.recursion-issue-02
+++ b/Documentation/kbuild/Kconfig.recursion-issue-02
@@ -42,7 +42,7 @@
 # "select FW_LOADER" [0], in the end the simple alternative solution to this
 # problem consisted on matching semantics with newly introduced features.
 #
-# [0] http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
+# [0] https://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
 
 mainmenu "Simple example to demo cumulative kconfig recursive dependency implication"
 
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index a1601ec3317b..41bee6a171e3 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -688,10 +688,10 @@ and real world requirements were not well understood. As it stands though
 only reverse engineering techniques have been used to deduce semantics from
 variability modeling languages such as Kconfig [3]_.
 
-.. [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
-.. [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
-.. [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
-.. [3] http://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
+.. [0] https://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
+.. [1] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [2] https://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
+.. [3] https://gsd.uwaterloo.ca/sites/default/files/icse2011.pdf
 
 Full SAT solver for Kconfig
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -710,10 +710,10 @@ such efforts somehow on Kconfig. There is enough interest from mentors of
 existing projects to not only help advise how to integrate this work upstream
 but also help maintain it long term. Interested developers should visit:
 
-http://kernelnewbies.org/KernelProjects/kconfig-sat
+https://kernelnewbies.org/KernelProjects/kconfig-sat
 
-.. [4] http://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
-.. [5] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
+.. [4] https://www.cs.cornell.edu/~sabhar/chapters/SATSolvers-KR-Handbook.pdf
+.. [5] https://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
 .. [6] https://cados.cs.fau.de
 .. [7] https://vamos.cs.fau.de
 .. [8] https://undertaker.cs.fau.de
diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index c776b6eee969..2aac50b97921 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -76,7 +76,7 @@ Getting Help
 Getting LLVM
 -------------
 
-- http://releases.llvm.org/download.html
+- https://releases.llvm.org/download.html
 - https://github.com/llvm/llvm-project
 - https://llvm.org/docs/GettingStarted.html
 - https://llvm.org/docs/CMake.html
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index df1adbfb8ead..48fbd3d0284a 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -175,7 +175,7 @@ Section: kernel
 Priority: optional
 Maintainer: $maintainer
 Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
-Homepage: http://www.kernel.org/
+Homepage: https://www.kernel.org/
 
 Package: $packagename
 Architecture: $debarch
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 8640c278f1aa..7c477ca7dc98 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -46,7 +46,7 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
 	License: GPL
 	Group: System Environment/Kernel
 	Vendor: The Linux Community
-	URL: http://www.kernel.org
+	URL: https://www.kernel.org
 $S	Source: kernel-$__KERNELRELEASE.tar.gz
 	Provides: $PROVIDES
 	%define __spec_install_post /usr/lib/rpm/brp-compress || :
-- 
2.27.0

