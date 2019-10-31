Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF54EAF2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 12:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfJaLyJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Oct 2019 07:54:09 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49976 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfJaLyJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 07:54:09 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x9VBs2aB001029;
        Thu, 31 Oct 2019 20:54:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x9VBs2aB001029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572522843;
        bh=m93XGxKPbCurKlKFk3bu8jhuKGv0fLdi65T0vmL+qQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y562YAlrVc0kdR5gsAkGhkYbZNSVU7042vHgwarApJ+msGR4gF6hrZxQ6Z45Ctxgw
         Tj7Lc1A8xdsriGCBBqepXRQmgoKGKpBE0jH7rZlJaOO4Kb1YsV8LCjgb3iVKo1nABz
         lJMpUwId/LhlNyY46AkZFFmEonQ61lrLuxBxVOrs4QYy1hI7UNdmzx3eHkHXeMznhB
         DHbTxeOff+Yyaa/GFYUlvcJXOLA5JJ+2HEGehPgCsKERdFNxbNbL6q3PKlNO1KvqmT
         U1YACh4tVxbMoLkyptIRJXkVkxtRoCi6WFLBZE7l7s66z5cKKErBdj99nOqgdBETLg
         jijuPhrjNECPg==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id k19so1294589vke.10;
        Thu, 31 Oct 2019 04:54:02 -0700 (PDT)
X-Gm-Message-State: APjAAAU+Exl5uThigefE7snqbu9sODjvStc0bvQArIFkdhFf0tjUarcr
        7YEtD29Dp/WHZPftpJc0IPA0lhcK1n1vo8XbIEg=
X-Google-Smtp-Source: APXvYqw9ZcRAr8ugDfLbOckJz9YBD5IgemzVYx/4Xa8WAM8apy1Wi1ubfXQJw9i8kuSCfEXiAWoYmh7iJljYAF6zzy8=
X-Received: by 2002:a1f:7387:: with SMTP id o129mr2279206vkc.73.1572522841286;
 Thu, 31 Oct 2019 04:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-3-yamada.masahiro@socionext.com> <20191031112044.GC2177@linux-8ccs>
