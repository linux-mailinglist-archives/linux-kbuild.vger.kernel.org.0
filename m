Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CAE320BF3
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 18:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhBURMm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 12:12:42 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44442 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBURMm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 12:12:42 -0500
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11LHBZxQ028780;
        Mon, 22 Feb 2021 02:11:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11LHBZxQ028780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613927495;
        bh=DvvustrzqKtKLI6zhBqGHjkFSER50wKV1i/U9qk6bu8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZEu9kZRKO2IVdqO8rr03PH2gFSU1JKQVYeg7iBkH3M+iGISLPb5ga9X2+3y7sq+u5
         BvxE7HpLxI9CAu0wxlSVPKPKYigFY8FFX61bpWr8gpLoM96kTIeY0MDxg/jwoKKTbL
         g7Lba9teuuS2IzA6IOKeGuy4c9ClHQzuITuI2ZKa3PJqTlRg8YXg7IiyFsU1qwiW30
         PLTuu1K+vDg1JuSR7MQEHOiIvMhCMgqhjDyZ+1J6jMziMk79wLOjmtW5jezxmZ59uU
         EmepU9W7sLcF73jX6ltH854Jk1FkEf0KuMYz1cD7TuyfqhlZKsmAd8sXNtZIjeo996
         3EvwaXfG4RBKg==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id x129so374365pfx.7;
        Sun, 21 Feb 2021 09:11:35 -0800 (PST)
X-Gm-Message-State: AOAM5312wg0/CjR4RcmyPQq3AhInqXbkz2UFpfo33HGhzPRZjuF++lsF
        Nzl8y0DzZz3GVH8Hds3sPZPT3OFORZKcZMcmfhE=
X-Google-Smtp-Source: ABdhPJzBtwmlHW4UhRXzXaVsco3d7YPNXCznKnDxzLBaDDk/xQP0zVZbSpy9P5oIEsA3U2iK74eXx+v3ED23ZQCSBjA=
X-Received: by 2002:a63:575e:: with SMTP id h30mr16533332pgm.7.1613927494874;
 Sun, 21 Feb 2021 09:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210216031004.552417-1-masahiroy@kernel.org> <20210216031004.552417-2-masahiroy@kernel.org>
In-Reply-To: <20210216031004.552417-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Feb 2021 02:10:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARD3FuBmFaNSw7wxSYxRmXheFbWXU-z2gxziP4PrLjEYg@mail.gmail.com>
Message-ID: <CAK7LNARD3FuBmFaNSw7wxSYxRmXheFbWXU-z2gxziP4PrLjEYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: check the minimum linker version in Kconfig
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     David Laight <david.laight@aculab.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Quentin Perret <qperret@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 12:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Unify the two scripts/ld-version.sh and scripts/lld-version.sh, and
> check the minimum linker version like scripts/cc-version.sh did.
>
> I tested this script for some corner cases reported in the past:
>
>  - GNU ld version 2.25-15.fc23
>    as reported by commit 8083013fc320 ("ld-version: Fix it on Fedora")
>
>  - GNU ld (GNU Binutils) 2.20.1.20100303
>    as reported by commit 0d61ed17dd30 ("ld-version: Drop the 4th and
>    5th version components")
>
> This script show an error message if the linker is too old:
>
>   $ make LD=ld.lld-9
>     SYNC    include/config/auto.conf
>   ***
>   *** Linker is too old.
>   ***   Your LLD version:    9.0.1
>   ***   Minimum LLD version: 10.0.1
>   ***
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
>
> I also moved the check for gold to this script, so gold is still rejected:
>
>   $ make LD=gold
>     SYNC    include/config/auto.conf
>   gold linker is not supported as it is not capable of linking the kernel proper.
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
>
> Thanks to David Laight for suggesting shell script improvements.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
