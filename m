Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5665647F27C
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Dec 2021 08:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhLYHL6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Dec 2021 02:11:58 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55056 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhLYHL6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Dec 2021 02:11:58 -0500
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1BP7BWVV001098
        for <linux-kbuild@vger.kernel.org>; Sat, 25 Dec 2021 16:11:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1BP7BWVV001098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1640416293;
        bh=gDGRYJrELfCdr1wCObW5FHn1ofl6SkPM0EVN1BVHC9Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rdypqm7GXk5lZczktCSbYGDL0IDgsTlAZmtZ/fH94Su81JFg6NEN6Dz9xRahf9fu+
         Cyt7LXGTpU6Aaj8mMEOjzwxyFsXqgUL2dkB6mIiyEN0UErwU/gSeyQ+VNU42epKklV
         GdexiOhwuf/e12wPuiALaBcoXgtN/21Wh2G0XsJTEGJTVylpajzX/X8LRY9tvVoYJm
         /6Z+CefaVkWAPKamPBk+zmKpWX//kmyKf9+wXnL0O+kAyRc8m0YstIcYZGhZOiKPRI
         roP0VU0dOS+2fU1sYJ2Cm2nt7HQ5ajBMpbYjqyhZSViTtlNLCM8I6DInTdGO2otuPf
         qnlWPbcUi78Eg==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so8106467pjf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Dec 2021 23:11:32 -0800 (PST)
X-Gm-Message-State: AOAM532OshLj2mU5ng8De66Gp0TE44P0uAcP6gQJKrbZUghwaCxvh2di
        UaAWtGN/OhfyY+j3vSAqgBcXsM2BLsy6dvy85mM=
X-Google-Smtp-Source: ABdhPJwYstefHCriB1x7TyYOABouFU3araAuEi3dAC4FwshlmSQCdDOFZRX0sTGmOBeQzZUIrBjObAvb1vlvfkgoUb0=
X-Received: by 2002:a17:902:b206:b0:149:3b5d:2b8b with SMTP id
 t6-20020a170902b20600b001493b5d2b8bmr9255549plr.162.1640416291927; Fri, 24
 Dec 2021 23:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20211222143628.618436-1-Jason@zx2c4.com> <d96ded7a-f584-db38-4170-c991b772a136@infradead.org>
 <CAHmME9oKMm_VZ10yArhstX4_=f6Vj6Po-uii_0t_wjtiG81dvg@mail.gmail.com>
In-Reply-To: <CAHmME9oKMm_VZ10yArhstX4_=f6Vj6Po-uii_0t_wjtiG81dvg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Dec 2021 16:10:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQViiExZQTKiRVE_2wiQVjeS+MLCvJO_xn3sJaqcuoPfA@mail.gmail.com>
Message-ID: <CAK7LNAQViiExZQTKiRVE_2wiQVjeS+MLCvJO_xn3sJaqcuoPfA@mail.gmail.com>
Subject: Re: [PATCH RFC kbuild] lib/crypto: blake2s: include as built-in
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 23, 2021 at 12:55 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Wed, Dec 22, 2021 at 4:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > If lib-y ignores (drops) an object file (usually because it is not used),
> > the usual way to force it to be included is to add it to obj-y instead
> > of lib-y (see many examples in lib/Makefile).
>
> This is not a problem with lib-y. This is a problem with libs-y. Note
> the 's'. The former is working as expected. The latter controls
> whether a directory's lib.a is picked up. For whatever reason, the
> build system isn't respecting a libs-y declaration added to
> lib/Makefile like it respects for one added to arch/*/Makefile.
>
> > However, this may cause problems with weak symbols. I don't recall it being
> > used in that scenario.
>
> The reason we're using lib-y is so that unused code is pruned in the
> case that the weak symbol isn't used. IOW, a usual use for lib-y. And
> it works just fine. As mentioned, the issue is just with libs-y not
> finding that lib.a file.

lib-y does not work like that.

See commit 7273ad2b08f8ac9563579d16a3cf528857b26f49

When CONFIG_MODULES=y (this is true for most of usecases),
there is not much difference between obj-y and lib-y.

So, weak functions will remain in vmlinux even if they are unused.



-- 
Best Regards
Masahiro Yamada
