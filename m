Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04176DB4A4
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjDGUCM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjDGUCK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:02:10 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C15AD02
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:02:09 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-93071f06a9fso223538766b.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB51VdR7JEx1ZSnneVh5Za6FSGjQHth9ml16pJWa/OY=;
        b=s9UoOyam49rU58nrSaVqSsBXBmYDzO5yyJbYd/nMfay4FeFH7RMcPPpnms0vAKUuui
         HkLEaJziDNZXd2U49szuvVcROWBhQqBgwBJmtOntYfKeY7K1x8ezUPWAh6QT954jn9g0
         OjoKW9LERo3suNM6mhjaZY9k4Mpif2ltTTEjE1m1CPDKBln6u3m+rKLEbv2vfJ4bO3k/
         4nOl9kXnrZsu1yth1cRMr2S4klg255gB5+/kEWrOsalKR9gdXhBO2PIQ0AIsj4viT2lu
         KQRrpFJYiJGc2BJMA+SpbFADPIAjYM9GolxB6empVGv8tOMoH+qd75xkkzboVCSHTmrC
         W6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB51VdR7JEx1ZSnneVh5Za6FSGjQHth9ml16pJWa/OY=;
        b=UOnTjPxYTfyUSr7MD9iDRfU9NGBExIwHh39FpCFCtJeGh4vjLUWKVCS6YVkJ36A6Y7
         Pwm7g3/W3epBgZLAXFb/xeTOWDerjcHEaMrbBVYjK51hJ155HV7nSS/ARG4pPS5holUA
         kULaFdc12+f5jWojWroDMh9di6gtkbobKmcmyQJ+09V7umvbxmtA76wL/vGrx4M/pjBH
         EibtJQ0Xe5DOvtD4ZBVWa/GYHtfGePeKYzNiwRPCApkJP3H8uA3IJIXEKKBVHuOjjLNe
         9/ai8931Gn57rCMglTSMwq35SJ0zz5kVbkUBh0nvYfCeKY6JsWwfksJlOiOJLtCNaKAk
         BN5A==
X-Gm-Message-State: AAQBX9dOZJEQBSKj9vsqfFIXLOAIXLrWhoxkLD4qCpfUZtuw9bQwfVrc
        YVu0e8WerximQJBE+BztJXYSqQxA0HnnLTq72p5u
X-Google-Smtp-Source: AKy350baYGJbCem5o3PwAIyD1Vv7OOSq5+llmmCT9fEUD8H+UhZLxHejjTlt2v2nKxYS2BwBxow2dtLlSjP+GIB8PAA=
X-Received: by 2002:a50:d55a:0:b0:504:7857:d739 with SMTP id
 f26-20020a50d55a000000b005047857d739mr1748268edj.7.1680897727520; Fri, 07 Apr
 2023 13:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
 <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com> <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
In-Reply-To: <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Fri, 7 Apr 2023 13:01:50 -0700
Message-ID: <CAGG=3QVCziOMitp5DenE-TfJv8spOL0KW-9eZ3OAVZ9+NBd97w@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Fri, Apr 7, 2023 at 1:00=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.com> w=
rote:
> >
> > I would like to compile all C files into. ll or. bc to facilitate analy=
zing the entire kernel.
>
> So there's a make target compile_commands.json. That will give you a
> json list of triples that contain the exact command used to compile
> the kernel. It's probably 10 lines of python to parse that, then rerun
> the exact command used the build each translation unit with -emit-llvm
> and -S (or not depending on if you want .ll or .bc).  That will give
> you a .ll/.bc for everything that's built as part of your config for
> that configuration.
>
> Otherwise, kbuild has rules to do:
>
> $ make LLVM=3D1 lib/string.ll
>
> There's no support for .bc (would be trivial to add) because you
> typically end up running llvm-dis on .bc files to get .ll files
> anyways.  I almost never use .bc files.
>
If LTO is enabled, then the .o files are LLVM bitcode files by default.

-bw

> > Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.com=
> wrote:
> >> >
> >> > Hi=EF=BC=8CI found the following compilation targets in the makefile=
(https://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L136)=
 of the Linux kernel. However, I don't know how to make this goal effective=
, compile the Linux kernel, and generate llvm bitcodes. Do I need to specif=
y specific parameters for the make command? Or through environment variable=
s?
> >>
> >> What precisely are you looking for? A single .ll file? A single .bc
> >> file? .ll or .bc files for every translation unit?
> >> --
> >> Thanks,
> >> ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
