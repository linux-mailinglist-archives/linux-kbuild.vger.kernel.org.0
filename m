Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1E73193F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 21:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBKUIE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 15:08:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:42478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230315AbhBKUGe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 15:06:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FD3A64E56;
        Thu, 11 Feb 2021 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073949;
        bh=J3OjsRR/EFCpgr5E1RGuPP8NVmShsvyMuey5Yd5flQo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vHIwuYixkcXmydjNAQ0ZbJgg4q7K4440VsMUpCH2URDxWrAWM7eWJvasHh4jv+WHU
         qpx7fuWFmUK3jehNOCX0vgUZOC6PlO3Q8dcbJstzRK75RcgnW27GOXCvD0LQJsNt18
         UrRoPvGvKG3xdDjcOJld7W5Xvt9JI0cB8hJNsu9qKK3F+b2TcvzIupWJp+HXgbcp52
         lSCrUT2d1Cy7uOaMWBXCSVpPs275f7xxjneCxfyhjRlbz29/2B2ciCN9ShpgPLXt9w
         FBWgT5AeAVYLwjS+qfcjxvgxkY7ce1+oGoCyZzTh/QlOKEMbRiHye1R5uAwjVXYnfv
         wjqTqOSrC941g==
Received: by mail-ej1-f41.google.com with SMTP id a9so11966064ejr.2;
        Thu, 11 Feb 2021 12:05:49 -0800 (PST)
X-Gm-Message-State: AOAM532ZQV4rnlhMHdPudEL9CZOSMaFp9mA6XqOsanLllJIYwEcK8but
        geIM1dO93XuPsbHcZ/FZRg7/67+B0ZTI/61S5A==
X-Google-Smtp-Source: ABdhPJwTcXAsCnv7YzmD2LNO8xfdbS4rMuQuZymW1Aig86uNJ22BYrtXIHWbatqKKQkk2xi+AlLo1RmhClMHeseHQ/w=
X-Received: by 2002:a17:906:57cd:: with SMTP id u13mr10134515ejr.341.1613073947801;
 Thu, 11 Feb 2021 12:05:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612955268.git.viresh.kumar@linaro.org> <44dad578df8a848fc378cd358f03b071f44c9a5b.1612955268.git.viresh.kumar@linaro.org>
 <CAK7LNARa8GzhhvZWV_KAW=MC0DRcSsfPsQ-KTBRRpbBgBqY=ig@mail.gmail.com>
In-Reply-To: <CAK7LNARa8GzhhvZWV_KAW=MC0DRcSsfPsQ-KTBRRpbBgBqY=ig@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 11 Feb 2021 14:05:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHUG6VvvpQ18YdzsOA_gZ59gFsc2tUzt1SxKHsO2A03g@mail.gmail.com>
Message-ID: <CAL_JsqKHUG6VvvpQ18YdzsOA_gZ59gFsc2tUzt1SxKHsO2A03g@mail.gmail.com>
Subject: Re: [PATCH V7 1/3] kbuild: Add generic rule to apply fdtoverlay
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 11, 2021 at 12:28 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 10, 2021 at 8:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > From: Rob Herring <robh@kernel.org>
> >
> > Add a generic rule to apply fdtoverlay in Makefile.lib, so every
> > platform doesn't need to carry the complex rule.
> >
> > The platform's Makefile only needs to have this now:
> >
> >  DTC_FLAGS_foo_base += -@
> >  foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
> >  overlay-y := foo.dtb
>
>
> Please reuse dtb-y instead of introducing the new
> overlay-y syntax, that is,
>
> foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
> dtb-y := foo.dtb

