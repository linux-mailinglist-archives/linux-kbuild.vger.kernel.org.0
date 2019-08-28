Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A658A0964
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 20:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfH1S0U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 14:26:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35897 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1S0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:26:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id w2so337362pfi.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2ELFCvPtWq7P/iBoFB+bDhTH6F6gZMcRs7pKSMkPZ0=;
        b=WrZfzjuQAiJeyCbI6jHnj8D+AK+KMLOLl1eaVP4JgWwVLtgFI6iVBl8OFgwkGfopj1
         XnLpMTHDNIci/IJ9m8znBva0rSgnEQ7GVHyIefiaQPdmIznyZCKl8Xc8ZuztfjSfin7+
         xgiv6fhHWTpOuuzx57DiiF9XV4j2Udj36RqMUZgYj4Lm5rADTEicVClvrvxfPlxvznzz
         OxAe0zMf8oUKsjq8B6KtuXljFFO+I5tN8krSxj2FyLoe9Gorb8N5n66A4SYP9/bInsEO
         0oEdsvRDuXfsyd6MVyvqD5ALJ37EAU1g70cdYKZ0TPREQp/FzJ27PI0YpzXhOChNP0/L
         Zjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2ELFCvPtWq7P/iBoFB+bDhTH6F6gZMcRs7pKSMkPZ0=;
        b=QIzRmhU5dVrrhEfwOHmVZ2fa5xLAdC6eTP+5OiHVUwAWAeu/h5sgn18/LWB0t9Vi1u
         TQ+OEcB5iQZxXw6tl0YJTeRnHzhFg/IZ2DJqia+Ed/Ug1EyaBkViW1p+5flstePd6W2t
         +5RvcJZvSrOXHAYIIqyBihcl26fJDpjhzqTnMk/9lDA9XhFXICh/QQendZ3dwtZx3N3v
         WbJVRVWqFnKZHafzqsnvW8hz4EQP5pYQBiBdtC1o6hBaJOiU96auwCvJtw8ekwCZrO42
         GQD9LxrE8+lphCF7Uj34roh6uJGtGM9ZVKNJdo9fue95JVyVVWKfJPL9nnJv3iz6DXA5
         0YFA==
X-Gm-Message-State: APjAAAXJslMKm7FDSdWMRg7kxYSKo5yQE45WIlsWwYcbg9O5O++gh975
        +EkkJYmT510+K5Tg9QJDWpUq5YZNNz9pTD6haZ0j9g==
X-Google-Smtp-Source: APXvYqwgq6GracV991sCW77HnUuRKoJAO+84cTfDtVfoqGVajWF/+QhM0kqUny8Jabemf0jwZfIKEvj1fo3VUHWGMi8=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr6354559pff.165.1567016779610;
 Wed, 28 Aug 2019 11:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com> <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
In-Reply-To: <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Aug 2019 11:26:08 -0700
Message-ID: <CAKwvOd=Zwkm33_8MTFKoVfs8XEEUKgzQFqJN3nar_ryKnbJTPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 12:20 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 7:55 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Instead of the warning-[123] magic, let's accumulate compiler options
> > to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> > easier to understand what is going on in this file.
> >
> > This commit slightly changes the behavior, I think all of which are OK.
> >
> > [1] Currently, cc-option calls are needlessly evaluated. For example,
> >       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
> >     needs evaluating only when W=3, but it is actually evaluated for
> >     W=1, W=2 as well. With this commit, only relevant cc-option calls
> >     will be evaluated. This is a slight optimization.
> >
> > [2] Currently, unsupported level like W=4 is checked by:
> >       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> >     This will no longer be checked, but I do not think it is a big
> >     deal.
> >
>
> Hi Masahiro Yamada,
>
> thanks for your patch series.
>
> If KBUILD_ENABLE_EXTRA_GCC_CHECKS does extra(-warning)-checks for GCC and Clang,
> please rename the Kconfig into...
>
> KBUILD_ENABLE_EXTRA_CC_CHECKS
>
> ...or something similiar (and maybe with some notes in its Kconfig help-text?).

I too would like to see that changed.

-- 
Thanks,
~Nick Desaulniers
