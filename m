Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BEB190105
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2020 23:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgCWWUX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Mar 2020 18:20:23 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:36797 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgCWWUX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Mar 2020 18:20:23 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15cbe099;
        Mon, 23 Mar 2020 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=PbPvni7Sltr0h22AlXOhuRrhfNc=; b=s0aD2i
        U5ofzLQJr4YECUyNMfLSjtqQRyjbV9+bXmhW9fatlhO9WHSiEh3OIaHvTdzTdDhI
        /03IoRQe2iO1B5KpvlQbDoD2rKkX/gJbz3I9Tqp01ORyHErrVX19NGSbTbL/LWeG
        jvSxxJ1zuEso00rYpNPwCqKvIFshqXAjU+fQK3cRjq1K/IuKGxjZ8isq9MlpXEUA
        ItKOY4vOQH909nvKaaAvitAFzNPlSghCa4jOJAn28XQ9TBipRvoQDto7JEJU5dFQ
        f+OLE4VzagoubjBVvu/SNdNR6UKp/EvEeTmi1lUVpUwD0HkpjgKphvUxnOHs/9Qo
        N8IWimxU7GnzLmEg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34232a36 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 23 Mar 2020 22:13:18 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id k9so5425031iov.7;
        Mon, 23 Mar 2020 15:20:21 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3/DBfdaeFBmcTTWexrOYgOPX4L1lKSvT+hY0kZDeALWpsZZaRK
        3xZ3qkNI6TIW/m9A+PNYPS6wJ/1FCFnDr4kizf8=
X-Google-Smtp-Source: ADFU+vvRm5gGEehyNNeHhDfxRATjvFXIdpkqP6nuyOPQJHJSeNSq5KBtMdSbsJFvPoMMLVjsD2hE1KtBv2mMqZv2yck=
X-Received: by 2002:a05:6638:52a:: with SMTP id j10mr1438090jar.36.1585002020839;
 Mon, 23 Mar 2020 15:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200323215732.13339-1-masahiroy@kernel.org>
In-Reply-To: <20200323215732.13339-1-masahiroy@kernel.org>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 23 Mar 2020 16:20:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9qYLYHsfV8S3WVV8x52tvqJNSarfgrXVm0oBsHD1GinCw@mail.gmail.com>
Message-ID: <CAHmME9qYLYHsfV8S3WVV8x52tvqJNSarfgrXVm0oBsHD1GinCw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: allow to pass optional flag into as-instr macro
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 23, 2020 at 3:58 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Commit 42d519e3d0c0 ("kbuild: Add support for 'as-instr' to be used in
> Kconfig files") introduced the Kconfig variant of as-instr.
>
> It is currently used in arch/arm64/Kconfig.
>
> arm and arm64 are simple cases because they are separated by directory,
> and GCC also provides a single architecture.
>
> Such architectures as x86, powerpc, sparc, etc. support both 32 and
> 64 bit kernel in the unified arch directory, and GCC can be biarch.
> On such architectures, Kbuild passes -m32 / -m64 flag (or a proper
> target triple for Clang) to select the target machine bit.
>
> This commit adds the second parameter to as-instr so you can optionally
> pass a compiler flag to evaluate the instruction with.
>
> One example usage of this is for the conversion of the following code
> in arch/x86/Makefile:
>
>   adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
>
> This instruction code should be evaluated by the 64-bit assembler
> (r10 is a 64-bit register).
>
> If you use compiler that defaults to 32-bit for building the 64-bit
> kernel, -m64 should be passed to invoke the 64-bit assembler.
>
>   config AS_ADX
>           def_bool $(as-instr,adox %r10$(comma)%r10,$(m64-flags))
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Kconfig.include | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 496d11c92c97..9b8c98168ba9 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -31,9 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>
> -# $(as-instr,<instr>)
> +# $(as-instr,<instr>,[<flag>])
>  # Return y if the assembler supports <instr>, n otherwise
> -as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> +# You can pass optional <flag> to evaluate <instr> with
> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) $(2) -c -x assembler -o /dev/null -)
>
>  # check if $(CC) and $(LD) exist
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> --
> 2.17.1

This looks fine to me, and might be useful down the line in the
future. But for the ADX situation, I wound up just going with the
bicompatible register:

https://git.zx2c4.com/linux-dev/commit/?h=jd/kconfig-assembler-support&id=c81d9c743d058ef9013fbf8661d071ac9d574472

+# binutils >= 2.23
+config AS_ADX
+ def_bool $(as-instr,adox %eax$(comma)%eax)

This seems to work. But it also doesn't matter much, as it gets
removed anyway during the binutils 2.23 bump:

https://git.zx2c4.com/linux-dev/commit/?h=jd/kconfig-assembler-support&id=c95d6f2ce88722eeb86d54f206bd7599bdc51e1d
