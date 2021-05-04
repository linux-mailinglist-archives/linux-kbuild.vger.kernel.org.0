Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B73731BC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 23:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhEDVHh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 17:07:37 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36254 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbhEDVHh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 17:07:37 -0400
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 144L6KSO007194;
        Wed, 5 May 2021 06:06:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 144L6KSO007194
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620162380;
        bh=xH0gW8TIeRQ8tN9XJTi1yPD7TLUHwwx+t4BRo+ku79Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GPGV3MeGMmJzWCdCZwBoOHWTrmpok99tPeu0DMgrCa76RNYuUeA8K10d/ztQv0gSW
         03OEOFThMV6PERSQhb3iAlqYk0OvFM4uRRzD5GSWpXs/2jWxXYtzd0s0yt5c8arLVO
         xkYuaIvKPEbkGhzBpSnYE9SdUEF1qZhDMAF7vcv9uoaSLgVvDkW0tNPwbB7ZMIUAzC
         OAF4a1M+WzqGBwV4Bzr/pjLOItVaCEWMunMncdrGbClxxXIDHLhU34bvpPjK1tNX2k
         ZUfEBsdHLeB4Qbtrm/CF+Mysf+qKtkqlwxDvqVHloZGu6LAQMzR3+ZXLJLcm6oLa1T
         E0sjGG/K9puYw==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id t21so6040449plo.2;
        Tue, 04 May 2021 14:06:20 -0700 (PDT)
X-Gm-Message-State: AOAM532NyOUEOdUNdMem4n9S5g/L7DBefJz3xGAEWGUvhhadQZG4bYJh
        VZL9dTYmEdXOCgICVibGhGCYt2EKQc2ybcA29KQ=
X-Google-Smtp-Source: ABdhPJzyB94b1kwA/O+ruJPLuSO6YoAFXW7PUOP5JUwD8XWHPMDU+HssucioEE7dJgWQJ0GjppREmzjDhpIk3O2THII=
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id
 r11-20020a1709028bcbb02900eca19221cfmr28303036plo.71.1620162379584; Tue, 04
 May 2021 14:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200614144341.1077495-1-masahiroy@kernel.org>
 <20200614144341.1077495-2-masahiroy@kernel.org> <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
 <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com> <58e4bd69c15fd0e0cf3de32e8ed53296d34c7e1e.camel@sipsolutions.net>
In-Reply-To: <58e4bd69c15fd0e0cf3de32e8ed53296d34c7e1e.camel@sipsolutions.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 5 May 2021 06:05:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROdVMPQq4Qn_M=OWzJrfqNOc4fyMicNKdnCqu7G9rFgw@mail.gmail.com>
Message-ID: <CAK7LNAROdVMPQq4Qn_M=OWzJrfqNOc4fyMicNKdnCqu7G9rFgw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: unify cc-option and as-option
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 5, 2021 at 5:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Wed, 2021-05-05 at 05:46 +0900, Masahiro Yamada wrote:
> >
> >  - This commit touches scripts/Kconfig.include.
> >  - External module builds (M= builds) never invoke Kconfig
> >
> > Putting these two together, your claim is really odd.
>
> Hmm.
>
> > If external module builds invoke Kconfig,
> > your kernel is already broken.
>
> Well, it's not about the kernel, that's just the normal upstream (or
> perhaps distribution) kernel.
>
> Anyway, you're right, it's much simpler. The problem isn't invoking M=
> or something like that, that happens much later and sent me on the
> completely wrong track.
>
> The problem is simply doing
>
>         make kernelversion
>
> to determine the version of a tree that's not writable to the user, e.g.
>
>         make -C /lib/modules/$(uname -r)/build/ kernelversion
>
> Which basically also means that it's harmless, since the version is of
> course not affected by cc-option.

It was fixed.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=805b2e1d427aab4bb27fa7c51ebb9db7547551b1



If you want to make it work without that commit,

   make -C /lib/modules/$(uname -r)/build/ kernelversion M=/tmp

will work.

Pass a writable directory to M=.
M= build never touches the kernel source tree.



> johannes
>


-- 
Best Regards
Masahiro Yamada
