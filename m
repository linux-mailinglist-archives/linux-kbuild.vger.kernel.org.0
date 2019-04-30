Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB14F107
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 09:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfD3HRJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Apr 2019 03:17:09 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46125 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfD3HRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 03:17:08 -0400
Received: by mail-qk1-f194.google.com with SMTP id w73so7509339qkb.13;
        Tue, 30 Apr 2019 00:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wuhJyRYvZ9esfFTmLHI+19kmI+qg43HVpdDIPGRGgeQ=;
        b=g/aRf6Mi8g/j19SW23CgD/Im4AVFPJSLxIILaf+3RFZPPHmbLFJSc4ge4DrkH9vMwS
         zDybyeH2/ixTJ2KJTfksPXgdyRs+QEou6Wgx4gDMp5znfFj5kXdRdxZmeYHFYHugNRVW
         1jxBjqHd4B44lcdzMDlK7LIruxq7oPYN5kvzF6bBmxw0VzsLLOMxzG6myHnmGwvOAStt
         6NRvoAFRtlalKXlBJO0IA+Pv2w0T7bRSbSH9vx8zqhLTtF6SXe4gBjkVSIxHh/s32Z3p
         bxe5wTaEBBM4nYqaUw9UfZShNJOMJbDn6rq9Rcwu5yxtz2A5RrQhE7Pn1J/cil6uO1Mw
         paYw==
X-Gm-Message-State: APjAAAUMT881skdoFpEmT4sRB83czZJXvTqUnPvr9S+JWNxvOAO/FyPr
        GEnMbFpOLRd6nB08ksaFyxD5AkN1X8Q8rwI2xRo=
X-Google-Smtp-Source: APXvYqz4FceHyHkim/0BxeERnYA/xGsIelFpSTapPHTYrrSQKx75sl0UWxdMB4/mMrlqmB2NxkApJVkK+Dzb6kSdiJE=
X-Received: by 2002:ae9:ee15:: with SMTP id i21mr47207016qkg.107.1556608626808;
 Tue, 30 Apr 2019 00:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190430010037.6216-1-natechancellor@gmail.com>
In-Reply-To: <20190430010037.6216-1-natechancellor@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 30 Apr 2019 09:16:50 +0200
Message-ID: <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> point, it has not been used because -Wuninitialized has been disabled,
> which also turns off -Wsometimes-uninitialized, meaning that we miss out
> on finding some bugs [1]. In my experience, it appears to be more
> accurate than GCC and catch some things that GCC can't.
>
> All of these warnings have now been fixed in -next across arm, arm64,
> and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> to prevent more from easily creeping in.
>
> As of next-20190429:
>
> $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> 45
>
> [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/381
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Masahiro, I am not sure how you want to handle merging this with regards
> to all of the patches floating around in -next but I wanted to send this
> out to let everyone know this is ready to be turned on.
>
> Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> randconfigs?

No, I don't see any with the patches that I submitted. I haven't checked
if there are any that still need to get merged into linux-next though.

> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306add591..f4332981ea85 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
>  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
>  endif
>  endif

This doesn't look right. Shouldn't you remove the line that turns off
-Wuninitilized
instead of adding only -Wsometimes-uninitialized?

If we warn about the instances that may or may not be wrong, we should
also warn about those that are provably wrong.

        Arnd
