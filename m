Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3772C6CD2
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Nov 2020 22:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgK0VJt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Nov 2020 16:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731224AbgK0VIk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Nov 2020 16:08:40 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA35C0613D4
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:08:39 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id q13so8083533lfr.10
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7vfZVmZni5y5pUNP8sVY5cN8ztemvM29CZjahGiwHqQ=;
        b=WqK8NyLZKb1SW4dOsSVDrG/QHynP06jRwhGvHeAfNjwz73taRzqZPpeDqq/jDuoTKm
         F4y+dEvEBYFKx9MkS1RO4Z+4qvMLnrri8AscPY9xgoFFJd4GcQlhoEug+Lpv/t+Ev2pk
         J8LjsgbV/e9n4r6R0HHBFBNZ+Kz9IrgiPyyqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7vfZVmZni5y5pUNP8sVY5cN8ztemvM29CZjahGiwHqQ=;
        b=hilAHp9SO3s5gR85fztgPfxZVJyxv5Cxi2gcwQVVQA4Gu15PTedx2rOoBAO9+ebEbu
         lkIbb+9yEChw74Tv78Nahz/D/HEm3mtYbcs0RxNd7BGIY5rn0ftCAeRApIfKKGcCfkBz
         WgRFiCC4IWcqlamp4ErAVd0VQ4fUr0RpMbEbiQ6/Uu1vTmoBuHYVaawE6W/dvRLRNzku
         YR1NeOwHA8e0UUBzTDhM5+zvV9Nek65VWKjZk9dUqxvvG/VnxXNwNv/8AmydqP3/eI8l
         4ZvKggR2fQy9eF1zWN2HtNdTW0CiUq+paJJB6Zqvl6PyuATx2QJ7cv8LQCljez9l1buG
         hzvA==
X-Gm-Message-State: AOAM531i5uidNKx0iaQqMV/Xsh94EbFS8VBhcs+vNEHBR6RmgcT5WylT
        LuZ6149kVCXsGkW/w9CX8t+hcDBRiFuj2w==
X-Google-Smtp-Source: ABdhPJxeCYHBmVanlBfxrYwXe0L5kMP34/psZSPTivE0sRNPjeeN+G/KnOeiEvfg/0QoOja6efJTLQ==
X-Received: by 2002:ac2:563a:: with SMTP id b26mr4350592lff.596.1606511317596;
        Fri, 27 Nov 2020 13:08:37 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 136sm452442lfn.193.2020.11.27.13.08.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 13:08:36 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id s9so7260648ljo.11
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:08:36 -0800 (PST)
X-Received: by 2002:a05:651c:339:: with SMTP id b25mr4749311ljp.285.1606511315967;
 Fri, 27 Nov 2020 13:08:35 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
In-Reply-To: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 27 Nov 2020 13:08:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
Message-ID: <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just a quick note, because it's been a small annoyance for a while (I
don't think it has anything to do with the 5.10 pull, I'm just
responding to your latest pull request)..

I have "make allmodconfig" taking unnecessarily long, and I finally
started asking myself "what's so expensive here". I'd expect it to be
basically instantaneous on my machine, and it isn't.

And when I looked at it, I noticed that it re-compiled
scripts/kconfig/conf every single time.

For no obvious reason I can see.

Doing a

       make --trace allmodconfig

shows a series of

    scripts/Makefile.host:112: target 'scripts/kconfig/....o' does not exist

lines, which is silly and wrong (they definitely exist), and I suspect
it's due to some confusion about the build directory or similar.

It's probably obvious to you once you start looking at it.

And yeah, I realize I'm being silly. Doing a "time make allmodconfig"
shows that it takes 1.5s to do. Should I care? No. But I feel that's
an eternity for something that I think should just be instantaneous.

                Linus
