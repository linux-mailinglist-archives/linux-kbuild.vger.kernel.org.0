Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B793F0E32
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 00:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbhHRWgA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 18:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbhHRWgA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 18:36:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A646C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 15:35:25 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id k24so3881798pgh.8
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+5mSEtJrjnggVNveih68RddTImV6HnC03hWsATd0wA=;
        b=kRIj8JIqpPRaKtf6CIkL46zXyN+TG7NSk6bw8gu7+8srWnLtPpMsCTfSAl6mGxQkPO
         AO2tJAjBgrQqg48z/R0w1gBkmv7qgCaYMxOgKctRX1l4WVxZaQ6vNnvX5LAGRKfFudjG
         PsQYY9oWNpYKfElRnHpaNeEhFchqOLvvFftCGuTzj/AyqbjlyvdzlVVTJ1IB4Ngv7/Ms
         u4r7kwHlTNVtr67hCv3yPPJX5ARYvjGYympkKth1dgkHgrQuh2AbLYKgiGUMqV8NtvDX
         +pRCiBA2g2BclAPoPSaP8V7pu3JHnBNUDDtuik7qEFxuxYTic4rAadkAFa3uqJjCsduq
         ulwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+5mSEtJrjnggVNveih68RddTImV6HnC03hWsATd0wA=;
        b=qqD/KTq6sPpfbHW73dFFteBiZalhH+5VAb58q4dlq39X0/Osl6fACsTqinhhLJ2LUh
         TM+JvRG7xGxsXftLVjFyAFuifVeX0YYJNUj0xAWSrTBnx68bItQXpMp90Apx6EOdQhMY
         GkOl70siGBzMOFNE5GTgbZxLIJYVN9mtn+Xo4X4BJZfFuxh8JxI+qIX5nBBEA5YkyE+R
         AbdwGrbdTpyN2/IqqQHuVmx+xWYuLhaLY3pXDO/kgc8PiKok38ESsAfSQYOq308xgf9a
         hd6A/ea3g6YkuYZ7f6CF6+X17PWOWOkF7zwXh6SHfGVbADxhyNYZqtnVDxzETuPGkPqo
         1a8w==
X-Gm-Message-State: AOAM532iuwe2MqVpcSTDFmawR/g1cLCMadD1DegSlnzzgJE90Att1x6C
        xMD9unhuqjiu6sLZhtecvgm1VfSk09ruqXXC5XtuGA==
X-Google-Smtp-Source: ABdhPJwyt02ESgNp2hR1UmZAbrXcfqwpxlM4lrynFVwd2ax1rLD8IK0a6F+uEetO+Gksr5LJ8GXEb6TCnHWEdnZ/Nzg=
X-Received: by 2002:a63:311:: with SMTP id 17mr10873581pgd.450.1629326124479;
 Wed, 18 Aug 2021 15:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-6-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-6-keescook@chromium.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 18 Aug 2021 15:35:13 -0700
