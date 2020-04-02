Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7A319C3F3
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 16:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732569AbgDBOYb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 10:24:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50571 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbgDBOYb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 10:24:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id t128so3620098wma.0;
        Thu, 02 Apr 2020 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=n3PDnctBOZZXWd2LbmIwxNVKZxM3wgowDyh1vzhpv5A=;
        b=DNJyYXWg7yUdzW8pIUDDFIiyrkbhbOckIO6REVwXspjhoeCVg3srHfqGEHFzeo0Q7M
         Fgwv/O+XO2zwhGiq5khGVY9sRsAt6Roi+eqFweXFTKwvNlKvYtZNxdYCb3j5U/kJ+q8R
         02I9d52piEPczGyjfsG+4klfsXnEA6cyg0gkNQ0D2/C4VAenTEZSDnMYv6akCYNVPR8o
         eVkfzB1Q+1dfxTLY79MaFr9eRRH8eeqQ2+x89bVSJ0X2ugYXsepKpi+2DuIvHB5HfMsz
         GijCm8E+RY4JRVudpKwL49c16q/6HCaFfPwck3ZrWj5hHpaSZ5Te5C2+DrwwBILMIgcK
         wyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=n3PDnctBOZZXWd2LbmIwxNVKZxM3wgowDyh1vzhpv5A=;
        b=i39LLYjVmKhTO+/C8G+RbqnFYHb86Eh/EJ1cTvuVW2FeiUnEsXalM50XO88p6YeK3G
         AqxSIZKsKniPO1T5SuDdH4/WuH3SbiC75IaOzKmqn85DKbyzH2MewANDydFyvJiTFmkA
         dDqIjpjyBUqm8KH16Y1f30Kw7Gvg7JlGkyyed95ddTO7FLKEcf0wrwa0SxfLYiXsBwcS
         KLPoRkS0lZ8R9F+OdC8Tx3AAsW+cl0QpQY4F/TUCAGkiRB5qczSG0vmlFqzpsPVd6D/x
         H/nnZtwKKD+bjTMtN5mlLgDNDnbrStmMGHya4BKNHSGbfeKTc8gTh3YQixOgW+oeCbn+
         1j9A==
X-Gm-Message-State: AGi0Pua+XPk1Ik5Z3J4mHQRsiZCzXDMYuvU2eC0bD4WuJXWgQvWIMAZO
        sOrcXsgECUMjKs7l5USNB4PpWkEzLIHoqQDpctM=
X-Google-Smtp-Source: APiQypIaJ5gs4ylgjiRxYhODKUqObmPaRUdDE22IcihJRWPT5lFNvkU8mUAjpMf20D4GOAug9/x5Iv9JvGDNmCH3QpM=
X-Received: by 2002:a7b:c850:: with SMTP id c16mr3895360wml.163.1585837469897;
 Thu, 02 Apr 2020 07:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook>
In-Reply-To: <202004020117.6E434C035@keescook>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 2 Apr 2020 16:24:36 +0200
Message-ID: <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kbuild@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
>
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Hi Kees,

this patch is really really a good one!

I use Clang and LLD to build my Linux-kernels.

For archiving important informations of my latest build I did:

cd linux
readelf -p .comment vmlinux > ../archives/readelf-p-comment_vmlinux.txt
...or...
readelf -p .comment arch/x86/boot/compressed/vmlinux >
../archives/readelf-p-comment_vmlinux-compressed.txt

The output looks like:

String dump of section '.comment':
  [     0]  Linker: LLD 10.0.0
  [    14]  clang version 10.0.0-1

With my next linux-kernel build I will include this one.

Feel free to add any appropriate credits.

Thanks.

Regards,
- Sedat -

> ---
>  init/Makefile       | 2 +-
>  scripts/mkcompile_h | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/init/Makefile b/init/Makefile
> index 6246a06364d0..82c15bdb42d7 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
> +       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3a5a4b210c86..f98c07709370 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,7 +6,8 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -CC=$6
> +LD=$6
> +CC=$7
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
>
> @@ -72,7 +73,10 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
> -  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
> +  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
> +  LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
> +                     | sed 's/[[:space:]]*$//')
> +  printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
>  } > .tmpcompile
>
>  # Only replace the real compile.h if the new one is different,
> --
> 2.20.1
>
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202004020117.6E434C035%40keescook.
