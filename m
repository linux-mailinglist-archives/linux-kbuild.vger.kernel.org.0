Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2EF4C5F73
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Feb 2022 23:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbiB0Wg7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Feb 2022 17:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiB0Wg7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Feb 2022 17:36:59 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2050E53732
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Feb 2022 14:36:22 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bn33so14984842ljb.6
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Feb 2022 14:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=aS+Cuu53E5xh6ezL4BQQcygkZ7taEG098ncxgu4s2QZu+Pf48uAsX8EMwnsNmZzs5O
         eo+kkcQwg/L9tnVyFaERl40XHOJRfEwQ+3p4bNjtTIEqFgNZTrhkUr5c7jHIQo0R2QlD
         6Z3HbL6vTEGo3aFlsNtdBL0CtUa6ZZQikH6w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8l4d/g0eKsVGAXwcSHou4m9texHyFwjSyXWV84L8X0=;
        b=ZoL1Iu+tTZ0WF6aaQdbsZlwxtPxT7wXaenbdYhywWW4M+dmzptiGY748S6K3LE0hzL
         oUvcUkyGnqEI/58x0VeUu37FJtVtW/bS17Sx4gK3tYXTIL/2buCEPRisT6JLw9GXMXyR
         djA3LH8/1W+lTS+q1NC3sisitbUmAD/3Ky51x5xJKMu4BdUTo1LhKwwHwCVqrKHlzA7Y
         Yd4iyqOQqFNOJWCpVfgrwLuomuSRYo2AlgunliokwlVCIWVsJboS1MSCGfk0nbfRzPrB
         gOebxPFXISl4i9rx+srBPJjLPlgm/kbfnMFbCgUn43U1+7vhOHEfTYm4oG9YAKY4Jb27
         lIiw==
X-Gm-Message-State: AOAM5327hoNo9hS9KNcqiVBOHV6yN4qCOtwuc6egoCSqG0btlcpBAv1/
        052f81GpAJrNFeLbowmbX51lxoRxbMOL1jxqNhc=
X-Google-Smtp-Source: ABdhPJwgtMgKGZkmr+MkWV53ml4qAaXKCvIfrx/bhhgKQ1CxdD9VQHnx1a038et/Cp4boLeq+1cerg==
X-Received: by 2002:a2e:8856:0:b0:246:3bfd:dfc8 with SMTP id z22-20020a2e8856000000b002463bfddfc8mr12204392ljj.405.1646001380234;
        Sun, 27 Feb 2022 14:36:20 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id o2-20020a2e90c2000000b002449296a055sm1026820ljg.64.2022.02.27.14.36.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 14:36:19 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id s25so14981486lji.5
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Feb 2022 14:36:18 -0800 (PST)
X-Received: by 2002:a2e:aaa2:0:b0:244:bf42:3e6e with SMTP id
 bj34-20020a2eaaa2000000b00244bf423e6emr12796324ljb.176.1646001378532; Sun, 27
 Feb 2022 14:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org>
In-Reply-To: <20220227215408.3180023-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 27 Feb 2022 14:36:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Message-ID: <CAHk-=whWbENRz-vLY6vpESDLj6kGUTKO3khGtVfipHqwewh2HQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 27, 2022 at 1:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Since the differences between gnu99, gnu11 and gnu17 are fairly minimal
> and mainly impact warnings at the -Wpedantic level that the kernel
> never enables, the easiest way is to just leave out the -std=gnu89
> argument entirely, and rely on the compiler default language setting,
> which is gnu11 for gcc-5, and gnu1x/gnu17 for all other supported
> versions of gcc or clang.

Honestly, I'd rather keep the C version we support as some explicit
thing, instead of "whatever the installed compiler is".

Not only do I suspect that you can set it in gcc spec files (so the
standard version might actually be site-specific, not compiler version
specific), but particularly with clang, I'd like that "GNU extensions
enabled" to be explicit. Yes, maybe it's the default, but let's make
sure.

The C version level has traditionally had a lot of odd semantic
meaning details - you mention "inline", others have existed. So it's
not just the actual new features that some C version implements, it's
those kind of "same syntax, different meaning" issues. I really don't
think that's something we want in the kernel any more.

Been there, done that, and we did the explicit standards level for a reason.

It may be true that c99/c11/c17 are all very similar, and don't have
those issues. Or maybe they do.

And I don't want somebody with a newer compiler version to not notice
that he or she ended up using a c17 feature, just because _that_
compiler supported it, and then other people get build errors because
their compilers use gnu11 instead by default.

Put another way: I see absolutely no upside to allowing different
users using higher/lower versions of the standard. There are only
downsides.

If gnu11 is supported by gcc-5.1 and up, and all the relevant clang
versions, then let's just pick that.

And if there are any possible future advantages to gnu17 (or eventual
gnu2x versions), let's document those, so that we can say "once our
compiler version requirements go up sufficiently, we'll move to gnuXX
because we want to take advantage of YY".

Please?

                   Linus

                   Linus
