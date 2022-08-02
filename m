Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14362587680
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Aug 2022 06:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbiHBE4z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 00:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbiHBE4y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 00:56:54 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABB427FC2
        for <linux-kbuild@vger.kernel.org>; Mon,  1 Aug 2022 21:56:52 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l9-20020a056830268900b006054381dd35so9605849otu.4
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Aug 2022 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/DNm5z+T5vJx1r2SUsHpauC1vXYlnGi8hqsGThWGfWg=;
        b=O/Rzz34M7G0I63oDVHhuLPnS1uTpQ23XzylGQBzraYLlcnYlhnXfMGGOIeKC9kQ5H1
         I/H+UyV0bHrAvuC1ZX4IxlCwLcW+AcxO0VvKhFwb5u/77/HkcjFdaBcfcPPfiVP/J7Gr
         dA7KvjGzK/8aB4a1beiPhF8R63lox2HjEMlIjcoiMgfdLrBTFoc3lOpLryByaSOpGs5F
         LciQ8U6q4brTLUD0/6r+JxpzUXOh3ip4AFoZApd2HAUucb9mDCLrchlL1vY1fU9ItFTc
         vL7+6PIXensHNleOGrmIvcYkWz6ogLHQUmJNvgi5stS3T7zuSsyjSR/Q49Be8tDIUOEf
         vS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/DNm5z+T5vJx1r2SUsHpauC1vXYlnGi8hqsGThWGfWg=;
        b=vauL4lwbwumDfpY7BPcS80Gt+BQreewhlhhcDUXxy4xJ54ag/8FwEVp23gAGxijfiC
         Ipc2SEzyd89iUIsWqasoL3mq26b/MnA4A0afucW5QHnFQW+kuH8AgGhN4WgvihJrT5Ym
         XX6AJ+F9daSrK9Ly29L+lrERwgMAmZXJX519HvhnbkS1oFps55WnZsIg7Q4/sO/DyuUq
         iQaOtQ+9hqa3BHZbcLrQdnRaH2xPAU5RfU+RgUvSD49KHVhEpYkA/wyAjiI1sXdCoHVj
         p6HIBDWB7swu1LjIgaDg5t+CwjvTcIQpsvFE7QzawOcXP/UOqai7d6egFKLG131jLrXr
         6KrA==
X-Gm-Message-State: ACgBeo3VMJ5o3TBg3R6teuiTgh8FiBbIUU0fhuv6POZruAADCGf+vT2z
        VzOrz94XDYJrprOBNxrFSfTZTcCSLXulpCynyafI6yTH
X-Google-Smtp-Source: AA6agR5I1A8Ul6ZCwIf8lIHiYXvi/TLd3Q24ceKNFyMc8hbpuEswGd6PNQzK+HM8MEge4H9y/Ca3eLGK/9z/ENCZoPE=
X-Received: by 2002:a9d:2c2a:0:b0:62a:129f:305e with SMTP id
 f39-20020a9d2c2a000000b0062a129f305emr3622287otb.86.1659416211996; Mon, 01
 Aug 2022 21:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsBwZdDhcKjnC0=COU7B+kM8vuRjPv_znZ5=p3k+QCONg@mail.gmail.com>
 <CAK7LNAQpTBtfnCGpO2O+w--=DPNJL14y+2Xc7GimH1j2qyd2SA@mail.gmail.com>
In-Reply-To: <CAK7LNAQpTBtfnCGpO2O+w--=DPNJL14y+2Xc7GimH1j2qyd2SA@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Mon, 1 Aug 2022 21:56:41 -0700
Message-ID: <CAGRSmLvVwZNnG-3CBeX+QuLbX9B72gABBCpSP2XfdM3pLEJhxA@mail.gmail.com>
Subject: Re: kbuild self-created module file errors with: ERROR: modpos:
 missing MODULE_LICENSE
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The source module has it.  This is a library that is built and to
build it, the makefile needed the obj-m:=junk.o item, when the error
comes up, it points to junk as the problem file.  I tried just copying
my own junk.mod.c but it appears its always overwritten.   I just
patched the kernel to go back to a warning instead of error and now
it's all working fine.

On Sun, Jul 31, 2022 at 9:16 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Aug 1, 2022 at 2:16 AM David F. <df7729@gmail.com> wrote:
> >
> > Years ago I set up a series of makefiles and bash scripts to build
> > both a support library for kernel modules and my own kernel modules.
> > Now years later, I don't recall much about how all this works but it
> > has until moving to 5.15 (from 5.10. kernels).  Although, there was an
> > issue with it not supporting libraries at some upgrade point, but this
> > list helped me with a patch so it would build the .a libraries and
> > link with them.
> >
> > Looking at the makefile for building the library it has a note that I
> > needed to set up a fake obj-m for it to actually build the library.
> > So what I have is:
> >
> > # Setup module name for kbuild
> > obj-m:=junk.o
> > junk-objs:=lib.a
> >
> > There is no reference to any junk_mod.c file, it appears kbuild
> > automatically creates the junk-mod.c file itself.   The problem is the
> > build now fails due to the:
> > ERROR: modpost: missing MODULE_LICENSE() in /.../junk.obj
> >
> > Is there some other makefile option to make kbuild set the
> > MODULE_LICENSE() or perhaps ignore it since it's not needed in this
> > type of case?
>
>
> You need to add MODULE_LICENSE()
> somewhere in your module source code.
>
>
>
>
>
>
>
> >
> > Or should I take this junk.mod.c file and now modify it and then
> > actually copy it over as the actual source to use to force the library
> > to be created?
> >
> > Thanks!!
>
>
>
> --
> Best Regards
> Masahiro Yamada
