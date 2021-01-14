Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7612F6936
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 19:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbhANSPt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 13:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbhANSPt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 13:15:49 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B16C061575;
        Thu, 14 Jan 2021 10:15:08 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 18so2665558ybx.2;
        Thu, 14 Jan 2021 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yb+qq3jE3dz702Bx7BFxZGv/G0yc9+3LN1cCdlwEu2c=;
        b=tf6V0LKwNOcgW88htXLBNwAp036KtO9+g4Enk+cOmblULhG9QNTt+SJFNode6W9R7W
         aEr0TSj0pNIbvuStefllwW88kh/Z/3DPS87zuAUxsqVbfJtK4Fx6LrXfrxula9bCf8Ye
         EVm6Dfl1fLBL9/jx4Wh+J+hiVC/JPsV/cYEit4IjRy4tNHvh6ocLGwVTjs5WlK1phE6a
         A69dpGXIntEoJwA3KYvW4W6N2T6hrMNUEzoohV3UOobp48Q9yBJ3RpLbLwScq8mC4jJa
         OJjsCPp7p92dxF/Q4C6CXkyOzystuGDksqTGkyI1y+xJENPQnR0rwQ6iwMGrV9tdL/dc
         WlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yb+qq3jE3dz702Bx7BFxZGv/G0yc9+3LN1cCdlwEu2c=;
        b=X6Qs0Vi1jwtmCMdFOs3k5kQ7oJ4Ku2EMKtt5V1l5mpSVLLnjSiWA/F8bLJJOeFzYYN
         ZM9l+aBgwfZ/mvhxpRo4Zr4Mnp6DS/XD4FZRmk8iN/PqOqZnilkRveV6WEwJS8o623D6
         DFllKGyyj1Zq9D0jpTn0LDl4q81BQbD+o6Wl5qhmwhbZ7NjjWQlgh0rH8/WXl4c2TARL
         4Bywrfx1mBkjQ9//ssKFg1PJPZ2sPEKgU51QMsRL7ga7rUopfx9gr+U+zOZuIOXYmd9S
         177c64eegElfACs6EG+shvZpha/qw5KkPg9zHSrdsBW+Zuv060yICrPPtfyfG7Lt7Bgl
         FyEA==
X-Gm-Message-State: AOAM532IH5mCfxr7L/9x/0PCifwdTVjX18E1hT9dudjz8tIJkcmmvQxx
        o1Gd34sy/4CfZF81Ib6HsttLmMOI9LDXutM7y8w=
X-Google-Smtp-Source: ABdhPJwSnU1m7hBTs6vE0HFvgG2Je2nQPrBksssYRHWESn3i8D3RIQGU+OO5Wy4e8d/nRxDIq5PLL866JaCuppU6/kM=
X-Received: by 2002:a25:ac03:: with SMTP id w3mr11967015ybi.135.1610648108210;
 Thu, 14 Jan 2021 10:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org>
In-Reply-To: <20210114042420.229524-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 14 Jan 2021 19:14:56 +0100
Message-ID: <CANiq72krA1VrVC2ecUCQFAgJC07od8POjpVUoGFYJOHjZ23ckQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 5:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The cc-version.sh also shows the error if the compiler is old:
>
>   $ make defconfig CC=clang-9
>   *** Default configuration is based on 'x86_64_defconfig'
>   ***
>   *** Compiler is too old.
>   ***   Your Clang version:    9.0.1
>   ***   Minimum Clang version: 10.0.1
>   ***
>   scripts/Kconfig.include:46: Sorry, this compiler is unsupported.

That looks nice. Hopefully we can do the same approach for other tools too!

> I put the stub for ICC because I see <linux/compiler-intel.h> although
> I am not sure if building the kernel with ICC is well-supported.

I doubt it, and there seems to be no maintainer listed either. I think
it could be considered for removal in an RFC.

Cheers,
Miguel
