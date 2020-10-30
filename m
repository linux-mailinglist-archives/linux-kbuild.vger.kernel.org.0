Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C944C29FA7B
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 02:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgJ3BWh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 21:22:37 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39522 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3BWg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 21:22:36 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09U1LQmq022700
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2020 10:21:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09U1LQmq022700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604020886;
        bh=fTjJTVWi1gMZ6JD3GUGDWnM2V1CChsIFSJFWtzkcb0E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ruq03Wle6Jp0pZ6iPBy0KbIa5AvmIqK9NLJ8gCFQTC2TMtFYUqpbZdOYZiw98XknP
         iGRLxZMky3j1ouvSIat5ZS44dJ07UnnqglMoYI9oiBOTAGUjOEtd/imlx99ZOLG5t6
         3CtluZvsv7N2nbpjjEYTttrkfVnCJFTeUe7Y2/UrN9s6WRWCepRLoIRs77SeBueoEI
         eq0NVizjzR8IsgWvNtRTZ15y962OEKP2uTneU0qVzs+jJTuLKnEJAfIBOHLPpTzoMR
         euv1XVAm3CPJuPqkSmDuA6Ft/NeXC3/ZFlKbqKbxtCeVmAKBZ2gEueS1IczXyiN0nO
         UEjmgVu5hBisw==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id 1so2182817ple.2
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2020 18:21:26 -0700 (PDT)
X-Gm-Message-State: AOAM5304y8nTYLo9VQamlnI6F1RfC3n3gVFVZXCmanxR7PY7JDhj0vpa
        imTsNt4V49ax2uO8Q/coIpjOK09L4GwOYx+L3fw=
X-Google-Smtp-Source: ABdhPJw4jtqC4vf9p0ReLzdLI1v2PzkfNGmw+vHJReX8JXjJDDftyuq740q9BXU2nS05gMiXKERaF28CygmxFFIi1H4=
X-Received: by 2002:a17:902:c40f:b029:d6:16b5:4de with SMTP id
 k15-20020a170902c40fb02900d616b504demr6295977plk.1.1604020885849; Thu, 29 Oct
 2020 18:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMFOmUUJ4C95J3psPBgfaFX=VCqAZEcRrf2Y0pzR+C=xxNMyg@mail.gmail.com>
In-Reply-To: <CAOMFOmUUJ4C95J3psPBgfaFX=VCqAZEcRrf2Y0pzR+C=xxNMyg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 30 Oct 2020 10:20:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAPLxx5_NEgopyXOouQ0QWP0B3L6UsuuEL7FNNdrLa=g@mail.gmail.com>
Message-ID: <CAK7LNARAPLxx5_NEgopyXOouQ0QWP0B3L6UsuuEL7FNNdrLa=g@mail.gmail.com>
Subject: Re: "Permission denied" when using system-installed kernel headers
To:     Anatol Pomozov <anatol.pomozov@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 2:35 AM Anatol Pomozov <anatol.pomozov@gmail.com> w=
rote:
>
> Hi folks
>
> Here is a follow-up for this issue
> https://github.com/Open-CAS/open-cas-linux/issues/540
>
> opencas project builds an out-of-tree kernel module and uses
> system-level kernel header. In my case these headers are installed to
> /lib/modules/5.9.1-arch1-1/build
>
> So if I do
>
> $ cd /lib/modules/5.9.1-arch1-1/build
> $ make kernelversion
>
> I get following output:
>
> mkdir: cannot create directory =E2=80=98.tmp_86541=E2=80=99: Permission d=
enied
> mkdir: cannot create directory =E2=80=98.tmp_86543=E2=80=99: Permission d=
enied
> mkdir: cannot create directory =E2=80=98.tmp_86545=E2=80=99: Permission d=
enied
> mkdir: cannot create directory =E2=80=98.tmp_86547=E2=80=99: Permission d=
enied
> .......
> mkdir: cannot create directory =E2=80=98.tmp_86626=E2=80=99: Permission d=
enied
> mkdir: cannot create directory =E2=80=98.tmp_86628=E2=80=99: Permission d=
enied
> mkdir: cannot create directory =E2=80=98.tmp_86630=E2=80=99: Permission d=
enied
> 5.9.1-arch1



This is because you did not pass M=3D option.



/lib/modules/$(uname -r)/build
is used for building external modules.

You cannot work in that directory
since it is usually read-only.


You need to pass M=3D<path-to-your-module>


This may work for you.



$ cd  /lib/modules/$(uname -r)/build
$ mkdir $HOME/foo
$ make M=3D$HOME/foo  kernelversion








>
> Quick debugging shows that it comes from scripts/Kbuild.include
> following lines in particular:
>
> # output directory for tests below
> TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
>
> # try-run
> # Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwis=
e)
> # Exit code chooses option. "$$TMP" serves as a temporary file and is
> # automatically cleaned up.
> try-run =3D $(shell set -e; \
> TMP=3D$(TMPOUT)/tmp; \
> TMPO=3D$(TMPOUT)/tmp.o; \
> mkdir -p $(TMPOUT); \
> trap "rm -rf $(TMPOUT)" EXIT; \
> if ($(1)) >/dev/null 2>&1; \
> then echo "$(2)"; \
> else echo "$(3)"; \
> fi)
>
>
>
> TMPOUT points to headers directory and in my case it is a part of /usr
> partition that restricts user writes.
>
>
> TMPOUT should avoid writing to headers dir and use `mktemp` instead.



--
Best Regards
Masahiro Yamada
