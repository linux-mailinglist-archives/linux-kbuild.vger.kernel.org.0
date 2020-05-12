Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A361CEC29
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 06:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgELEr1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 00:47:27 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39851 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgELEr1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 00:47:27 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04C4lBA8001660;
        Tue, 12 May 2020 13:47:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04C4lBA8001660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589258832;
        bh=tWGwfGztD2z/RvAz3neBmOayn6cuxuG3PSxa/ZcJpbg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mOGHPmCDEdoqZsFvVYBBiKqPCcLq8N98UujriisSvYXJh5xucv8wuMmdWE0Vs/W65
         LMwlSc+NnuJfHXV+zSzIsRxYdOKGu3IkpL/YGF0Q8doKiRXzdQs7Jr41MkFFWrnXH1
         J2evvqyowN3Shtr7y6qza4qUOHG56Si9gP8tRhiv8SyljnZ+kgFXZCSNL343j/UWqi
         XK3iCTpceYQUWM7Rg6aMjlB+XjC7YVPKh45V0UNKEMoESO/5IfZckBgKaFyNtnNXPX
         l+KBU6WDocbUQqK5+h+Ew6HFo+IZZxXnQ4YGrquT2ROu+IjQ2R6egpkq2oqaDUyLrF
         tT+/kMXuyWMLw==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id p5so2979691vke.1;
        Mon, 11 May 2020 21:47:11 -0700 (PDT)
X-Gm-Message-State: AOAM531B3MOCBPq5p13y/kNJCNYJJ+NQAyXp6XC5BiZ7Ihm6mTMNKSyG
        QaoO8ZidzfUHKfUMDkR7W0PPbbBovNvENu0uxm0=
X-Google-Smtp-Source: ABdhPJx9Bfa6MksNEoRe5t9wT2eICKX2B4d/8RFu+auloS9KsDHXOcvEkbuAo18ovUl5UV0ud/EQm9lTrtowvLXmDjU=
X-Received: by 2002:a1f:2e16:: with SMTP id u22mr6840176vku.12.1589258830441;
 Mon, 11 May 2020 21:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200504080807.126396-1-masahiroy@kernel.org> <20200504080807.126396-2-masahiroy@kernel.org>
In-Reply-To: <20200504080807.126396-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 May 2020 13:46:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmcUZtyYXiwPc8qet9harwtsFWUVXbznLHuYAO=VCG9w@mail.gmail.com>
Message-ID: <CAK7LNAQmcUZtyYXiwPc8qet9harwtsFWUVXbznLHuYAO=VCG9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove {CLEAN,MRPROPER,DISTCLEAN}_DIRS
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jeff Dike <jdike@addtoit.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Richard Weinberger <richard@nod.at>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 4, 2020 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Merge {CLEAN,MRPROPER,DISTCLEAN}_DIRS into {CLEAN,MRPROPER,DISTCLEAN}_FILES
> because the difference is just the -r option passed to the 'rm' command.
>
> Do likewise as commit 1634f2bfdb84 ("kbuild: remove clean-dirs syntax").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.




> ---
>
>  Makefile         | 22 ++++++----------------
>  arch/um/Makefile |  2 +-
>  2 files changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ffd80afcd0bb..8a7c931cc0d9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1389,14 +1389,14 @@ endif # CONFIG_MODULES
>  # make distclean Remove editor backup files, patch leftover files and the like
>
>  # Directories & files removed with 'make clean'
> -CLEAN_DIRS  += include/ksym
> -CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
> +CLEAN_FILES += include/ksym \
> +              modules.builtin modules.builtin.modinfo modules.nsdeps
>
>  # Directories & files removed with 'make mrproper'
> -MRPROPER_DIRS  += include/config include/generated          \
> +MRPROPER_FILES += include/config include/generated          \
>                   arch/$(SRCARCH)/include/generated .tmp_objdiff \
> -                 debian/ snap/ tar-install/
> -MRPROPER_FILES += .config .config.old .version \
> +                 debian snap tar-install \
> +                 .config .config.old .version \
>                   Module.symvers \
>                   signing_key.pem signing_key.priv signing_key.x509     \
>                   x509.genkey extra_certificates signing_key.x509.keyid \
> @@ -1404,12 +1404,10 @@ MRPROPER_FILES += .config .config.old .version \
>                   *.spec
>
>  # Directories & files removed with 'make distclean'
> -DISTCLEAN_DIRS  +=
>  DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
>
>  # clean - Delete most, but leave enough to build external modules
>  #
> -clean: rm-dirs  := $(CLEAN_DIRS)
>  clean: rm-files := $(CLEAN_FILES)
>
>  PHONY += archclean vmlinuxclean
> @@ -1422,7 +1420,6 @@ clean: archclean vmlinuxclean
>
>  # mrproper - Delete all generated files, including .config
>  #
> -mrproper: rm-dirs  := $(wildcard $(MRPROPER_DIRS))
>  mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
>  mrproper-dirs      := $(addprefix _mrproper_,scripts)
>
> @@ -1431,18 +1428,15 @@ $(mrproper-dirs):
>         $(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
>
>  mrproper: clean $(mrproper-dirs)
> -       $(call cmd,rmdirs)
>         $(call cmd,rmfiles)
>
>  # distclean
>  #
> -distclean: rm-dirs  := $(wildcard $(DISTCLEAN_DIRS))
>  distclean: rm-files := $(wildcard $(DISTCLEAN_FILES))
>
>  PHONY += distclean
>
>  distclean: mrproper
> -       $(call cmd,rmdirs)
>         $(call cmd,rmfiles)
>         @find $(srctree) $(RCS_FIND_IGNORE) \
>                 \( -name '*.orig' -o -name '*.rej' -o -name '*~' \
> @@ -1732,7 +1726,6 @@ $(clean-dirs):
>         $(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
>
>  clean: $(clean-dirs)
> -       $(call cmd,rmdirs)
>         $(call cmd,rmfiles)
>         @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
>                 \( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
> @@ -1827,11 +1820,8 @@ tools/%: FORCE
>         $(Q)mkdir -p $(objtree)/tools
>         $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
>
> -quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
> -      cmd_rmdirs = rm -rf $(rm-dirs)
> -
>  quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files)))
> -      cmd_rmfiles = rm -f $(rm-files)
> +      cmd_rmfiles = rm -rf $(rm-files)
>
>  # Run depmod only if we have System.map and depmod is executable
>  quiet_cmd_depmod = DEPMOD  $(KERNELRELEASE)
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 275f5ffdf6f0..3f27aa3ec0a6 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -140,7 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE)
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
>  CLEAN_FILES += linux x.i gmon.out
> -MRPROPER_DIRS += arch/$(SUBARCH)/include/generated
> +MRPROPER_FILES += arch/$(SUBARCH)/include/generated
>
>  archclean:
>         @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
