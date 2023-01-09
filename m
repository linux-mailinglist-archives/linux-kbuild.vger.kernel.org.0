Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3686633BB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 23:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237358AbjAIWNn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 17:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237705AbjAIWNI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 17:13:08 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0215A11A2A
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 14:13:07 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 7so6904243pga.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 14:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=avwgqVIoXCpLRgL2rsbCwZk0+FJkhMDJvlfNCKRUfVdJskLNjDTEzit1skN/ZlDe3T
         R4r88LCIkzuGmRlRfgYxMpZlD7ZQ8qIJT0x6uZxwzNzAIwkcBLcBXmLsLe6xmo4jbR+8
         BddQ+9IEl/FL+GcFcDjRQnvhsj3/k2N6WpOnOJIXa+jd8/Qt4rM5go649f1Ve2iEqVxA
         Wwvyrgxb/ZPP8v5V9xzX5o1EFc+KUs7qPXPBnIuI3HUnZ2l7+lBWtwJtQnlK14+xFYLR
         sNCpJroLJ2+SnjtIbGfkqlwz+ePnTt2aNE1eKtJ+tBXfhOulflt9EqgIVYQEezgG5/3h
         0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=6aG2nazr6O98z9CZ3e/5reHiRSH9UG+TCG88y/y+iqWu0uuo7I+xYbcpi/7geRFrEG
         UOS0PzvdkEzO15XAxLqf0ezeJW/V58UUgkMjUadKtefc6GbEm8EeFTEUaBzvDss2NkKu
         WZt4lJYLuzvfOfbGVuxJSeg40NjM6ZifHeBLGT4nEkq1NmLN4EdWfxazs1xeNDMjrhvg
         ol+Ky/aXGnh0ndoi5VDOOOOm+JD2V/ptz3M/+kYnGz2XiVWqf9oFpNH5dVVQTvAaK4+X
         6B1S7+/O1sCa+xp6MGlUzEVUq/P43l429nfDaSEKfBBaBcuD1D5gqjZJL48BdAvvPTAx
         /57g==
X-Gm-Message-State: AFqh2kpqcbbL1CJE0H/Hz54edmy3m3ypu98GUXmkOIYQWDNKzMiCjYZa
        120p8tz8M1k4KDjl4dehfbK2WjHUDY63YuCppGuRTA==
X-Google-Smtp-Source: AMrXdXtMcFa+l6kAazK251eqZGx6C7sgD9DBhmYRg4WNsq57PkL6XzXoZvYpynLFe25uQvunKx2n9ndiQ0ZxzuLH2tc=
X-Received: by 2002:a63:c50:0:b0:494:7a78:4bb0 with SMTP id
 16-20020a630c50000000b004947a784bb0mr3997953pgm.427.1673302386285; Mon, 09
 Jan 2023 14:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 14:12:55 -0800
Message-ID: <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
> This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> been done for other flags previously.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Hmm...so this was added by the top level Makefile doing a cc-option
test.  How did the test pass if this was unsupported? That worries me
that perhaps other cc-option tests are passing erroneously for certain
ppc -m32/-m64 configs?

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 769b62832b38..4ee7d36ce752 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
>    CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
>    CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> +  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
> +  # an unused command line flag warning for this file.
> +  ifdef CONFIG_CC_IS_CLANG
> +  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
> +  endif
>    CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
>    CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>    CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
