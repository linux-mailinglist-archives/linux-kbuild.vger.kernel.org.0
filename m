Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433CB308062
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhA1VUi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhA1VUT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:20:19 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998CAC061574;
        Thu, 28 Jan 2021 13:19:39 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u8so2023964ior.13;
        Thu, 28 Jan 2021 13:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=8KacIPQbORj40QvqegzfTEzGvNMpxCBDGW80/SheMdk=;
        b=uALI5RA+UDVO9yHlHg1R3fl2m3imATTzEiriaqP3VfyeMAPL2iBha5KO2Iw1Mc9cAO
         qrmOEjZpf9KwUgQl6Ai7NYp4T5fmBhzII0hJMq6pwcM7rX3tb0v3PWO+cpdDONkxKcAo
         B5C7W4AcZx7t8ffBYZ1a48Uv2IvkYKNE+TqKs6T/yyFx3TLy6Fr3qbwnE2zGd78z23Ch
         iuTpYHzM8MXi3VGAKZwSSAJroXHRihgTI7hZw3NFpP3sBAFA2kVXPgviPvrq3yNR9Z60
         /xmBDLlwbCOxBOoibx/AVqO85LStXaIcbl0MKtP8dp+IzLr/zNU/BpvZ0GZPR7Ju7XkO
         UOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=8KacIPQbORj40QvqegzfTEzGvNMpxCBDGW80/SheMdk=;
        b=nkcFpnKJBH1D3OZ8WGQnjl/o7Xw19YRhoS3Po+AnOpWZCh/Ki8V94aL2VIFvP8QBoY
         FkelOmbV1Kl7RX65YkQh5SeRqgtfc8UGWlwY4r+Sfg7MEXbWvJy1NtllzDl5zMSL3750
         68UBG4sWLuU8xN5FWYXe2MJEIB58vQYLt4jVfS46xZZR5t5HOolMOpZQfsbQwSJG/4mh
         8LHGZeP97f8RRFYDNOxtViZ68mnTq37TA/uj1No1WdrRi2253YQRKHEobfydsWI7nJ/B
         WgA1ydqY6PZ+uXxEe1dalZOQ2DigYSE5sYBek+hr+DXqxL6+vbwhIrix5gzXo7MVcbr2
         4nNA==
X-Gm-Message-State: AOAM531A/HOQ0f9LYDCenWxtgxXkuVXjMcr3PBvgzSwWgdN7hibe3a93
        5M1ottvzCNMgeG912BfZlkpi90OFrme2OiX+Za8=
X-Google-Smtp-Source: ABdhPJxkeX+a0t3UEWcvRnCQEoX2qs85tdDKuKZlwXgE9TpII2Hd+h2Xs6BbQ1qihMSZekjtnFrhn1l9APmiElZ8zt8=
X-Received: by 2002:a02:cc54:: with SMTP id i20mr1003818jaq.138.1611868779021;
 Thu, 28 Jan 2021 13:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com>
 <CA+icZUU=XfwqMcXYonQKcD4QgqTBW-mA+d_84b7cU2R3HYPOSQ@mail.gmail.com> <CAKwvOdnUm2FqC0CEF3qFuMCaWoqiUMqr7ddMjA2UNsJugA9DNQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnUm2FqC0CEF3qFuMCaWoqiUMqr7ddMjA2UNsJugA9DNQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 28 Jan 2021 22:19:10 +0100
Message-ID: <CA+icZUWJu0FWdRY0DMQxpYwjqq1WTB87y9u1-6t3YMmkR3UsBQ@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 10:12 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ LLVM ]
> >
> > Today, I switched over to LLVM version 12.0.0-rc1.
> >
> >
> > [ Step #1: 5.11.0-rc5-5-amd64-clang12-pgo ]
> >
> > My first kernel was built with CONFIG_PGO_CLANG=y and LLVM=1 plus LLVM_IAS=1.
> >
> > [ start-build_5.11.0-rc5-5-amd64-clang12-pgo.txt ]
> > dileks    193090  193065  0 06:54 pts/2    00:00:00 /usr/bin/perf_5.10
> > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > LD=ld.lld LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> > LOCALVERSION=-5-amd64-clang12-pgo KBUILD_VERBOSE=1
> > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > KDEB_PKGVERSION=5.11.0~rc5-5~bullseye+dileks1
> >
> > Config: config-5.11.0-rc5-5-amd64-clang12-pgo
> >
> >
> > [ Step #2: x86-64 defconfig & vmlinux.profdata ]
> >
> > Booted into 5.11.0-rc5-5-amd64-clang12-pgo and built an x86-64
> > defconfig to generate/merge a vmlinux.profdata file.
> >
> > [ start-build_x86-64-defconfig.txt ]
> > dileks     18430   15640  0 11:15 pts/2    00:00:00 make V=1 -j4
> > HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang LD=ld.lld LLVM=1
> > LLVM_IAS=1
> >
> > Script: profile_clang-pgo.sh
> > Config: dot-config.x86-64-defconfig
> >
> >
> > [ Step #3.1: 5.11.0-rc5-6-amd64-clang12-pgo & GNU-AS ]
> >
> > The first rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> > KCFLAGS=-fprofile-use=vmlinux.profdata".
> > I was able to boot into this one.
> > Used assembler: GNU-AS 2.35.1
> >
> > [ start-build_5.11.0-rc5-6-amd64-clang12-pgo.txt ]
> > dileks     65734   65709  0 11:54 pts/2    00:00:00 /usr/bin/perf_5.10
> > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> > LOCALVERSION=-6-amd64-clang12-pgo KBUILD_VERBOSE=1
> > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > KDEB_PKGVERSION=5.11.0~rc5-6~bullseye+dileks1 LLVM=1
> > KCFLAGS=-fprofile-use=vmlinux.profdata
> >
> > Config: config-5.11.0-rc5-6-amd64-clang12-pgo
> >
> >
> > [ Step #3.2: 5.11.0-rc5-7-amd64-clang12-pgo & Clang-IAS ]
> >
> > The second rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> > KCFLAGS=-fprofile-use=vmlinux.profdata" plus LLVM_IAS=1.
> > Compilable but NOT bootable in QEMU and on bare metal.
> > Used assembler: Clang-IAS v12.0.0-rc1
> >
> > [ start-build_5.11.0-rc5-7-amd64-clang12-pgo.txt ]
> > dileks      6545    6520  0 16:31 pts/2    00:00:00 /usr/bin/perf_5.10
> > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> > LOCALVERSION=-7-amd64-clang12-pgo KBUILD_VERBOSE=1
> > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > KDEB_PKGVERSION=5.11.0~rc5-7~bullseye+dileks1 LLVM=1
> > KCFLAGS=-fprofile-use=vmlinux.profdata LLVM_IAS=1
> >
> > Config: config-5.11.0-rc5-7-amd64-clang12-pgo
> >
> >
> > [ Conclusion ]
> >
> > The only statement I can tell you is a "PGO optimized" rebuild with
> > LLVM_IAS=1 is compilable but NOT bootable.
>
> Thanks for the extensive testing and report. Can you compress, upload,
> and post a link to your kernel image? I would like to take it for a
> spin in QEMU and see if I can find what it's doing, then work
> backwards from there.
>

Which files do you need?
For QEMU: bzImage and initrd.img enough?

- Sedat -
