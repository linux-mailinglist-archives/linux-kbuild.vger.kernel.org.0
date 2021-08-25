Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B223A3F7E98
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 00:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhHYW23 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 18:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhHYW23 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 18:28:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FD4C0613C1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:27:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o10so2070650lfr.11
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lT1I55KczeyyrBKJaTcaNt3EKQYdb66gBkFV3oKdmU=;
        b=cLLRlG3z2UJOYGSV2OFLN7nala7hSRKkm1NT2+fUl0YaMiiOZlYsWCw7ByaZKyYdej
         eG8dr3UbwvIMU/RM8z2rsQ4DgasSeZTh0i/Rftbh7OwRpJDOTDumqCCxERtqfeOPINQO
         xPDmZ92Q0CLLogMTcGI5GgcmEeQiRAwo7+DjtUhyVKRKEfry50YDK6jbyL7zmr8hoadn
         xt0f1POpvE/7AJPn7S4IcaP5zIZqyuNVPONf+dLiQYTIAEDYVIGjift9BtHsgPAhQusE
         GSNawaJdNcayCnxbUi9s9cWUCu+mOqqxtNS64tIGdilUeRLu5SvkNkd+azkaiHG6ZYZf
         AF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lT1I55KczeyyrBKJaTcaNt3EKQYdb66gBkFV3oKdmU=;
        b=iuH4imHGq2WyFtHlvnZ98s2xVD5qyia4f+AqMoqyRCtP0LwUNFTHk3MnJ4ba/phLi2
         LK0zg91kEvouQOPKRSXJd4D1eAcLYg9mh/r7jMG3KoTh2DgGhfnObDK1ogxIHx9BSziK
         mkyS5sxbCeSJZhRe5ouL0HuUc/Rli/eQdgOxmrxCCDdKKdmXI2FpvKZTCds3CwofsRBd
         QtyxuSRpSpdYJR7vfcI/SEggSaW5AYhaaLFro5E0rVBMJoyGkiL3TQkwOulDXJVvY41Z
         7ahOFfZhHA42SjdHBu3Fyar0tZSszw1vuhund84G9sCIiTLrhcuDRf757GIIuXCwmVFa
         Z1Kg==
X-Gm-Message-State: AOAM530AaCnWqtHJBPBnXfqfno6nZPL0I0WoHHf6XhQ/85JBtgB/pM2F
        U7GGOCyhQH+htdJET595/rsoIeJ76hpQG2Y6myPtuw==
X-Google-Smtp-Source: ABdhPJz69LBJzlo7mshI5KNm0XFcBV9epeSDC13/1omU+QcDvmsdJXT9mzNuW+AIOyT9FilOddxsxsY8rgdU9BNEkZA=
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr285821lfu.374.1629930461195;
 Wed, 25 Aug 2021 15:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210824022640.2170859-1-nathan@kernel.org> <20210824022640.2170859-3-nathan@kernel.org>
In-Reply-To: <20210824022640.2170859-3-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 25 Aug 2021 15:27:29 -0700
Message-ID: <CAKwvOdk8nj6Yu=+k+cDx_rKh=ug6+VyYRzzFGDiZjrQQ8q7eCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 7:27 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Similar to commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS").
>
> Clang ignores certain GCC flags that it has not implemented, only
> emitting a warning:
>
> $ echo | clang -fsyntax-only -falign-jumps -x c -
> clang-14: warning: optimization flag '-falign-jumps' is not supported
> [-Wignored-optimization-argument]
>
> When one of these flags gets added to KBUILD_CFLAGS unconditionally, all
> subsequent cc-{disable-warning,option} calls fail because -Werror was
> added to these invocations to turn the above warning and the equivalent
> -W flag warning into errors.
>
> To catch the presence of these flags earlier, turn
> -Wignored-optimization-argument into an error so that the flags can
> either be implemented or ignored via cc-option and there are no more
> weird errors.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Good idea.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 4cce8fd0779c..2fe38a9fdc11 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -29,7 +29,11 @@ CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  else
>  CLANG_FLAGS    += -fintegrated-as
>  endif
> +# By default, clang only warns on unknown warning or optimization flags
> +# Make it behave more like gcc by erroring when these flags are encountered
> +# so they can be implemented or wrapped in cc-option.
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> +CLANG_FLAGS    += -Werror=ignored-optimization-argument
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
