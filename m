Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6EA6E859E
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Apr 2023 01:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjDSXCh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Apr 2023 19:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjDSXCg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Apr 2023 19:02:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC72A270
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Apr 2023 16:02:05 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso210302a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Apr 2023 16:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681945317; x=1684537317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5FZbEuLPEba8rPcluAsC6ixzhvfsFfoHO9sfW3zN38=;
        b=uB33jRMOsh8Ag9+IcRCZ0dL69lg9NphJA+0ZiNUtp2TXceT9w54VIrahIW+5XA+sgv
         cLtSa1GE68NCl2nBzHAE1T2bO0DNRyg/CFDwkwR1Klb5h3YYVgu4XWGmZaLvoJyQFW+P
         Evqesc0TTUu8L0cD0MO1jbrG3h729UiKPor5klzZD8fKhMSuWoheOgLa7CKtTi7n3oYP
         c4H+84dToBUEdtLKLkvCCDSy1UT+BtfBg9AeM7hAmoFoYxjVNz9CFb4fylh83YZ39RQz
         Zs1lWDZ9PNLRh1p/ne5Q+BH7flgtKX+HYe+ieSIX2eSdYZmIGH5ne9gqpt5xdSzIwnPS
         FPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681945317; x=1684537317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5FZbEuLPEba8rPcluAsC6ixzhvfsFfoHO9sfW3zN38=;
        b=OT0Tw0jG5YZqpz63eLqE8Sq0ySSqO3fNKRGLOx9x8p0c1BNjVjxoZ6O5X0rUArHI52
         tWsWQ4KLiIXTjanpef6saEgdpzoLzizlk5H2emE0BBomOTqx5/xWo3KQeq9k8ue4yK2t
         FuyeQVZABzA8pxgnBwNZNSh/keXgSlK6/i85MEbRNnc6E0inxp9G6vsxbSWkZpPctxAu
         eCilpMGUcWI0eoftN4IyPswO4mPwvbD0OG1LKCK9mQ6jpzB5WDCq4rQ5tlRREzEaZaun
         eqK4S4gFnnZC8Dqck5m9JGC6Ct3kYW9e3Mo5M3he2VFY4NT7UgzQo3bRIvgTGs5NZg+S
         hC7Q==
X-Gm-Message-State: AAQBX9ee3+u17kMWwp+ArUOoQd76p352fF0siH4GA5FoHXEAkFledzAq
        5j8IHocs0CiGnVqAh8xGfN8hFmwngBOJ2C8RrHvlmw==
X-Google-Smtp-Source: AKy350Z07sfMiUFpEccZ3g5+kPuYI4IuMUqzBNmCLDqLSpQ+Oz8wKiBFnopdr2eveirWFgBMhzi0xVHY4pu5kn0GVTU=
X-Received: by 2002:a17:90b:3b46:b0:237:97a3:1479 with SMTP id
 ot6-20020a17090b3b4600b0023797a31479mr4401121pjb.28.1681945317258; Wed, 19
 Apr 2023 16:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-3-jiaxun.yang@flygoat.com> <20230418130823.GA12456@alpha.franken.de>
In-Reply-To: <20230418130823.GA12456@alpha.franken.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 19 Apr 2023 16:01:45 -0700
Message-ID: <CAKwvOd=ye9jA0-3QRpD76waZCSX=ayFeE2ZNAPPM-fLdyCq1FQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for
 microMIPS smartMIPS
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        llvm@lists.linux.dev, nathan@kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 18, 2023 at 6:13=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Apr 14, 2023 at 09:06:56AM +0100, Jiaxun Yang wrote:
> > microMIPS smartMIPS kernel can only be compiled if they are supported
> > by toolchain.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Question: won't the lack of this (patch and rest of the series) hurt
our ability to test randconfig builds of ARCH=3Dmips with clang? See
also the 0day report from Boris:
https://lore.kernel.org/llvm/202304170748.Fg9VIgGd-lkp@intel.com/

i.e. randconfig will continue to select options that can't be built yet.

> > ---
> >  arch/mips/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 41ac4dc5aae4..0b270562c3eb 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
> >         Select this if you want neither microMIPS nor SmartMIPS support
> >
> >  config CPU_HAS_SMARTMIPS
> > -     depends on SYS_SUPPORTS_SMARTMIPS
> > +     depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
> >       bool "SmartMIPS"
> >       help
> >         SmartMIPS is a extension of the MIPS32 architecture aimed at
> > @@ -2373,6 +2373,7 @@ config CPU_HAS_SMARTMIPS
> >
> >  config CPU_MICROMIPS
> >       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
> > +     depends on CC_HAS_MICROMIPS
> >       bool "microMIPS"
> >       help
> >         When this option is enabled the kernel will be built using the
>
> hmm, with this change the options will silently be dropped. I prefer
> the error message, that the compiler doesn't support what is configured.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20
Thanks,
~Nick Desaulniers
