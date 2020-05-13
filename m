Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FEE1D1B1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2020 18:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389599AbgEMQdn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 May 2020 12:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgEMQdn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 12:33:43 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84E1C061A0C;
        Wed, 13 May 2020 09:33:42 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id j3so240348ilk.11;
        Wed, 13 May 2020 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=s1lBbWECS5IwE3IeUZjyhM1ZXxahSFoW3FrHXLj/HpU=;
        b=pQuBIWh3mzzQZB+43EIVfTKnn7N3VSa4dHI0Cu+zzeVkHsG2ht6OeCjXixZtHrzS3W
         VjkRDL+gUvs/58Wly4/yPkRCq83SuYuNCXeu0BLENwcaUUwjftTtZpHHl+Ne5ZGVNfGF
         iIFmmXj/5ZtYXVnLYKCubZNR0FqfO07t06TjU1mf5MPEX64ECmrktmYsuHdoC/qec24j
         /DbqYh1bOhnhdk8wkBedESeYquNo2/bkvHTSt7xUdnnQ+EBKxXNECEBdQc8CoV1ey56g
         nXNCFExDjQPtjLdYq2UZsECD+1jgFjxYro2TgrUTZs8zEmzo9K+piTgyNuMiK/GEJnQW
         V6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=s1lBbWECS5IwE3IeUZjyhM1ZXxahSFoW3FrHXLj/HpU=;
        b=B+JbRxFfNkaJUr/uf159wCj1DDHDe6VzTCWwyR27f9WGx3ZIxk3CGs9Elq/cpIpPQJ
         wKwt0gHDTFrsRMJq1xtgYdzkTUqBeZI7PlOPmMZw5fUScmpGeEnmhmHVgdfApWr+az4V
         f6wSD58z+zoBmyFBly0TgE3mzKxn/Q9B6neQ4rPGqYXugWmI6392wTtBTyec9GcYOtL4
         +ZQ1Z26U6SG88iIvIfCyIE4Klsk7BIdqzK+f+UFuvpMcAKbaldOu87LJsPYCsCLDf+oE
         vZT+IC/2LYyxrITJK38b5dQhKK2QjAlGaOx7Mih3T7Y62xQ9x2OA1ONHWxVxFiQZM0lW
         Dg5Q==
X-Gm-Message-State: AOAM533s8V0BQqMXRMn0Lc5inEaQ/SlqIMmMu12z4cx2NhEu1FTbKtsE
        QFyhjdUzwaYIPvf4pxDqDTafabLdFgR2EcZ+WHk=
X-Google-Smtp-Source: ABdhPJwxfphddCpUB9hXDPWmGIrIF4zunHFBgZWBofCeO9kPGqIS2d7FLMfTphgRor5KuWloT3TETMhfcnw7U5Rl+To=
X-Received: by 2002:a92:3652:: with SMTP id d18mr304019ilf.212.1589387622176;
 Wed, 13 May 2020 09:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com> <CAK7LNATm2r9pH7i=pe3e7WvNmumGnivn05J+Mz10DzrzB8i=hw@mail.gmail.com>
In-Reply-To: <CAK7LNATm2r9pH7i=pe3e7WvNmumGnivn05J+Mz10DzrzB8i=hw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 13 May 2020 18:33:30 +0200
Message-ID: <CA+icZUUzLORp_TvDZiLO4WOdwEHTZF9vpi9BTHwQm-S3KDtMBw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 13, 2020 at 4:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Nick,
>
> On Wed, May 13, 2020 at 4:23 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > > > ><nick.desaulniers@gmail.com> wrote:
> > > > >>
> > > > >> As debug information gets larger and larger, it helps significantly save
> > > > >> the size of vmlinux images to compress the information in the debug
> > > > >> information sections. Note: this debug info is typically split off from
> > > > >> the final compressed kernel image, which is why vmlinux is what's used
> > > > >> in conjunction with GDB. Minimizing the debug info size should have no
> > > > >> impact on boot times, or final compressed kernel image size.
> > > > >>
> > > Nick,
> > >
> > > I am OK with this patch.
> > >
> > > Fangrui provided the minimal requirement for
> > > --compress-debug-sections=zlib
> > >
> > >
> > > Is it worth recording in the help text?
> > > Do you want to send v2?
> >
> > Yes I'd like to record that information.  I can also record Sedat's
> > Tested-by tag.  Thank you for testing Sedat.
> >
> > I don't know what "linux-image-dbg file" are, or why they would be
> > bigger.  The size of the debug info is the primary concern with this
> > config.  It sounds like however that file is created might be
> > problematic.
>
>
>
> As Sedat explained, deb package data
> is compressed by xz, which is default.
>
> You can use another compression method,
> or disable compression if you desire.
>
>
>
> "man dpkg-deb" says as follows:
>
>  -Zcompress-type
>       Specify which compression type to use when building a package.
>       Allowed  values  are  gzip,  xz  (since  dpkg  1.15.6), and none
>       (default is xz).
>
>
>
> Kbuild supports KDEB_COMPRESS variable
> to change the compression method.
> See line 46 of scripts/package/builddeb.
>

Hi Masahiro,

thanks for the clarification and the informations.

With next RC I will add KDEB_COMPRESS=gzip to my build-script and report.

Regards,
- Sedat -

>
> If you are interested,
> try "make bindeb-pkg" with/without CONFIG_DEBUG_INFO_COMPRESSED,
> and compare the size of the generated debug package.
>
>
>
>
> As Sedat stated,
>
> (plain data) -> compress by gzip  ->  compress by xz
>
>    is often less efficient than
>
> (plain data) -> compress by xz
>
>
>
> I hope this is clearer.
>
>
>
>
>
>
>
>
> > Fangrui, I wasn't able to easily find what version of binutils first
> > added support.  Can you please teach me how to fish?
> >
> > Another question I had for Fangrui is, if the linker can compress
> > these sections, shouldn't we just have the linker do it, not the the
> > compiler and assembler?  IIUC the debug info can contain relocations,
> > so the linker would have to decompress these, perform relocations,
> > then recompress these?  I guess having the compiler and assembler
> > compress the debug info as well would minimize the size of the .o
> > files on disk.
> >
> > Otherwise I should add this flag to the assembler invocation, too, in
> > v2.  Thoughts?
> >
> > I have a patch series that enables dwarf5 support in the kernel that
> > I'm working up to.  I wanted to send this first.  Both roughly reduce
> > the debug info size by 20% each, though I haven't measured them
> > together, yet.  Requires ToT binutils because there have been many
> > fixes from reports of mine recently.
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Best Regards
> Masahiro Yamada
