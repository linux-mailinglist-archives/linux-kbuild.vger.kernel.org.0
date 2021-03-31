Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98E93505DC
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 19:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbhCaRyb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 13:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbhCaRyQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 13:54:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3618C06174A
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 10:54:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s17so24892011ljc.5
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 10:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9A9ww4rQUdY3ojKZCC1DB3r6UqmhvDhvswbu4JoQEio=;
        b=cm38beLeV+gqOXd++TM8MCiOpTRwonhIyR/dG9IXlrP4NO5zNwL5W+BGyKA/HasGvW
         XoPblAQSWqFdftq7mEdhRjyjG4oQL45yy0Ev5bbGHTonufD/W/bNLebYSVIDQXlXTo1d
         OBH32n1GlqnFsHnl27zWznGdIdXIeXOGGti9V2+k3gd+WtlFiKn/G9ZJBGhq44Xv4U0/
         oTntTgWjAm3RHhanVwQOQJhmItfE2/skI9q15SPM4g+nEKaHx+3ZoUbvkcNltihDpeBy
         RQBpcLsPl+e9iapI3v7GzxvFtaI20yTSRzx8/f1EH+3a5zG28Rqult1Ki1Ye7Hv4xhtR
         F0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9A9ww4rQUdY3ojKZCC1DB3r6UqmhvDhvswbu4JoQEio=;
        b=i1SRhiZ+AA3aPjj2iQWN/9skLw5vP/yb0v31sU/flAGGYxdXJ5bc9IgRkrw2OlCpKK
         JkfXmV3hyKlzPzdg0S5q0Jpe+Fyq/2j/lPApd2kB/taWrhkxZ8mox9xaG9NO4Pl9wTmv
         k15OPpedGjZ3cmrpZ+Ph2PxERqHcSLaIkrM474N7Wvlh8qQYNbghX3aOhPmE438CmSjP
         GoiWT0bl5pfVOwoo78zyvAugh8frcJ7K+He1fDkUvfyu4tACVHGOPgQCFfgZD3qR0LW4
         8+vklpq+s4QtOIaRlYMJSKKbsAtqk+M6MIuDp4eRJWzsLdpAop32ovSssJkZkDYW+VF2
         59yQ==
X-Gm-Message-State: AOAM531GI+IdNfjJyYKeaj0B1J32EvUPdFdhk40Eh5SezkGkumWmTwaG
        eAU3PGfGU8VF6WcH7wePbMWZxQog/E1UjWiU/IvUPpRYTR8Phw==
X-Google-Smtp-Source: ABdhPJwERGvvjLkxfZzMMn7o3xJaAAVMqEQlFROWX0ouaVknZw9OCybjMkS68AN3sG7V+DacLtuEeauazzT6G/MNPWM=
X-Received: by 2002:a2e:5716:: with SMTP id l22mr2798734ljb.244.1617213253975;
 Wed, 31 Mar 2021 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133811.3221540-1-masahiroy@kernel.org> <20210331133811.3221540-5-masahiroy@kernel.org>
In-Reply-To: <20210331133811.3221540-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 31 Mar 2021 10:54:03 -0700
Message-ID: <CAKwvOdnZWWbirNGu-PdfnhTqXQ6yD9-dyUy7jMRyL+O5qN4gzg@mail.gmail.com>
Subject: Re: [PATCH 5/9] kbuild: rename extmod-prefix to extmod_prefix
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 6:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This seems to be useful in sub-make as well. As a preparation of
> exporting it, rename extmod-prefix to extmod_prefix because exported
> variables cannot contain hyphens.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b5ff4753eba8..e3c2bd1b6f42 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -919,7 +919,7 @@ endif
>  ifdef CONFIG_LTO_CLANG
>  ifdef CONFIG_LTO_CLANG_THIN
>  CC_FLAGS_LTO   := -flto=thin -fsplit-lto-unit
> -KBUILD_LDFLAGS += --thinlto-cache-dir=$(extmod-prefix).thinlto-cache
> +KBUILD_LDFLAGS += --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
>  else
>  CC_FLAGS_LTO   := -flto
>  endif
> @@ -1141,9 +1141,9 @@ endif # CONFIG_BPF
>
>  PHONY += prepare0
>
> -extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> -export MODORDER := $(extmod-prefix)modules.order
> -export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
> +extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> +export MODORDER := $(extmod_prefix)modules.order
> +export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
>
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
> @@ -1742,7 +1742,7 @@ build-dirs := $(KBUILD_EXTMOD)
>  $(MODORDER): descend
>         @:
>
> -compile_commands.json: $(extmod-prefix)compile_commands.json
> +compile_commands.json: $(extmod_prefix)compile_commands.json
>  PHONY += compile_commands.json
>
>  clean-dirs := $(KBUILD_EXTMOD)
> @@ -1832,12 +1832,12 @@ endif
>
>  PHONY += single_modpost
>  single_modpost: $(single-no-ko) modules_prepare
> -       $(Q){ $(foreach m, $(single-ko), echo $(extmod-prefix)$m;) } > $(MODORDER)
> +       $(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$m;) } > $(MODORDER)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
>  KBUILD_MODULES := 1
>
> -export KBUILD_SINGLE_TARGETS := $(addprefix $(extmod-prefix), $(single-no-ko))
> +export KBUILD_SINGLE_TARGETS := $(addprefix $(extmod_prefix), $(single-no-ko))
>
>  # trim unrelated directories
>  build-dirs := $(foreach d, $(build-dirs), \
> @@ -1906,12 +1906,12 @@ nsdeps: modules
>  quiet_cmd_gen_compile_commands = GEN     $@
>        cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
>
> -$(extmod-prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
> +$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
>         $(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
>         $(if $(CONFIG_MODULES), $(MODORDER)) FORCE
>         $(call if_changed,gen_compile_commands)
>
> -targets += $(extmod-prefix)compile_commands.json
> +targets += $(extmod_prefix)compile_commands.json
>
>  PHONY += clang-tidy clang-analyzer
>
> @@ -1919,7 +1919,7 @@ ifdef CONFIG_CC_IS_CLANG
>  quiet_cmd_clang_tools = CHECK   $<
>        cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
>
> -clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
> +clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
>         $(call cmd,clang_tools)
>  else
>  clang-tidy clang-analyzer:
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
