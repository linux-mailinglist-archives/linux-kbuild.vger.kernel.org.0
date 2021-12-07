Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7375946C822
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Dec 2021 00:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbhLGXZP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Dec 2021 18:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhLGXZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Dec 2021 18:25:14 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DD7C061746
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Dec 2021 15:21:43 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id z7so1808553lfi.11
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Dec 2021 15:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=asJWBO7eY0QcfrBWswJqa0D8PLdaP618kcEvbJ50eIg=;
        b=AfW0d1I+nq7/xxFpdy1SyfbN4hZQhpvUWKC/GFTTsGAkXcBRgPA3Uoi8dsklmKbnZs
         BaHhEvIBWm5tYwA3UXnxtEtRrd4pSEvtTaywyA4iXU1bWgPUv1tK8UvDnxlPZQHTsqyk
         bPw4p4cTEMmd76cOMbNIq9pGcYn9opr3bNzZnIOwlkqcs7avXNIRj1sJuvVgHL+Bez2q
         anbMo3xtEQ3nttb1ctyuDdZzWVrD4P3w5jqNVPOF+nFveMKvJDJ9RCt7l17U5PsENZsj
         bTPpPjS24TkJRZNtOIjeB76IOXqQdfSTcK7q8AHp9NSxsSAZQ2atebIn/FJNYJywWeJG
         e1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=asJWBO7eY0QcfrBWswJqa0D8PLdaP618kcEvbJ50eIg=;
        b=2mL5RM8JfRLansi/OOTOj2MOaZJyCdGCOv2yclgxO2WdVR93ol48jlu+RxPpk7SRcA
         c5Kvbwhn+kTX0WlT6MaWkLFTQ/1MP1Iim6arrQtuM/pFsQ5fXy/ovgRUjV1DeT/CJ4FT
         PUh3d4AbbR6XC1JyiUFmWql2rb4pNyByUA6xB9Ye9qlvpMOgmXt9kYvhHjDL/CDmknAy
         QYiwYXkMXJ2vV8lccqOMeN977Aw0PMKxYs4e/BfQm41bfBtv66qG+KC3xiHWTHCNJFbK
         sGNKgLf5GgtH7qu8vxoYbxxvJloEzjbazilPGG4G36K0kqfoscNwVqiQH0L53gwsVIVS
         BkMA==
X-Gm-Message-State: AOAM533UurlpzU5vPM3M4Njp9fDSJ8NtROXjl36TwYDvrDgBykukOLzn
        hLE7mOs1D7EauxvEJsmNRzIrRBs0kN0t8m0vV3e1nQ==
X-Google-Smtp-Source: ABdhPJysjkyhUOJrmyHDdSyDIM7lBOtMYaXwrIgiy6u2C5zfwK9sd9NDowrss4BuvDXhYt26C+A6eoi0whwvH42sfZc=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr42666731lfi.82.1638919301609;
 Tue, 07 Dec 2021 15:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-16-ojeda@kernel.org>
 <CAKwvOd=7QTUH69+ZbT7e8einvgcosTbDkyohmPaUBv6_y8RfrQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=7QTUH69+ZbT7e8einvgcosTbDkyohmPaUBv6_y8RfrQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Dec 2021 15:21:29 -0800
Message-ID: <CAKwvOdk9VNenJJN5HnPpGgsHT+OsRsgPGSesQgqMP2aLPWy0NQ@mail.gmail.com>
Subject: Re: [PATCH 15/19] Kbuild: add Rust support
To:     Miguel Ojeda <ojeda@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 7, 2021 at 2:45 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Mon, Dec 6, 2021 at 6:07 AM Miguel Ojeda <ojeda@kernel.org> wrote:
> >
>
> ... snip ...
>
> Miguel and team,
> I'm happy to see progress here! Just some quick notes after a first pass.
>
> Testing this series applied on mainline, I see:
> $ make LLVM=1 -j72 defconfig
> $ grep RUST .config
> CONFIG_HAS_RUST=y
> CONFIG_RUSTC_VERSION=14000
> # CONFIG_RUST is not set
> ...
> $ make LLVM=1 -j72 menuconfig
> # enable CONFIG_RUST
> $ make LLVM=1
> ...
>   CALL    scripts/checksyscalls.sh
> error: @path is unstable - use -Z unstable-options to enable its use
>
> error: @path is unstable - use -Z unstable-options to enable its use
> $ rustc --version
> rustc 1.40.0 (73528e339 2019-12-16)
>
> Can we update some Kconfig checks to fix that?

After now reading though the Documentation/ patch:

$ rustup update
$ rustc --version
rustc 1.57.0 (f1edd0429 2021-11-29)
$ make LLVM=1 -j72
...
make[1]: *** No rule to make target
'/usr/local/google/home/ndesaulniers/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs',
needed by 'rust/core.o'.  Stop.

Maybe I'm holding it wrong, let me reread the Documentation/ again.

I still think CONFIG_RUST shouldn't be selectable unless
CONFIG_RUSTC_VERSION is either a blessed version, or above some
minimal value (like we do for CONFIG_GCC_VERSION, CONFIG_LD_VERSION,
CONFIG_CLANG_VERSION, LLD_VERSION, etc).

Also, it looks like I don't have bindgen installed. Anything we can do
there to help the developer out, as in informing them that it's
necessary perhaps via a Kconfig check? I don't think I should be able
to select CONFIG_RUST if I don't have bindgen installed. (Same comment
about version check probably applies, too).  Installing bindgen
doesn't change the error I'm observing above though.
-- 
Thanks,
~Nick Desaulniers
