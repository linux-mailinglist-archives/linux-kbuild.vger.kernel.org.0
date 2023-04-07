Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D046DB4A1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjDGUAC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDGUAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:00:01 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F164BA5F8
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:00:00 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id bm13so12898250pfb.5
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897600; x=1683489600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjAQpZ3P5/kgKKUseQN+C8hGKXm2+H7ZkT4BzbfR8Fo=;
        b=Lb0Ga8zwodeySz593bYtheEuGKpvcY9YIXjoyyX4mT7x1LcGMW8lQ73BAyRoMkJnuA
         U5T1u9GmsxTQAZOozZHmonZOwP0+bMUoml8iOUwm67MOPu+l4fkHa9D9R07CCR5xOaXI
         7SG492wt3w3Lb0ogFOK6ZvRt6eJB+tC/EQY5whtZCgIXHeykH6Dy43GD3CMz0Z8QA0s0
         3Ppi6/BvkgLMSqg1XzB+Dk8D7Zllt9a++P7+nVEvfIzIXMe+Pur8W5M2FpFGGGxE3hkN
         GnJtv8J/KuMck0GPF9JDcQc1WBETo82PqLSek7HpSu6mYUEj8hjKp6wyzBWLOzo1+vPi
         0mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897600; x=1683489600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjAQpZ3P5/kgKKUseQN+C8hGKXm2+H7ZkT4BzbfR8Fo=;
        b=ocH0KKumnCVWUW4sc8JRD8XaRtpsbbpKhRED9ZU9bW6moLdi3V/9UNQT+N2SVZqhAv
         KY2aLnAM2rBsiBc532QrMq9XGr7Zatthz1L3FG+9+PWZ3/5XOt6CAQlRoSqAqOF06+5f
         eDcF4SRxTvqFtTek/pnst9qI+SzJfWLYi+Cp8G7KEQSFL6o0kXWj0LGO3a9WGVVys2sU
         VTXdQ5dq0tCfo2+3FLWJ4dSQguHUXbrIqwFgJjgTLZ2a1mS1FPzfqw5ZEvVqzbLR65ci
         wcA+7SyLlVttWD8+lzT1GVoqYwQPOOjdp87567uFT86Kdr+eMRInRwYW/Z1y30N7/TY6
         Ak6A==
X-Gm-Message-State: AAQBX9diWxl6bA+65LfmdgML2iq+iROhzXBCRozkZGDGmVI4wk2eglu/
        iIdAOn/yZcCsuB3KSyz3BInK+ycnOQ6TVH8X0xQs+Q==
X-Google-Smtp-Source: AKy350aZ10fpP1uNZLdHCoSPvLrIsXMMPJkw6vRI9cpv6rVDNj4+tZzceQBSaTDtuokxPAy1Qa1W0xEmYmRR0JzNqGw=
X-Received: by 2002:a63:db47:0:b0:4fc:d6df:85a0 with SMTP id
 x7-20020a63db47000000b004fcd6df85a0mr732260pgi.1.1680897600271; Fri, 07 Apr
 2023 13:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
 <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com> <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
In-Reply-To: <CAK_uB7iqftfEgX+GWMtcFwJhfMDCHZwdO26R-dXCL-ChR2SgtQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 12:59:49 -0700
Message-ID: <CAKwvOdne=8KXzkn_jDfjqFTcu1SYyTrCTPe1BtCVj+8F3sk7UA@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To:     tr4v3ler <0xtr4v3ler@gmail.com>
Cc:     clang-built-linux <llvm@lists.linux.dev>,
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

On Mon, Mar 20, 2023 at 7:14=E2=80=AFPM tr4v3ler <0xtr4v3ler@gmail.com> wro=
te:
>
> I would like to compile all C files into. ll or. bc to facilitate analyzi=
ng the entire kernel.

So there's a make target compile_commands.json. That will give you a
json list of triples that contain the exact command used to compile
the kernel. It's probably 10 lines of python to parse that, then rerun
the exact command used the build each translation unit with -emit-llvm
and -S (or not depending on if you want .ll or .bc).  That will give
you a .ll/.bc for everything that's built as part of your config for
that configuration.

Otherwise, kbuild has rules to do:

$ make LLVM=3D1 lib/string.ll

There's no support for .bc (would be trivial to add) because you
typically end up running llvm-dis on .bc files to get .ll files
anyways.  I almost never use .bc files.

>
> Nick Desaulniers <ndesaulniers@google.com> =E4=BA=8E 2023=E5=B9=B43=E6=9C=
=8821=E6=97=A5=E5=91=A8=E4=BA=8C 01:12=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.com> =
wrote:
>> >
>> > Hi=EF=BC=8CI found the following compilation targets in the makefile(h=
ttps://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L136) o=
f the Linux kernel. However, I don't know how to make this goal effective, =
compile the Linux kernel, and generate llvm bitcodes. Do I need to specify =
specific parameters for the make command? Or through environment variables?
>>
>> What precisely are you looking for? A single .ll file? A single .bc
>> file? .ll or .bc files for every translation unit?
>> --
>> Thanks,
>> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
