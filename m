Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8131F435202
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhJTRw6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhJTRw5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:52:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07E5C061755
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:50:42 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r19so26359lfe.10
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=DxXrG20AfYyTWbuMUYzNfwR4ma6dWiFGO0KjGKjLqVUYkWc3DGlA7gExcJhltON98Q
         iCOl7ShLDxT6gW3S/iaxj1F4KrUBb9e17xdURrxubqYpnaDf5fqI+klbo/6SpeMVbaxj
         bVO5N1ypo4BJgVzIhZmV7S+lvG+ppRftQ74TP0w7xkCYNdCPabymX9EBoVJgU+AiJdnX
         73rfLrfIuuMZZa7dbpcIoqZmbjgOPkSZh/tq0Pqn9LQQD0c50F18mXQtmzKwXTaIrbI4
         VLerFWmUTLJfn1+7KKosGH7U2IvcsnC2m3gcHYqoEbu8bW+mpmpUd0FUhndHkvD2mYx+
         E4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFvyJDv7zWHNgpVy4rL7we9/QbUTjFwP2DzX3TA0tiQ=;
        b=iRgTvn6bERvuN+oJohfv8TR+nrt0yX4tdEEZdTWKDNrWPTruJCjlB4AHVf+KwMmtg9
         3WWlxOMk4+t+pONHcHv95AYJQSPYRt/n24/9g8LOoH+fwprvCRzXaax2nO2y1kwpzTGX
         vGOvvoUS1ooBoH3iYXuxKgEG8+fkya8LPi6fIL6UFamQ4zsa9SjawM4VKHULFT/DJbnu
         jqYQi0CvxHIRmN2foWoQ5fRkeRd75SBW7+VKByxWb3XBG7SpFUBIpIDDUX2wGPzXSCBz
         w41gnZz8p1KksAGemdeXU6JdxKI7MVDWNDAI2iBeuTFYNwNDUzpvIfGAO0LlCQIkLubY
         11tw==
X-Gm-Message-State: AOAM532WKS6Bsn8vjEbLYAtrv00o1MvpSqCSS7Cm0Mx+Rei9ed4GJA7e
        htxuuPfz+ZnHsWkLh/2DnUXRXuD+7teD9sTAsC9Zuw==
X-Google-Smtp-Source: ABdhPJwPFGMtZow5DrrM1QQEhKH4UgBAhO+q3OhbDbIA+NCFfvXVoE6xurM+6DQNbeaHKSEmyE1T/I8F3ayNnhS04hg=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr643276lfu.489.1634752240690;
 Wed, 20 Oct 2021 10:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-1-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 20 Oct 2021 10:50:29 -0700
Message-ID: <CAKwvOdnH4JG1Qt3scCVYGMT+iyfYKna4wyuODXZqURVfe+DZVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Li <ashimida@linux.alibaba.com>, ardb@kernel.org,
        ojeda@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 10:35 AM Kees Cook <keescook@chromium.org> wrote:
>
> Hi,
>
> GCC plugins should only exist when some compiler feature needs to be
> proven but does not exist in either GCC nor Clang. For example, if a
> desired feature is already in Clang, it should be added to GCC upstream.
> Document this explicitly.
>
> I'll put this in -next unless there are objections. :)

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Thanks!
>
> -Kees
>
>
> Kees Cook (2):
>   gcc-plugins: Explicitly document purpose and deprecation schedule
>   gcc-plugins: Remove cyc_complexity
>
>  Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
>  scripts/Makefile.gcc-plugins                |  2 -
>  scripts/gcc-plugins/Kconfig                 | 20 +-----
>  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
>  security/Kconfig.hardening                  |  9 ++-
>  5 files changed, 34 insertions(+), 94 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
>
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
