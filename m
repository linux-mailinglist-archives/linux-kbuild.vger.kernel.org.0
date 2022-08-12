Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1F4590A72
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Aug 2022 04:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236896AbiHLC6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Aug 2022 22:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236141AbiHLC6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Aug 2022 22:58:24 -0400
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F81A0313
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 19:58:23 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 27C2w865017686
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Aug 2022 11:58:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 27C2w865017686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1660273089;
        bh=OhvHk/49CaqkV46DHfTDVzjmQoyYxmHgb3eESjFHGcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ev8MRqqQs82T+YOFRYLK3XR/vAXgus13tzVhYkX2CJt4JJM2Wbz3GInm2sZElEDc7
         Belh9BN8TpRy5JIWKZWZzhB/Veg5WvZMxwvL5gU7nKWvAhEvbH2wgJ0rxdd4hZfR0j
         wuRfqgpMOwYqPXdHqaWMGi5r7Tt+2E15r2AyUgWLnXFk29az+kTVKRkjDCt/e7hqq/
         tytpin2m6dWoFO5t1LWdOwuC9T41nAtfnl2u2ZAAZ21ahuFPjHti0lGHKArKIxeKSg
         cV3KF4VPC7tIBqUVyc+B264omywgd0yLYmJtDMwGyjst7dUL55GbhZztLwZkmBuum8
         HIMeKy7S4Zbeg==
X-Nifty-SrcIP: [209.85.221.52]
Received: by mail-wr1-f52.google.com with SMTP id l4so23251620wrm.13
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 19:58:08 -0700 (PDT)
X-Gm-Message-State: ACgBeo3r0sYeer0NmDWpXT3H4ISKzXNKrjjr9+zmNXs7L3VHG0CColqd
        b2qfyrp4LL28qSAjY4HOR4ctfZi2w0tM/R9N+ik=
X-Google-Smtp-Source: AA6agR55z7NApGwgkRsaFgbMKrzWSCTDA00B4oArD3s54hDc0mnNgC8rnP3fueCCWIvAdL/Rfe0yyCg9OvEOyYjmRfc=
X-Received: by 2002:a05:6000:1f9a:b0:21e:d4a7:a4c0 with SMTP id
 bw26-20020a0560001f9a00b0021ed4a7a4c0mr791615wrb.409.1660273087490; Thu, 11
 Aug 2022 19:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <YvUQOwL6lD4/5/U6@shell.armlinux.org.uk> <YvUSmt/LinmjCY+w@FVFF77S0Q05N>
In-Reply-To: <YvUSmt/LinmjCY+w@FVFF77S0Q05N>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Aug 2022 11:57:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVwpG0LNh11jw0QmUyfURk_on8VsjNL4TfN8+5KmeVxg@mail.gmail.com>
Message-ID: <CAK7LNARVwpG0LNh11jw0QmUyfURk_on8VsjNL4TfN8+5KmeVxg@mail.gmail.com>
Subject: Re: Odd kbuild behaviour
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 11, 2022 at 11:31 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Aug 11, 2022 at 03:20:43PM +0100, Russell King (Oracle) wrote:
> > Hi,
> >
> > Please can someone try to explain what is going on when I ask for a .S
> > file to be built to an object with 5.19 and GNU make 4.3 from Debian
> > Bullseye (although I don't think this is a make version issue):
> >
> > $ rm ../build/multi/arch/arm/lib/findbit.o
> > $ make -j2 CROSS_COMPILE="arm-linux-gnueabihf-" ARCH="arm" O=../build/multi arch/arm/lib/findbit.o
> > make[1]: Entering directory '/home/rmk/git/build/multi'
> >   GEN     Makefile
> >   CALL    /home/rmk/git/linux-rmk/scripts/atomic/check-atomics.sh
> >   CALL    /home/rmk/git/linux-rmk/scripts/checksyscalls.sh
> > make[3]: *** No rule to make target 'arch/arm/lib/findbit.o'.  Stop.
> > make[2]: *** [/home/rmk/git/linux-rmk/scripts/Makefile.build:441: __build] Error 2
> > make[1]: *** [/home/rmk/git/linux-rmk/Makefile:1843: arch/arm] Error 2
> > make[1]: *** Waiting for unfinished jobs....
> >   AS      arch/arm/lib/findbit.o
> > make[1]: Leaving directory '/home/rmk/git/build/multi'
> > make: *** [Makefile:219: __sub-make] Error 2
>
> FWIW, I think this is to do with lib-y directories rather than wheether the
> object is C or assembly:
>
> [mark@lakrids:~/src/linux]% ls arch/arm64/lib
> clear_page.S  copy_from_user.S  copy_template.S  crc32.S  delay.c         insn.c           Makefile  memcmp.S  memset.S  strchr.S  strlen.S   strnlen.S  tishift.S             xor-neon.c
> clear_user.S  copy_page.S       copy_to_user.S   csum.c   error-inject.c  kasan_sw_tags.S  memchr.S  memcpy.S  mte.S     strcmp.S  strncmp.S  strrchr.S  uaccess_flushcache.c
> [mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib/insn.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
> make[2]: *** No rule to make target 'arch/arm64/lib/insn.o'.  Stop.
> make[1]: *** [scripts/Makefile.build:441: __build] Error 2
> make: *** [Makefile:1844: arch/arm64] Error 2
> [mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib/copy_page.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
> make[2]: *** No rule to make target 'arch/arm64/lib/copy_page.o'.  Stop.
> make[1]: *** [scripts/Makefile.build:441: __build] Error 2
> make: *** [Makefile:1844: arch/arm64] Error 2
> [mark@lakrids:~/src/linux]% usekorg 12.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- arch/arm64/lib
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   AS      arch/arm64/lib/clear_page.o
>   AS      arch/arm64/lib/clear_user.o
>   AS      arch/arm64/lib/copy_from_user.o
>   AS      arch/arm64/lib/copy_page.o
>   AS      arch/arm64/lib/copy_to_user.o
>   CC      arch/arm64/lib/csum.o
>   CC      arch/arm64/lib/delay.o
>   CC      arch/arm64/lib/insn.o
>   AS      arch/arm64/lib/memchr.o
>   AS      arch/arm64/lib/memcmp.o
>   AS      arch/arm64/lib/memcpy.o
>   AS      arch/arm64/lib/memset.o
>   AS      arch/arm64/lib/strchr.o
>   AS      arch/arm64/lib/strcmp.o
>   AS      arch/arm64/lib/strlen.o
>   AS      arch/arm64/lib/strncmp.o
>   AS      arch/arm64/lib/strnlen.o
>   AS      arch/arm64/lib/strrchr.o
>   AS      arch/arm64/lib/tishift.o
>   AR      arch/arm64/lib/lib.a
>   AS      arch/arm64/lib/crc32.o
>   AS      arch/arm64/lib/mte.o
>   AR      arch/arm64/lib/built-in.a
>
>
> ... clearly it figures how to build the directory as a whole, but can't figure
> out how to build indiviual objects within that.
>
> Thanks,
> Mark




Right, you cannot build individual files in arch/*/lib/.
This is a corner-case of the current implementation
of single target rules.

The GNU Make version, the file suffix (.S, .c, or whatever), etc. are
irrelevant.


Let me think if I can improve it somehow.





-- 
Best Regards
Masahiro Yamada
