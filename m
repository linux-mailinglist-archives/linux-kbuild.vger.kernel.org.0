Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CF16DCB8D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Apr 2023 21:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjDJT3M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Apr 2023 15:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjDJT3K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Apr 2023 15:29:10 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FE019B3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Apr 2023 12:29:09 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id j17so5156096ejs.5
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Apr 2023 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681154947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqqVTxdThIrWJ0JnBtkrcoFoLSU42l+GTy1305Yz8uM=;
        b=g2etEoKdIOFTKbIK6gpYGFTfzWM/kv9LdNiiK8+njpxR2og7aIiYCMMg7l0osP8heR
         GZv4CIxbc8+Kd0BdcLmhneBak6Ukfm4f05OfMFBgCF1slEKg1wfziGl1MhWdJq8F8oMI
         1A+c0US8+R0u+Z4YiQHLdHGtremmTD2ZbbdQYavrGqBJ8GhLAC5qa1z2+8ygSfsy/unZ
         sLV0+tc8KD0aWEu6DQF8o+N36EXWK4mv3DWprUANkTfdhJhAFne3l7cZAKzlcXtKrdZN
         hhtaPOnEY578DMRlzRiwrDEhDhaq+hcQd4kEg3ADQG5pQi9yO3vhJc4DOTNbPNqqq9Q7
         8OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqqVTxdThIrWJ0JnBtkrcoFoLSU42l+GTy1305Yz8uM=;
        b=7Ip/23vSLGXzvv5xJJTZyhnErRW2k2nqowbO3ReuSbVA/jvVDZQiHP2zKE9NJvHlVI
         ke24+u+m+EZqxWxVZM5OG+kbYiy8YZHH0jS83tt6T5Mvc2NmfQ0rgegprEcVNkbhA+47
         hgXsn5VsA5r9htHtkpGKM5DYtTwsMt7LE4beZXTMWilccr7P4BmWElrT183zXkaE0UCv
         AUKGP3ns4qj0+Mr7QZwPoFIgH4GMYVOUbd7PPdqujXRtKxIIv3zy4eLiHP7LgKdvtFpB
         gt4OyHvdRwttXeSPCoQRb0XaZjUKNCPhfRdntyLwWAj/YvWd2rX/J+ASBSa9xI9eIcvC
         jMRg==
X-Gm-Message-State: AAQBX9e6fMuFjEZy6glyNGfzQeNYehb3P4marF7vsiNyq8Vde3+R3h+C
        RqwfUBOam1XsTGTAddGWIacP7pXnd9mAhhUUM+cu
X-Google-Smtp-Source: AKy350b5qAlU+or/fvC+RW59KSyuKPqrgNrieAxHEHOqUCpU0Qn6yLx9pL2WngytH8wfpYSYLvhvUbiFl5ilIgGZjfg=
X-Received: by 2002:a17:907:d502:b0:94a:3ce:722 with SMTP id
 wb2-20020a170907d50200b0094a03ce0722mr3240164ejc.4.1681154947311; Mon, 10 Apr
 2023 12:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
 <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
 <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
 <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com> <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
In-Reply-To: <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 10 Apr 2023 12:28:49 -0700
Message-ID: <CAGG=3QWo1FrTa9PSWq_b5Gfzsp-6wNwJgT7u9yR-Q767DKwU=Q@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        tr4v3ler <0xtr4v3ler@gmail.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 7, 2023 at 1:07=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Apr 7, 2023 at 1:02=E2=80=AFPM Bill Wendling <morbo@google.com> w=
rote:
> >
> > On Fri, Apr 7, 2023 at 1:00=E2=80=AFPM Nick Desaulniers <ndesaulniers@g=
oogle.com> wrote:
> > >
> > > On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.co=
m> wrote:
> > > >
> > > > I would like to compile all C files into. ll or. bc to facilitate a=
nalyzing the entire kernel.
> > >
> > > So there's a make target compile_commands.json. That will give you a
> > > json list of triples that contain the exact command used to compile
> > > the kernel. It's probably 10 lines of python to parse that, then reru=
n
> > > the exact command used the build each translation unit with -emit-llv=
m
> > > and -S (or not depending on if you want .ll or .bc).  That will give
> > > you a .ll/.bc for everything that's built as part of your config for
> > > that configuration.
> > >
> > > Otherwise, kbuild has rules to do:
> > >
> > > $ make LLVM=3D1 lib/string.ll
> > >
> > > There's no support for .bc (would be trivial to add) because you
> > > typically end up running llvm-dis on .bc files to get .ll files
> > > anyways.  I almost never use .bc files.
> > >
> > If LTO is enabled, then the .o files are LLVM bitcode files by default.
>
> Ah right!
>
> (I wonder what would break if we changed this to use the expected file
> extension of .bc rather than .o.)
>
I'm sure it can be done, but it would require poking into a lot of
Makefiles. Ultimately, it might not be worth it...

The only situation where it might be beneficial is to compare ELF
files generated during ThinLTO to their bitcode counterparts---e.g. if
one wants to verify a livepatch and have a "paper trail" back to the
changed files (we do something similar to this internally, but I don't
think it's a widespread workflow).

-bw

> > > > Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
> > > >>
> > > >> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail=
.com> wrote:
> > > >> >
> > > >> > Hi=EF=BC=8CI found the following compilation targets in the make=
file(https://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L=
136) of the Linux kernel. However, I don't know how to make this goal effec=
tive, compile the Linux kernel, and generate llvm bitcodes. Do I need to sp=
ecify specific parameters for the make command? Or through environment vari=
ables?
> > > >>
> > > >> What precisely are you looking for? A single .ll file? A single .b=
c
> > > >> file? .ll or .bc files for every translation unit?
> > > >> --
> > > >> Thanks,
> > > >> ~Nick Desaulniers
> > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
