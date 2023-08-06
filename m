Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBCB771558
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 15:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjHFNlf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Aug 2023 09:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjHFNl1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2023 09:41:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716F11A3
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 06:41:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED2D16114A
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 13:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BEEC433C7
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691329274;
        bh=SWZ3TMPTJ1dSS/mbrgJKAAI63aiJ+I+kRZBzbf1Eit0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SwAWVjRzxZNPa4byJeW+gCZAeSosrOFmfGwAjc5QRGaT59sTHWycq69QMwB9paMho
         hE6JW4W3PgG0yWq56rhFZSZ3+yhYmM/5vSnHbQPPLOH4syUyOo5zCCZkTF7K/FdpGW
         GkmZ7sCyC701fZfEC0e/N6gxV8XnuYgeAZNjcAV3+hq64b+F0IZbk61vZG6vEUwlkO
         lFfz2aaHDdEKcyGkE7JD1KN6S8uILHwW1EbmyX7N4bvzUSpEJicUBL3eV9K3FsX1m0
         OPwg87219elVqk3tnjCKsBKthCMQQkQNj9ETB7m/H7AauhIAsxGdc9pz9zsMEHS1X9
         z6iBP60It5VQw==
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a3c78ede4bso2894058b6e.2
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Aug 2023 06:41:14 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywuse1LA4C2FxWl7H6SMh9ScrvoUkRpsLVY0/3KCdWq+690yLy4
        ixW4EmAmdFgLgeIA1wzIpA7g6YW6g7g7tmtzQBs=
X-Google-Smtp-Source: AGHT+IFrogf2QFrazIABFYuDEkEijg78E7jpEWFe4icEKV0febzEY9b3SGgI2PRDgqxp9U/fZrK0mLcSz8GY8g8Oi6k=
X-Received: by 2002:a05:6808:5a:b0:3a7:5d83:14d2 with SMTP id
 v26-20020a056808005a00b003a75d8314d2mr7273057oic.17.1691329273659; Sun, 06
 Aug 2023 06:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230805034256.2478162-1-Mr.Bossman075@gmail.com>
 <1df1527b-6929-eca1-9e6d-8a4d9a2f8b1e@infradead.org> <CAJFTR8Q2H+Z8pXTx1VNT94=me_rqTunU0sAxZCnKQuqW_3Mt6w@mail.gmail.com>
In-Reply-To: <CAJFTR8Q2H+Z8pXTx1VNT94=me_rqTunU0sAxZCnKQuqW_3Mt6w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Aug 2023 22:40:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATAPEjzU1CqMXFhduT=zp_GV2dMYeiaSpgF2zvZj2D4-g@mail.gmail.com>
Message-ID: <CAK7LNATAPEjzU1CqMXFhduT=zp_GV2dMYeiaSpgF2zvZj2D4-g@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: Alias mconfig to menuconfig, qconfig to xconfig
To:     Jesse T <mr.bossman075@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 5, 2023 at 1:38=E2=80=AFPM Jesse T <mr.bossman075@gmail.com> wr=
ote:
>
> On Fri, Aug 4, 2023 at 11:54=E2=80=AFPM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
> >
> > Hi,
> >
> > On 8/4/23 20:42, Jesse Taube wrote:
> > > All the other menu-based config tools have a one-letter prefix, and
> > > are named the same as their respective file,
> > > except for mconfig and qconfig. This commit adds an alias for mconfig
> > > to menuconfig and qconfig to xconfig.
> > >
> > > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > > ---
> > >  scripts/kconfig/Makefile | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > > index af1c96198f49..319cd623acb9 100644
> > > --- a/scripts/kconfig/Makefile
> > > +++ b/scripts/kconfig/Makefile
> >
> > > @@ -45,7 +47,7 @@ PHONY +=3D build_$(1)
> > >  build_$(1): $(obj)/$($(1)-prog)
> > >  endef
> > >
> > > -$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(cal=
l config_rule,$(c))))
> > > +$(foreach c, config menuconfig mconfig nconfig gconfig xconfig qconf=
ig, $(eval $(call config_rule,$(c))))
> > >
> > >  PHONY +=3D localmodconfig localyesconfig
> > >  localyesconfig localmodconfig: $(obj)/conf
> > > @@ -118,7 +120,9 @@ help:
> > >       @echo  '  config          - Update current config utilising a l=
ine-oriented program'
> > >       @echo  '  nconfig         - Update current config utilising a n=
curses menu based program'
> > >       @echo  '  menuconfig      - Update current config utilising a m=
enu based program'
> > > +     @echo  '  mconfig         - Alias to menuconfig'
> > >       @echo  '  xconfig         - Update current config utilising a Q=
t based front-end'
> > > +     @echo  '  qconfig         - Alias to xconfig'
>
> Crap how did I miss this.
> @Masahiro, can you add that when applying?


I am not applying this.

I do not understand why it is useful.




> I'll take a reviewed-by as a yes otherwise I will submit V2 tomorrow.
>
> >
> > Seems to be missing an ending ' mark above... if we need this.
> >
> > >       @echo  '  gconfig         - Update current config utilising a G=
TK+ based front-end'
> > >       @echo  '  oldconfig       - Update current config utilising a p=
rovided .config as base'
> > >       @echo  '  localmodconfig  - Update current config disabling mod=
ules not loaded'
> >
> > --
> > ~Randy



--
Best Regards
Masahiro Yamada
