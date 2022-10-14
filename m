Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292A65FF442
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Oct 2022 21:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiJNT7W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Oct 2022 15:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJNT7U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Oct 2022 15:59:20 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA401D1E3F
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Oct 2022 12:59:18 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 29EJx1Tj018312
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Oct 2022 04:59:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 29EJx1Tj018312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665777542;
        bh=VkUBTQlPbqcNjaSsou1UrX18k7wKnuetkSSrdarzjSI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XUQd3xXjVhoxbHg6ngEcEJK+s9yyMceluE6WQxC49lIRzXYhHYILLeO5TugvBBD/F
         QrAV4m4B4vrTVQCLNF6mQkXh6u2Hp+EsL4ITsnaS7sgZy0hFllKE7n2OPjQNOqpXqJ
         Me5bfJNSnJpeiZOZxXfHMRnBV1vYWdQPadS6gCPZERdI4BBSMbJ585rEz12OEGCkeQ
         3UVMRhhvG89gYT/Xzhogl6RB5JNwfwTCson5nEPWqaMFCG5t9ntdbO+qUhbUxOcEwX
         HsOa0PCU+Uii/FbsuwRHZpVsGbalcjoq6qlijC70mz4s2lB1ZZNPRwU13TT0/NH74r
         FO/eHL4EAOS5g==
X-Nifty-SrcIP: [209.85.210.46]
Received: by mail-ot1-f46.google.com with SMTP id e53-20020a9d01b8000000b006619152f3cdso2470957ote.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Oct 2022 12:59:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf0PBNLnfMaxMRkHv4DE/TMvgKcxAMbgKrpQyOBHhA5SgP/7NGaG
        OFcYK3ZWbxcnNbWSYVpMX40zRivHPTpyAyO1gPw=
X-Google-Smtp-Source: AMsMyM48HWoJ9aBRJtt7tBgCukn7fm3ovhPPGmY/zQ/Bz5qM0X8dcnEXfNFHU9hvyFLqChl1kGy2UOYoYVj9KjP8g9I=
X-Received: by 2002:a05:6830:6384:b0:661:bee5:73ce with SMTP id
 ch4-20020a056830638400b00661bee573cemr3223542otb.343.1665777540739; Fri, 14
 Oct 2022 12:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
 <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com> <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
In-Reply-To: <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 15 Oct 2022 04:58:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQko303BT0wj8axV=AsWdEJbmkZCXvVohn-XfU+W9KCVw@mail.gmail.com>
Message-ID: <CAK7LNAQko303BT0wj8axV=AsWdEJbmkZCXvVohn-XfU+W9KCVw@mail.gmail.com>
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     Gioele Barabucci <gioele@svario.it>
Cc:     sedat.dilek@gmail.com, Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 14, 2022 at 7:10 PM Gioele Barabucci <gioele@svario.it> wrote:
>
> Dear Masahiro, dear Sedat,
>
> [Debian bug #1008735 removed from CC]
>
> On 13/10/22 16:02, Masahiro Yamada wrote:
> > On Mon, Oct 3, 2022 at 6:56 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Can you give me more context of this email?
> >
> >> I am using Debian/unstable AMD64 and doing Linux-kernel upstream
> >> development and testing.
> >>
> >> People using bindeb-pkg (mkdebian) from Linux-kernel sources
> >> (scripts/packages) to build and test their selfmade Debian kernels get
> >> a now a "n/a" for distribution.
> >
> > Right, if I try the latest sid,
> > "lsb_release -cs" returns "n/a".
> > It returned "sid" before IIRC.
> >
> > What was changed in Debian?
> > Any change in the lsb_release program?
>
>
> A quick summary from the upstream developer (me) of the new
> `lsb_release` implementation being rolled out in Debian.
>
> Debian dropped the legacy `lsb_release` package. Now the `lsb_release`
> command is provided by `lsb-release-minimal`.
>
> `lsb-release-minimal` relies on `/etc/os-release` to provide LSB
> information in a format that is byte-for-byte compatible with the
> `lsb_release` specifications.
>
> The issue you experienced is due to Debian's `/etc/os-release` (provided
> by the `base-files` package) not contain all the necessary information.
> See <https://bugs.debian.org/1008735>.
>
> The situation is now changing. The maintainer of `base-files` has added
> VERSION_CODENAME ("bookworm" for both unstable and testing).
>
> However VERSION_ID (used for `lsb_release --release`) has not been added
> yet. This is being tracked at <https://bugs.debian.org/1021663>.
>
> Until #1021663 is fixed, `lsb_release -rc` will return the following
> info in both unstable and testing.
>
>      Release:   n/a
>      Codename:  bookworm



Thanks for the pointer.
It sounds reasonable.

Also, it was good to know that no action is needed
for the kernel tree.

Thanks.

>
> A workaround to get the old behavior is:
>
>      rm /etc/os-release
>      cp /usr/lib/os-release /etc/os-release
>      echo "VERSION_ID=unstable" >> /etc/os-release
>      echo "VERSION_CODENAME=sid" >> /etc/os-release
>
> Regards,
>
> --
> Gioele Barabucci



-- 
Best Regards
Masahiro Yamada
