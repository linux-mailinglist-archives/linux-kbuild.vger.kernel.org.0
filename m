Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 169EA562D75
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Jul 2022 10:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbiGAIIs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Jul 2022 04:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbiGAIIq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jul 2022 04:08:46 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FA76EEB8;
        Fri,  1 Jul 2022 01:08:45 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r82so2592871oig.2;
        Fri, 01 Jul 2022 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=V+qOhLMWaipbX4NclZqhWztNxiZLAR6zxs69J3D8vBU=;
        b=msPkMQKE7m2JMmz2U/m6fipmb/ZN8lfjspxw9d59NMKbHj2d6avVf2y9+PLlXZcNvi
         AeZoGGNIBr8GMfTNmCu18LZX7YS38s+Cgg7OW0t3mEolvRbrvSVrJgvFf7whwjjvr/P0
         hI3NflFR6dLuRxtK7ua6Id4vY8fdaWRMMePB4Nso3GhQCXEazF7B/V+3aAoJ211YdqG0
         R20wRiohqjc0QtwaekaSJ0a2Sx7xjI9HK16pWSQ+8R9kZtW1yNU9E7y1aFQbpdabw6an
         ChZgM1rW4TUAnQ7EEfdD1d53/3hmUg39/qN3xR/DelECkMkmI3OE51QXM9t6DDis5A71
         GvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=V+qOhLMWaipbX4NclZqhWztNxiZLAR6zxs69J3D8vBU=;
        b=LTnK5NGho+aGO2VXF2xiAqr9tVZXIuqBEdbNYKME7PsbFWO/nYFLpcLw4BZi25KKfR
         qjO2CO1yz8VgNvQqN9Ve0cf1Kqfe7kaaBwANWTHEJAzO7/BBk5fQuTNcohv2m3bWXn8f
         a2XG2q/Vuh6zDFQ2/vLVf18tdym3C2vWpSyHXvmBw/fpnJ0KO3EdPpwwE31lrIs8gnw8
         yrmmTyYK6Aby/MMmR925q9amzwF3Pb+TrdP05G9dYdHsUGnsikkmf+Ct84CetzH+bv/p
         FDuS8GsDCaYt8MPGgMoKL07IcomqUILErFKGSHHs2C/mTpSmvdHWIC/MtbgxsC8r1wvH
         7UMw==
X-Gm-Message-State: AJIora+AMcDvearMHd/Sw5LOXmbMs/OVZQz4u1gM+Q2uRYCdXXX0HBnx
        zgkijH20GBgBis8Oe/ABM4aFtN6NBO5JSlufEdm/+AoTPRudww==
X-Google-Smtp-Source: AGRyM1vDnC41lX66LaXItuRF6HCHHxL1uBKav1RurXkMnkwYZc7hKVRcMbHqrrxaqk9FRCY9/NVJBN3gbsKmsiIUNq0=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr8924634oib.128.1656662924371; Fri, 01
 Jul 2022 01:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX-=vjX1WgJLDGZYZhrpxy+KqynMMFmNPp8pWu0q2sDcg@mail.gmail.com>
 <CA+icZUWFUC5eiKS96vpoPQbX+jx5OYBfD40Ns86sUxE0hcft1w@mail.gmail.com> <178bee80-3ccc-812a-2e2e-46540bbdcc51@kernel.org>
In-Reply-To: <178bee80-3ccc-812a-2e2e-46540bbdcc51@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 1 Jul 2022 10:08:08 +0200
Message-ID: <CA+icZUXz+rV-QUXZCrctRwXhz15jw+vStvgK5L+vh+zMu_V7uA@mail.gmail.com>
Subject: Re: [Linux v5.19-rc2] rtla: Errors when running `make tools/clean`
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 30, 2022 at 11:57 AM Daniel Bristot de Oliveira
<bristot@kernel.org> wrote:
>
> Hi Sedat,
>
> On 6/27/22 08:23, Sedat Dilek wrote:
> > On Wed, Jun 15, 2022 at 12:23 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >> [ CC linux-kbuild folks ]
> >>
> >> Hi,
> >>
> >> while digging into a perf issue I see this:
> >>
> >> $ cd /path/to/linux.git
> >>
> >> $ LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
> >> ...
>
> Do you mind trying this?
>
> diff --git a/tools/tracing/rtla/Makefile b/tools/tracing/rtla/Makefile
> index 3822f4ea5f49..1bea2d16d4c1 100644
> --- a/tools/tracing/rtla/Makefile
> +++ b/tools/tracing/rtla/Makefile
> @@ -1,6 +1,6 @@
>  NAME   :=      rtla
>  # Follow the kernel version
> -VERSION :=     $(shell cat VERSION 2> /dev/null || make -sC ../../.. kernelversion)
> +VERSION :=     $(shell cat VERSION 2> /dev/null || make -sC ../../.. kernelversion | grep -v make)
>
>  # From libtracefs:
>  # Makefiles suck: This macro sets a default value of $(2) for the

Thanks for the diff Daniel.

Indeed, it fixes the build-error for me.

$ cd /path/to/linux.git

$ git status -s
M tools/tracing/rtla/Makefile

$ LANG=C LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
[ ... ]
 DESCEND rtla
make[2]: Entering directory '/home/dileks/src/linux/git/tools/tracing/rtla'
make -C /home/dileks/src/linux/git/tools/tracing/rtla/../../../Documentation/tools/rtla/
clean
make[3]: Entering directory
'/home/dileks/src/linux/git/Documentation/tools/rtla'
rm -f rtla-osnoise-hist.1 rtla-osnoise-top.1 rtla-osnoise.1
rtla-timerlat-hist.1 rtla-timerlat-top.1 rtla-timerlat.1 rtla.1
make[3]: Leaving directory '/home/dileks/src/linux/git/Documentation/tools/rtla'
make[2]: Leaving directory '/home/dileks/src/linux/git/tools/tracing/rtla'
make[1]: Leaving directory '/home/dileks/src/linux/git/tools/tracing'

Please feel free to add my...

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

...when you have prepared a real fix.

-sed@-