Message-ID: <CAPcyv4jU+FhX0e4EXXVzisD5hzsdxK+cyVD3=QuqGOSpE4j-SQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/63] stddef: Introduce struct_group() helper macro
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Keith Packard <keithp@keithp.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Wireless List <linux-wireless@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 11:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> Kernel code has a regular need to describe groups of members within a
> structure usually when they need to be copied or initialized separately
> from the rest of the surrounding structure. The generally accepted design
> pattern in C is to use a named sub-struct:
>
>         struct foo {
>                 int one;
>                 struct {
>                         int two;
>                         int three, four;
>                 } thing;
>                 int five;
>         };
>
> This would allow for traditional references and sizing:
>
>         memcpy(&dst.thing, &src.thing, sizeof(dst.thing));
>
> However, doing this would mean that referencing struct members enclosed
> by such named structs would always require including the sub-struct name
> in identifiers:
>
>         do_something(dst.thing.three);
>
> This has tended to be quite inflexible, especially when such groupings
> need to be added to established code which causes huge naming churn.
> Three workarounds exist in the kernel for this problem, and each have
> other negative properties.
>
> To avoid the naming churn, there is a design pattern of adding macro
> aliases for the named struct:
>
>         #define f_three thing.three
>
> This ends up polluting the global namespace, and makes it difficult to
> search for identifiers.
>
> Another common work-around in kernel code avoids the pollution by avoiding
> the named struct entirely, instead identifying the group's boundaries using
> either a pair of empty anonymous structs of a pair of zero-element arrays:
>
>         struct foo {
>                 int one;
>                 struct { } start;
>                 int two;
>                 int three, four;
>                 struct { } finish;
>                 int five;
>         };
>
>         struct foo {
>                 int one;
>                 int start[0];
>                 int two;
>                 int three, four;
>                 int finish[0];
>                 int five;
>         };
>
> This allows code to avoid needing to use a sub-struct named for member
> references within the surrounding structure, but loses the benefits of
> being able to actually use such a struct, making it rather fragile. Using
> these requires open-coded calculation of sizes and offsets. The efforts
> made to avoid common mistakes include lots of comments, or adding various
> BUILD_BUG_ON()s. Such code is left with no way for the compiler to reason
> about the boundaries (e.g. the "start" object looks like it's 0 bytes
> in length), making bounds checking depend on open-coded calculations:
>
>         if (length > offsetof(struct foo, finish) -
>                      offsetof(struct foo, start))
>                 return -EINVAL;
>         memcpy(&dst.start, &src.start, offsetof(struct foo, finish) -
>                                        offsetof(struct foo, start));
>
> However, the vast majority of places in the kernel that operate on
> groups of members do so without any identification of the grouping,
> relying either on comments or implicit knowledge of the struct contents,
> which is even harder for the compiler to reason about, and results in
> even more fragile manual sizing, usually depending on member locations
> outside of the region (e.g. to copy "two" and "three", use the start of
> "four" to find the size):
>
>         BUILD_BUG_ON((offsetof(struct foo, four) <
>                       offsetof(struct foo, two)) ||
>                      (offsetof(struct foo, four) <
>                       offsetof(struct foo, three));
>         if (length > offsetof(struct foo, four) -
>                      offsetof(struct foo, two))
>                 return -EINVAL;
>         memcpy(&dst.two, &src.two, length);
>
> In order to have a regular programmatic way to describe a struct
> region that can be used for references and sizing, can be examined for
> bounds checking, avoids forcing the use of intermediate identifiers,
> and avoids polluting the global namespace, introduce the struct_group()
> macro. This macro wraps the member declarations to create an anonymous
> union of an anonymous struct (no intermediate name) and a named struct
> (for references and sizing):
>
>         struct foo {
>                 int one;
>                 struct_group(thing,
>                         int two;
>                         int three, four;
>                 );
>                 int five;
>         };
>
>         if (length > sizeof(src.thing))
>                 return -EINVAL;
>         memcpy(&dst.thing, &src.thing, length);
>         do_something(dst.three);
>
> There are some rare cases where the resulting struct_group() needs
> attributes added, so struct_group_attr() is also introduced to allow
> for specifying struct attributes (e.g. __align(x) or __packed).
> Additionally, there are places where such declarations would like to
> have the struct be typed, so struct_group_typed() is added.
>
> Given there is a need for a handful of UAPI uses too, the underlying
> __struct_group() macro has been defined in UAPI so it can be used there
> too.
>
> Co-developed-by: Keith Packard <keithp@keithp.com>
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Link: https://lore.kernel.org/lkml/20210728023217.GC35706@embeddedor
> Enhanced-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Link: https://lore.kernel.org/lkml/41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk
> Enhanced-by: Dan Williams <dan.j.williams@intel.com>

Acked-by: Dan Williams <dan.j.williams@intel.com>
