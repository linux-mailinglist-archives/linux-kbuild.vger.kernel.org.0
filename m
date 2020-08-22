Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAD124E444
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgHVApt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgHVAps (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:45:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E9C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:45:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y206so1870990pfb.10
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NY5DJt5lm6krkgKqak2a2sk/F2E40cokLY/vvCYJjVU=;
        b=DAF4Uzk+6LWkOs67dmwOZou7gMPWDX2nM+zcoecflADOiL1AApoCC/JOPEkSQFkCe9
         4WSr+j+63g7Ni5esapgD1nt5CR/9zSSKPFoaEfNoK0y4PegYReQteJWzEimSmub/wKGi
         xVDmEqNhXCZsXw6Pm6SzY+HkCzuNUjWsnG4dWedcSFlvtJywfAuRC39AkyUyeShZPGEk
         xwYFWWHo/lB1SzX3IEoapRxiW0fR53qf/UbXUno1IwmGzUGDJKlVwl4kVoyN+g4bNZzo
         0yC59/HRF5YJ2tDfwIaAJQuy/wRY/imraHuuNkRB3zA5THp6yCekidNPx2ds3GdoO5z2
         VU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NY5DJt5lm6krkgKqak2a2sk/F2E40cokLY/vvCYJjVU=;
        b=rhbRza7kbeNSjWEd4zhNYYp7ewxWJhOb7ik8txpbdykfA0r7rWtZyTON431O4MddMg
         YapmNuClz5YoFnWi3rj6vs86nfFkyn74PvcOnu53oViAvtbXrU8AxPzW1wQFgcvkPbek
         r2pIX35ExkJKVONh1ERLFavwabKdj6MJeBo8YRpfCnhG3DR+OvDlL12MJcSTZpXD5eEF
         JwscnYdMruGqx223wa6k8stGNBKB5jp2l1GZ4u/z/Fq3VG7HRwZC7Yz2u0fUDgk/eLQS
         2MGzXMgF7kJo2yZxpvSnWVjvclccW7hFdaVWcJNJW7WbKFSinsSUUcVtMSU/noyRk7K1
         Bzqw==
X-Gm-Message-State: AOAM533LTrnmVvXJMop8MoEAZp6uwJxRLmMaK1G8drOtYmazR6ycJ446
        mpRaFSpUysqCE5O9aXTsVonkiXpeclf/hM+q5WtNsWt1jjU=
X-Google-Smtp-Source: ABdhPJwCpi4q0w40Z6KfvQ4WP6U01dqUMDFXPo+YITzJ/wHGuNDDeuZOHf+Qy1UlvvJQR6jXqD66x7/zMuutikn4Yio=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr4156920pgh.263.1598057146355;
 Fri, 21 Aug 2020 17:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org> <20200821190159.1033740-9-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-9-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:45:35 -0700
Message-ID: <CAKwvOdkm81Cn66LFKiM2bcSbFP29vPWxOGu9RsaLvMFZ=D5b4g@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] kbuild: wire up the build rule of
 compile_commands.json to Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, you need to manually run scripts/gen_compile_commands.py
