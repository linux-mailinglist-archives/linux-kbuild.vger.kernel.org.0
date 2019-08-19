Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDE892812
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 17:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHSPLg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 11:11:36 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49145 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfHSPLg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 11:11:36 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x7JFBGtA012361;
        Tue, 20 Aug 2019 00:11:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7JFBGtA012361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566227477;
        bh=h/gYp6z9vHElY/ysm1oNETCDq97Pb6kSM8SnC30SrZc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gzf7HKVd8BquHU9WC9XvO/pO4AYOPyvHVgjee9uNncToq2MUG6n7cU4kS+oF6fAMe
         t/fZ+7sQerhgrFBp+BMrzUaeCKqFSGLmfLtbdmbbaEXYHCIh7IpsPfNfr3cmqOJNpX
         BFMEQbS5bbjyD5bD4WaM4wVRaHSZczIazr5mSquhN4l7mvbS+vRcfHCOgo/0ZWY3RJ
         okLZsXo9HBmO/TqKEJC8FP5WSSBbm6hDrzNBCS0qdpqVKv9cHqYrVXkXBSKPr0VMp+
         suzN9PQLAn3vZPjCkCJHv4VjfuyY7Z5XNTRffH3czkn5H0VLLLDdlwOkRxWFuvqnnr
         VTq0N6tvcbIZw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id q188so1398192vsa.4;
        Mon, 19 Aug 2019 08:11:17 -0700 (PDT)
X-Gm-Message-State: APjAAAX6z2Zxc4VU095L9BpNRrTqaDM0qjIr74E559W5MbTFLLTPLB33
        0CHyJrN+5oYQt/LpPTNPXisTXmwBc1Sznofojkk=
X-Google-Smtp-Source: APXvYqwZURSuJY4CFy+oTgNhYJPZJF8pYegkGVSJF0jfwehnc5vxsjUSyxOIGHwPsLbn9Khrol78ytg7SCrJ9iCVjZg=
X-Received: by 2002:a67:8a83:: with SMTP id m125mr14497318vsd.181.1566227475706;
 Mon, 19 Aug 2019 08:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190814151919.16300-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190814151919.16300-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 20 Aug 2019 00:10:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWuhXBG7hCg8nEJ+S5eRhcZqZ-qL2pW9NbJ2e_FNf+jw@mail.gmail.com>
Message-ID: <CAK7LNATWuhXBG7hCg8nEJ+S5eRhcZqZ-qL2pW9NbJ2e_FNf+jw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: make single targets work more correctly
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 12:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, the single target build directly descends into the directory
> of the target. For example,
>
>   $ make foo/bar/baz.o
>
> ... directly descends into foo/bar/.
>
> On the other hand, the normal build usually descends one directory at
> a time, i.e. descends into foo/, and then foo/bar/.
>
> This difference causes some problems.
>
> [1] miss subdir-asflags-y, subdir-ccflags-y in upper Makefiles
>
>     The options in subdir-{as,cc}flags-y take effect in the current
>     and its sub-directories. In other words, they are inherited
>     downward. In the example above, the single target will miss
>     subdir-{as,cc}flags-y if they are defined in foo/Makefile.
>
> [2] could be built in a different directory
>
>     As Documentation/kbuild/modules.rst section 4.3 says, Kbuild can
>     handle files that are spread over several sub-directories.
>
>     The build rule of foo/bar/baz.o may not necessarily be specified in
>     foo/bar/Makefile. It might be specifies in foo/Makefile as follows:
>
>     [foo/Makefile]
>     obj-y := bar/baz.o
>
>     This often happens when a module is so big that its source files
>     are divided into sub-directories.
>
>     In this case, there is no Makefile in the foo/bar/ directory, yet
>     the single target descends into foo/bar/, then fails due to the
>     missing Makefile. You can still do 'make foo/bar/' for partial
>     building, but cannot do 'make foo/bar/baz.s'. I believe the single
>     target '%.s' is a useful feature for inspecting the compiler output.
>
>     Some modules work around this issue by putting an empty Makefile
>     in every sub-directory.
>
> This commit fixes those problems by making the single target build
> descend in the same way as the normal build does.
>
> Another change is the single target build will observe the CONFIG
> options. Previously, it allowed users to build the foo.o even when
> the corresponding CONFIG_FOO is disabled:
>
>    obj-$(CONFIG_FOO) += foo.o
>
> In the new behavior, the single target build will just fail and show
> "No rule to make target ..." (or "Nothing to be done for ..." if the
> stale object already exists, but cannot be updated).
>
> The disadvantage of this commit is the build speed. Now that the
> single target build visits every directory and parses lots of
> Makefiles, it is slower than before. (But, I hope it will not be
> too slow.)
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both applied.


