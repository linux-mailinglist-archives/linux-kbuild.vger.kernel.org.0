Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEC721CC29
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2020 01:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgGLXex (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Jul 2020 19:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbgGLXew (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Jul 2020 19:34:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9236DC08C5DB
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Jul 2020 16:34:52 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lx13so13395280ejb.4
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Jul 2020 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVOtLwv/Cvl11tUYp50SksGWhQhY11SC0NIkGuc8zKg=;
        b=pBpXJX539broCTWH17WgpJDxoLP0paWSlvb8A7h3fxHZadJbhqRCNtCFP25mX7XEJ4
         /kwaDuWKopj4I8eO8SAvDGZq6F9j25nSGRAO0y6X2NGnu7izoh9SZwvHn6KFIILHenua
         VZeZFZ0bZYIFUV+EEZeOEkkM7qjxY5RJIoRAIP4Ic1GB+xDjTjYg3z0lEPuNawED7EbA
         MonmBQTmlvtQCqFgEnrnwFndAHCUOPLKAGIG3XWpeW0/Qr4qA0bZxFzdTlAkI2KH7b0F
         rBajQRa/6JbzOq5B4AwXzh5PM1ZTZhssUaqSkDgJ7Yz0lPtz7xwa3hLHTGAXQMnzERV6
         /O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVOtLwv/Cvl11tUYp50SksGWhQhY11SC0NIkGuc8zKg=;
        b=p5asbue4QMHNUPAxsbjiKwXs3NoUMhguW7FVTdb0MIMiLgjCKjoI3JDcr/W1ii+2r7
         Cvbux1Dsrv3FhyRrj9QWbk7qFMf8EF0XrScUMVej+cwhGKlfMt2uQvR/3fKXSAXcH8zD
         Y84XM9rDUXU72aIcxYMuuHK0xjQXdvee2fWb92meqsDnHFcGmHJSPsWiD92Dcq5SNnHZ
         TYfiEYfstzZzygMSGqwmoIRco3xQk769scV+LeEE8CBcNIW8CxWKfWn9MCZjfmbfPOkn
         4rL88Cebn91NiVy+liM9Uu7Xih2aqUtvOj5CZzIMVB3fjTy64W7ZCqXin4+HtVjKz9zy
         YRVw==
X-Gm-Message-State: AOAM533iCId8/1ie4v+PDELHdW15IwOo6HNGfyyUoZJYOll4H4w+s3dE
        S4zz1gvICMUvgrzHku0rqEmKu1YIHcN4YfTuQgh5vQ==
X-Google-Smtp-Source: ABdhPJytFy6lsxbxptEBJHanuAZiQiJRjagWMLPmEYrRnXLJYMLE9doc2W4BiVdJO1Ek3tqEEHDclPE0n0pEuhpOHu8=
X-Received: by 2002:a17:906:94c4:: with SMTP id d4mr69283452ejy.232.1594596890894;
 Sun, 12 Jul 2020 16:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com> <671d8923-ed43-4600-2628-33ae7cb82ccb@molgen.mpg.de>
In-Reply-To: <671d8923-ed43-4600-2628-33ae7cb82ccb@molgen.mpg.de>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Sun, 12 Jul 2020 16:34:39 -0700
Message-ID: <CABCJKuedpxAqndgL=jHT22KtjnLkb1dsYaM6hQYyhqrWjkEe6A@mail.gmail.com>
Subject: Re: [PATCH 00/22] add support for Clang LTO
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 11, 2020 at 9:32 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> Thank you very much for sending these changes.
>
> Do you have a branch, where your current work can be pulled from? Your
> branch on GitHub [1] seems 15 months old.

The clang-lto branch is rebased regularly on top of Linus' tree.
GitHub just looks at the commit date of the last commit in the tree,
which isn't all that informative.

> Out of curiosity, I applied the changes, allowed the selection for i386
> (x86), and with Clang 1:11~++20200701093119+ffee8040534-1~exp1 from
> Debian experimental, it failed with `Invalid absolute R_386_32
> relocation: KERNEL_PAGES`:

I haven't looked at getting this to work on i386, which is why we only
select ARCH_SUPPORTS_LTO for x86_64. I would expect there to be a few
issues to address.

> >   arch/x86/tools/relocs vmlinux > arch/x86/boot/compressed/vmlinux.relocs;arch/x86/tools/relocs --abs-relocs vmlinux
> > Invalid absolute R_386_32 relocation: KERNEL_PAGES

KERNEL_PAGES looks like a constant, so it's probably safe to ignore
the absolute relocation in tools/relocs.c.

Sami
