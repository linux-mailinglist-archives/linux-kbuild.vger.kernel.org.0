Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDC55FDBFA
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Oct 2022 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiJMOFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Oct 2022 10:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiJMOFU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Oct 2022 10:05:20 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377603F1E1
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Oct 2022 07:05:05 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 29DE3ObB020274
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Oct 2022 23:03:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 29DE3ObB020274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665669805;
        bh=oLq/97lp0beFieI9AdlWkZAhQYA90bFw+zH427wHvQw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VpNheZogKbRNLlVa31k2gSdlp/mNMJr0VZvufkp8PFI9v5/QZ+xGQKLbivUu19ZSN
         s6tnB7xz9LI2X1x2scQkjfwuIuukz+is2+mNLz01TQ8VMBOgIs0vQVRCaiC5AMisIv
         p1wWnnXxe2Mz4yOULOn2VRPNDO+G2UAFR2v0ico96Lo/Zs17k2bIY3A+fKfXJQF9HY
         FEdo6QiTPODOaUSwdK/5kTgWzUboFIu/mLkQe/oH1Nt7WtXnkzLl4f2H9hTVuAQ91v
         4ZxpW6R2eW/qs7CLlJyxkkSEIBQrVNEDmKIPx7mxl0nRPWEoAVc52jP8zdUKCDYs3e
         HlZfMj/5GCVug==
X-Nifty-SrcIP: [209.85.160.51]
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1326637be6eso2348976fac.13
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Oct 2022 07:03:25 -0700 (PDT)
X-Gm-Message-State: ACrzQf2z/kWJwwX+i+teW2vx8voBsFyNvzaFol8uUEkEsaldWr8tbTIn
        Sj/XeDk1mkmiieS3KMUT8yjZPM7M93ao1dqG0I8=
X-Google-Smtp-Source: AMsMyM6p+emgxpoWDSNU0eTENVZmwK6fsPj+YarTHZtiqQuChjukBv9MyGhs0X/2xokiuYsh6UgTboYlRC13X3Youhw=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr5344902oab.287.1665669804269; Thu, 13
 Oct 2022 07:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
In-Reply-To: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 13 Oct 2022 23:02:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
Message-ID: <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     sedat.dilek@gmail.com
Cc:     1008735@bugs.debian.org, Gioele Barabucci <gioele@svario.it>,
        Nick Desaulniers <ndesaulniers@google.com>,
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

Hi Sedat,

Sorry for my late replay.


On Mon, Oct 3, 2022 at 6:56 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ CC linux-kbuild folks (see [0] ]



Can you give me more context of this email?




> Hi,
>
> I am using Debian/unstable AMD64 and doing Linux-kernel upstream
> development and testing.
>
> People using bindeb-pkg (mkdebian) from Linux-kernel sources
> (scripts/packages) to build and test their selfmade Debian kernels get
> a now a "n/a" for distribution.



Right, if I try the latest sid,
"lsb_release -cs" returns "n/a".
It returned "sid" before IIRC.


What was changed in Debian?
Any change in the lsb_release program?







>
> Background (see [1]):
>
> [ scripts/package/mkdebian ]
>
> # Try to determine distribution
> if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>         distribution=$KDEB_CHANGELOG_DIST
> # In some cases lsb_release returns the codename as n/a, which breaks
> dpkg-parsechangelog
> elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n
> "$distribution" ] && [ "$distribution" != "n/a" ]; then
>         : # nothing to do in this case
> else
>         distribution="unstable"
>         echo >&2 "Using default distribution of 'unstable' in the changelog"
>         echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
> fi
>
> Personally, I set hardcoded in my kernel build-script as a workaround:
>
> distribution="bookworm"
>
> Gioele suggested me to enrich /etc/os-release with:
>
> VERSION_ID=unstable <--- XXX: I prefer sid because of PRETTY_NAME and
> it's shorter
> VERSION_CODENAME=bookworm
>
> In the end the file looks like:
>
> PRETTY_NAME="Debian GNU/Linux bookworm/sid"
> NAME="Debian GNU/Linux"
> ID=debian
> VERSION_ID=sid
> VERSION_CODENAME=bookworm
> HOME_URL="https://www.debian.org/"
> SUPPORT_URL="https://www.debian.org/support"
> BUG_REPORT_URL="https://bugs.debian.org/"
>
> ...and this seems to work:
>
> # lsb_release -cs
> No LSB modules are available.
> bookworm
>
> Please, provide a solution not to break workflows that were successful
> for years.
>
> Thanks.
>
> Best regards,
> -Sedat-
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n11005
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/mkdebian#n123



-- 
Best Regards
Masahiro Yamada
