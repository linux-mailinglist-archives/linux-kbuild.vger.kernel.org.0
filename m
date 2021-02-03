Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B05F30D50C
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 09:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhBCIUL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 03:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbhBCIUL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 03:20:11 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064FBC061573;
        Wed,  3 Feb 2021 00:19:31 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id s24so12752039iob.6;
        Wed, 03 Feb 2021 00:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Nwlpcct/F9cJQ/7dbMVRZOZAh6ZmCNE68LBrwiCRQ3w=;
        b=iTmKXcVRGgIbvupY209fVzFzdBNIkqDBHPReGxt+iAePvJ6QsdneBuZ3oFJOe2hpGO
         LeMhmrA0eso6K57FHHZHKaC0k51zcrCIuAFLtlPylxmK6i2Cmh2yBMVbXybpUGU7XOQ/
         8yE2hszs5Z+Vpx1OsxdpL9q7mLKFA/sNCpWGoz2VdGvDRy6PrqbV3TgBm3Zx7nReOtVg
         XpCk9zqbFa+lYOrHU52RtknjkCT2HFcPUjedBSqdFs2Y7Bo0yt0PE0dXfygs6kVytzk9
         I1xMp36y2EW/i8i6Jt/oNChnOxGIwgp4QHNvUIVFy0IePhoFQ/U/Hdhrs+iRMoZD/adR
         vaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Nwlpcct/F9cJQ/7dbMVRZOZAh6ZmCNE68LBrwiCRQ3w=;
        b=OdTlXg9ZI0RwiZUyRcjeibjHUbZLCgjLH/x6vz/3RhqqHJFlh0R+2lksYGqrEFKjSm
         bX4YOlpA0SvgaypU3b5+747AqDXFWQDEvklUjyKHxWDhKwf0N6+ncA8DfMGxiqUr1xrs
         f6X30UIZWSds+y74yW9gdTJKTlVxwddrnxkANEygBH4qSqX79EGP36Tp+l5HuTjiFaNo
         v9syOnUDPickfmH7d/99Ydn3OaqbSR6YcsWpeOZ4bP4/LD2CtcmAFVc+mdNjVWS6CQb6
         EWrDkjWmbnJs5+D52yVePyAcFl5j07flQQEQgP8s84sCsTYpmMi7EJFL2Mslx1kZHIto
         4+BA==
X-Gm-Message-State: AOAM530hfMcl24WeS5YmYlFusOg6NfWE2yWVyG4jroxmmXRgrr1L8HNm
        1wkfpBNgxoNgIVCoL6l2kOJVrBhkK2nKQ22wsfvTiejmm1E=
X-Google-Smtp-Source: ABdhPJxD8V87tad7EkvPiaD2wrK0mSumpXh6jv1ydp2zHS2djx4W+Ya82t7uqoxxwmSeQcAunngr8X5Z4IdJs8jdPm4=
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr1566109iov.156.1612340370361;
 Wed, 03 Feb 2021 00:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203075239.5505-1-masahiroy@kernel.org>
In-Reply-To: <20210203075239.5505-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 3 Feb 2021 09:19:19 +0100
Message-ID: <CA+icZUWpXQZqF+sz9bTv8ZUw2xYKUiCChyu92Zma1y-EtruRLA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Mark Wielaard <mark@klomp.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 3, 2021 at 8:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Sedat Dilek noticed duplicated debug flags passed when building C
> files with CONFIG_DEBUG_INFO.
>
> I do not know much about his build environment, but yes, Kbuild
> recurses to the top Makefile with some build targets. For example,
> 'make CC=clang bindeb-pkg' reproduces the issue.
>
> With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
> for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> CONFIG_CC_IS_GCC=y.
>
> Fix it to reset DEBUG_CFLAGS also when using Clang.
>

Great, Masahiro!

I wanted to request an "undrunken" switch for GNU/make :-).

- Sedat -

> Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 3d3f67b98ca2..769a38ee81b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -811,10 +811,12 @@ KBUILD_CFLAGS     += -ftrivial-auto-var-init=zero
>  KBUILD_CFLAGS  += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
>  endif
>
> +DEBUG_CFLAGS   :=
> +
>  # Workaround for GCC versions < 5.0
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
>  ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS   := $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> +DEBUG_CFLAGS   += $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
>  endif
>
>  ifdef CONFIG_DEBUG_INFO
> --
> 2.27.0
>
