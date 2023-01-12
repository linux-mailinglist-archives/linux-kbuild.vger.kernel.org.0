Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3783E667E24
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 19:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjALS3S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 13:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240785AbjALS2o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 13:28:44 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF4476EC2
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:03:08 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id bn6so20166252ljb.13
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndh3l6uBoXa06zj+WBg5LiMdLFR8aWNRgARJ4DfSidI=;
        b=LmNrxNiZmnVFVPOM8BmikHO+4MdtaTs310NFHCrQYh4OmFV5ncP+XH0c5dQn01fuwx
         n5W72KOXp97Bj7YGCaO+z3yCVVIFae1JbKOuUx15pk1F3J3j36/X+daLs+rGgB6Nu/6X
         2YYgycZXiW3ADy31jqqUzgaR6RqVP6Z3joMShb/qD9lPd5woGyZKRdvyULhnqPp+KGTx
         Ohq1acwDyvdHJ9p3h+pcfbKHd2I8DbNWwZazTj7QDILzRh2vWEl0UUdCyyY5e6w0G85o
         hnqIlntQ6RfWEpqrc8MRRd3+k369cYBzvHCRGDUBXCY2cWVyRnAYwvfWQHJ92Xp9QFxr
         9X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndh3l6uBoXa06zj+WBg5LiMdLFR8aWNRgARJ4DfSidI=;
        b=plft18GX9GUyZ2E1SVGrvQmbJ7Onz7xN5yaS6Zh51mHVaTUFOjTHaoVL5IN/LDNTu5
         bbxNk+kXiydlKqGoelcilPHsbH8IXZNYGEoX77MM+Kn+9Y2zmSqE37hO3m2aKFMAHJH+
         5tjXzl49FwJjFXKcIqWJ39ADaOMMlWPtPUDmld0IO1zd6n5q26cIM7Q9LJLPQ4INb1Ws
         cvGFYGv4YgSZl1ujQ0GwgTnIekHVHCmblc163e2JqtKr3wFLqMQJGSWM8zl69sraW0Z/
         0lhhpGkfNJi0clV0+wk2nxw6pe/Wid4PDjkFr7nQOsduftNoxIEjD6buMi/vRiGDwXa7
         0mrA==
X-Gm-Message-State: AFqh2krjZV9SCHd47dwBXhlj1y9stOm+w1CNHggVylh2mNX+KoA4LSOX
        sacAuAc8nQbAMaA34X1eYJrONTSyXmHKsK0LXfY=
X-Google-Smtp-Source: AMrXdXuetufdJJeJC/X+XoCQxfcd8EltY+2hSGpOCciWaJv9pAZNP5cadqHRPbtuWDUUhvtwkyKs6ebexWS/akbSPeI=
X-Received: by 2002:a05:651c:124f:b0:27f:c535:5ec2 with SMTP id
 h15-20020a05651c124f00b0027fc5355ec2mr2707171ljh.204.1673546587258; Thu, 12
 Jan 2023 10:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org> <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 12 Jan 2023 19:02:30 +0100
Message-ID: <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> are several warnings in the PowerPC vDSO:
>
>   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
>
>   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
>
> The first group of warnings point out that linker flags were being added
> to all invocations of $(CC), even though they will only be used during
> the final vDSO link. Move those flags to ldflags-y.
>
> The second group of warnings are compiler or assembler flags that will
> be unused during linking. Filter them out from KBUILD_CFLAGS so that
> they are not used during linking.
>
> Additionally, '-z noexecstack' was added directly to the ld_and_check
> rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> but now that there is a common ldflags variable, it can be moved there.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 45c0cc5d34b6..4337b3aa9171 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>
> -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> -
> -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> +ccflags-y := -fno-common -fno-builtin
> +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> +# Filter flags that clang will warn are unused for linking
> +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +
> +CC32FLAGS := -m32
> +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
>  AS32FLAGS := -D__VDSO32__
>
> -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1

Set CC64FLAGS := -m64 ?

> +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
>  AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
> @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
>
>  # actual build commands
>  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
>  quiet_cmd_vdso32as = VDSO32A $@
>        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
>  quiet_cmd_vdso32cc = VDSO32C $@
>        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
>
>  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)

If no CC64FLAGS := xxx is set, this can go?

-Sedat-

>  quiet_cmd_vdso64as = VDSO64A $@
>        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
>
>
> --
> 2.39.0
>