> Changes in v2:
>  - Fix single targets for external module build
>
>  Makefile               | 84 ++++++++++++++++++++++++++----------------
>  scripts/Makefile.build | 45 +++++++++++++++++++---
>  2 files changed, 92 insertions(+), 37 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9661fa37158f..164ca615e2f6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -230,6 +230,8 @@ endif
>
>  export KBUILD_CHECKSRC KBUILD_EXTMOD
>
> +extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> +
>  ifeq ($(abs_srctree),$(abs_objtree))
>          # building in the source tree
>          srctree := .
> @@ -271,11 +273,16 @@ no-dot-config-targets := $(clean-targets) \
>                          %asm-generic kernelversion %src-pkg
>  no-sync-config-targets := $(no-dot-config-targets) install %install \
>                            kernelrelease
> +single-targets := %.a %.i %.ko %.lds %.lst %.mod %.o %.s %.symtypes %/
> +ifdef CONFIG_CC_IS_CLANG
> +single-targets += %.ll
> +endif
>
>  config-build   :=
>  mixed-build    :=
>  need-config    := 1
>  may-sync-config        := 1
> +single-build   :=
>
>  ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
>         ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
> @@ -302,6 +309,14 @@ ifeq ($(KBUILD_EXTMOD),)
>          endif
>  endif
>
> +# We cannot build single targets and the others at the same time
> +ifneq ($(filter $(single-targets), $(MAKECMDGOALS)),)
> +       single-build := 1
> +       ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
> +               mixed-build := 1
> +       endif
> +endif
> +
>  # For "make -j clean all", "make -j mrproper defconfig all", etc.
>  ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
>          ifneq ($(filter-out $(clean-targets),$(MAKECMDGOALS)),)
> @@ -1003,7 +1018,7 @@ endif
>
>  PHONY += prepare0
>
> -export MODORDER := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
> +export MODORDER := $(extmod-prefix)modules.order
>
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
> @@ -1655,7 +1670,7 @@ endif # KBUILD_EXTMOD
>  PHONY += descend $(build-dirs)
>  descend: $(build-dirs)
>  $(build-dirs): prepare
> -       $(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
> +       $(Q)$(MAKE) $(build)=$@ single-build=$(single-build) need-builtin=1 need-modorder=1
>
>  clean-dirs := $(addprefix _clean_, $(clean-dirs))
>  PHONY += $(clean-dirs) clean
> @@ -1752,40 +1767,47 @@ tools/%: FORCE
>
>  # Single targets
>  # ---------------------------------------------------------------------------
> -# Single targets are compatible with:
> -# - build with mixed source and output
> -# - build with separate output dir 'make O=...'
> -# - external modules
> +# To build individual files in subdirectories, you can do like this:
> +#
> +#   make foo/bar/baz.s
> +#
> +# The supported suffixes for single-target are listed in 'single-targets'
>  #
> -#  target-dir => where to store outputfile
> -#  build-dir  => directory in kernel source tree to use
> -
> -build-target = $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD)/)$@
> -build-dir = $(patsubst %/,%,$(dir $(build-target)))
> -
> -%.i: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> -%.ll: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> -%.lst: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> -%.o: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> -%.s: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> -%.symtypes: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
> +# To build only under specific subdirectories, you can do like this:
> +#
> +#   make foo/bar/baz/
> +
> +ifdef single-build
> +
> +single-all := $(filter $(single-targets), $(MAKECMDGOALS))
> +
> +# .ko is special because modpost is needed
> +single-ko := $(sort $(filter %.ko, $(single-all)))
> +single-no-ko := $(sort $(patsubst %.ko,%.mod, $(single-all)))
> +
> +$(single-ko): single_modpost
> +       @:
> +$(single-no-ko): descend
> +       @:
> +
>  ifeq ($(KBUILD_EXTMOD),)
> -# For the single build of an in-tree module, use a temporary file to avoid
> +# For the single build of in-tree modules, use a temporary file to avoid
>  # the situation of modules_install installing an invalid modules.order.
> -%.ko: MODORDER := .modules.tmp
> +MODORDER := .modules.tmp
>  endif
> -%.ko: prepare FORCE
> -       $(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
> -       $(Q)echo $(build-target) > $(MODORDER)
> +
> +PHONY += single_modpost
> +single_modpost: $(single-no-ko)
> +       $(Q){ $(foreach m, $(single-ko), echo $(extmod-prefix)$m;) } > $(MODORDER)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> -%/: prepare FORCE
> -       $(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
> +
> +KBUILD_MODULES := 1
> +
> +export KBUILD_SINGLE_TARGETS := $(addprefix $(extmod-prefix), $(single-no-ko))
> +
> +single-build = $(if $(filter-out $@/, $(single-no-ko)),1)
> +
> +endif
>
>  # FIXME Should go into a make.lib or something
>  # ===========================================================================
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index f84ccca8d74f..10adf3b558de 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -52,7 +52,7 @@ ifndef obj
>  $(warning kbuild: Makefile.build is included improperly)
>  endif
>
> -ifeq ($(MAKECMDGOALS)$(need-modorder),)
> +ifeq ($(need-modorder),)
>  ifneq ($(obj-m),)
>  $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
>  $(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
> @@ -76,11 +76,6 @@ endif
>
>  mod-targets := $(patsubst %.o, %.mod, $(obj-m))
>
> -__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
> -        $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
> -        $(subdir-ym) $(always)
> -       @:
> -
>  # Linus' kernel sanity checking tool
>  ifeq ($(KBUILD_CHECKSRC),1)
>    quiet_cmd_checksrc       = CHECK   $<
> @@ -487,12 +482,50 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
>            $(call intermediate_targets, .lex.o, .lex.c) \
>            $(call intermediate_targets, .tab.o, .tab.c .tab.h)
>
> +# Build
> +# ---------------------------------------------------------------------------
> +
> +ifdef single-build
> +
> +curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
> +                       $(if $(filter $(x) $(basename $(x)).o, $(targets)), $(x))))
> +
> +# Handle single targets without any rule: show "Nothing to be done for ..." or
> +# "No rule to make target ..." depending on whether the target exists.
> +unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
> +                       $(filter $(obj)/%, \
> +                               $(filter-out $(curdir-single), \
> +                                       $(KBUILD_SINGLE_TARGETS))))
> +
> +__build: $(curdir-single) $(subdir-ym)
> +ifneq ($(unknown-single),)
> +       $(Q)$(MAKE) -f /dev/null $(unknown-single)
> +endif
> +       @:
> +
> +ifeq ($(curdir-single),)
> +# Nothing to do in this directory. Do not include any .*.cmd file for speed-up
> +targets :=
> +else
> +targets += $(curdir-single)
> +endif
> +
> +else
> +
> +__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
> +        $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
> +        $(subdir-ym) $(always)
> +       @:
> +
> +endif
> +
>  # Descending
>  # ---------------------------------------------------------------------------
>
>  PHONY += $(subdir-ym)
>  $(subdir-ym):
>         $(Q)$(MAKE) $(build)=$@ \
> +       $(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
>         need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
>         need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
