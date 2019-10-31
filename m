Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD60AEAEA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 12:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfJaLUu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Oct 2019 07:20:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:58088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbfJaLUu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 07:20:50 -0400
Received: from linux-8ccs (nat.nue.novell.com [195.135.221.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DF172083E;
        Thu, 31 Oct 2019 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572520849;
        bh=qbolzit8+ocGRc2S2uV5k+K0AQ6gemV7AMG6LItKXnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m34ftpbVQHRxvCAB4kilR0Bv3E8ebc3JxfR/lVCOGeCt0K/D6lvtYypRFelK3JvQ8
         vEkt17hBi+iyPGDs2Y83C/ffUeqV6ZUzR8DMFQAxm2lJQziUA3HsPTaVUrA7/w3wK9
         5loT+3QxvoFVOotYQqtI3r0DCL6wjlx1/+WybhTE=
Date:   Thu, 31 Oct 2019 12:20:44 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] modpost: dump missing namespaces into a single
 modules.nsdeps file
Message-ID: <20191031112044.GC2177@linux-8ccs>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191029123809.29301-3-yamada.masahiro@socionext.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [29/10/19 21:38 +0900]:
>The modpost, with the -d option given, generates per-module .ns_deps
>files.
>
>Kbuild generates per-module .mod files to carry module information.
>This is convenient because Make handles multiple jobs when the -j
>option is given.
>
>On the other hand, the modpost always runs as a single thread.
>I do not see a strong reason to produce separate .ns_deps files.
>
>This commit changes the modpost to generate just one file,
>modules.nsdeps, each line of which has the following format:
>
>  <module_name>: <list of missing namespaces>
>
>Please note it contains *missing* namespaces instead of required ones.
>So, modules.nsdeps is empty if the namespace dependency is all good.
>
>This will work more efficiently because spatch will no longer process
>already imported namespaces. I removed the '(if needed)' from the
>nsdeps log since spatch is invoked only when needed.
>
>This also solved the stale .ns_deps files problem reported by
>Jessica Yu:
>
>  https://lkml.org/lkml/2019/10/28/467
>
>While I was here, I improved the modpost code a little more;
>I freed ns_deps_bus.p because buf_write() allocates memory.
>
>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> .gitignore               |  2 +-
> Documentation/dontdiff   |  1 +
> Makefile                 |  4 ++--
> scripts/Makefile.modpost |  2 +-
> scripts/mod/modpost.c    | 44 +++++++++++++++++-----------------------
> scripts/mod/modpost.h    |  4 ++--
> scripts/nsdeps           | 21 +++++++++----------
> 7 files changed, 36 insertions(+), 42 deletions(-)
>
>diff --git a/.gitignore b/.gitignore
>index 70580bdd352c..72ef86a5570d 100644
>--- a/.gitignore
>+++ b/.gitignore
>@@ -32,7 +32,6 @@
> *.lzo
> *.mod
> *.mod.c
>-*.ns_deps
> *.o
> *.o.*
> *.patch
>@@ -61,6 +60,7 @@ modules.order
> /System.map
> /Module.markers
> /modules.builtin.modinfo
>+/modules.nsdeps
>
> #
> # RPM spec file (make rpm-pkg)
>diff --git a/Documentation/dontdiff b/Documentation/dontdiff
>index 9f4392876099..72fc2e9e2b63 100644
>--- a/Documentation/dontdiff
>+++ b/Documentation/dontdiff
>@@ -179,6 +179,7 @@ mkutf8data
> modpost
> modules.builtin
> modules.builtin.modinfo
>+modules.nsdeps
> modules.order
> modversions.h*
> nconf
>diff --git a/Makefile b/Makefile
>index 0ef897fd9cfd..1e3f307bd49b 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1356,7 +1356,7 @@ endif # CONFIG_MODULES
>
> # Directories & files removed with 'make clean'
> CLEAN_DIRS  += include/ksym
>-CLEAN_FILES += modules.builtin.modinfo
>+CLEAN_FILES += modules.builtin.modinfo modules.nsdeps

Hmm, I tried to run `make -C path/to/kernel/src M=$(PWD) clean` for a test
external module, but it didn't remove modules.nsdeps for me. I declared a
MODULE namespace for testing purposes.

$ make 
make -C /dev/shm/linux M=/tmp/ppyu/test-module 
make[1]: Entering directory '/dev/shm/linux'
  AR      /tmp/ppyu/test-module/built-in.a
  CC [M]  /tmp/ppyu/test-module/test1.o
  CC [M]  /tmp/ppyu/test-module/test2.o
  LD [M]  /tmp/ppyu/test-module/test.o
  Building modules, stage 2.
  MODPOST 1 modules
WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
  CC [M]  /tmp/ppyu/test-module/test.mod.o
  LD [M]  /tmp/ppyu/test-module/test.ko
make[1]: Leaving directory '/dev/shm/linux'

Then I make nsdeps:

make -C /dev/shm/linux M=/tmp/ppyu/test-module nsdeps
make[1]: Entering directory '/dev/shm/linux'
  Building modules, stage 2.
  MODPOST 1 modules
WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
Adding namespace MODULE to module /tmp/ppyu/test-module/test.ko.
--- /tmp/ppyu/test-module/test1.c
+++ /tmp/cocci-output-3696-c1f8b3-test1.c
@@ -38,3 +38,4 @@ static void __exit hello_cleanup(void)
 module_init(hello_init);
 module_exit(hello_cleanup);
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(MODULE);
make[1]: Leaving directory '/dev/shm/linux'
$ cat modules.nsdeps
/tmp/ppyu/test-module/test.ko: MODULE

Looks good so far, then I try make clean:

$ make clean
make -C /dev/shm/linux M=/tmp/ppyu/test-module clean
make[1]: Entering directory '/dev/shm/linux'
  CLEAN   /tmp/ppyu/test-module/Module.symvers
make[1]: Leaving directory '/dev/shm/linux'
$ ls
Makefile  modules.nsdeps  test1.c  test2.c

But modules.nsdeps is still there.

