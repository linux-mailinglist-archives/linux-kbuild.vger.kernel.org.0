Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2B733C928
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 23:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCOWNV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 18:13:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41990 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCOWNG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 18:13:06 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1A82316;
        Mon, 15 Mar 2021 23:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615846385;
        bh=73c9i3x/pZaVNcLHX/PwQ73wX2ErVRnjivgwz2iKHoQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ckPK2DNP7sWGYN/x56bTYCBuTD8ctf1HNtCkv9MBhmpsk7nmxgeIvWAJQ14j4Xp5A
         JUFt+lWapV4xAlJl9uK9wRD8/yd1qeKlQtsNg3NGO0McyNmZC60rYFAYxq3XFkWNnQ
         HcteAA9/OoWaIEl1afjlYJ7l/1A1wXXaKmQNKL/E=
Date:   Tue, 16 Mar 2021 00:12:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <YE/bzbU4jbgd6uNW@pendragon.ideasonboard.com>
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
 <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Tue, Mar 16, 2021 at 02:43:45AM +0900, Masahiro Yamada wrote:
> On Mon, Mar 15, 2021 at 3:40 PM Viresh Kumar wrote:
> > On 14-03-21, 20:16, Frank Rowand wrote:
> > > On 3/12/21 11:11 PM, Frank Rowand wrote:
> > > > On 3/12/21 1:13 AM, Viresh Kumar wrote:
> > > >> On 12-03-21, 01:09, Frank Rowand wrote:
> > > >>> I suggested having the .dtso files include the .dts file because that is a relatively
> > > >>> small and easy change to test.  What would probably make more sense is the rename
> > > >>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
> > > >>> file create a new .dts file that #includes the corresponding .dtso file.  This is
> > > >>> more work and churn, but easier to document that the .dts files are a hack that is
> > > >>> needed so that the corresponding .dtb.S files will be generated.
> > > >>
> > > >> What about creating links instead then ?
> > > >>
> > > >
> > > > I don't really like the idea of using links here.
> > > >
> > > > Maybe it is best to make the changes needed to allow the unittest
> > > > overlays to be .dtso instead of .dts.
> > > >
> > > > Off the top of my head:
> > > >
> > > >   scripts/Makefile.lib:
> > > >      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
> > > >      overlay data in section .dtb.init.rodata, with a label
> > > >      pointing to the beginning of the overlay __dtb_XXX_begin and
> > > >      a label pointing to the end of the overlay __dtb_XXX_end,
> > > >      for the overlay named XXX.  I _think_ that you could simply
> > > >      add a corresponding rule for %.dtbo.S using a new command
> > > >      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
> > > >      __dtbo_XXX_begin and __dtbo_XXX_end).
> > >
> > > If you do the above, please put it in drivers/of/unittest-data/Makefile
> > > instead of scripts/Makefile.lib because it is unittest.c specific and
> > > not meant to be anywhere else in the kernel.
> >
> > What about doing this then in unittest's Makefile instead (which I
> > already suggested earlier), that will make everything work just fine
> > without any other changes ?
> >
> > +# Required for of unittest files as they can't be renamed to .dtso
> > +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> > +       $(call if_changed_dep,dtc)
> >
> 
> If those rules are only needed by drivers/of/unittest-data/Makefile,
> they should not be located in scripts/Makefile.lib.
> 
> But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
> if these are doing bad things.
> They seem to be overlay files even though the file name suffix is .dts

That is correct, they are overlays. I have no issue with those files
being renamed to .dtso if that can help (but I haven't checked if that
would have any adverse effect on the R-Car DU driver).

These files are there to ensure backward compatibility with older DT
bindings. The change was made 3 years ago and I wouldn't object to
dropping this completely, but I understand I may not be the most
cautious person when it comes to ensuring DT backward compatibility :-)

> $ find drivers -name '*.dts'
> drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
> drivers/staging/mt7621-dts/gbpc2.dts
> drivers/staging/mt7621-dts/gbpc1.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> drivers/of/unittest-data/overlay_1.dts
> drivers/of/unittest-data/testcases.dts
> drivers/of/unittest-data/overlay_bad_add_dup_node.dts
> drivers/of/unittest-data/overlay_bad_symbol.dts
> drivers/of/unittest-data/overlay_0.dts
> drivers/of/unittest-data/overlay_11.dts
> drivers/of/unittest-data/overlay_gpio_03.dts
> drivers/of/unittest-data/overlay_gpio_04a.dts
> drivers/of/unittest-data/overlay_gpio_04b.dts
> drivers/of/unittest-data/overlay_5.dts
> drivers/of/unittest-data/overlay_bad_add_dup_prop.dts
> drivers/of/unittest-data/overlay_gpio_01.dts
> drivers/of/unittest-data/overlay_10.dts
> drivers/of/unittest-data/overlay_7.dts
> drivers/of/unittest-data/overlay_bad_phandle.dts
> drivers/of/unittest-data/overlay_3.dts
> drivers/of/unittest-data/overlay_6.dts
> drivers/of/unittest-data/overlay_8.dts
> drivers/of/unittest-data/overlay_12.dts
> drivers/of/unittest-data/overlay_gpio_02a.dts
> drivers/of/unittest-data/overlay_gpio_02b.dts
> drivers/of/unittest-data/overlay_4.dts
> drivers/of/unittest-data/overlay.dts
> drivers/of/unittest-data/overlay_9.dts
> drivers/of/unittest-data/overlay_2.dts
> drivers/of/unittest-data/overlay_15.dts
> drivers/of/unittest-data/overlay_base.dts
> drivers/of/unittest-data/overlay_13.dts

-- 
Regards,

Laurent Pinchart
