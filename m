Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC2332CE5
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 18:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhCIRKT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 12:10:19 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49364 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhCIRJy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 12:09:54 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 129H9eLa012070;
        Wed, 10 Mar 2021 02:09:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 129H9eLa012070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615309781;
        bh=Pal5Drg605AgZU5o/jFyWQrW4YUqQKhMRpZPLbzgbH8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eStQOfowwsJ3aSBTdFDBhw5a5/g+pA2VDHHgmkA4WMvK/2424NLf7bBcTsdqlO/s6
         Qc0+rrjTxeJhGQQEMMo01/2SfyvSx2+fz0taispD81S99Y6ME2CMIBhi6WyCoJ40Kw
         PStIiLtmTK01PosbSAZXSJUMJdupij6e/XhZOnQD35woGC/j8tyYGS1qqqTBA0W8Yl
         DTIXbH2QAzRqjTRVHhXQnZuK2QXZrJHWNTN0vKFTt6s7e7m43NhxSXMj+ha8S6L8jO
         oinKzP/5y0E74nXJ1KZpGpgxVtEbj3jeyDsh8Gx/TumBVIwGZlOG3KRb96OXdhptdJ
         QI0JSKp8PU+RQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso3091500pjb.4;
        Tue, 09 Mar 2021 09:09:41 -0800 (PST)
X-Gm-Message-State: AOAM533Djc5tt5CAa1VcKTVolPlrydUGcHjt6f8yUNqizw5sjVYRIzQJ
        sI8CjZn2wBfmgGIdL8UFwO8npahNLdI6UNf70nU=
X-Google-Smtp-Source: ABdhPJya5m8ID1Wv2M6uXVNjKcbgsssZ00JY8fy/DIxUDOyVg8abjIAiSWkr3X6LItdWJgWRYbwgTV8iCpYajdgkbj4=
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id
 x9-20020a1709028ec9b02900e60c5ecf18mr14856219plo.47.1615309780374; Tue, 09
 Mar 2021 09:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20210302221211.1620858-1-bero@lindev.ch> <CAK7LNARA3uKsW_G+gnCX6dvSwgXWzqgZON7pc6gBWdw9gimq1A@mail.gmail.com>
In-Reply-To: <CAK7LNARA3uKsW_G+gnCX6dvSwgXWzqgZON7pc6gBWdw9gimq1A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 02:09:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQb2pCtFgebADigYoRJUo4M3i_4iwS=88QYZx5H+736Hw@mail.gmail.com>
Message-ID: <CAK7LNAQb2pCtFgebADigYoRJUo4M3i_4iwS=88QYZx5H+736Hw@mail.gmail.com>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
To:     =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 12:34 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> On Thu, Mar 4, 2021 at 9:18 AM Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch=
> wrote:
> >
> > If LLD was built with -DLLD_VENDOR=3D"xyz", ld.lld --version output
> > will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> > LLD identifier isn't guaranteed to be $2 either.
> >
> > Adjust the version checker to handle such versions of lld.
> >
> > Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
> > ---
>
>
> Bernhard,
>
> Could you senv v2
> with the suggested code change?
>
> Please make sure to add
> linux-kbuild@vger.kernel.org
> in the To:


I did not get v2, but never mind.
I locally modified the code and applied.

I added Link: to your original patch
just in case I make some mistake in the
code refactoring.


The final one looks as follows:





commit 0b2813ba7b0f0a9ff273177e85cbc93d92e76212
Author: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
Date:   Tue Mar 2 23:12:11 2021 +0100

    kbuild: Fix ld-version.sh script if LLD was built with LLD_VENDOR

    If LLD was built with -DLLD_VENDOR=3D"xyz", ld.lld --version output
    will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
    LLD identifier isn't guaranteed to be $2 either.

    Adjust the version checker to handle such versions of lld.

    Link: https://lore.kernel.org/lkml/20210302221211.1620858-1-bero@lindev=
.ch/
    Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
    [masahiro yamada: refactor the code]
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a463273509b5..30debf78aa09 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -44,14 +44,20 @@ if [ "$1" =3D GNU -a "$2" =3D ld ]; then
 elif [ "$1" =3D GNU -a "$2" =3D gold ]; then
        echo "gold linker is not supported as it is not capable of
linking the kernel proper." >&2
        exit 1
-elif [ "$1" =3D LLD ]; then
-       version=3D$2
-       min_version=3D$lld_min_version
-       name=3DLLD
-       disp_name=3DLLD
 else
-       echo "$orig_args: unknown linker" >&2
-       exit 1
+       while [ $# -gt 1 -a "$1" !=3D "LLD" ]; do
+               shift
+       done
+
+       if [ "$1" =3D LLD ]; then
+               version=3D$2
+               min_version=3D$lld_min_version
+               name=3DLLD
+               disp_name=3DLLD
+       else
+               echo "$orig_args: unknown linker" >&2
+               exit 1
+       fi
 fi

 # Some distributions append a package release number, as in 2.34-4.fc32




--
Best Regards
Masahiro Yamada
