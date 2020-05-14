Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAA91D41A6
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2020 01:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgENXZz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 May 2020 19:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENXZy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 19:25:54 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B990C061A0C
        for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2020 16:25:54 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t11so99632pgg.2
        for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2020 16:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQrnCHYLO0Vg5jOwAUNb34HO2tHD8mNTv/oZ6XDZtGw=;
        b=sUu77TjWviN24ATo8ztZkS6DEzpQ1s9mMpUFWdowgLqzTJcNhQWj2TDf+3EoxYs3kL
         42+AfMDQ7/kfY0CHdwNZeq99syfjbJn2r/lIsRVsdTl9BCq/WKvNfGChxwsWUqt+nLq0
         jjQY4zswFCOqoFFc0yMa6mGOiO9SwTOte4EcVduTNcwclk1u1wQbNlgyGL6rzu9sHd/1
         lEjxK+XbYrAz8TAWOBPKMsMBGdMwCN+BCi3t5m1A13MUjDgl/V8yGOnHmFuAWsOSpYJb
         nNb0aO1yyaz+2DzzTg6v82spoFHdZ+ddGMds72SomIfSkbbZqGurznmivZtPCVcqIw/G
         Yogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQrnCHYLO0Vg5jOwAUNb34HO2tHD8mNTv/oZ6XDZtGw=;
        b=lj12psP7lKjKmxjzLcPhnl4eiVQ9K1BA5vILRU5tvfUTebOeS0XeUefdZ+yTu704vm
         AQBnzpBJXMqQnfw9vY14/Y27lzU2zJZg/JXYI2B1Bbzh61DTy9+p9DBhI47Q0aGbHLyY
         zl1Rv+dnOH+TZc7Wx/Muap2/3tSu4j5777vpYvgBI0mufLXFVRBeQNjp3jF2PUjdQrm0
         nL6f+wMa/P38xaBtTygfNKqjpKQwQtLaxxWUs2eeCVG0wWbkBeTwW+HQXxAkCWJXeQcq
         PQB3qNh7wY9jaBqcST7cmS3TNqTtXfqXZTl2CJwzFqJaLAt64ellCQD1QrI+Nh2UOlxt
         DU9A==
X-Gm-Message-State: AOAM532XcAnMMU/vhX1SwZnATd0rdw2ke07bPs1LRf1dlYhze9AlWPLg
        IkZr5qoRwZVMBBYGsSasbVz8Wf2hwT867xJpsbZbCw==
X-Google-Smtp-Source: ABdhPJzrjVCdyFvdAYHnaYzO3t9QKrcZasLyT+6cHGtriw0SjQnZT96e3FIx7TuiJFq0J5INzxCRbMPOTZv5vrjhvCk=
X-Received: by 2002:aa7:8c44:: with SMTP id e4mr967827pfd.108.1589498753790;
 Thu, 14 May 2020 16:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <87imgykunh.fsf@m5Zedd9JOGzJrf0>
In-Reply-To: <87imgykunh.fsf@m5Zedd9JOGzJrf0>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 May 2020 16:25:42 -0700
Message-ID: <CAKwvOdnJ9p+iGYP31TJcaCLBqk2gOes4=5z=K8Tv_jytn6+RgA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: compile_h: fix compiler version detection with clang
To:     Yuxuan Shui <yshuiv7@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 14, 2020 at 3:43 PM Yuxuan Shui <yshuiv7@gmail.com> wrote:
>
>
> In some setup clang will print a line about CUDA version it detects,
> like this:
>
>     Found CUDA installation: /opt/cuda, version 10.1
>
> So grepping ' version ' matches 2 lines, and results in a broken string in
> compiler.h, which doesn't compile.
>
> This commit adds a "head -n1" to fix this problem.
>
> Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>

Hi Yuxuan, thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Might be worthwhile for Masahiro to add

Cc: stable@vger.kernel.org

if/when picked up?

> ---
>  scripts/mkcompile_h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 5b80a4699740..8e6b4fc6fdd9 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -62,7 +62,7 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
> -  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
> +  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | head -n1 | sed 's/[[:space:]]*$//')
>    LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
>                       | sed 's/[[:space:]]*$//')
>    printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
> --
> 2.26.2


-- 
Thanks,
~Nick Desaulniers
