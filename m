Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BB15F763F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 11:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJGJ3M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 05:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJGJ3L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 05:29:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58625120BCD
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 02:29:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1028B822A5
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 09:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6D4C43140
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665134947;
        bh=yxbVCMWLFJy47kHwmOYiNZk4lnYPr+zwr2slBli/+68=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IzPdfQI/genKJ+poJsjdM8mskgKQB5+QIckuG6dup2vPFbKjZKEa3Tww9avDz5Fka
         utxEWVlEL7sc8s4fj4N4gppAmEpj0NoHJS+QSGCqW+LyqIs/fE0TOTt7VD817rQ8LI
         g8RfA/cqjPNuTEBu0wi5i6DL7HwWIiURN7NLkKFb8Bn8L0S8xkWhakw0G8x/geps2D
         cDgTaZP2W+2q2BBdOZY7O7T0XKm9ZptrC4pK94f3QYEQqvIpDao2Fin9lwp9phadV+
         CwPzPg+Tbj73lfkuS3PYsJ1jUu190HqYDdJW0IjzcdUQjjwyCsbA7f1nlfbgL9RNbe
         P2rnvQ8D35cVg==
Received: by mail-lf1-f42.google.com with SMTP id b1so1473678lfs.7
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Oct 2022 02:29:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf1yiIQu+v72MMWl+X/NY0On3nV06kN3b4Lt06mjL+SGvbQS8R/m
        M+YbPOD/sZRz3gJ348zNeItSDMXJ5WE/2SD3Qzg=
X-Google-Smtp-Source: AMsMyM639U9dFcr0nMyz9VBR5TRaZHqUIAQtyUFHIYT88cQ4a+7Y3KO5HlUYAb+Bd820+eKyvFXy9y0yYUmvj3M3fDw=
X-Received: by 2002:a05:6512:104a:b0:4a2:9c7b:c9c with SMTP id
 c10-20020a056512104a00b004a29c7b0c9cmr771471lfb.122.1665134945513; Fri, 07
 Oct 2022 02:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com> <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 7 Oct 2022 11:28:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE7pE+1w06i3XX6XhA2KXsYU2JPetoFSZw60RS85wpmdQ@mail.gmail.com>
Message-ID: <CAMj1kXE7pE+1w06i3XX6XhA2KXsYU2JPetoFSZw60RS85wpmdQ@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, kernelci-results@groups.io,
        bot@kernelci.org, Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 7 Oct 2022 at 07:40, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Oct 7, 2022 at 2:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, Oct 7, 2022 at 1:53 AM Mark Brown <broonie@kernel.org> wrote:
> > >
> > > On Thu, Oct 06, 2022 at 09:36:22AM -0700, KernelCI bot wrote:
> > >
> > > The KernelCI bisection bot found a boot regression on qemu in today's
> > > -next for a multi_v7_defconfig with additional debug options running on
> > > virt-gicv3 which it identified as being triggered by 5750121ae738
> > > ("kbuild: list sub-directories in ./Kbuild") which does seem surprising
> > > but the bot did test a revert so it seemed worth reporting
> >
> >
> >
> > Please tell me the command line arguments to qemu-system-arm.
> > Especially, how to turn on gicv3.
>
>
> I found it in the qemu manual:
> https://www.qemu.org/docs/master/system/arm/virt.html?highlight=gic%20version
>
>
>
>
> The arm virt machine with gicv3 booted as far as I tested.
>
> So, I need to know more details about the settings of the KernelCI.
>
>
>
>
> This is my qemu command line.
>
>
> qemu-system-arm -machine virt,gic-version=3 \
> -kernel /home/masahiro/tools/qemu-arm_virt/kernel \
> -initrd /home/masahiro/tools/qemu-arm_virt/initrd \
> -drive file=fat:rw:/home/masahiro/tools/qemu-arm_virt/disk-shared,if=none,format=raw,id=drive0
> \
> -netdev bridge,id=netdev0,br=virbr0,helper=/usr/lib/qemu/qemu-bridge-helper \
> -serial stdio -monitor vc:800x600 -cpu cortex-a15 \
> -smp 4 -device virtio-blk-pci,drive=drive0 \
> -device virtio-net-pci,netdev=netdev0 -append console=ttyAMA0
>
>

You need to pass a firmware image as well.

-bios QEMU_EFI.fd

https://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/4666/QEMU-ARM/RELEASE_GCC5/QEMU_EFI.fd

(the firmware execution can be quite slow under emulation so give it some time)
