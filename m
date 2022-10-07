Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D405F79C5
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 16:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJGOgU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 10:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiJGOgS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 10:36:18 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A331E72EDC
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 07:36:16 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 297Ea20m025817
        for <linux-kbuild@vger.kernel.org>; Fri, 7 Oct 2022 23:36:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 297Ea20m025817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665153363;
        bh=CDCun5TRVs5h8TGjahdouMxcsGU5T69DdqQ+1z+O7vI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BKOmmTeNVYOYas61IU86k4HDc/EPQfHINjz+BIc3Hs7sWZNUHw/dz3s48j7nKuk9L
         nshTlTp0pITK+YQDwrYfb/yZPZGfu8Qr4poqV8d3OGZzYyCcV3p3VsOilC0ZuelF4w
         //8ppsNFCAVRfnHoMrLTgcuSKEGgvbsRWvQrIYlKtYSMkRGq59mgCvAzv7+U3tqOfk
         WUDOeWwgTuZubOtJC3fMOD2zhgkSuKISJD0NN6NPKTm8BKEdhUeQULdseLHICCeok0
         OZ4kV8mcDq90aIymmsGfp9LoLiHbHsQaPwMarlR0tEOjMG+tkVNAVlkxJRkSOfWUK4
         j9TAhCj2rVttA==
X-Nifty-SrcIP: [209.85.167.182]
Received: by mail-oi1-f182.google.com with SMTP id n83so5678229oif.11
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Oct 2022 07:36:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf3uthJDz9hV666R/x9Ac2wvf4rDjhayJCjVVk764joPKQUORA+G
        sgbXEwhgU5MBkpnlwhuZi6kvQwLUjB6eUTDztCo=
X-Google-Smtp-Source: AMsMyM7ZyWosPTx0XaHGbJLw4PoFATCCm2cIMmCKbiRYhXCC/GgS3iOp0GS6QaUJwrfAuN3MC+BUZRPjQUlLgSQWpKw=
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id
 cj5-20020a0568081b8500b0034d8ce1d5b0mr7660537oib.194.1665153361395; Fri, 07
 Oct 2022 07:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com> <Y0AOD/EfGEiGevsD@sirena.org.uk>
In-Reply-To: <Y0AOD/EfGEiGevsD@sirena.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Oct 2022 23:35:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
Message-ID: <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
To:     Mark Brown <broonie@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 7, 2022 at 8:31 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 07, 2022 at 02:38:06PM +0900, Masahiro Yamada wrote:
>
> > The arm virt machine with gicv3 booted as far as I tested.
> >
> > So, I need to know more details about the settings of the KernelCI.
>
> The HTML versions of the boot logs include the qemu command, these days
> it's run using docker so so you can even get the specific version of
> qemu version that was being used by kernelci in case that's important:
>
> docker run --network=3Dhost --cap-add=3DNET_ADMIN --interactive --tty --r=
m --init --name=3Dlava-docker-qemu-7496529-2.1.1-gexyjab5hb --device=3D/dev=
/kvm --device=3D/dev/net/tun --mount=3Dtype=3Dbind,source=3D/var/lib/lava/d=
ispatcher/tmp,destination=3D/var/lib/lava/dispatcher/tmp kernelci/qemu qemu=
-system-arm -cpu cortex-a15 -machine virt-2.11,gic-version=3D3 -nographic -=
net nic,model=3Dvirtio,macaddr=3DDE:AD:BE:EF:45:5C -net bridge,br=3Dvirbr0 =
-m 1024 -monitor none -kernel /var/lib/lava/dispatcher/tmp/7496529/deployim=
ages-blwzkdvs/kernel/zImage -append "console=3DttyAMA0,115200 root=3D/dev/r=
am0 debug verbose console_msg_format=3Dsyslog earlycon" -initrd /var/lib/la=
va/dispatcher/tmp/7496529/deployimages-blwzkdvs/ramdisk/rootfs.cpio.gz -dri=
ve format=3Dqcow2,file=3D/var/lib/lava/dispatcher/tmp/7496529/apply-overlay=
-guest-f5mnvw0l/lava-guest.qcow2,media=3Ddisk,if=3Dvirtio,id=3Dlavatest
>
> Everything from qemu-system-arm on is the command that's run inside the
> container.
>
> The logs also show the download of the filesystems that would be used,
> though we don't get as far as actually using them so it's a bit moot:
>
> https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defco=
nfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html






I suspect "+debug" in "multi_v7_defconfig+debug"
because the failure log says "ftrace bug" multiple times.


Which config options does "+debug" enable?

Can you share the .config file?



--=20
Best Regards
Masahiro Yamada
