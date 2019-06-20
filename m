Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACEAD4D04C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2019 16:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfFTOY4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jun 2019 10:24:56 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38607 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfFTOY4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 10:24:56 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x5KEOTdL028578;
        Thu, 20 Jun 2019 23:24:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x5KEOTdL028578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561040670;
        bh=2X76LTHUosgor/jhs63Qb8iV44kkpWwl3bN30s3Us5A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GkqwTM2pya27J3ydebgJOg2PTC8Nxtt8u6JTkAaBg8NUAh4NJVEoiLVU32mk/EZXe
         k1DhuPK/btNWgTh1F7xaoAwH04HYmt+kkaw1oUXniWKywrVD3ODa9oyJRaW4rOwwb+
         oXxlXyoKgmJM40jqMxSUO0gxD8LqHFShmQjtHhGrf472IngCl0iEQb6+LKdFCDHTYy
         EHxSdJK3IpALceB8qQC0PUuX8djXw99z4TyAB28ntYUIpd+mePHySPUstwiI5wykTy
         OnQfOeZ3nmkrCEODpm24MtpoJ6aKqL2JecOlACajJEKOmjgV4rITZyTumq1l6pHYtH
         M1KidI5YB9cxQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id v129so1646147vsb.11;
        Thu, 20 Jun 2019 07:24:29 -0700 (PDT)
X-Gm-Message-State: APjAAAUEAcOW2kc0egVmjsnYNhIVU0k/80Za2H8j6jrN35MFwTC0i8Fu
        /o3ksltVgv7ajIQ0kj7wu9aDepWBz3OnvYRvORc=
X-Google-Smtp-Source: APXvYqy4x++JonE0M0zu4KyZ1yBsgDjAXdOABpmeCACgrH1RAF0HwwGicJx8Jh1Nb9lgjuZE07v+l+FywkVJd8TRDSI=
X-Received: by 2002:a67:7fcc:: with SMTP id a195mr51898717vsd.181.1561040668318;
 Thu, 20 Jun 2019 07:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190611184331.44242-1-natechancellor@gmail.com>
In-Reply-To: <20190611184331.44242-1-natechancellor@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 20 Jun 2019 23:23:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNARM510X5JL9T6J7Mc3ZG_TnGxpxaLndR044f6nFFgY3VA@mail.gmail.com>
Message-ID: <CAK7LNARM510X5JL9T6J7Mc3ZG_TnGxpxaLndR044f6nFFgY3VA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Smith <peter.smith@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 12, 2019 at 3:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> In commit ebcc5928c5d9 ("arm64: Silence gcc warnings about arch ABI
> drift"), the arm64 Makefile added -Wno-psabi to KBUILD_CFLAGS, which is
> a GCC only option so clang rightfully complains:
>
> warning: unknown warning option '-Wno-psabi' [-Wunknown-warning-option]
>
> https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
>
> However, by default, this is merely a warning so the build happily goes
> on with a slew of these warnings in the process.
>
> Commit c3f0d0bc5b01 ("kbuild, LLVMLinux: Add -Werror to cc-option to
> support clang") worked around this behavior in cc-option by adding
> -Werror so that unknown flags cause an error. However, this all happens
> silently and when an unknown flag is added to the build unconditionally
> like -Wno-psabi, cc-option will always fail because there is always an
> unknown flag in the list of flags. This manifested as link time failures
> in the arm64 libstub because -fno-stack-protector didn't get added to
> KBUILD_CFLAGS.
>
> To avoid these weird cryptic failures in the future, make clang behave
> like gcc and immediately error when it encounters an unknown flag by
> adding -Werror=unknown-warning-option to CLANG_FLAGS. This can be added
> unconditionally for clang because it is supported by at least 3.0.0,
> according to godbolt [1] and 4.0.0, according to its documentation [2],
> which is far earlier than we typically support.
>
> [1]: https://godbolt.org/z/7F7rm3
> [2]: https://releases.llvm.org/4.0.0/tools/clang/docs/DiagnosticsReference.html#wunknown-warning-option
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/511
> Link: https://github.com/ClangBuiltLinux/linux/issues/517
> Suggested-by: Peter Smith <peter.smith@linaro.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild.
Thanks!

-- 
Best Regards
Masahiro Yamada
