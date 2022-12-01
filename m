Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0AA63FC25
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Dec 2022 00:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiLAXjU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Dec 2022 18:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiLAXjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2022 18:39:19 -0500
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524B3B955F
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Dec 2022 15:39:18 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 2B1Nd20d026396
        for <linux-kbuild@vger.kernel.org>; Fri, 2 Dec 2022 08:39:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2B1Nd20d026396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669937943;
        bh=LOpfgpZ0kv29k76LKNxB3waY+xeWjokqpJxJjm7XdY0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pN20PnRT/9c7VV/55JR/2i210b0A7KOzexFHbWirhIKOHVXlemaEWz1u8x3xq8EtS
         zYc0r4furetEsZZ71vNFxyTJ4vDCrrNIVs+OUzxJk7vZumu+VsoFOgqejFn/qswwLf
         ljrE6fq9ItTMlehzRU8uqAlppSXHhXj+XSZNWyUaj5NUEUHSP8N5xsot49wZ9c4E81
         fuVW6StgD3khRI6BS8epZ49pG1hyO9W7dxOd4S5ZJr6SXjGf0dKMbTAwt1jTkGoeKU
         mmKZeIpsgTXQ/pWaxV6F/QDnTc2Pm5igVnQZTnog7A8lmzjtqcENLe2LIKNOI05Uwg
         QnlS/jmquEgWw==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id n205so3758726oib.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Dec 2022 15:39:02 -0800 (PST)
X-Gm-Message-State: ANoB5pmgYURkUIWNL3foXeVQIqBS+IBfGrq5w5pvCKRco584IiGTKyKl
        bld4r4TA/U+2UmEdPVtcvHXz4kpc0Y3ysoNXVPY=
X-Google-Smtp-Source: AA0mqf5zMznLK5wbl6hrmVVPm/op1DK9bgtnq49b1qiaWKlRH5ZU2cuM9ovVLXJq9+FMoaCeY9/clz2Mf4WOqV6kIZk=
X-Received: by 2002:a05:6808:3009:b0:354:94a6:a721 with SMTP id
 ay9-20020a056808300900b0035494a6a721mr24473223oib.194.1669937941636; Thu, 01
 Dec 2022 15:39:01 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
 <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com> <CAG+Z0CsTtXctFE2LG0+B+zWQCJTnfJkkYweV3qzFBgxZsXKLxw@mail.gmail.com>
In-Reply-To: <CAG+Z0CsTtXctFE2LG0+B+zWQCJTnfJkkYweV3qzFBgxZsXKLxw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 2 Dec 2022 08:38:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUwXn-CVy7husUhcKF5buVo5eZdP9fvN+4yy5fwg_24A@mail.gmail.com>
Message-ID: <CAK7LNARUwXn-CVy7husUhcKF5buVo5eZdP9fvN+4yy5fwg_24A@mail.gmail.com>
Subject: Re: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Dmitry Goncharov <dgoncharov@users.sf.net>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 2, 2022 at 7:34 AM Dmitry Goncharov <dgoncharov@users.sf.net> wrote:
>
> On Wed, Nov 30, 2022 at 6:41 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I think the following code will work
> > for 3.82, 4.x, and future releases.
> >
> > diff --git a/Makefile b/Makefile
> > index 78525ebea876..58dfd7475448 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -94,7 +94,7 @@ endif
> >  # If the user is running make -s (silent mode), suppress echoing of
> >  # commands
> >
> > -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> > +ifneq ($(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS)))),)
> >    quiet=silent_
> >    KBUILD_VERBOSE = 0
> >  endif
>
>
> make-4.4 (and later) stores -I<path> in makeflags.
> $ cat makefile2
> $(info $(MAKEFLAGS))
> all:
> $ make-4.4 -rR   -Isrc --warn-undefined-variables   a=s -j2 -fmakefile2
> rR -Isrc -j2 --warn-undefined-variables
> make-4.4: warning: undefined variable 'GNUMAKEFLAGS'
> make-4.4: Nothing to be done for 'all'.
> $
>
> $(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS)))),)
> confuses 's' in -Isrc with -s.
>
> What about the following?
>
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..3a97494a9989 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,9 +94,15 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> -  quiet=silent_
> -  KBUILD_VERBOSE = 0
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
> +else
> +silence:=$(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS))))
> +endif



Yes.

You do not need to change the logic in 'else' part,
but this will work as well.






> +
> +ifeq ($(silence),s)
> +quiet=silent_
> +KBUILD_VERBOSE = 0
>  endif
>
>  export quiet Q KBUILD_VERBOSE
>
> Tested 3.82, 4.3, 4.4, latest master.
> regards, Dmitry



-- 
Best Regards
Masahiro Yamada
