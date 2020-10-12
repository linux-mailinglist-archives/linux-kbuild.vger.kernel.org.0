Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF18228BBFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 17:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389340AbgJLPdf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 11:33:35 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36641 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389797AbgJLPde (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 11:33:34 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 09CFXJSO020029;
        Tue, 13 Oct 2020 00:33:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 09CFXJSO020029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602516799;
        bh=4xfUkRM4tDIXFk/3vrkgZkiCeT2rEb0t423IsRd/G98=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S4Z7K/Q4dgPotevhgimcaWst96OFcDNem9aT2gZGQEVZQSpbcec2wkRhGrkoR8FRF
         AKgJxRu6983EDPetJ+7/ldK7/GQ6DHGagMcCSpoAnvP0mZScXkUy8GQ0uxogCcx7wo
         J/1ArJR51t87dXtsHaB3AdBoLIWnnPLANOeu3Jd4U5YFTdGfrpGRK34mH69oJbOWUP
         QdwwQfLta5BZuONKcZYFeNiKXhXtdCKK0NpJoYinAO4ijbMtRMgy0yxXO9JClwcW/Q
         KbEcv24TxFdwp9KxczT23+k5GCB7H5SH5oaS586NRYertNgtLeJ1K1X9zdDZ/3wSMN
         hdx7ij93ZDG1A==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id a200so13796763pfa.10;
        Mon, 12 Oct 2020 08:33:19 -0700 (PDT)
X-Gm-Message-State: AOAM533QSGcJCcUv0/aO17dSXOlxL9zwQdyiS17MuMwlrWUenByp42YF
        qCJvMiyUpZa/ngjUe2XRv9App2268mDc/3m2Xvk=
X-Google-Smtp-Source: ABdhPJzY2prhw5FRGtjof81jBwHsEX04/rS7YVZYomzkxPVRVeT+isQ1/XL54G7/ldeuyrFICLsLjjjsTEcVQcpRjHk=
X-Received: by 2002:a17:90a:c285:: with SMTP id f5mr21414855pjt.87.1602516798361;
 Mon, 12 Oct 2020 08:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <979bb7b0-2cae-3cd7-2fbd-7fcece9aafd1@gmail.com>
In-Reply-To: <979bb7b0-2cae-3cd7-2fbd-7fcece9aafd1@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 13 Oct 2020 00:32:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQFgzsmUppA=4eF1VrO_Tg=zrM9NSvUxrOp=7qa2_GsQ@mail.gmail.com>
Message-ID: <CAK7LNATQFgzsmUppA=4eF1VrO_Tg=zrM9NSvUxrOp=7qa2_GsQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] kbuild: use interpreters to invoke scripts
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 4, 2020 at 12:21 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
>
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  Makefile                          | 4 ++--
>  arch/arm64/kernel/vdso/Makefile   | 2 +-
>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>  arch/ia64/Makefile                | 4 ++--
>  arch/nds32/kernel/vdso/Makefile   | 2 +-
>  scripts/Makefile.build            | 2 +-
>  scripts/Makefile.package          | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f93dbae71248..5f1399a576d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1258,7 +1258,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>  PHONY += headerdep
>  headerdep:
>         $(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> -       $(srctree)/scripts/headerdep.pl -I$(srctree)/include
> +       $(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>
>  # ---------------------------------------------------------------------------
>  # Kernel headers
> @@ -1314,7 +1314,7 @@ PHONY += kselftest-merge
>  kselftest-merge:
>         $(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>         $(Q)find $(srctree)/tools/testing/selftests -name config | \
> -               xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> +               xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>         $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
>  # ---------------------------------------------------------------------------
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index de981f7b4546..30fe93bb5488 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>         $(call if_changed,vdsosym)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 572475b7b7ed..4f8fe34bc75a 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
>  # The AArch64 nm should be able to read an AArch32 binary
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>
>  # Install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL32 $@
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 2876a7df1b0a..5f6cc3c3da50 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -28,8 +28,8 @@ cflags-y      := -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>                    -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>
> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")



These changes look wrong to me.

$($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)





>  ifeq ($(GAS_STATUS),buggy)
>  $(error Sorry, you need a newer version of the assember, one that is built from        \
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
> index 55df25ef0057..e77d4bcfa7c1 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>         $(call if_changed,vdsosym)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a467b9323442..893217ee4a17 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -104,7 +104,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
>
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
> +  cmd_checkdoc = $(PERL) $(srctree)/scripts/kernel-doc -none $<
>  endif
>
>  # Compile C sources (.c)
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index f952fb64789d..4fc16c4776cc 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -44,7 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>         echo >&2; \
>         false; \
>  fi ; \
> -$(srctree)/scripts/setlocalversion --save-scmversion; \
> +$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion; \
>  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
> @@ -123,7 +123,7 @@ git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
>  mkdir -p $(perf-tar);                                               \
>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>  (cd $(srctree)/tools/perf;                                          \
> -util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
> +$(CONFIG_SHELL) util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> --
> 2.26.2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/979bb7b0-2cae-3cd7-2fbd-7fcece9aafd1%40gmail.com.



-- 
Best Regards
Masahiro Yamada
