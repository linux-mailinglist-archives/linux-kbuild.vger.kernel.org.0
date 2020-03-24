Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1687D1917BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 18:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgCXRdt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 13:33:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42229 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgCXRdq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 13:33:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id h8so9361885pgs.9
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l8i/jKNKGTUjyZgUaJ4Q4T57WgO4guK2uBJsY6uqpzo=;
        b=l0XcA5O6RVgIo3bJA7443ZUE+xxIelr9CsIBjJs9tFuf9qQvm8YmOZt8DWsTdKo/jt
         sf6cqFgG3gcJyXEhJ3ePjo3pC6ZAAM+xbyt9/I5qhMZ9FuzXkKM0WIP7gOWI8sw+NLQA
         zAtSWXtA4kxu9BpkqHb5R3txEf1gF+QBmObPKWLw0F3APnCnlk5PpySxThMgKZIKReSH
         fadhc5DQxGgoVOX3HaMJH9drsNkbknSNYEFKl2MNBLJ5uBPOj3p7LDZp2cEqaPDA4Agl
         c9MVpbM6S6ehOpyntMODwdeLdDJgmqnKzxskXZqiSQ94M9H+5UROtxtEnf3Q5Nb5DiES
         jvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8i/jKNKGTUjyZgUaJ4Q4T57WgO4guK2uBJsY6uqpzo=;
        b=QDxWfjgSuGoABjwVTO5moz2/DKqwgv3pkaEfQv3FTR7kUiD4PrX52g16GSXBJCMC+B
         rS1InK5nYGJKx/1y7Z/5yilXh4Mp5DyHC27oIocYYBBFyoFT+s+2xtYl+ZD+XE3pkP5S
         rWqhiSzxia00sZELnShqh2f+ZSW2S/iSpZkS/H+qQi/xR1iJr5SlRDJk49UZf48VLKXe
         Yh5KFGwz2t+Q8MottaS4pgQARQeU4b4fVQH/9QPpt6qi9YtLXkR6YJZ6KglG8yruTgsz
         7zLANaWmwrjv5CEG0rypfMT3B9ccYOXBHz8nrDmkeOVKIa6BemdaetJezowmm5h4wQV3
         Klag==
X-Gm-Message-State: ANhLgQ0LICL/rkVYcJKirD7Tj0tTVXpHq3rvjTzEk/bXQnOhChG9wsMC
        rUSzWye90Ii6wbn/tSUwSqZ53IJ0F72i9NgVyIRfsA==
X-Google-Smtp-Source: ADFU+vumwoGVKW5e7HNVBvJkvgDzk/FkczTUQunpToW6bcg/sTbgkxAIHKgmKJhQhPXrCtYgfRjNy6pDCfbW+x7s+k8=
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr30843931pfo.169.1585071224082;
 Tue, 24 Mar 2020 10:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-12-masahiroy@kernel.org>
 <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com> <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
In-Reply-To: <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 10:33:32 -0700
Message-ID: <CAKwvOdmw5G+4F9eiZYK3JDHvnraDjGBPT+1hu=62Kc28PDa0Rw@mail.gmail.com>
Subject: Re: [PATCH 11/16] x86: probe assembler capabilities via kconfig
 instead of makefile
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 10:17 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Mar 24, 2020 at 11:01 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Can 11 just be rebased with 8 dropped?
>
> 8 adds comments to one place. 11 moves them to another place, while
> doing other things.
>
> Your desire is to skip the first step? I guess there's no problem with
> this, but I'm curious to learn why.

Before this series, there's no comments. After, the comments are in
arch/x86/Kconfig.assembler. Don't waste reviewers time by having other
patches in the set that move them around for fun. Just add them to the
final destination.

-- 
Thanks,
~Nick Desaulniers
