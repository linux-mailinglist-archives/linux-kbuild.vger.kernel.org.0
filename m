Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6610A4D278
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2019 17:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfFTPx0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jun 2019 11:53:26 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43977 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfFTPxZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:53:25 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x5KFrGHk030031;
        Fri, 21 Jun 2019 00:53:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x5KFrGHk030031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561045997;
        bh=iRJq3YgZQ4ohWqePk0QYexJbrYZIPdBdV7a+31+PdK4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j1CpcYtfBvu6WV0HQAf7UWje5sGgdX8McoDtxlRbQ1y16hatsDOxrCv7WWFH2pNmk
         uvhoz9OA+WdTySjKYeHgEdjuptjiFsp4em4iucvN2ULme09e5uacExEFqdSBIJS9NR
         iYHJDjYZbiuhx3ZVQQOOWveGV4pc2di9D3wboj4Hz5PRKlaW6mxeGCdXYa18XPGrcS
         +dGtjQbgpyiON/7CXKNQnPCcxNa6Fb5LpppZKbamm6POFJ3kFXL+VzmNNokn5kIBwg
         Io8rQ1vzLBAn7OWkkoJYZ0rfN4m1z72oJr9ay8bqLveOi992YKABvYf3+hyM44Wyvz
         9dz2piX3mGcZw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id l125so1842354vsl.13;
        Thu, 20 Jun 2019 08:53:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWQ0id5Lh/WK0NqTUdgB+70nt147BRgHK6z8oxRi5zF9CBO4oee
        WBZosWClt8h4DmxYvihn2y/HZgFFYiapM+sDJUo=
X-Google-Smtp-Source: APXvYqzbyx5DgFaWTMn2kEc9IUBJ7cyjY6GJDjnC+U5ytv2h589fRkPuqkkeUvyPT4+Tao8e5QAbk6qxrNUHl0GvVG8=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr32261561vsl.155.1561045995988;
 Thu, 20 Jun 2019 08:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190617172829.164520-1-nhuck@google.com>
In-Reply-To: <20190617172829.164520-1-nhuck@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 21 Jun 2019 00:52:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnsx0tb4bWqLjxGjU5udXE8FsT+dC4_YCwwY=HpMUhgw@mail.gmail.com>
Message-ID: <CAK7LNAQnsx0tb4bWqLjxGjU5udXE8FsT+dC4_YCwwY=HpMUhgw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove unnecessary -Wno-unused-value
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 18, 2019 at 2:28 AM Nathan Huckleberry <nhuck@google.com> wrote:
>
> This flag turns off several other warnings that would
> be useful. Most notably -warn_unused_result is disabled.
> All of the following warnings are currently disabled:
>
> UnusedValue
> |-UnusedComparison
>   |-warn_unused_comparison
> |-UnusedResult
>   |-warn_unused_result
> |-UnevaluatedExpression
>   |-PotentiallyEvaluatedExpression
>     |-warn_side_effects_typeid
>   |-warn_side_effects_unevaluated_context
> |-warn_unused_expr
> |-warn_unused_voidptr
> |-warn_unused_container_subscript_expr
> |-warn_unused_call
>
> With this flag removed there are ~10 warnings.
> Patches have been submitted for each of these warnings.
>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/520
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---

Applied to linux-kbuild.
Thanks!


>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 3ab8d1a303cd..b293246e48fe 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -68,7 +68,6 @@ else
>
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
> -KBUILD_CFLAGS += -Wno-unused-value
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> --
> 2.22.0.410.gd8fdbe21b5-goog
>


-- 
Best Regards
Masahiro Yamada
