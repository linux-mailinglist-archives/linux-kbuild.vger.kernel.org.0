Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7F67546E1
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jul 2023 07:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjGOFF3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Jul 2023 01:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjGOFF2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Jul 2023 01:05:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3E33A9D
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 22:05:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6287602E2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Jul 2023 05:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A284C433C7
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Jul 2023 05:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689397526;
        bh=blpreD30rA+t3XbmyEcGZCtr8pUN6nt3D+T40+SmrXg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J51VCw5VD2v0LM1TsmvV7PTZVuwE9+4SaIj42NbET/Fya8TXjpJTY+CI44WXKDV9v
         HoRrD8OblFvunl/edpNxpqRrjs+CMk74Q6f84vSSrQog7la0vw1hnMyaL/0MjfHVWh
         iINovZUxdouMKrvfBVIPwmNT1uB1DtnT9x7J25tLdxuSayuIJOc3pofj1d+ErYEaPB
         rC91Mg0FcGnNR0FzkfC1MXY/JbVKszEwcczd65agG64iGi3bnzFWb5YHM9vPnXsb/H
         HYcBO6icusarDjeCo040qzT2UGYSiKrcCE0X0gP7WGYbWAHM7LAaZlECi9fTomNiEd
         mzeK6in770ZGg==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-560b56b638eso1643391eaf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 22:05:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLa5vHJ+KsjfhsSQ9EchV5EwnOg5wvCK4jHkJuY42NX/QjVb8ilJ
        0TgtTGN9L50SgEen4qC1qROgrsKb9MzBiDw6EYI=
X-Google-Smtp-Source: APBJJlEkMD9QcRJyH75LuuvDvsxMvAEGuEgwcKx/2Fp2o5a0sZKm5vYi7poKNw3Oe1Ps3iTd/3KJrRwDtU42yFvtgOk=
X-Received: by 2002:a4a:304a:0:b0:564:e465:5d5c with SMTP id
 z10-20020a4a304a000000b00564e4655d5cmr703033ooz.2.1689397525343; Fri, 14 Jul
 2023 22:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
In-Reply-To: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 15 Jul 2023 14:04:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com>
Message-ID: <CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com>
Subject: Re: con3270.o is built twice, leading to errors
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 14, 2023 at 3:33=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> Hi,
>
> if I create an s390 defconfig:
> mkdir /tmp/s390/
> make O=3D/tmp/s390/ ARCH=3Ds390 CROSS_COMPILE=3Ds390x-suse-linux- defconf=
ig
>
> And then if I try for a couple times:
> make O=3D/tmp/s390/ -j17 ARCH=3Ds390 CROSS_COMPILE=3Ds390x-suse-linux-
> drivers/s390/char/con3270.o
>
> Most of the time, I get:
> make[1]: Entering directory '/tmp/s390'
>    GEN     Makefile
>    CALL    /home/latest/linux/scripts/checksyscalls.sh
>    CC      drivers/s390/char/con3270.o
>    CC      drivers/s390/char/con3270.o
>
> I.e. it is built twice.
>
> Sometimes, I also get an error:
> fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such file
> or directory
> make[4]: *** [/home/latest/linux/scripts/Makefile.build:243:
> drivers/s390/char/con3270.o] Error 2
> make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
> make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]
>
> Obviously due to some race.
>
> Any ideas what is going on?



The reason is because ARCH=3Ds390 descends into
drivers/s390/ in a non-standard way.

See arch/s390/Makefile line 122.



This is a corner case in single builds, and I
do not know how to make it work.



I really hope arch maintainers will follow the standard
obj-y syntax unless there is a strong reason to opt out.


The following patch will fix the issue.








diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 5ed242897b0d..a53a36ee0731 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -119,7 +119,6 @@ export KBUILD_CFLAGS_DECOMPRESSOR
 OBJCOPYFLAGS   :=3D -O binary

 libs-y         +=3D arch/s390/lib/
-drivers-y      +=3D drivers/s390/

 boot           :=3D arch/s390/boot
 syscalls       :=3D arch/s390/kernel/syscalls
diff --git a/drivers/Makefile b/drivers/Makefile
index 7241d80a7b29..a7459e77df37 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -195,3 +195,5 @@ obj-$(CONFIG_PECI)          +=3D peci/
 obj-$(CONFIG_HTE)              +=3D hte/
 obj-$(CONFIG_DRM_ACCEL)                +=3D accel/
 obj-$(CONFIG_CDX_BUS)          +=3D cdx/
+
+obj-$(CONFIG_S390)             +=3D s390/






--=20
Best Regards
Masahiro Yamada
