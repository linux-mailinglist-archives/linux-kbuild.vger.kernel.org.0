Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0F33BF640
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 09:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhGHHah (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 03:30:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhGHHah (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 03:30:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C595261CE6;
        Thu,  8 Jul 2021 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625729275;
        bh=VpwS74sn0t9DOYxCOxJQbb5MWKu8kh0BSYlixiieyUk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=efxDp5fFr+pRqFyPUJlyRllnY/YX928i3PAR9jJVZvwpUsMMqfiIChkMJ2mumhxSl
         LQBSOsbVJCmyZcfdEjcWxPc61DD/2z4D9wlkiuOC47eJAVO+1VK3zUa4bXj3uVpLJm
         OQFGodQOkdscZ3BUdvn3kI2S32S9EHXrBMUe1J01EqVYD/7tCkt1pELIJvFtHpw65+
         PRzklL0x4vZQSJ5N+qWZPjXU3bgivEgK6MhyjZjvkFnZJBWAqLgP+V2BjlOxPUkcE1
         fFMKfvsn8p56P5F+EjFs8Vd3Mq+gj5P0sdK4sIb9D8sdqNgPK35jzckM/rb4ZY6ofs
         Uxj1HuNE/qMVg==
Received: by mail-wr1-f43.google.com with SMTP id f17so6196004wrt.6;
        Thu, 08 Jul 2021 00:27:55 -0700 (PDT)
X-Gm-Message-State: AOAM5333JowZT2lpNZTdTfG5KfMnLBKP+BCVkWDvrnjFaJRuRAxyXKyI
        c3OOcs7dS3Pav/CmhPi0efs5gSJJzJpI2EirUyE=
X-Google-Smtp-Source: ABdhPJwOJUc8WOoAvivZvzplZIoiv8OZEvFjB98beVIBCV5NJIJNqWP8yX4b/JR9slr34KeawQwn/Esd98wX5jCjdJY=
X-Received: by 2002:adf:e650:: with SMTP id b16mr3155943wrn.105.1625729274326;
 Thu, 08 Jul 2021 00:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com> <YOaR1ZjToP/kgNsC@infradead.org>
In-Reply-To: <YOaR1ZjToP/kgNsC@infradead.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 8 Jul 2021 09:27:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
Message-ID: <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 7:49 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Jul 07, 2021 at 03:43:08PM -0700, Nick Desaulniers wrote:
> > We get constant feedback that the command line invocation of make is too
> > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > target triple, or is an absolute path outside of $PATH, but it's mostly
> > redundant for a given ARCH.
> >
> > Instead, let's infer it from ARCH, and move some flag handling into a
> > new file included from the top level Makefile.
>
> Why only for LLVM?  I really hate the mess we currently have with
> ARCH and CROSS_COMPILE.  Being able to set both in .config (and maybe
> even inferring CROSS_COMPILE where possible) would make my life so
> much easier.

I agree this would be best, but solving the problem for llvm is
trivial with a 1:1
mapping between ARCH= and --target= strings. Doing the same for gcc
requires enumerating all possible target triples, and possibly deciding between
different versions, e.g. when your path contains

/usr/bin/powerpc64-linux-gnu-gcc-5.2.0
/usr/bin/powerpc64-linux-gnu-gcc -> powerpc64-linux-gnu-gcc-5.2.0
/usr/local/bin/ppc64le-linux-gcc-9
~/bin/powerpc/powerpc-linux-unknown-gcc-12.0.20210708.experimental

all of these should be able to cross-build any powerpc kernel, but
there is no obvious first choice (highest version, first in path,
ordered list of target triples, ...). I tried coming up with a heuristic
to pick a reasonable toolchain, but at some point gave up because
I failed to express that in a readable bash or Makefile syntax.

        Arnd
