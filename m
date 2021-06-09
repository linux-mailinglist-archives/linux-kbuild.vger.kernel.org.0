Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C2B3A1E22
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 22:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhFIUeN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 16:34:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhFIUeN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 16:34:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A60A613E7;
        Wed,  9 Jun 2021 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623270738;
        bh=4qm710P1OA7OMkhtekLyDnYLYqBDjd2xZMqBkTiCI0M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WoTt84HjYglUozilmslANiazVDWPu5yAcLaVyUypcu20rt/Euw6u1AFG3rSkEbU2P
         558HVVpdf4NxS0elCOfKro9hKTEhpE3MgOoNvliX54WpvnoHWFizrepum+fH0/UlPS
         AjrybK8Zs6r4w11XUNhKKOEjJ47UGFI8plHZ8j5CeXHQ2lrFr20t1eWgluLXyIwE2I
         vCRDLbKPSTcYfPOz8Vy+SVhVgvh7u96mb7+SLwxslDJrh0JvqnDSqEbAXegZP5i8Tr
         zSRM9yT3DGw504n5gfyab8qcUrXnf1MPGtEnl1I6Tu50acNl6HBYMH56+MWHMLQZGb
         w9UN0ORcLrPTA==
Received: by mail-wm1-f52.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso5134098wmg.2;
        Wed, 09 Jun 2021 13:32:18 -0700 (PDT)
X-Gm-Message-State: AOAM5312KDIsc7Dr0FNp6FCKhGnE007HMz/bLGghLBi5ozl9tNceZR+W
        ikZ1lEKNIlaxV8lXfAMlXzU810bwOSPcmypZYCs=
X-Google-Smtp-Source: ABdhPJwlus2qHqqCkFXB+s9csz65yb5XSvAC7T2VMudFzXDC4H204isL2RHS+4WMtFutJw8Hf3GlwvbSCvGXMB+aRks=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr11423781wmc.120.1623270736992;
 Wed, 09 Jun 2021 13:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210204152957.1288448-1-arnd@kernel.org> <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
 <20210609151608.GA3389541@roeck-us.net> <20210609191553.GA2535199@roeck-us.net>
In-Reply-To: <20210609191553.GA2535199@roeck-us.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Jun 2021 22:30:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com>
Message-ID: <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        mfaltesek@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 9, 2021 at 9:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Jun 09, 2021 at 08:16:11AM -0700, Guenter Roeck wrote:
> > > I suppose we could improve the situation if scripts/link-vmlinux.sh was able
> > > to do that automatically, and compare the kallsyms output .S file between
> > > steps 1 and 2.
> >
> > Comparing the .S files doesn't result in useful data; turns out there are
> > always irrelevant differences. We'll try to run a diff on the output of
> > "objdump --syms". Hopefully that will generate something useful.
> >
>
> Turns out it wasn't that useful.
>
> chromeos-kernel-5_10-5.10.42-r406: Symbol file differences:
> chromeos-kernel-5_10-5.10.42-r406: 7c7
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000325c8 g       .rodata   0000000000000000 kallsyms_relative_base
> chromeos-kernel-5_10-5.10.42-r406: ---
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c0 g       .rodata   0000000000000000 kallsyms_relative_base
> chromeos-kernel-5_10-5.10.42-r406: 9,13c9,13
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d0 g       .rodata   0000000000000000 kallsyms_num_syms
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000325d8 g       .rodata   0000000000000000 kallsyms_names
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000cd7f0 g       .rodata   0000000000000000 kallsyms_markers
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000cdb18 g       .rodata   0000000000000000 kallsyms_token_table
> chromeos-kernel-5_10-5.10.42-r406: < 00000000000cde78 g       .rodata   0000000000000000 kallsyms_token_index
> chromeos-kernel-5_10-5.10.42-r406: ---
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000325c8 g       .rodata   0000000000000000 kallsyms_num_syms
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000325d0 g       .rodata   0000000000000000 kallsyms_names
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000cd7d8 g       .rodata   0000000000000000 kallsyms_markers
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000cdb00 g       .rodata   0000000000000000 kallsyms_token_table
> chromeos-kernel-5_10-5.10.42-r406: > 00000000000cde60 g       .rodata   0000000000000000 kallsyms_token_index
>
> I thought I'd see the added symbols, but it looks like the only difference
> between the two files is the addresses.
>
> What am I missing ?

I probably misremembered the part about 'objdump --syms' and there was
something more to it.

Maybe this was the last version before converging? It looks like the '<' version
has one extra symbol ompared to the '>' version. The diff has no context, but I
assume the first symbol that has a different size is 'kallsyms_offsets', which
is generated by kallsyms.

I see that link-vmlinux.sh already compares the System.map files, using
"cmp -s System.map .tmp_System.map", which is roughly the same as the
objdump --syms diff you got, so comparing these files probably doesn't
help either. However, comparing the .tmp_System.map file with the previous
version might reveal the problem. This might need another step to filter out
the address and only compare the symbol names.

      Arnd
