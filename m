Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6676C7177
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Mar 2023 21:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjCWUBd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Mar 2023 16:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjCWUB2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Mar 2023 16:01:28 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB6628E63
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Mar 2023 13:01:27 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id i15so9975560pfo.8
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Mar 2023 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=IPZIkew3dFtjmZdaViTjyD0HscLUwPXqPripmrMsr3WTFFmpjru7uOEiW5MdR0VV95
         3AkjKWS+SSGR66Z2HcB5pk7YSGalu08/hGwoMnkFnDkE2qoAQbU1GvgUd6upSXxx5s2P
         WgA85mghqIhhEYMtWiZMDw6eVS30vmwumoj8UFiy4jXPgOQpsvTsmsWOaQLIrepOjNLG
         23PQbOvHd/lWhmQ57R9lQXqXoeGABGhKFPHzTLsKICBt+2gzhqsz8P/8SexMqUTFcc6H
         UOF5X9dx/gsFR66RqsvJo3OswMwtQs/bMnp7PF1XkJIv33y55T3bQzLy+NDa36XNhCpS
         +QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=DniHv0Ie4kkj5Dlkg8NN8oHODgeUFOrkwt5MoF9TNTO5O5z9OWUGHspQT1XrRlzI9d
         MNdBQuYgVqyKFdDX+PtnlCojlVm2FqLAC79Z+mmWw56Ydz2E3HIuT4F0/TeyTcknfyis
         023XUgxFrlsPo9aNvb+EZejWFKmtTS0QrUGGvPLwjJDg4an3mns/GgrLmV9Ih7ZqXsXz
         19TcppFlHTs5ERv3v9ZgViT92ECVs9x5eOHMpkxdq2ZTPHUIdC4vWPZp63BQ+cz2u7Vv
         KusxFLdIAQig/VA5+vcc8UhQgqPoOqMa1Nk5DmjAHI9BvXda/YdnLx1HbgUy+4KXgllB
         VB0w==
X-Gm-Message-State: AO0yUKXMjRZeJpiMmyzFjmBB9eif0oUTDkAnkLK05HjJGuumw0XLzopb
        qN0wPjE/WvV1djbp4VqA6QO8Y7CWyKXbEJXgCQM2ag==
X-Google-Smtp-Source: AK7set+ozY4YViDqnsSitk2Wr074yCOGB0DUpWwEKn9HjfwuqHnY07bD2pSglnB1LUnHagdMFzX9OQx8JdW2HNZ3kOw=
X-Received: by 2002:a65:484d:0:b0:503:354c:41ad with SMTP id
 i13-20020a65484d000000b00503354c41admr2238413pgs.11.1679601686525; Thu, 23
 Mar 2023 13:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us> <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From:   Fangrui Song <maskray@google.com>
Date:   Thu, 23 Mar 2023 13:01:15 -0700
Message-ID: <CAFP8O3+UO0x9aETSnOkL7=473mX0wrt+ueuB9UgOJaf+N0p7gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, nathan@kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
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

On Wed, Mar 22, 2023 at 11:26=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Feb 24, 2023 at 7:58=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:
> >
> > Alexandre Ghiti <alex@ghiti.fr> writes:
> >
> > > +cc linux-kbuild, llvm, Nathan, Nick
> > >
> > > On 2/15/23 15:36, Alexandre Ghiti wrote:
> > >> From: Alexandre Ghiti <alex@ghiti.fr>
> > >>
> > > I tried a lot of things, but I struggle to understand, does anyone ha=
ve
> > > any idea? FYI, the same problem happens with LLVM.
>
> Off the top of my head, no idea.
>
> (Maybe as a follow up to this series, I wonder if pursuing
> ARCH_HAS_RELR for ARCH=3Driscv is worthwhile?)

(I had thought about this for my own fun, but the currently only
implementation arch/arm64/kernel/head.S uses assembly.
Every port needs to write some assembly for the same task, which is a pity.
In FreeBSD rtld, glibc, and musl, DT_RELR code is target-independent.)


> >
> > Don't ask me *why*, but adding --emit-relocs to your linker flags solve=
s
> > "the NULL .rela.dyn" both for GCC and LLVM.
> >
> > The downside is that you end up with a bunch of .rela cruft in your
> > vmlinux.
>
> There was a patch just this week to use $(OBJCOPY) to strip these from
> vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
> https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/
> --
> Thanks,
> ~Nick Desaulniers
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
