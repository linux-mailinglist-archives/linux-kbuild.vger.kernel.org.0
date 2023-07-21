Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8E075C7F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jul 2023 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjGUNi1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jul 2023 09:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjGUNi0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jul 2023 09:38:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8371AE53
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 06:38:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16D8C619EB
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 13:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76727C433CA
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689946704;
        bh=Kq8EQ3qf8edF4iAuPjQ77Vjr0LAbeAqcjgLTsIpDnKs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Asr4tAha+Mb/LkfU9ullL48VfVs5Ouitjo6Il1G/WR0NDnDqemZKOFstAzRnneLHz
         55vKc31IKcMVVBwAU2ry7Q0ysf+OwZ+JcvfcSxlDLKVhPwD03wHOi6zT2hgc0BupA0
         Wazbv++Xi1xh1pub8xBAVmw560PvSVWxsa/bELyI02JaKXGCD/03Cb2QiUXPF9j+b9
         7/4LjT3s6mBz4eDpOlyzHlA6Z0Jl7AbGoAqgZdg6SLD6uCeXBfnSIlGnIsyToXIzTe
         9SwC1wQpTHRP8yuNxCCVcSqEbPnSBriagXxI0qyLXSYbMHmEJ3moSzQ4vCOY0YCrDh
         BbFqV7J2kgMoQ==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b9d562f776so1593860a34.2
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2023 06:38:24 -0700 (PDT)
X-Gm-Message-State: ABy/qLalSphLAlg9sknCsvE95SkMTx5m5aLSfrkbXqzssPFbHWg2tlkK
        rsDmTh/rZjr1quz+2Fbnbw9Mw9Vzlz+HnPDJW1k=
X-Google-Smtp-Source: APBJJlG4qXqe7m9HtrCZzB6GAAMPuPwBREOqd1xcVozsN32kXq8sIkvqsSXVfqm2+Ngy5+yhNQH2kOxlPpZ2KdMgei0=
X-Received: by 2002:a05:6870:65ac:b0:1b8:5d9e:638b with SMTP id
 fp44-20020a05687065ac00b001b85d9e638bmr2244161oab.43.1689946703751; Fri, 21
 Jul 2023 06:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org> <92f4dfe9-eb87-766b-271a-e57ada3a7dbd@kernel.org>
In-Reply-To: <92f4dfe9-eb87-766b-271a-e57ada3a7dbd@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Jul 2023 22:37:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1_vR+eaKzqg_0eWVhBzyvRsoLHZa=NJCc52z+1bVVAQ@mail.gmail.com>
Message-ID: <CAK7LNAQ1_vR+eaKzqg_0eWVhBzyvRsoLHZa=NJCc52z+1bVVAQ@mail.gmail.com>
Subject: Re: arch/um's ssl.o [was: con3270.o] is built twice, leading to errors
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 19, 2023 at 5:30=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 14. 07. 23, 8:33, Jiri Slaby wrote:
> > Hi,
> >
> > if I create an s390 defconfig:
> > mkdir /tmp/s390/
> > make O=3D/tmp/s390/ ARCH=3Ds390 CROSS_COMPILE=3Ds390x-suse-linux- defco=
nfig
> >
> > And then if I try for a couple times:
> > make O=3D/tmp/s390/ -j17 ARCH=3Ds390 CROSS_COMPILE=3Ds390x-suse-linux-
> > drivers/s390/char/con3270.o
> >
> > Most of the time, I get:
> > make[1]: Entering directory '/tmp/s390'
> >    GEN     Makefile
> >    CALL    /home/latest/linux/scripts/checksyscalls.sh
> >    CC      drivers/s390/char/con3270.o
> >    CC      drivers/s390/char/con3270.o
> >
> > I.e. it is built twice.
>
> Similarly, another tty driver, another arch (um):
>
> $ make O=3D../a/arch/um/ -j17 ARCH=3Dum arch/um/drivers/ssl.o V=3D2
>    GEN     Makefile - due to target is PHONY
>    CALL    scripts/checksyscalls.sh - due to target is PHONY
>    CC      arch/um/drivers/ssl.o - due to: arch/um/drivers/ssl.c
>    CC      arch/um/drivers/ssl.o - due to: arch/um/drivers/ssl.c
>
> This leads often to corrupted arch/um/arch/um/drivers/.ssl.o.cmd.
>
> But in this case, I see:
> obj-$(CONFIG_SSL) +=3D ssl.o
>
> So is this has this a different root cause?


It is a similar symptom.

See arch/um/Makefile line 26


core-y                  +=3D $(ARCH_DIR)/kernel/          \
                           $(ARCH_DIR)/drivers/         \
                           $(ARCH_DIR)/os-$(OS)/


I will send a patch.



>
> > Sometimes, I also get an error:
> > fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such fil=
e
> > or directory
> > make[4]: *** [/home/latest/linux/scripts/Makefile.build:243:
> > drivers/s390/char/con3270.o] Error 2
> > make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
> > make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]
> >
> > Obviously due to some race.
> >
> > Any ideas what is going on?
> >
> > thanks,
>
> --
> js
> suse labs
>


--=20
Best Regards
Masahiro Yamada
