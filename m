Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4223FF86E
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 02:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345789AbhICApL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 20:45:11 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38215 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344741AbhICApL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 20:45:11 -0400
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1830htGS023940;
        Fri, 3 Sep 2021 09:43:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1830htGS023940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630629835;
        bh=IPdE81XIeV5i00q1eMsUBaZKdBd5hLxdnRKkzqN7Mz0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SQGAuf9oAjDokTu78s3sDDrZzy6D30KMNslYh6Zd6Jmk+BY+NZkQhe/DM2skgcH6n
         T+aQxYPxiFEEYwDNl07XJeSybiYAzKQ2UAOHRq9ErQpI3inK6CB1bmsxINGBxZV1lK
         bvqd++hKyXiuii3lXOGzMGZNtUZ+gPM7X34pouVc1r58hQFkwi3UopsyF+WVA/0Xpc
         CqnRLylPRJi2YBUhA8cWnG0bC0Gik7UTbIxoBZpY7+UTYZhaXHJ2hXCIfWIGupKzIP
         3Y+tgE1/1wei+Dbhqr/sjaIDcOnPEhUK2wH20vwqYqy0wDSsRCxQBm3HN3f37ro1zC
         b7ZZqUDH7lcEw==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id n18so3819007pgm.12;
        Thu, 02 Sep 2021 17:43:55 -0700 (PDT)
X-Gm-Message-State: AOAM530QGX3/Mr6Vx8S93el/McfsYBPUAg20xK2VMt74h+LYfui8ipmS
        vUG20talNmhbOQrWTLawbhj+74IsGswceKNc4Q0=
X-Google-Smtp-Source: ABdhPJyf/tqbA+a3DPFaPcLPFUFDaKH/E5H4kJW6o4StoMnP/9Oevn8LljjrNvsidqlOE2cdspyZG6jv32UObdTH5/g=
X-Received: by 2002:a63:a58:: with SMTP id z24mr1050153pgk.175.1630629834920;
 Thu, 02 Sep 2021 17:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-6-masahiroy@kernel.org> <202108311032.F503B07@keescook>
In-Reply-To: <202108311032.F503B07@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Sep 2021 09:43:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvYHNqtadDJNm08-PcWAfYoJATMYFWRxhhYOmUv6sm3A@mail.gmail.com>
Message-ID: <CAK7LNASvYHNqtadDJNm08-PcWAfYoJATMYFWRxhhYOmUv6sm3A@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] kbuild: detect objtool update without using .SECONDEXPANSION
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 1, 2021 at 2:32 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Aug 31, 2021 at 04:39:56PM +0900, Masahiro Yamada wrote:
> > Redo commit 8852c5524029 ("kbuild: Fix objtool dependency for
> > 'OBJECT_FILES_NON_STANDARD_<obj> := n'") to add the objtool
> > dependency in a cleaner way.
> >
> > Using .SECONDEXPANSION ends up with unreadable code due to escaped
> > dollars. Also, it is not efficient because the second half of
> > Makefile.build is parsed twice every time.
> >
> > Append the objtool dependency to the *.cmd files at the build time.
> >
> > This is what fixdep and gen_ksymdeps.sh already do. So, following the
> > same pattern seems a natural solution.
> >
> > This allows us to drop $$(objtool_deps) entirely.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Okay, so IIUC, this means objtool (and args) now ends up in the .cmd
> file instead of in the Makefile dep rules? That seems reasonable.


Yes.

For example, after 'make defconfig all',
you can see it at the bottom line of *.cmd files.


$ tail -n 5  kernel/.smp.o.cmd
kernel/smp.o: $(deps_kernel/smp.o)

$(deps_kernel/smp.o):

kernel/smp.o: $(wildcard ./tools/objtool/objtool)





> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook



-- 
Best Regards
Masahiro Yamada
