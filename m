Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184103D0274
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 22:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhGTTUV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 15:20:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232025AbhGTTS0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 15:18:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30950611F2;
        Tue, 20 Jul 2021 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626811131;
        bh=gj/ZyZfKT5W/PMZKp3qddd7AG7he0FV77gp+PYIZ1RU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MVTeDBI5Zz6zcG8Ebsth6zDu6pmNx/dGRyHsoWOnuSOLaaJ7Tz+bUCZbDVjzeqEWv
         ZsxalzKYOCXVvM50Qedc06e2hpYHW7qoIKzwJY1tX30vi9gMccQSlMiXff7LZdz2++
         9MshRB0odBuJe2fwOTZVX/Tj2IOWOULDBvp7hwcj8YMxvW9VKvT3pYrIftvPBxfBPy
         sTKpmZcx7lNnqby+prQ7dTfnjcaGeuUfhSmVitGvhXA5Ga2Xtw/Gn+VOZwzkcfcrnc
         rkZwQi6oC6LhGgAwUHYQhSM0DOhN5QQ54FXzm1kaFcFBj3YRYdnxwvoXogwe8zkkmi
         45OY60QF/9zSQ==
Received: by mail-wm1-f51.google.com with SMTP id p15-20020a05600c358fb0290245467f26a4so257533wmq.0;
        Tue, 20 Jul 2021 12:58:51 -0700 (PDT)
X-Gm-Message-State: AOAM532LqhNPdi9BIAf6CshLQYaLKF306s/D52UuXYHi1zfFZyYUqTwH
        ZIiVTCQcVF0hiDJrqvM3xmevT4Zs8d8xQwjhw/o=
X-Google-Smtp-Source: ABdhPJwYrRYUGVB+Wf52c2FNTWAvnZe/E7Y3A/1NwS/Zv2DxDcE4Z0FQf7SzTd7kTnIfxfN32tmRfXooeqHi8aXfkSY=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr123895wmb.142.1626811129717;
 Tue, 20 Jul 2021 12:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 20 Jul 2021 21:58:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
Message-ID: <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> We do most of the other heavy lifting in this area in Kconfig anyway,
> why not add that compiler choice?
>
> Obviously it would be gated by the tests to see which compilers are
> _installed_ (and that they are valid versions), so that it doesn't ask
> stupid things ("do you want gcc or clang" when only one of them is
> installed and/or viable).

I don't see a good way of making Kconfig options both select the
compiler and defining variables based on the compiler, since that
would mean teaching Kconfig about re-evaluating all compiler
dependent settings whenever the first option changes.

I do have another idea that I think would work though.

> Hmm? So then any "LLVM=1" thing would be about the "make config"
> stage, not the actual build stage.
>
> (It has annoyed me for years that if you want to cross-compile, you
> first have to do "make ARCH=xyz config" and then remember to do "make
> ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> never really cared).

The best thing that I have come up with is a pre-configure step, where
an object tree gets seeded with a makefile fragment that gets included
for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
'CC=' and possibly any other option that gets passed to 'make' as
a variable and has to exist before calling 'make *config'.

This is probably the easiest part here, and it lets you set up multiple
object directories in which you can then do

make O=obj-x86 defconfig vmlinux modules -skj32
make O=obj-x86-clang
make O=obj-arm64 randconfig
...

without ever having to type the additional CC/CROSS_COMPILE/LLVM
variables again.

One step further is the script that automatically finds a working toolchain
for a given architecture and sets up that object directory accordingly,
or even downloads a working cross-toolchain from kernel.org when
asked to do that.

        Arnd