> to create compile_commands.json. It parses all the .*.cmd files found
> under the specified directory.
>
> If you rebuild the kernel over again without 'make clean',
> .*.cmd files from older builds will create stale entries in
> compile_commands.json.
>
> This commit wires up the compile_commands.json rule to Makefile, and
> makes it parse only the .*.cmd files involved in the current build.
>
> Pass $(KBUILD_VMLINUX_OBJS), $(KBUILD_VMLINUX_LIBS), and modules.order
> to the script. The objects or archives linked to vmlinux are listed in
> $(KBUILD_VMLINUX_OBJS) or $(KBUILD_VMLINUX_LIBS). All the modules are
> listed in modules.order.
>
> You can create compile_commands.json from Make:
>
>   $ make -j$(nproc) CC=clang compile_commands.json
>
> You can also build vmlinux, modules, and compile_commands.json all
> together in a single command:
>
>   $ make -j$(nproc) CC=clang all compile_commands.json
>
> It works for M= builds as well. In this case, compile_commands.json
> is created in the top directory of the external module.
>
> This is convenient, but it has a drawback; the coverage of the
> compile_commands.json is reduced because only the objects linked to
> vmlinux or modules are handled. For example, the following C files are
> not included in the compile_commands.json:
>
>  - Decompressor source files (arch/*/boot/)
>  - VDSO source files
>  - C files used to generate intermediates (e.g. kernel/bounds.c)
>  - Standalone host programs
>
> I think it is fine for most developers because our main interest is
> the kernel-space code.
>
> If you want to cover all the compiled C files, please build the kernel
> then run the script manually as before:
>
>   $ make clean    # if you want to delete stale .cmd files [optional]
>   $ make -j$(nproc) CC=clang
>   $ scripts/gen_compile_commands.json
>
> Here is a note for out-of-tree builds. 'make compile_commands.json'
> works with O= option, but please notice compile_commands.json is
> created in the object tree instead of the source tree.
>
> Some people may want to have compile_commands.json in the source tree
> because Clang Tools searches for it through all parent paths of the
> first input source file.
>
> However, you cannot do this for O= builds. Kbuild should never generate
> any build artifact in the source tree when O= is given because the
> source tree might be read-only. Any write attempt to the source tree
> is monitored and the violation may be reported. See the commit log of
> 8ef14c2c41d9.
>
> So, the only possible way is to create compile_commands.json in the
> object tree, then specify '-p <build-path>' when you use clang-check,
> clang-tidy, etc.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)
>
>  Makefile | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9cac6fde3479..65ed336a6de1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -635,7 +635,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all modules nsdeps,$(MAKECMDGOALS)),)
> +ifneq ($(filter all modules nsdeps %compile_commands.json,$(MAKECMDGOALS)),)
>    KBUILD_MODULES := 1
>  endif
>
> @@ -1464,7 +1464,8 @@ endif # CONFIG_MODULES
>
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES += include/ksym vmlinux.symvers \
> -              modules.builtin modules.builtin.modinfo modules.nsdeps
> +              modules.builtin modules.builtin.modinfo modules.nsdeps \
> +              compile_commands.json
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
> @@ -1698,9 +1699,12 @@ KBUILD_MODULES := 1
>
>  build-dirs := $(KBUILD_EXTMOD)
>  PHONY += modules
> -modules: descend
> +modules: $(MODORDER)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
> +$(MODORDER): descend
> +       @:

^ stuff like this I don't understand.  But I understand the premise of
the patch, the change in behavior, and the tradeoffs, so:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> +
>  PHONY += modules_install
>  modules_install: _emodinst_ _emodinst_post
>
> @@ -1714,8 +1718,12 @@ PHONY += _emodinst_post
>  _emodinst_post: _emodinst_
>         $(call cmd,depmod)
>
> +compile_commands.json: $(extmod-prefix)compile_commands.json
> +PHONY += compile_commands.json
> +
>  clean-dirs := $(KBUILD_EXTMOD)
> -clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
> +clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
> +       $(KBUILD_EXTMOD)/compile_commands.json
>
>  PHONY += help
>  help:
> @@ -1828,6 +1836,19 @@ nsdeps: export KBUILD_NSDEPS=1
>  nsdeps: modules
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
>
> +# Clang Tooling
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_gen_compile_commands = GEN     $@
> +      cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
> +
> +$(extmod-prefix)compile_commands.json: scripts/gen_compile_commands.py \
> +       $(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
> +       $(if $(CONFIG_MODULES), $(MODORDER)) FORCE
> +       $(call if_changed,gen_compile_commands)
> +
> +targets += $(extmod-prefix)compile_commands.json
> +
>  # Scripts to check various things for consistency
>  # ---------------------------------------------------------------------------
>
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
