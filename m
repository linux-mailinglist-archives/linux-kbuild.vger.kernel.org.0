Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55105F9FC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Oct 2022 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiJJOEM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 10:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiJJOEE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 10:04:04 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6591E4DB76
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 07:04:03 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 29AE3eEv003503
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 23:03:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 29AE3eEv003503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665410621;
        bh=cXonEz/GvEpA51uhgIt6f5Su5d5K8kcSU1MAxpO0dug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vK1/PKi0VjxCgidal5xVetBNKYQAjQbAgNuAC3nLn76Xqt3WO1v/0UvvnEVZIMJbp
         unNOpf1rmkt5Q1Rihbc76IKfu0qALkblRoUxhy+JGz+tlbYxYfVJcyxToANj+0XXtt
         zE83/VY2VdlFBaiymRwMkOrCtcI/OGuG2JIxx7yuWVRcqteW2UEW1VSeFysVXH7VPe
         MfpRg66P6VIM57xOKx09Ce0yUbQ+JKpsv87nNXBGDJXtXJ2IloPrX49xtdjgD7BvL1
         opjo2bbZTHjcjhlH5tH/45PdP8wPGKjnrZy4xSU6mWcwk4vq64OVftvFf17cnZS/62
         9rk95yIXcjDpA==
X-Nifty-SrcIP: [209.85.160.54]
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-131ea99262dso12557798fac.9
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 07:03:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf2XKAbfYMetYLzu4ML9+X76TpQK+uh2rfx5NkmgjQNg8MK1ncSq
        O+JZ11y6dkGFqv7okaG7tT6hiBYKUCKkQfHn/Mk=
X-Google-Smtp-Source: AMsMyM6T2chL5QX51FLNbjFSjoIKoxvpZ6kSv8ArTsWVDep2VhB7dXZ7MkpOGqziGRWNTDlazL10ZwJgVeU5bimVOUc=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr9584340oab.287.1665410619660; Mon, 10
 Oct 2022 07:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
 <Y0AOD/EfGEiGevsD@sirena.org.uk> <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
 <Y0P1cBijSd2OfYVD@sirena.org.uk> <CAK7LNATK10aT20SbGdJGLFebSQb3EnnMQ2pmy=_=gG7dpLB6JA@mail.gmail.com>
 <Y0Qi7APbIpNn/Z08@sirena.org.uk>
In-Reply-To: <Y0Qi7APbIpNn/Z08@sirena.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 10 Oct 2022 23:03:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARC1ik9cm3CTfF3-CYp56hGViiUK1vVcAv1iYELkrt1hw@mail.gmail.com>
Message-ID: <CAK7LNARC1ik9cm3CTfF3-CYp56hGViiUK1vVcAv1iYELkrt1hw@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
To:     Mark Brown <broonie@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 10, 2022 at 10:49 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 10, 2022 at 10:31:51PM +0900, Masahiro Yamada wrote:
> > On Mon, Oct 10, 2022 at 7:35 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Fri, Oct 07, 2022 at 11:35:25PM +0900, Masahiro Yamada wrote:
>
> > > The baseline config and fragment are both in:
>
> > >    https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig%2Bdebug/gcc-10/config/
>
> > Thanks for sharing the .config file.
>
> > With it applied, I can reproduce the boot error.
>
> > And, I see the same boot error on v6.0-rc7, which my branch is based on.
>
> > So, arm is already broken in the mainline, and
> > my kbuild patches are irrelevant.
>
> > Also, please check the bisection logic of kernelci.
>
> I *suspect* there's some involvement from link ordering, object sizes
> and exact placements here and there's probably some toolchain variance
> (the KernelCI results are with Debian's GCC 10).


Different GCC versions result in different machine code output.
If the problem repeats appear/disappear with slightly different code
placement, it is already broken.

Just in case, I removed the output tree, and built v6.0-rc7 kernel
from the clean tree.  I swear to see the boot failure.
I want to agree my patch is not the cause of the issue.


-- 
Best Regards
Masahiro Yamada
