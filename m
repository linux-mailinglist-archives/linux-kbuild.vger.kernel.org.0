Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8482F3233
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2019 16:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388941AbfKGPJ6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 10:09:58 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:63495 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729948AbfKGPJ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:09:57 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xA7F9lnD027691;
        Fri, 8 Nov 2019 00:09:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xA7F9lnD027691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573139388;
        bh=mPAsVC6gh6EEzCErLHRr6Jw+C/8LRyXEC3VNajpj5aQ=;
        h=From:To:Cc:Subject:Date:From;
        b=CMtwBN7Oh68rdtwPznU6QxLQZ6mtJZPTbx2Y9sRSXv4YJ3pqFYH9YioeWKcnUJmnx
         uekpTmnm4WLROasLCa3vtQ4o8JKlDbG2SqhXu96N2v75YbpO4Fno3GTITZMTJQp7yI
         nBVokbVo/MlGNX+5vLanpfBRjUkxJVLFU+1TSsrwyfSgVaWiPZqpyjc2K/k8hu5kwi
         7tVsvuucIF3JwhesY6ParCVR9U+pNSNTDwVHZtGE4a3C3JTRHpf8ZNxCxx5Aue0gRN
         YdcSKYTC/WwnEuN9cAO/ADy+7kSQUBX93WefCWBukynqEDvcqVceMiBUMA1aAo+Fsl
         C0m2SyhFN6OpA==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: drop $(wildcard $^) check in if_changed* for faster rebuild
Date:   Fri,  8 Nov 2019 00:09:44 +0900
Message-Id: <20191107150945.4513-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The incremental build of Linux kernel is pretty slow when lots of
objects are compiled. The rebuild of allmodconfig may take a few
minutes even when none of the objects needs to be rebuilt.

The time-consuming part in the incremental build is the evaluation of
if_changed* macros since they are used in the recipes to compile C and
assembly source files into objects.

I notice the following code in if_changed* is expensive:

  $(filter-out $(PHONY) $(wildcard $^),$^)

In the incremental build, every object has its .*.cmd file, which
contains the auto-generated list of included headers. So, $^ are
expanded into the long list of the source file + included headers,
and $(wildcard $^) checks whether they exist.

It may not be clear why this check exists there.

Here is the record of my research.

[1] The first code addition into Kbuild

This code dates back to 2002. It is the pre-git era. So, I copy-pasted
it from the historical git tree.

