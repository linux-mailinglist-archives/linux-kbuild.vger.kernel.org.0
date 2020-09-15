Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18BF269ED5
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 08:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgIOGtg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 02:49:36 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44929 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgIOGtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 02:49:33 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08F6nCbt021636;
        Tue, 15 Sep 2020 15:49:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08F6nCbt021636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600152552;
        bh=/YHgxIWJTokp6tJ9bPAse6XvKXfjZr/YkOmrQ5PQYsE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gatAAVH2PVWlmec+zk+hkP+H5Kuqb2Sm79qiUh9m+zrIHUf2nqNIRWupFiVVl1VUd
         UaxO40ycb+sVJVAEHC0UDiru0Ss6HF4K3z8H+h2amflG/g9GdA5HSNGJuEWWWqKQGZ
         zjq4N6oL/apPmpk3S5eIn8mXoxoTzsaihbJu3FQaHUG/mWCQlYXjidoi3/EWKCFAr1
         jd6PZEAHmkKgu32Y6XcUiC9ESkhUG8cm8lFwJF+YUQM1/Al7kOA4sytlAuf+6jFwSJ
         /ERC/b+HLfVkiOXkwJs/J90HX/qlpIiT7l27674i1hZTaJpyLxuxjA2/SV4DoXaJP+
         G0Iz098/K7TFg==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id r19so828717pls.1;
        Mon, 14 Sep 2020 23:49:12 -0700 (PDT)
X-Gm-Message-State: AOAM531urcWhiiJ7LIfKdwqbjyFpMg7sVT05Tu+fIntWaZGeuhVeWrMC
        p8xZfWCxMrX2vMl+gplVlatMV7slXPcwiz63kmo=
X-Google-Smtp-Source: ABdhPJwmk+KlJ+DZwmvZcIlJHZPjqVj43hPVgQtBJC1zq87btiWa01sD7OPp3O/Gxh/i7mLfclnwILe1apF92R8ziWw=
X-Received: by 2002:a17:902:760b:b029:d1:9be4:856b with SMTP id
 k11-20020a170902760bb02900d19be4856bmr17401421pll.1.1600152551621; Mon, 14
 Sep 2020 23:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk> <6A76267A-6B60-4428-94DF-E05706EB85FB@fb.com>
In-Reply-To: <6A76267A-6B60-4428-94DF-E05706EB85FB@fb.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 15 Sep 2020 15:48:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
Message-ID: <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
Subject: Re: vmlinux link failure on ia64 with zstd
To:     Nick Terrell <terrelln@fb.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 15, 2020 at 4:12 AM Nick Terrell <terrelln@fb.com> wrote:
>
>
>
> > On Sep 13, 2020, at 12:51 PM, Ben Hutchings <ben@decadent.org.uk> wrote=
:
> >
> > Enabling CONFIG_RD_ZSTD (which is enabled by default) resulted in a
> > link failure on ia64:
> >
> > + ld -r -o vmlinux.o --whole-archive arch/ia64/kernel/head.o init/built=
-in.a usr/built-in.a arch/ia64/kernel/built-in.a arch/ia64/mm/built-in.a ke=
rnel/built-in.a certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a=
 security/built-in.a crypto/built-in.a block/built-in.a lib/built-in.a arch=
/ia64/lib/built-in.a lib/lib.a arch/ia64/lib/lib.a drivers/built-in.a sound=
/built-in.a net/built-in.a virt/built-in.a arch/ia64/pci/built-in.a arch/ia=
64/hp/common/built-in.a --no-whole-archive --start-group --end-group
> > ld: lib/zstd/entropy_common.o: linking constant-gp files with non-const=
ant-gp files
> > ld: failed to merge target specific data of file lib/zstd/entropy_commo=
n.o
> > ld: lib/zstd/fse_decompress.o: linking constant-gp files with non-const=
ant-gp files
> > ld: failed to merge target specific data of file lib/zstd/fse_decompres=
s.o
> > ld: lib/zstd/zstd_common.o: linking constant-gp files with non-constant=
-gp files
> > ld: failed to merge target specific data of file lib/zstd/zstd_common.o
>
> I=E2=80=99ve never seen anything like this error before. I did some searc=
hing, and found that it may show up if an object file is empty.
>
> These three files are all included in both the zstd_compress and the zstd=
_decompress modules. We used to exclude these 3 files from the zstd_decompr=
ess module when both modules are built-in. But then commit dc35da16a2e2 [0]=
 removed that, because Kbuild is supposed to handle that case.
>
> If you revert commit dc35da16a2e2 [0] does that fix the issue? I=E2=80=99=
m attempting to build with IA64, and I=E2=80=99ll let you know if I am able=
 to reproduce the issue and test if this fixes it.
>
> CC: Masahiro Yamada <yamada.masahiro@socionext.com> author of the commit =
and the linux-kbuild mailing list.
>
> [0] https://github.com/torvalds/linux/commit/dc35da16a2e23db04822f0129cd5=
b28b7b0e72b4


dc35da16a2e2 is more than two years old (i.e. v4.17)

Are we discussing a long-standing issue
or something that arose recently?




> Best,
> Nick
>
> > This is seen on Debian unstable, with gcc 10.2 and binutils 2.35.  A
> > full build log is available at:
> > https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Dia64&ver=
=3D5.9~rc4-1~exp1&stamp=3D1599955166&raw=3D1
> >
> > Ben.
> >
> > --
> > Ben Hutchings
> > Humour is the best antidote to reality.
> >
>


--=20
Best Regards
Masahiro Yamada
