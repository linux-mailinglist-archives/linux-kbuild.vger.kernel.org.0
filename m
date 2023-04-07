Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1888A6DB4BD
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjDGUHj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDGUHi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:07:38 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77E255AA
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:07:37 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id cm5so21201925pfb.0
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680898057; x=1683490057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkOEhQNrIBFDHu7KAVwRblXldBrOwOumrazSx2PHct0=;
        b=mJE8l6pA+2PT6E5N5sbq9oZWU6MFGh4WrHvDXlxWedKbAYSpCmaQscbYlmnvGF8lXB
         nhvqJmlRNTThO0BlZysjCSmIzK0wH0URUyIMIbEYqL9mIW9i06SBWe/5D39t7X+02w3F
         lx/C9e3beaemoSIpaWak5PdZtdzQAEWmirLoDeKgOiC2EEoDCOKycNQHZWM4V62PWECi
         /uVHNUfr6gkaeoeKVFEckRq1iwsVxASE3y+N8cKrpjD4Jzh8P3a41eTGxa9dNpX3iu2y
         ICXq3yLhX+IFRWRPWCZjWy7pN62ht+k8bqrLvnhahCS61wmP9eFrvug0ZK0/pFyBetiX
         RIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898057; x=1683490057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkOEhQNrIBFDHu7KAVwRblXldBrOwOumrazSx2PHct0=;
        b=PZywyiAzEUOt0BKAyBI+8B/YGvdKSJ9jqUn59CuTYpEN/Ip62cKjvKPpx9/1iJdncb
         uBqHPILg5EgEp1oV66G0ycc6UFl6sDVi0QRPtB7D8W4l5JERpjcNbD/GHSuLxU9QM+Ps
         Fo1+++xu1KLZKOQZkqi6qFp/D5XHTgt5KcJd3vLJedw0eKRIphKJ7nISdbM275tRscJX
         HfWH1Fh5pJ+LEPoOTegs1WRlXrAepwMcHbc3rSgfyYJESLV1ykA5I4nXY4yJhVQo52ii
         r76jxQttN/UPZ1AQonKgnWltxf225F2+0lgqco/ybMxRm9pBXOmgO9CAEeJQDC+Ep2IA
         vTOQ==
X-Gm-Message-State: AAQBX9cn1dyQAuGRRGK4L6NQlbn35lpN28chVq0Zl/MVQVmOitB0rR+Y
        3F8v0byVuNBRHcIkOWW4XVSE7vivDpfWeoOTgkXKvcOqZ/l78Tj1u5g=
X-Google-Smtp-Source: AKy350ZodAE1kFxaDIP59bG96aIVjkJ5nBYb13hi5XnQQ0LKgyr6AqX0Jjr5lrWDDS0eoVNk6zG3x7nSzNx62dkuwrg=
X-Received: by 2002:a63:d65:0:b0:513:6b94:8907 with SMTP id
 37-20020a630d65000000b005136b948907mr703540pgn.1.1680898056858; Fri, 07 Apr
 2023 13:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
 <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
 <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com> <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com>
In-Reply-To: <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 13:07:25 -0700
Message-ID: <CAKwvOdmKmtzSqEk6L8ru+sj7G9zFUxWQ4qqHwzuAj1RAEMFj-g@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To:     Bill Wendling <morbo@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Cc:     tr4v3ler <0xtr4v3ler@gmail.com>,
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

On Fri, Apr 7, 2023 at 1:02=E2=80=AFPM Bill Wendling <morbo@google.com> wro=
te:
>
> On Fri, Apr 7, 2023 at 1:00=E2=80=AFPM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.com>=
 wrote:
> > >
> > > I would like to compile all C files into. ll or. bc to facilitate ana=
lyzing the entire kernel.
> >
> > So there's a make target compile_commands.json. That will give you a
> > json list of triples that contain the exact command used to compile
> > the kernel. It's probably 10 lines of python to parse that, then rerun
> > the exact command used the build each translation unit with -emit-llvm
> > and -S (or not depending on if you want .ll or .bc).  That will give
> > you a .ll/.bc for everything that's built as part of your config for
> > that configuration.
> >
> > Otherwise, kbuild has rules to do:
> >
> > $ make LLVM=3D1 lib/string.ll
> >
> > There's no support for .bc (would be trivial to add) because you
> > typically end up running llvm-dis on .bc files to get .ll files
> > anyways.  I almost never use .bc files.
> >
> If LTO is enabled, then the .o files are LLVM bitcode files by default.

Ah right!

(I wonder what would break if we changed this to use the expected file
extension of .bc rather than .o.)

>
> -bw
>
> > > Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.c=
om> wrote:
> > >> >
> > >> > Hi=EF=BC=8CI found the following compilation targets in the makefi=
le(https://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L13=
6) of the Linux kernel. However, I don't know how to make this goal effecti=
ve, compile the Linux kernel, and generate llvm bitcodes. Do I need to spec=
ify specific parameters for the make command? Or through environment variab=
les?
> > >>
> > >> What precisely are you looking for? A single .ll file? A single .bc
> > >> file? .ll or .bc files for every translation unit?
> > >> --
> > >> Thanks,
> > >> ~Nick Desaulniers
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >



--=20
Thanks,
~Nick Desaulniers