That's what I had, but I believe Viresh changed this because we don't
want to run schema checks on foo.dtb (as foo.dts doesn't exist).
However, we should be able to filter those out using something similar
to technique used for multi-used-y and real-obj-y. We just need to
drop composite entries when creating the .dt.yaml list.

> This resembles to composite modules.
>
> foo-objs := foo1.o foo2.o foo3.o
> obj-m := foo.o
>
>
>
>
>
> > Rearrange Makefile.lib to keep DT specific stuff together.

Would be better if you do this in a separate patch or not at all. It
was sorted more by the type of operation, than the target. Also, we
also already have one conflict in linux-next with changing extra- to
always-, let's not make it worse or this will be 5.13 for sure.

> > The files from overlay-y (i.e. files generated by fdtoverlay) aren't
> > added to dtb-y here, as dtb-y is later used to generate .dt.yaml files
> > and the files in overlay-y don't have a corresponding dts file and make
> > dtbs_check fails for them.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [ Viresh: Add commit log and replace dtb-y with overlay-y, handle
> >           CONFIG_OF_ALL_DTBS case, rearrange Makefile, don't add
> >           overlay-y to dtb-y to skip dtbs_check for them. ]
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  scripts/Makefile.lib | 39 +++++++++++++++++++++++++++------------
> >  1 file changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index b00855b247e0..a6e79e3be527 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -66,23 +66,16 @@ multi-used   := $(multi-used-y) $(multi-used-m)
> >  real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
> >  real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
> >
> > -always-y += $(always-m)
> > -
> > -# hostprogs-always-y += foo
> > -# ... is a shorthand for
> > -# hostprogs += foo
> > -# always-y  += foo
> > -hostprogs += $(hostprogs-always-y) $(hostprogs-always-m)
> > -always-y += $(hostprogs-always-y) $(hostprogs-always-m)
> > -
> > -# userprogs-always-y is likewise.
> > -userprogs += $(userprogs-always-y) $(userprogs-always-m)
> > -always-y += $(userprogs-always-y) $(userprogs-always-m)
> > +# Add base dtb and overlay dtbo
> > +dtb-y += $(foreach m,$(overlay-y), $(if $(strip $($(m:.dtb=-dtbs))),$($(m:.dtb=-dtbs)),))
> > +dtb-$(CONFIG_OF_ALL_DTBS) += $(foreach m,$(overlay-), $(if $(strip $($(m:.dtb=-dtbs))),$($(m:.dtb=-dtbs)),))
> >
> >  # DTB
> >  # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
> >  extra-y                                += $(dtb-y)
> > +extra-y                                += $(overlay-y)
> >  extra-$(CONFIG_OF_ALL_DTBS)    += $(dtb-)
> > +extra-$(CONFIG_OF_ALL_DTBS)    += $(overlay-)
> >
> >  ifneq ($(CHECK_DTBS),)
> >  extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> > @@ -91,6 +84,19 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> >  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
> >  endif
> >
> > +always-y += $(always-m)
> > +
> > +# hostprogs-always-y += foo
> > +# ... is a shorthand for
> > +# hostprogs += foo
> > +# always-y  += foo
> > +hostprogs += $(hostprogs-always-y) $(hostprogs-always-m)
> > +always-y += $(hostprogs-always-y) $(hostprogs-always-m)
> > +
> > +# userprogs-always-y is likewise.
> > +userprogs += $(userprogs-always-y) $(userprogs-always-m)
> > +always-y += $(userprogs-always-y) $(userprogs-always-m)
> > +
> >  # Add subdir path
> >
> >  extra-y                := $(addprefix $(obj)/,$(extra-y))
> > @@ -332,6 +338,15 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> >  $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> >         $(call if_changed_dep,dtc)
> >
> > +
> > +quiet_cmd_fdtoverlay = DTOVL   $@
> > +      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(real-prereqs)
> > +
> > +.SECONDEXPANSION:
> > +
> > +$(obj)/%.dtb: $$(addprefix $$(obj)/,$$(%-dtbs)) FORCE
> > +       $(call if_changed,fdtoverlay)
> > +
>
>
>
> Please do not use .SECONDEXPANSION.
>
> This will parse the Makefile twice
> in _all_ directories, while only a few
> directories use the overlay-y syntax.
>
>
> Use the multi_depend macro.

I knew you'd have a better way.

Rob
