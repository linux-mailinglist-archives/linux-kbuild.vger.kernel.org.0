Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156B15FF93C
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Oct 2022 10:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiJOI4s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Oct 2022 04:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJOI4r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Oct 2022 04:56:47 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C9454CB7
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Oct 2022 01:56:46 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so8434133fac.11
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Oct 2022 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7l24W/x8vr8QD9CY+EHAyucUiFiTwLOsda9ZNs//Sw=;
        b=UZFNdj5dJUEYV8KZwkfwRiPXjQOpj4S5AtLSU2f9ynLASKOqUDTN3k2t4pKLpb6ork
         1Q5gGB1mej/dZFTvdfrGKl0c74AgR7ULEDaD6lKBylOMbXc5ZWWXa3ErrROdbXIECd2S
         YJcEeGPMMOtWylk0RVCrrUD/CpHUYAdsiGtPaVErvwK67a6kPRevnKvymwk8hABnOJZC
         En875TevdLiAZ4jS92Nk4KmkBbMyvDnxu2hvH4SKJgeuQwuit5zOIGLCdMqfS2LrkLwo
         6dPXU24EBGysX1O4JOdqmP3fOigFNcP2C/n2VwsH+EXE19XGsUVHj6iq0JKT6QilpdoX
         lg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7l24W/x8vr8QD9CY+EHAyucUiFiTwLOsda9ZNs//Sw=;
        b=n0sTNlmIggR7o+kGhpHVj3vDa0Clj82rZO11h6b3mQhG52weJI0vj2GviWoI9pnSXX
         3CAo5ql/dP5oGFejRSIH4FZRTvJ0H9Lo+6HgKnfUWutOZVCzAcYKb6oWpsmZAtSqfmcA
         +3aNsmzZVloz4eszAI0WjuW23qMNKN+RYja6SDzEWWkxQNnivgvQG20FmsXYf8S08REp
         4aztcucC4pJVJuBgSrFg7U4wTTsJ+lKvEy61LHVeZ8k3VtUjX0KzV/18Gv7KBvBAntwe
         G3M/ippganfPSCg4ZifbRDV+x4VTmFrfhOewHbaykqnfg2nwXG59rdb/RGqUlD4hDTJE
         +hxQ==
X-Gm-Message-State: ACrzQf06/io9rKEPD4qDItrcEWbhXVfRlAEiJIqvYxLdpXlINb77fdZ6
        hQG9zP+K+D3OBtMzSdkUdNN3GTDG3B7uflBl3+tNYn/O6dadBQ==
X-Google-Smtp-Source: AMsMyM6idLllshOrHDqDN2r7DPUvZ7nYB/uIJI/7hF66XZexnvgQiqKkuSHBeb5FM9mzaJWe6HtcUWoGDvYZeXn6pPk=
X-Received: by 2002:a05:6870:1685:b0:132:d9b7:5fd6 with SMTP id
 j5-20020a056870168500b00132d9b75fd6mr931284oae.252.1665824205664; Sat, 15 Oct
 2022 01:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
 <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com> <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
In-Reply-To: <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 15 Oct 2022 10:56:09 +0200
Message-ID: <CA+icZUWRVNc=gUs0Ytjp0oG9-JBnA7wsyyz8gvdScrVE17rE=A@mail.gmail.com>
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     Gioele Barabucci <gioele@svario.it>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 14, 2022 at 12:10 PM Gioele Barabucci <gioele@svario.it> wrote:
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
>
> A workaround to get the old behavior is:
>
>      rm /etc/os-release
>      cp /usr/lib/os-release /etc/os-release
>      echo "VERSION_ID=unstable" >> /etc/os-release
>      echo "VERSION_CODENAME=sid" >> /etc/os-release
>

Thanks for your clarifications and information.

Adding your workaround (with which I agree and looks sane to me):

I still see some issues:

# lsb_release --all 2>/dev/null
Distributor ID: Debian
Description:    Debian GNU/Linux bookworm/sid
Release:        unstable
Codename:       sid

# lsb_release --codename --short 2>/dev/null
sid

I bet we need to change PRETTY_NAME as well and...

# cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
ID=debian
VERSION_ID=unstable
VERSION_CODENAME=sid
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

( For Debian/testing "testing" and "bookworm" sounds reasonable to me
(see Debian Bug #1021663). )
( Guess Debian/stable then should contain "stable" and "buster"? )

...who cares about?

# cat /etc/debian_version
bookworm/sid

I am a long user of Debian/unstable AMD64 and I was seeing on boot,
background of graphical login-manager and/or any info-tool like
KDE/kinfocenter etc.

Debian GNU/Linux $codename_of_current_testing/sid (current: bookworm/sid)

When you want to change all that "old behaviour" then do it for all
releases available on Debian, please.

-Sedat-
