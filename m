Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905502F8A7F
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 02:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbhAPBd4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 20:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAPBd4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 20:33:56 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345C5C061757;
        Fri, 15 Jan 2021 17:33:16 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id z1so6798141ybr.4;
        Fri, 15 Jan 2021 17:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EvTOZfW2FWE2ZdoJVQQoFg6/SB4fiO4KfILc0PWzOXI=;
        b=QbqES6Qyyf7EnSEZ4VIx9TR+ekEIcQM2bzGitqCwe6aGt+1WZcs5W8aSdEoBinEuyj
         P1n2F66Nedycq2zrP2etebtfABnm1wI9z5qz6sa1I99PqBld1x5FDzkF8kaX+IEyhVfQ
         Hv4aIGBXRpMpR5Uclv+s+CH0JACZZGXZu5LMTGokGENK4xKEX+6N7HWWqPhzzOh9qVfb
         C4eLh2G4ENkHvueKUn3Yu216FNsHTBZ8V3mDjHtKvJ0CWzNVUkvxLMeRSbWeHOJV6o/c
         1W9iEm6JubCrp7y2nKwSXK1OHXiexdJKxip1u0xTXVzONF8j5OYoruOm8uN7LuPMQqNN
         3n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvTOZfW2FWE2ZdoJVQQoFg6/SB4fiO4KfILc0PWzOXI=;
        b=dn6pxIOsHMNP7Qg8syHCwyL3I+Rxn58G0ViKy5zx7UL8MzgbZZHdoOHoVGl3iJkkkN
         g+NVj7UYj9NJuaKDLfvardTUErhjWelZrEn48SXtlZtP0VgL6bmhNkuH6zVbCMEspcGH
         ek5qjfw1apIXqmAENQR9u6T6mWeOx8gWzMb4sHKOOh2L/uTQFalyXr+PxmoawqKMjcyE
         a7PuUmkUL3FRTMwj0K5YER/HEDGlraqE6fv5PRATtDuVRZmkEuU9awzoz9ZHvLJfLCNF
         zAmsByR+TKecJ7QakJtc3CgbrJxgmg9XW1w56C+LaolvJxaKCQXMFuwmxxXWNvYV9GJR
         4i4Q==
X-Gm-Message-State: AOAM533zmHlaIULMiq0+uAcT78fXu6a7XS3W2trN+7g6Ped2FeGl1Lzv
        qQj3N9zkBbp5jZdPMmPGQJENHDYJxC8x4DWXogs=
X-Google-Smtp-Source: ABdhPJykvpNGXUEqk4lXHf6vw97+NY8TA95kX6JqraV4cGQJ5T66tSAPURLkaTLXpd2w3cXr0MRA8Kq1/+PrFp+0kLg=
X-Received: by 2002:a25:ac03:: with SMTP id w3mr21214598ybi.135.1610760795582;
 Fri, 15 Jan 2021 17:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org> <CANiq72krA1VrVC2ecUCQFAgJC07od8POjpVUoGFYJOHjZ23ckQ@mail.gmail.com>
 <CAK7LNASc-3ADgKnM=GiHbXwAo1cYFVL3o6SuWcunsLcrTU8t7Q@mail.gmail.com>
In-Reply-To: <CAK7LNASc-3ADgKnM=GiHbXwAo1cYFVL3o6SuWcunsLcrTU8t7Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 16 Jan 2021 02:33:04 +0100
Message-ID: <CANiq72=W79sfEPN5VSPwF06rRoeZmdL0TLyHT2AyLEu5qsdD=g@mail.gmail.com>
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

On Fri, Jan 15, 2021 at 11:55 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Yes, I plan to merge scripts/ld-version.sh and scripts/lld-version.sh
> in a similar way, and move the version check as well
> once the following cleanups land in the upstream:
>
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201212165431.150750-1-masahiroy@kernel.org/
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201212165431.150750-2-masahiroy@kernel.org/

Nice!

> Yes, but that would require higher level acks,
> and consult x86 and intel folks.
>
> Please let this patch land first,
> then we will discuss whether ICC is still used or not.

I was not implying to delay this patch -- rather to start an
independent RFC to discuss it. This patch should go in regardless of
that, of course :-)

Cheers,
Miguel
