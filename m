Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0D05A34DC
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Aug 2022 07:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbiH0Flf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Aug 2022 01:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiH0Fle (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Aug 2022 01:41:34 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05716895EB
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 22:41:32 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 27R5fG8h009204
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Aug 2022 14:41:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 27R5fG8h009204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1661578877;
        bh=bK1fLrJZBt0smVDX9LgmHTXt4dfcHbe7gU5826LoDjA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jR5Uw3uA4+LTJoKhKQuD54MWxm1PpqmIbOsucf1QHZW5tk91ZFrMMIHq/857lpr5Q
         LRDAeWRa7pFXX+6gw2//9Twa2G13CKKnUbdjADASwnqy6clJNiCeye56uPCpmXxsGO
         U9PBcFhfW7JgejJoSOdG1xgI4dQaK8VamPU8qU3e8uTYMJ1A5LYE/eJ3xQ7GGOp9ka
         wW9/R9VGnpTxFRLvl6EmlniCpNdJKAPBWOco8MqSN05yI8w93GpaVjDjypjYCA+iAP
         GdoG2AOZCW5H2Uc0s9+JVQlOBmB0zOqPO8UhT/r+hw6TAWxpcxtO4IjUUw+r4noTHh
         N3jKcDe8xdc+A==
X-Nifty-SrcIP: [209.85.160.52]
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so4610046fac.12
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 22:41:16 -0700 (PDT)
X-Gm-Message-State: ACgBeo0UOhJxjEp8k4kT+LuhzNpExb2XaQ9A/VG+RQgdkZgw9inE6hCB
        plqg5alFzVWrew29w35vrQm5OMxIITeSYLoxywg=
X-Google-Smtp-Source: AA6agR6XmHcdOAwc2n7Zb+o83qS/vBSABSkXz1TIg16/yEyeajw/ioAPOk4IcOOVEvFyq0XEySwHgYR9nl4VJ5+YFcw=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr3322479oab.287.1661578875749; Fri, 26
 Aug 2022 22:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
 <CAK7LNATbLrc=s7=SOs7QUwcxchmEy4G8OXp3Mn_03a4_-xAf6A@mail.gmail.com> <YvmSXFqv3fhAYNnk@niobium.localdomain>
In-Reply-To: <YvmSXFqv3fhAYNnk@niobium.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Aug 2022 14:40:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2Z4nGCCaiok8MSHxAPDb=pQKd5yxi9UKwguNqt=DgYQ@mail.gmail.com>
Message-ID: <CAK7LNAT2Z4nGCCaiok8MSHxAPDb=pQKd5yxi9UKwguNqt=DgYQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rewrite check-local-export in sh/awk
To:     Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 15, 2022 at 9:25 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> On 22/08/14 09:23AM, Masahiro Yamada wrote:
> > On Fri, Aug 12, 2022 at 11:36 PM Owen Rafferty <owen@owenrafferty.com> wrote:
> > >
> > > Remove the bash build dependency for those who otherwise do not
> > > have it installed. This also provides a significant speedup:
> > >
> > > $ make defconfig
> > > $ make yes2modconfig
> > >
> > > ...
> > >
> > > $ find  .  -name "*.o" | grep -v vmlinux | wc
> > >      3169      3169     89615
> > > $ export NM=nm
> > > $ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
> > > ./scripts/check-local-export'
> > >
> > > Without patch:
> > >     0m15.90s real     0m12.17s user     0m05.28s system
> > >
> > > With patch:
> > > dash + nawk
> > >     0m02.16s real     0m02.92s user     0m00.34s system
> > >
> > > dash + busybox awk
> > >     0m02.36s real     0m03.36s user     0m00.34s system
> > >
> > > dash + gawk
> > >     0m02.07s real     0m03.26s user     0m00.32s system
> > >
> > > bash + gawk
> > >     0m03.55s real     0m05.00s user     0m00.54s system
> > >
> > > Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> >
> >
> >
> >
> > How did you get those small numbers?
> >
> >
> > The script invokes ${NM} internally,
> > so it is impossible to become faster than nm.
> >
> > For me, it takes 55 sec just for running nm.
> >
> >
> >
> >
> > $ find . -name "*.o"  | wc
> >    3191    3191   90085
> >
> > $ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm >/dev/null'
> > nm: ./arch/x86/entry/vdso/vdso32/note.o: no symbols
> > nm: ./arch/x86/entry/vdso/vdso-note.o: no symbols
> >
> > real 0m55.783s
> > user 0m24.887s
> > sys 0m30.905s
> >
>
> I'm not exactly sure. I get compatible numbers with just nm.
>
> $ find . -name "*.o" | grep -v vmlinux | wc
>      3169      3169     89615
>
> $ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm'
>     0m02.02s real     0m01.77s user     0m00.43s system
>


About the slowness of nm, it might depend on the GNU binutils version.

I tried some versions in docker.




On Ubuntu 18.04:

$ nm -V | head -n1
GNU nm (GNU Binutils for Ubuntu) 2.30
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm >/dev/null'
nm: ./arch/x86/entry/vdso/vdso-note.o: no symbols
nm: ./arch/x86/entry/vdso/vdso32/note.o: no symbols

real 0m2.694s
user 0m2.201s
sys 0m0.729s



On Ubuntu 20.04:

$ nm -V | head -n1
GNU nm (GNU Binutils for Ubuntu) 2.34
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm >/dev/null'
nm: ./arch/x86/entry/vdso/vdso-note.o: no symbols
nm: ./arch/x86/entry/vdso/vdso32/note.o: no symbols

real 0m5.287s
user 0m3.356s
sys 0m2.035s



On Ubuntu 22.04:

$ nm -V | head -n1
GNU nm (GNU Binutils for Ubuntu) 2.38
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm >/dev/null'
nm: ./arch/x86/entry/vdso/vdso-note.o: no symbols
nm: ./arch/x86/entry/vdso/vdso32/note.o: no symbols

real 0m37.107s
user 0m14.121s
sys 0m23.229s









So, 'nm' is progressively becoming slower and slower.

With the recent nm, most of the time for running check-local-export
is consumed for 'nm'.




llvm-nm is a little faster, but it is still slow.


-- 
Best Regards
Masahiro Yamada