| commit 4a6db0791528c220655b063cf13fefc8470dbfee (HEAD)
| Author: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
| Date:   Mon Jun 17 00:22:37 2002 -0500
|
|     kbuild: Handle removed headers
|
|     New and old way to handle dependencies would choke when a file
|     #include'd by other files was removed, since the dependency on it was
|     still recorded, but since it was gone, make has no idea what to do about
|     it (and would complain with "No rule to make <file> ...")
|
|     We now add targets for all the previously included files, so make will
|     just ignore them if they disappear.
|
| diff --git a/Rules.make b/Rules.make
| index 6ef827d3df39..7db5301ea7db 100644
| --- a/Rules.make
| +++ b/Rules.make
| @@ -446,7 +446,7 @@ if_changed = $(if $(strip $? \
|  # execute the command and also postprocess generated .d dependencies
|  # file
|
| -if_changed_dep = $(if $(strip $? \
| +if_changed_dep = $(if $(strip $? $(filter-out FORCE $(wildcard $^),$^)\
|                           $(filter-out $(cmd_$(1)),$(cmd_$@))\
|                           $(filter-out $(cmd_$@),$(cmd_$(1)))),\
|         @set -e; \
| diff --git a/scripts/fixdep.c b/scripts/fixdep.c
| index b5d7bee8efc7..db45bd1888c0 100644
| --- a/scripts/fixdep.c
| +++ b/scripts/fixdep.c
| @@ -292,7 +292,7 @@ void parse_dep_file(void *map, size_t len)
|                 exit(1);
|         }
|         memcpy(s, m, p-m); s[p-m] = 0;
| -       printf("%s: \\\n", target);
| +       printf("deps_%s := \\\n", target);
|         m = p+1;
|
|         clear_config();
| @@ -314,7 +314,8 @@ void parse_dep_file(void *map, size_t len)
|                 }
|                 m = p + 1;
|         }
| -       printf("\n");
| +       printf("\n%s: $(deps_%s)\n\n", target, target);
| +       printf("$(deps_%s):\n", target);
|  }
|
|  void print_deps(void)

The "No rule to make <file> ..." error can be solved by passing -MP to
the compiler, but I think the detection of header removal is a good
feature. When a header is removed, all source files that previously
included it should be re-compiled. This makes sure we has correctly
got rid of #include directives of it.

This is also related with the behavior of $?. The GNU Make manual says:

  $?
      The names of all the prerequisites that are newer than the target,
      with spaces between them.

This does not explain whether a non-existent prerequisite is considered
to be newer than the target.

At this point of time, GNU Make 3.7x was used, where the $? did not
include non-existent prerequisites. Therefore,

  $(filter-out FORCE $(wildcard $^),$^)

was useful to detect the header removal, and to rebuild the related
objects if it is the case.

[2] Change of $? behavior

Later, the behavior of $? was changed (fixed) to include prerequisites
that did not exist.

First, GNU Make commit 64e16d6c00a5 ("Various changes getting ready for
the release of 3.81.") changed it, but in the release test of 3.81, it
turned out to break the kernel build.

See these:

 - http://lists.gnu.org/archive/html/bug-make/2006-03/msg00003.html
 - https://savannah.gnu.org/bugs/?16002
 - https://savannah.gnu.org/bugs/?16051

Then, GNU Make commit 6d8d9b74d9c5 ("Numerous updates to tests for
issues found on Cygwin and Windows.") reverted it for the 3.81 release
to give Linux kernel time to adjust to the new behavior.

After the 3.81 release, GNU Make commit 7595f38f62af ("Fixed a number
of documentation bugs, plus some build/install issues:") re-added it.

[3] Adjustment to the new $? behavior on Kbuild side

Meanwhile, the kernel build was changed by commit 4f1933620f57 ("kbuild:
change kbuild to not rely on incorrect GNU make behavior") to adjust to
the new $? behavior.

[4] GNU Make 3.82 released in 2010

GNU Make 3.82 was the first release that integrated the correct $?
behavior. At this point, Kbuild dealt with GNU Make versions with
different $? behaviors.

 3.81 or older:
    $? does not contain any non-existent prerequisite.
    $(filter-out $(PHONY) $(wildcard $^),$^) was useful to detect
    removed include headers.

 3.82 or newer:
    $? contains non-existent prerequisites. When a header is removed,
    it appears in $?. $(filter-out $(PHONY) $(wildcard $^),$^) became
    a redundant check.

With the correct $? behavior, we could have dropped the expensive
check for 3.82 or later, but we did not. (Maybe nobody noticed this
optimization.)

[5] The .SECONDARY special target trips up $?

Some time later, I noticed $? did not work as expected under some
circumstances. As above, $? should list non-existent prerequisites,
but the ones specified as SECONDARY do not appear in $?.

I asked this in GNU Make ML, and it seems a bug:

  https://lists.gnu.org/archive/html/bug-make/2019-01/msg00001.html

Since commit 8e9b61b293d9 ("kbuild: move .SECONDARY special target to
Kbuild.include"), all files, including headers listed in .*.cmd files,
are treated as secondary.

So, we are back into the incorrect $? behavior.

If we want to rebuild objects, reacting to the header removal, we need
$(filter-out $(PHONY) $(wildcard $^),$^) but this makes the rebuild
so slow.

[Summary]

 - I believe noticing the header removal and recompiling related objects
   is desirable for the build system.

 - If $? worked correctly, $(filter-out $(PHONY),$?) would be enough
   to detect the header removal.

 - Currently, $? does not work correctly when used with .SECONDARY,
   and Kbuild is hit by this bug.

 - I filed a bug report for this, but not fixed yet as of writing.

 - Currently, the header removal is detected by the following expensive
   code:

    $(filter-out $(PHONY) $(wildcard $^),$^)

 - I do not want to revert commit 8e9b61b293d9 ("kbuild: move
   .SECONDARY special target to Kbuild.include"). Specifying
   .SECONDARY globally is clean, and it matches to the Kbuild policy.

This commit proactively removes the expensive check:

  $(filter-out $(PHONY) $(wildcard $^),$^)

Due to the $? bug, Kbuild will no longer be able to notice the header
removal, but the build speed wins. Once the $? bug is fixed in GNU Make,
everything will work fine.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 10ba926ae292..b3a1189ec3d9 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -212,7 +212,7 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 
 # Find any prerequisites that is newer than target or that does not exist.
 # PHONY targets skipped in both cases.
-any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
+any-prereq = $(filter-out $(PHONY),$?)
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(any-prereq)$(cmd-check),                                 \
-- 
2.17.1

