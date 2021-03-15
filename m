Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AEC33C4ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 18:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhCOR4E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 13:56:04 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27741 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCORsk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 13:48:40 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12FHiMgi024481;
        Tue, 16 Mar 2021 02:44:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12FHiMgi024481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615830263;
        bh=KNyDKKgxnqSVpV4t4S2247pneiCYUCh4fjqdyjwwm+0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=seT7XqgbfoC6y++lDPEj8oAN80IX9tbKc6DfHtGjpaMMT+8TVxx2r9iXQZwUXvPw6
         ghmfK6nRCc5n2VtqpV/MD0LADAyj9GEDl8zxjTIxnhdXbhgOSBKimejiuwijHhX+wg
         a4iRsTWj5h6ogMFKnHSt7w5qtGsFW66TdYqqJKskQJ1hT78TePKTn+DdC36xE1hZmf
         26SDLR9UOeyPV7vYKyRbBRkJ1Q57lIRGsrFZNFgvtSSTW6Igz6sN0zFUipEuVO9fu2
         PzjGrSvx5SwfXj9ybm6mBrtLShp5PYGUxISSHkPtLUSRqLQJOaFvHdIWHDKvN8UuVT
         fSGqToqD5C7WA==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so14801697pjb.0;
        Mon, 15 Mar 2021 10:44:23 -0700 (PDT)
X-Gm-Message-State: AOAM531/qZtMJpGYHcnjdi+Q5PgM5rjYWJVKLn4OnVirfu1ZvDIu7hqP
        69agBRvnjnE855k6g3YQJXNSyQaJ1o3b/9+SDAs=
X-Google-Smtp-Source: ABdhPJxIBVrlOLJYXkXSSEqOrvs/bPM3LRRLcdZo/fpVfVvTXjWlEww6ZKBbbaBiyMpi53jIpTMo8ZxOpAUgLVpu2/Y=
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id
 a9-20020a170902b589b02900e62875aa4cmr12686472pls.71.1615830262408; Mon, 15
 Mar 2021 10:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615354376.git.viresh.kumar@linaro.org> <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7> <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com> <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com> <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
In-Reply-To: <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Mar 2021 02:43:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
Message-ID: <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 15, 2021 at 3:40 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 14-03-21, 20:16, Frank Rowand wrote:
> > On 3/12/21 11:11 PM, Frank Rowand wrote:
> > > On 3/12/21 1:13 AM, Viresh Kumar wrote:
> > >> On 12-03-21, 01:09, Frank Rowand wrote:
> > >>> I suggested having the .dtso files include the .dts file because that is a relatively
> > >>> small and easy change to test.  What would probably make more sense is the rename
> > >>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
> > >>> file create a new .dts file that #includes the corresponding .dtso file.  This is
> > >>> more work and churn, but easier to document that the .dts files are a hack that is
> > >>> needed so that the corresponding .dtb.S files will be generated.
> > >>
> > >> What about creating links instead then ?
> > >>
> > >
> > > I don't really like the idea of using links here.
> > >
> > > Maybe it is best to make the changes needed to allow the unittest
> > > overlays to be .dtso instead of .dts.
> > >
> > > Off the top of my head:
> > >
> > >   scripts/Makefile.lib:
> > >      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
> > >      overlay data in section .dtb.init.rodata, with a label
> > >      pointing to the beginning of the overlay __dtb_XXX_begin and
> > >      a label pointing to the end of the overlay __dtb_XXX_end,
> > >      for the overlay named XXX.  I _think_ that you could simply
> > >      add a corresponding rule for %.dtbo.S using a new command
> > >      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
> > >      __dtbo_XXX_begin and __dtbo_XXX_end).
> >
> > If you do the above, please put it in drivers/of/unittest-data/Makefile
> > instead of scripts/Makefile.lib because it is unittest.c specific and
> > not meant to be anywhere else in the kernel.
>
> What about doing this then in unittest's Makefile instead (which I
> already suggested earlier), that will make everything work just fine
> without any other changes ?
>
> +# Required for of unittest files as they can't be renamed to .dtso
> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +       $(call if_changed_dep,dtc)
>
> --
> viresh


If those rules are only needed by drivers/of/unittest-data/Makefile,
they should not be located in scripts/Makefile.lib.



But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
if these are doing bad things.
They seem to be overlay files even though the file name suffix is .dts



$ find drivers -name '*.dts'
drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
drivers/staging/mt7621-dts/gbpc2.dts
drivers/staging/mt7621-dts/gbpc1.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
drivers/of/unittest-data/overlay_1.dts
drivers/of/unittest-data/testcases.dts
drivers/of/unittest-data/overlay_bad_add_dup_node.dts
drivers/of/unittest-data/overlay_bad_symbol.dts
drivers/of/unittest-data/overlay_0.dts
drivers/of/unittest-data/overlay_11.dts
drivers/of/unittest-data/overlay_gpio_03.dts
drivers/of/unittest-data/overlay_gpio_04a.dts
drivers/of/unittest-data/overlay_gpio_04b.dts
drivers/of/unittest-data/overlay_5.dts
drivers/of/unittest-data/overlay_bad_add_dup_prop.dts
drivers/of/unittest-data/overlay_gpio_01.dts
drivers/of/unittest-data/overlay_10.dts
drivers/of/unittest-data/overlay_7.dts
drivers/of/unittest-data/overlay_bad_phandle.dts
drivers/of/unittest-data/overlay_3.dts
drivers/of/unittest-data/overlay_6.dts
drivers/of/unittest-data/overlay_8.dts
drivers/of/unittest-data/overlay_12.dts
drivers/of/unittest-data/overlay_gpio_02a.dts
drivers/of/unittest-data/overlay_gpio_02b.dts
drivers/of/unittest-data/overlay_4.dts
drivers/of/unittest-data/overlay.dts
drivers/of/unittest-data/overlay_9.dts
drivers/of/unittest-data/overlay_2.dts
drivers/of/unittest-data/overlay_15.dts
drivers/of/unittest-data/overlay_base.dts
drivers/of/unittest-data/overlay_13.dts





-- 
Best Regards
Masahiro Yamada
