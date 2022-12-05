Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140056420B3
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Dec 2022 01:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiLEAM4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Dec 2022 19:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiLEAMy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Dec 2022 19:12:54 -0500
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F08E0A4
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Dec 2022 16:12:51 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2B50CN3C018552
        for <linux-kbuild@vger.kernel.org>; Mon, 5 Dec 2022 09:12:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2B50CN3C018552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1670199144;
        bh=mj9bcDOTwt9KxIPpAej5VBWGjTfyKTzkzkRufg1HPbA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XULDCKWJR33LS+crt4mirtSDh6tn9CfKW1DU3qeUeBSVJniYCjekQJplgot2LDbBv
         BNoL+0D/K5MFI+Yr5hGPhr8itxfoCOTnciWoyGKPkhAmnBQg2/PIQNQ94g68nsUyyE
         8zxgMpWVNbhBS/J8cQSBJk4Y1aKJpwC4qHWCT0IQRn+7w7LQ6OFxwoQ5pxXNH6WDWm
         TOiu3OGvJg6439r0Zaicuuao+vgjjVMMT8cpSRq+q4Kx3XC+Pp8ZQr8yHgU2vaOgQz
         QghyjUHS11jaqIeUESD+90brka8qkf3CnkqCxt6LSbVkCSAwj/BzArwUMpgoZhBZpL
         4XHy175y75JAg==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id r11so5595430oie.13
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Dec 2022 16:12:24 -0800 (PST)
X-Gm-Message-State: ANoB5plEuggzwJPsFQd02NiD141wn7nRu8hq9xRZpz/gfV3UtXyMyvIt
        O/B6U5Kq097eWtivkxm6FZlO3EW8rnASW0rgT40=
X-Google-Smtp-Source: AA0mqf57Kx8chBAfLIABpf+J+c/mqP1DiJCexOzrSzXJ51OYnkyRz0RdaeeESkxFjgM90YwkirAbWdZFxskj+IL1QeY=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr30069643oic.287.1670199142936; Sun, 04
 Dec 2022 16:12:22 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
 <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
 <CAG+Z0CsTtXctFE2LG0+B+zWQCJTnfJkkYweV3qzFBgxZsXKLxw@mail.gmail.com>
 <CAK7LNARUwXn-CVy7husUhcKF5buVo5eZdP9fvN+4yy5fwg_24A@mail.gmail.com> <CAG+Z0CuM5gKa+n2ayOYF9oDqc1ZpuN64bw37SLqk0CTUi3_gGg@mail.gmail.com>
In-Reply-To: <CAG+Z0CuM5gKa+n2ayOYF9oDqc1ZpuN64bw37SLqk0CTUi3_gGg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 5 Dec 2022 09:11:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwVfFacfVN=OjhoS21G3cft9QDoXiH0Ks-uMJUG3LVNA@mail.gmail.com>
Message-ID: <CAK7LNAQwVfFacfVN=OjhoS21G3cft9QDoXiH0Ks-uMJUG3LVNA@mail.gmail.com>
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

On Sat, Dec 3, 2022 at 12:26 PM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> On Thu, Dec 1, 2022 at 6:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > You do not need to change the logic in 'else' part,
> > but this will work as well.
>
> Here is the version which keeps the 3.82 specific code intact.
> Tested with 3.82, 4.0, 4.3, 4.4, the latest master.


Thanks.
Could you please send v3 with a commit description?


>
> regards, Dmitry
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..fbd9ff4a61e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -93,10 +93,17 @@ endif
>
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
> +# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> -  quiet=silent_
> -  KBUILD_VERBOSE = 0
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
> +else
> +silence:=$(findstring s,$(filter-out --%,$(MAKEFLAGS)))
> +endif
> +
> +ifeq ($(silence),s)
> +quiet=silent_
> +KBUILD_VERBOSE = 0
>  endif
>
>  export quiet Q KBUILD_VERBOSE



-- 
Best Regards
Masahiro Yamada
