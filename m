Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD6356E7C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhDGOZi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 10:25:38 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17347 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbhDGOZi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 10:25:38 -0400
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 137EP7aH022263;
        Wed, 7 Apr 2021 23:25:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 137EP7aH022263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617805508;
        bh=kkn3m/BCSxf2wWzhn6Nistuursiw20cEhHeA63xRAuE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MlzMMEXQEYrfYLb50tmTehRfqFTJ/gDi99r8VznhkQcun5Xdbe9HpoKSawmondCKr
         BI9R75umLMQyBhHG835MOCRH7jOWZc8slDhI9kzspKkKtNjacBZ8xZgaOvUG7TusKM
         lpkxPn6wppMbKzHZbXjww2VeOjLfPEmPIFGI271wrfN3AKtAw6GfdFzvWZtr+JVjV+
         Z3QQZG7PQc7NJLCrn7nGTNcmR2Mh2mbVXC8vDIljdoMiru9QLdG37iYCTQlOHUPI+u
         gHSiX2DXXCD6Zcvseczplc/5Auj5EBSfKEYhRwcBkwrXwtLOj7xM+BOOXWKJ2UahKy
         YiOa30rNaGEDQ==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id y2so9427199plg.5;
        Wed, 07 Apr 2021 07:25:08 -0700 (PDT)
X-Gm-Message-State: AOAM532G7dEJa3kEVCkvMyVuTr7zzsvbV4PUKzxFGzjX+37gMBFziYCn
        XBry+UMEmdnmleYfDXE/sOdj3OQi/xkqGALyCjQ=
X-Google-Smtp-Source: ABdhPJz5uhq8IDSf3S/3h7p8BMiaz6Akfdns4mQYFnNyvxGlA0ujmo7PLCgt78eyUaRA8ndd8CZgmTXl1yaWdyMAUmY=
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr3532498pjb.87.1617805507406;
 Wed, 07 Apr 2021 07:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210402123959.5143-1-alobakin@pm.me> <CABCJKufH262ki4FCQJxSO-v+gQzPBsVntQWnNZY7h-cvt1KYTA@mail.gmail.com>
 <Gt4--xIFQdFQbd97OwKvRwelvfikSSv3Vkc_KKzAeGgp6c2fe8SPW6v_njp0xvwepPwC_UcWdyWeAjSdFEXpheJWlnmWNY-mVsaMEnJV56A=@pm.me>
In-Reply-To: <Gt4--xIFQdFQbd97OwKvRwelvfikSSv3Vkc_KKzAeGgp6c2fe8SPW6v_njp0xvwepPwC_UcWdyWeAjSdFEXpheJWlnmWNY-mVsaMEnJV56A=@pm.me>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 23:24:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBYxZ4s4Eg2TPMoLA+NDWXsNrnq2ch1ZQsBgcCXPk7Sw@mail.gmail.com>
Message-ID: <CAK7LNAQBYxZ4s4Eg2TPMoLA+NDWXsNrnq2ch1ZQsBgcCXPk7Sw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: merge module sections under CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 too
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        Jessica Yu <jeyu@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sean Christopherson <seanjc@google.com>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 6, 2021 at 11:42 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> On Friday, 2 April 2021, 18:09, Sami
> Tolvanen <samitolvanen@google.com> wrote:
>
> > On Fri, Apr 2, 2021 at 5:40 AM Alexander Lobakin alobakin@pm.me wrote:
> >
> > > When building with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION,
> > > -fdata-sections and -ffunction-sections are being enabled by the
> > > top-level Makefile, and module section merging is also needed.
> > > Expand the ifdef (and the comment block) to cover that case too.
> > > Fixes: 6a3193cdd5e5 ("kbuild: lto: Merge module sections if and only =
if CONFIG_LTO_CLANG is enabled")


Did you test this patch before submission?


See the top Makefile closely:

ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
KBUILD_CFLAGS_KERNEL +=3D -ffunction-sections -fdata-sections
LDFLAGS_vmlinux +=3D --gc-sections
endif


-ffunction-sections -fdata-sections are passed to only
built-in objects, but not to module objects in the
first place.

KBUILD_CFLAGS_KERNEL is only passed to built-in objects.


The situation you claimed never happens.







> > Wouldn't this trigger the ld.bfd bug described in the commit message
> > when LD_DEAD_CODE_DATA_ELIMINATION is enabled? LTO_CLANG always uses
> > LLD, so it won't have this issue.
>
> LD_DEAD_CODE_DATA_ELIMINATION is marked
> =E2=80=9CEXPERIMENTAL=E2=80=9C in the config prompt, and
> arches have to opt-in
> HAS_LD_DEAD_CODE_DATA_ELIMINATION to give
> an access to it (only a few does). This
> should be relatively safe.
>
> > Sami
>
> Thanks,
> Al



--=20
Best Regards
Masahiro Yamada