In-Reply-To: <20191031112044.GC2177@linux-8ccs>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 31 Oct 2019 20:53:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCmSUuqLyJhZW+3yrGk1KTPxA-_0x86N=Y7A5psCVUSg@mail.gmail.com>
Message-ID: <CAK7LNASCmSUuqLyJhZW+3yrGk1KTPxA-_0x86N=Y7A5psCVUSg@mail.gmail.com>
Subject: Re: [PATCH 2/4] modpost: dump missing namespaces into a single
 modules.nsdeps file
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 31, 2019 at 8:20 PM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Masahiro Yamada [29/10/19 21:38 +0900]:
> >The modpost, with the -d option given, generates per-module .ns_deps
> >files.
> >
> >Kbuild generates per-module .mod files to carry module information.
> >This is convenient because Make handles multiple jobs when the -j
> >option is given.
> >
> >On the other hand, the modpost always runs as a single thread.
> >I do not see a strong reason to produce separate .ns_deps files.
> >
> >This commit changes the modpost to generate just one file,
> >modules.nsdeps, each line of which has the following format:
> >
> >  <module_name>: <list of missing namespaces>
> >
> >Please note it contains *missing* namespaces instead of required ones.
> >So, modules.nsdeps is empty if the namespace dependency is all good.
> >
> >This will work more efficiently because spatch will no longer process
> >already imported namespaces. I removed the '(if needed)' from the
> >nsdeps log since spatch is invoked only when needed.
> >
> >This also solved the stale .ns_deps files problem reported by
> >Jessica Yu:
> >
> >  https://lkml.org/lkml/2019/10/28/467
> >
> >While I was here, I improved the modpost code a little more;
> >I freed ns_deps_bus.p because buf_write() allocates memory.
> >
> >Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >---
> >
> > .gitignore               |  2 +-
> > Documentation/dontdiff   |  1 +
> > Makefile                 |  4 ++--
> > scripts/Makefile.modpost |  2 +-
> > scripts/mod/modpost.c    | 44 +++++++++++++++++-----------------------
> > scripts/mod/modpost.h    |  4 ++--
> > scripts/nsdeps           | 21 +++++++++----------
> > 7 files changed, 36 insertions(+), 42 deletions(-)
> >
> >diff --git a/.gitignore b/.gitignore
> >index 70580bdd352c..72ef86a5570d 100644
> >--- a/.gitignore
> >+++ b/.gitignore
> >@@ -32,7 +32,6 @@
> > *.lzo
> > *.mod
> > *.mod.c
> >-*.ns_deps
> > *.o
> > *.o.*
> > *.patch
> >@@ -61,6 +60,7 @@ modules.order
> > /System.map
> > /Module.markers
> > /modules.builtin.modinfo
> >+/modules.nsdeps
> >
> > #
> > # RPM spec file (make rpm-pkg)
> >diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> >index 9f4392876099..72fc2e9e2b63 100644
> >--- a/Documentation/dontdiff
> >+++ b/Documentation/dontdiff
> >@@ -179,6 +179,7 @@ mkutf8data
> > modpost
> > modules.builtin
> > modules.builtin.modinfo
> >+modules.nsdeps
> > modules.order
> > modversions.h*
> > nconf
> >diff --git a/Makefile b/Makefile
> >index 0ef897fd9cfd..1e3f307bd49b 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -1356,7 +1356,7 @@ endif # CONFIG_MODULES
> >
> > # Directories & files removed with 'make clean'
> > CLEAN_DIRS  += include/ksym
> >-CLEAN_FILES += modules.builtin.modinfo
> >+CLEAN_FILES += modules.builtin.modinfo modules.nsdeps
>
> Hmm, I tried to run `make -C path/to/kernel/src M=$(PWD) clean` for a test
> external module, but it didn't remove modules.nsdeps for me. I declared a
> MODULE namespace for testing purposes.
>
> $ make
> make -C /dev/shm/linux M=/tmp/ppyu/test-module
> make[1]: Entering directory '/dev/shm/linux'
>   AR      /tmp/ppyu/test-module/built-in.a
>   CC [M]  /tmp/ppyu/test-module/test1.o
>   CC [M]  /tmp/ppyu/test-module/test2.o
>   LD [M]  /tmp/ppyu/test-module/test.o
>   Building modules, stage 2.
>   MODPOST 1 modules
> WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
>   CC [M]  /tmp/ppyu/test-module/test.mod.o
>   LD [M]  /tmp/ppyu/test-module/test.ko
> make[1]: Leaving directory '/dev/shm/linux'
>
> Then I make nsdeps:
>
> make -C /dev/shm/linux M=/tmp/ppyu/test-module nsdeps
> make[1]: Entering directory '/dev/shm/linux'
>   Building modules, stage 2.
>   MODPOST 1 modules
> WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
> Adding namespace MODULE to module /tmp/ppyu/test-module/test.ko.
> --- /tmp/ppyu/test-module/test1.c
> +++ /tmp/cocci-output-3696-c1f8b3-test1.c
> @@ -38,3 +38,4 @@ static void __exit hello_cleanup(void)
>  module_init(hello_init);
>  module_exit(hello_cleanup);
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(MODULE);
> make[1]: Leaving directory '/dev/shm/linux'
> $ cat modules.nsdeps
> /tmp/ppyu/test-module/test.ko: MODULE
>
> Looks good so far, then I try make clean:
>
> $ make clean
> make -C /dev/shm/linux M=/tmp/ppyu/test-module clean
> make[1]: Entering directory '/dev/shm/linux'
>   CLEAN   /tmp/ppyu/test-module/Module.symvers
> make[1]: Leaving directory '/dev/shm/linux'
> $ ls
> Makefile  modules.nsdeps  test1.c  test2.c
>
> But modules.nsdeps is still there.
>

Good catch!

I forgot to take care of it for external module builds.

The following should work. I will fold it in 3/4.




diff --git a/Makefile b/Makefile
index 79be70bf2899..6035702803eb 100644
--- a/Makefile
+++ b/Makefile
@@ -1619,7 +1619,7 @@ _emodinst_post: _emodinst_
        $(call cmd,depmod)

 clean-dirs := $(KBUILD_EXTMOD)
-clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
+clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
$(KBUILD_EXTMOD)/modules.nsdeps

 PHONY += /
 /:



-- 
Best Regards
Masahiro Yamada
