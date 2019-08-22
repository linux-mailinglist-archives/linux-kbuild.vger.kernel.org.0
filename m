Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32DE499159
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2019 12:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387884AbfHVKs7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Aug 2019 06:48:59 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:58804 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732378AbfHVKs6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 06:48:58 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7MAm3ob013611;
        Thu, 22 Aug 2019 19:48:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7MAm3ob013611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566470884;
        bh=pgMh/XShvFXZtm5mQiWwmSeXQh92l0dVrwBiaBdOW5M=;
        h=From:To:Cc:Subject:Date:From;
        b=qy7j2+OxzQ3YyC5B0siftsymKSsn8q0bji129g0ZmxeoUxuJT4Hjbjz2E2wJa1W3A
         zT8w16DEdBNGoR0kcNTp6nEnWdrnMtoIT3hx3gHs4xOhvRLxAnTZtGiJd4Ufk3xmqa
         jHeL1ldQYloj4FyLWKCPHpD1/xaPRaZyM3f64gOvCY9WbUfZ/wu50Yni0BX4yVjDn1
         mR+r8lwRE6Czj1pDJojrMKrrr5dlulM5EWEIidWRPPo8006ajvj4N4lWpYq2lCs01V
         QokuaM9FjCfIJwIV3kNn7TOsFheU4kWySS3F86zH6qtUPefcek7LG5nEkGKbPiv2Hq
         mMTrN5QN8YzIA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Paul Smith <psmith@gnu.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [NOT APPLICABLE YET] kbuild: speed up incremental build for the new GNU Make?
Date:   Thu, 22 Aug 2019 19:47:59 +0900
Message-Id: <20190822104759.31775-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It has been 3 years since GNU Make 4.2.1 was released. The maintainer
of GNU Make, Paul Smith, has announced that the new version (4.3?) will
be released soon.

I reported a bug about the $? behavior some time ago, but it has not
been fixed yet. I am eager to see it fixed for the new release.
[https://savannah.gnu.org/bugs/?55532]

This is a hypothetical patch to demonstrate how it would be beneficial
for the Linux kernel build if it were fixed in time.

The incremental build of Linux kernel is somewhat slow, especially when
lots of objects are compiled. The incremental build of allmodconfig
typically takes a couple of minutes even when none of the objects needs
to be rebuilt.

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

This is also related with the behavior of $?. The manual says:

  $?
      The names of all the prerequisites that are newer than the target,
      with spaces between them.

This does not address whether a non-existent prerequisite is considered
to be newer than the target.

At this point of time, GNU Make 3.7x was used, where the $? did not
include non-existent prerequisites. Therefore,

  $(filter-out FORCE $(wildcard $^),$^)

was added to detect the header removal, and to rebuild the related
objects if it is the case.

[2] Change of $? behavior

Later, the behavior of $? was changed (fixed) to include prerequisites
that did not exist.

First, GNU Make commit 64e16d6c00a5 ("Various changes getting ready for
the release of 3.81.") changed it, but in the release test of 3.81, it
turned out to break the kernel build.

Some materials:

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

Talking about the released versions, 3.82 was the first release that
came with the new $? behavior.

 3.81 or older:
    $? does not contain any non-existent prerequisite. So, we need the
    expensive $(filter-out $(PHONY) $(wildcard $^),$^) if we want to
    notice the removal of an included header.

 3.82 or newer:
    $? contains non-existent prerequisites. When a header is removed,
    it appears in $?. $(filter-out $(PHONY) $(wildcard $^),$^) became
    a redundant check.

We could have optimized the build by dropping the expensive check
for 3.82 or later. But, we did not.

[5] The .SECONDARY special target affects $?

Some time later, I noticed $? did not work as expected under some
circumstances. As above, $? should list non-existent prerequisites,
but the ones specified as SECONDARY do not appear in $?.

I asked this in GNU Make ML, and it seems a bug:

  https://lists.gnu.org/archive/html/bug-make/2019-01/msg00001.html

Since commit 8e9b61b293d9 ("kbuild: move .SECONDARY special target to
Kbuild.include"), all files, including headers listed in .*.cmd files,
are treated as secondary.

So, we are back into the situation where non-existent files are not
contained in $?.

If we want to rebuild objects, reacting to the header removal, we need
the extra check by $(filter-out $(PHONY) $(wildcard $^),$^).

[Summary]

 - I believe noticing the header removal and recompiling objects is a
   good feature for the build system.

 - Currently, it is achieved by the expensive code:

    $(filter-out $(PHONY) $(wildcard $^),$^)

 - I do not want to revert commit 8e9b61b293d9 ("kbuild: move
   .SECONDARY special target to Kbuild.include"). Specifying
   .SECONDARY globally is clean, and it matches to the Kbuild policy.

 - The behavior of $? affected by .SECONDARY is a bug.

 - If it is fixed, we can bypass the costly check, at least for
   the new released version.

This commit bypasses the expensive check for GNU Make >= 4.3.
According to my analysis, we can save ~20% of time for the incremental
build.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4b0432e095ae..5c4f63642bfe 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -217,7 +217,14 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 
 # Find any prerequisites that is newer than target or that does not exist.
 # PHONY targets skipped in both cases.
+
+ifeq ($(firstword $(sort $(MAKE_VERSION) 4.3)),4.3)
+any-prereq = $(filter-out $(PHONY),$?)
+else
+# For Make <= 4.2.1, $? does not contain non-existent prerequisites that are
+# specified as secondary. We need an extra check to notice header removal.
 any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
+endif
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(any-prereq)$(cmd-check),                                 \
-- 
2.17.1

