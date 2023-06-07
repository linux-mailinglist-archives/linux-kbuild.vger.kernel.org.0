Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46795725CA7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jun 2023 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbjFGLGs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jun 2023 07:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239418AbjFGLGp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jun 2023 07:06:45 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348071FE3
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jun 2023 04:06:20 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-786e8de85c1so1962493241.1
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jun 2023 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135631; x=1688727631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utFv2n7Nj2e/FDpN7qyLak8UIusvCi1A8IvvGYMYwhU=;
        b=DrwRvvr8wkCc60q+4TeytNMzG5yzg5YRzsakXJGC5Mw51JiiVpXEblZqcTLneUGJvd
         Sl1NFLHdxszDECCn/BTwb2PY65GlWu1yjId2I5ebbKULn5NN/9Cywfn2KeU4LYcUzD+0
         aVBVXuToS3UQiftn4+QXSg3fTT84fIo8/VwwmdS5+Lg32ucMC7dWX9sGw7asFrNqJ+du
         hRQ0EqOTlYd/EM2OtCPk9uRb5YTjsFKSOxVMzz9S86hL9AVjoxpqKux72m5Kks0rLNHY
         cq6HGMLo/dx7PHz6Z3KK0P6idgtfCnvnfrQ5B2WadXP6Zo+1J7Ugkd1IMVrZcKxtB8W7
         c0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135631; x=1688727631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utFv2n7Nj2e/FDpN7qyLak8UIusvCi1A8IvvGYMYwhU=;
        b=E7IGDzHPLHCDb27ruojUcyk5HYWcHgluOcjz8CGkvsPKbR6totzGlmff4RdWQH8D6t
         ILoP6D75SDRlUh2x10sU5H4WurTCbnBsbnKmh/7kiqUXB7BEEq1L+1YSAerf6F2NlV3m
         KcZ1KA5iHMftG4HFg1klwAjOJADlucbMTmwaWa8/Ro99Gkrcc/hI7xt/XoLJxrkkXH0X
         N+lmKs5B7/iJ3qLTJb/DWq1qrowhjqUiLWN/qxQiQcCM29Z/Uln+U25p2xfKOn7ESVnC
         lZiTdJBAJZCs63XL2W4f1WRFsX6yVrIAjGR9gQubFkUgA8WDv34p9VutEO/1/uLbWwmd
         wtvQ==
X-Gm-Message-State: AC+VfDwNWqUCN4xe8vrH179QA5/LwRZ8DMwyU7ZBsXwARRlDf8OZqZvV
        MwwDC9Dtc/ynmlmdePVEI0hfxKgit5oKFy+oJmcxKw==
X-Google-Smtp-Source: ACHHUZ4HFfYgNv7o5eIp7Pa4GlU+Wn3luys2k3t/inbdIsV5+uKmMsly2J5/GaooqGXZqbfoG+Fnb0Er/HoYVgIr5bQ=
X-Received: by 2002:a67:f7c4:0:b0:436:22fe:1d9 with SMTP id
 a4-20020a67f7c4000000b0043622fe01d9mr874244vsp.10.1686135630486; Wed, 07 Jun
 2023 04:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230606-fix-as-option-after-clang_flags-move-v1-1-a7f7b23a35e3@kernel.org>
In-Reply-To: <20230606-fix-as-option-after-clang_flags-move-v1-1-a7f7b23a35e3@kernel.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 7 Jun 2023 16:30:19 +0530
Message-ID: <CA+G9fYs8HCjaBzTDdXsQoEt3KP5rS=M34awGs8em7Jmx=yQkkw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add KBUILD_CPPFLAGS to as-option invocation
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 7 Jun 2023 at 04:10, Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit feb843a469fb ("kbuild: add $(CLANG_FLAGS) to
> KBUILD_CPPFLAGS"), there is an error while building certain PowerPC
> assembly files with clang:
>
>   arch/powerpc/lib/copypage_power7.S: Assembler messages:
>   arch/powerpc/lib/copypage_power7.S:34: Error: junk at end of line: `0b01000'
>   arch/powerpc/lib/copypage_power7.S:35: Error: junk at end of line: `0b01010'
>   arch/powerpc/lib/copypage_power7.S:37: Error: junk at end of line: `0b01000'
>   arch/powerpc/lib/copypage_power7.S:38: Error: junk at end of line: `0b01010'
>   arch/powerpc/lib/copypage_power7.S:40: Error: junk at end of line: `0b01010'
>   clang: error: assembler command failed with exit code 1 (use -v to see invocation)
>
> as-option only uses KBUILD_AFLAGS, so after removing CLANG_FLAGS from
> KBUILD_AFLAGS, there is no more '--target=' or '--prefix=' flags. As a
> result of those missing flags, the host target
> will be tested during as-option calls and likely fail, meaning necessary
> flags may not get added when building assembly files, resulting in
> errors like seen above.
>
> Add KBUILD_CPPFLAGS to as-option invocations to clear up the errors.
> This should have been done in commit d5c8d6e0fa61 ("kbuild: Update
> assembler calls to use proper flags and language target"), which
> switched from using the assembler target to the assembler-with-cpp
> target, so flags that affect preprocessing are passed along in all
> relevant tests. as-option now mirrors cc-option.
>
> Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYs=koW9WardsTtora+nMgLR3raHz-LSLr58tgX4T5Mxag@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

This proposed fix patch applied on top of Linux next and
built with clang and build test pass.
https://storage.tuxsuite.com/public/linaro/naresh/builds/2QsEzqEij2M3F1JkQAQfhpIpsXG/

> ---
>  scripts/Makefile.compiler | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 437013f8def3..e31f18625fcf 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -32,7 +32,7 @@ try-run = $(shell set -e;             \
>  # Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
>
>  as-option = $(call try-run,\
> -       $(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
> +       $(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
>
>  # as-instr
>  # Usage: aflags-y += $(call as-instr,instr,option1,option2)
>
> ---
> base-commit: feb843a469fb0ab00d2d23cfb9bcc379791011bb
> change-id: 20230606-fix-as-option-after-clang_flags-move-be88e993cbaa
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>

Best regards
Naresh Kamboju
