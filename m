Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E4C2FD480
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 16:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731520AbhATPsb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 10:48:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390990AbhATPs0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 10:48:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D31F823381;
        Wed, 20 Jan 2021 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157666;
        bh=2MocRlRCh66dE3X3CN+d7WGNSYOcv0cdbsXGp0jK/TI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G7g8/XwFmDSefIYQ0/hM5DG32luuviYnhxsvGyyvqH71drjwgOnxl7cnq6qSETStC
         rgI/qBfGvFezKi/tXapt2RaP5X88f8g4Dey5uctSOrl24zJVMoru1W+KwuI5dWXwj1
         074UBRLKcvc9cYYLY4vvyJYdKeivIIU9uTo24gArf5cGeisFOOhO/obuB3uLPo+j0S
         3QI5hO4J0eR2275CxpTFc4VJzRdJ0w9MC5roUONYAOjGktXjA+zVDehx6ByFTjw0kc
         7Oth2N+RPvveGHovy8Jrtf5S38e4hz0rQ80CSNMKTL+6rGCUDC7jETT1Z0o8POUZwa
         w+lKYjI19qjTQ==
Received: by mail-ed1-f46.google.com with SMTP id p22so26282235edu.11;
        Wed, 20 Jan 2021 07:47:45 -0800 (PST)
X-Gm-Message-State: AOAM532LVsSG+M5mvFEs8qO89GP5yue/+SN+8hLc/xJu5p/d5qjNtcds
        bTi1sgAVdfTjLEUHwuv1O/eBymILXSKh9LMx9A==
X-Google-Smtp-Source: ABdhPJyv5rSn8gpQeUE47l+JvQKQMeSPtNSNnL82x0WlBAb+tiv+uDDVZYOK9w4R3yR9mLRvZq3e6YHT2ajWnLZroDo=
X-Received: by 2002:a50:e78b:: with SMTP id b11mr7795479edn.165.1611157664395;
 Wed, 20 Jan 2021 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610431620.git.viresh.kumar@linaro.org> <facca66aba8070ef8bdb075ec442287c81e7d23e.1610431620.git.viresh.kumar@linaro.org>
 <c77e66ee-5553-123a-7ec7-bf3d9e3cebd1@gmail.com>
In-Reply-To: <c77e66ee-5553-123a-7ec7-bf3d9e3cebd1@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 Jan 2021 09:47:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+NkV1-yrWKrP+OAChekMV81h2hk12xADkeGUvmwi9DgQ@mail.gmail.com>
Message-ID: <CAL_Jsq+NkV1-yrWKrP+OAChekMV81h2hk12xADkeGUvmwi9DgQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] scripts: dtc: Build fdtoverlay tool
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 19, 2021 at 12:28 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> Hi Viresh,
>
> I made these comments in the v2 patch series.  I am copying them here since
> this is the current version.
>
> On 1/12/21 2:29 AM, Viresh Kumar wrote:
> > We will start building overlays for platforms soon in the kernel and
> > would need fdtoverlay going forward. Lets start building it.
> >
> > The fdtoverlay program applies (or merges) one ore more overlay dtb
> > blobs to a base dtb blob. The kernel build system would later use
> > fdtoverlay to generate the overlaid blobs based on platform specific
> > configurations.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  scripts/dtc/Makefile | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > index 4852bf44e913..5f19386a49eb 100644
> > --- a/scripts/dtc/Makefile
> > +++ b/scripts/dtc/Makefile
> > @@ -1,13 +1,17 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # scripts/dtc makefile
> >
> > -hostprogs-always-$(CONFIG_DTC)               += dtc
> > +hostprogs-always-$(CONFIG_DTC)               += dtc fdtoverlay
> >  hostprogs-always-$(CHECK_DT_BINDING) += dtc
> >
> >  dtc-objs     := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
> >                  srcpos.o checks.o util.o
> >  dtc-objs     += dtc-lexer.lex.o dtc-parser.tab.o
> >
>
> # The upstream project builds libfdt as a separate library.  We are choosing to
> # instead directly link the libfdt object files into fdtoverly
>
> > +libfdt-objs  := fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> > +libfdt               = $(addprefix libfdt/,$(libfdt-objs))
> > +fdtoverlay-objs      := $(libfdt) fdtoverlay.o util.o
> > +
> >  # Source files need to get at the userspace version of libfdt_env.h to compile
> >  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> >
> >
>
> In general, I am a proponent of using shared libraries (which the upstream project
> builds by default) because if a security bug in the library is fixed, it is fixed
> for all users of the library.
>
> In this specific case, I actually prefer the implementation that the patch provides
> (directly linking the library object files into fdtoverlay, which uses the library)
> because it is the only user of the library _and_ fdtoverlay will not inadvertently
> use the system wide libfdt if it happens to be installed (as it is on my system).
>
> Any thoughts on this Rob?

I agree. No point in complicating the build to do a library.

Rob
