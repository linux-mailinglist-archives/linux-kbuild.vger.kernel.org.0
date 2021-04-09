Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16AD359519
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 08:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhDIGEk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 02:04:40 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54320 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhDIGEj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 02:04:39 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 13963hg8017956;
        Fri, 9 Apr 2021 15:03:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 13963hg8017956
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617948223;
        bh=9v7EZ1Jf0k26fNaOMZcOQXGoA0rc+Pc1mW+lsvNVu34=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HXv1sNVOAAA2QM+yx4wsoeuSWbjAtwLUcUdtkddp0NOGd7o02TmljfC9J48vZQWyl
         Zimh8p9CbHpHBE6lCDg47pAA9RUVyt6QvTVAYsUODRaN+D6q4LQwpCsZCAehRNC35a
         ZfyaUZmdtYN928r0m2oaFB4ANXqX8R2851VUUnGc7RDHH9kGEYQ8bTw+6ov3mr/kzX
         Xfttg2rfdp1WBngPKcPvqD7jToDrrz2vxjhjfjC3ZQfwAqE6SpukufzO3pu7N7fAIC
         5uvd6ExdHwzmmOhYZKuAXzHIJVI0llsGDoKeU93ArkKomjDkMDH9zTAUBwlbGJMYLw
         szntkQgYr6Pbw==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id t7so2217525plg.9;
        Thu, 08 Apr 2021 23:03:43 -0700 (PDT)
X-Gm-Message-State: AOAM531yrdTU7qyoA/9QRj+mIKAVvbxP+ZXeowdv/AxwdWo5emHza2Gh
        yebLRZ7b0KDu84j7fdWm9HDnz3n63oiVGLTASUM=
X-Google-Smtp-Source: ABdhPJyF8hHwl2VmFGtFb8Bcx8rM4wWzrQp4VEECFSvH/FeYpAzZCQ9P0PMIefMKQu01W8PnpjITnaROe/fEGByubWw=
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id
 a9-20020a170902b589b02900e62875aa4cmr11412019pls.71.1617948222723; Thu, 08
 Apr 2021 23:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7> <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com> <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com> <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7> <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
 <YE/bzbU4jbgd6uNW@pendragon.ideasonboard.com> <e08f4006-af23-6c58-8557-263901193229@gmail.com>
 <CAMuHMdWCUQRwUy3s_ApH8Pzafdvh61VRNkMcbZ0OnGcqtJxdkw@mail.gmail.com>
In-Reply-To: <CAMuHMdWCUQRwUy3s_ApH8Pzafdvh61VRNkMcbZ0OnGcqtJxdkw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 9 Apr 2021 15:03:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASwMrWC2GWUVv-WEDVBvi4tJXM2ko++UXBEzsskAP_Uqw@mail.gmail.com>
Message-ID: <CAK7LNASwMrWC2GWUVv-WEDVBvi4tJXM2ko++UXBEzsskAP_Uqw@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 16, 2021 at 5:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Frank,
>
> On Tue, Mar 16, 2021 at 6:39 AM Frank Rowand <frowand.list@gmail.com> wrote:
> > On 3/15/21 5:12 PM, Laurent Pinchart wrote:
> > > On Tue, Mar 16, 2021 at 02:43:45AM +0900, Masahiro Yamada wrote:
> > >> But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
> > >> if these are doing bad things.
> > >> They seem to be overlay files even though the file name suffix is .dts
> > >
> > > That is correct, they are overlays. I have no issue with those files
> > > being renamed to .dtso if that can help (but I haven't checked if that
> > > would have any adverse effect on the R-Car DU driver).
> >
> > As Laurent replied, yes these are overlays.  They were grandfathered in
> > as a deprecated use of overlays.
> >
> > > These files are there to ensure backward compatibility with older DT
> > > bindings. The change was made 3 years ago and I wouldn't object to
> > > dropping this completely, but I understand I may not be the most
> > > cautious person when it comes to ensuring DT backward compatibility :-)
> >
> > My memory is that the goal was to eventually remove these overlays
> > at some point in the future.  If everyone agrees that today is the
> > proper time, it would be helpful to go ahead and remove these .dts
> > files and the code that uses them.
>
> Given [1][2][3] were merged in v4.17, and [4] was merged in v4.20, and
> all were backported to the old v4.14-based R-Car BSP v3.8.0, I think
> it's safe to assume all users have the DTS updates, so the backward
> compatibility mode can be removed?
>
> > >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> > >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> > >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> > >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> > >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>
> [1] 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings")
> [2] e5c3f4707f3956a2 ("ARM: dts: r8a7791: Convert to new LVDS DT bindings")
> [3] edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings")
> [4] 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS DT bindings")


Can we remove all of drivers/gpu/drm/rcar-du/*.dts ?

I see some more under drivers/staging/.


masahiro@grover:~/ref/linux-next$ find  drivers  -name  '*.dts'  |
grep -v drivers/of/unittest-data
drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
drivers/staging/mt7621-dts/gbpc2.dts
drivers/staging/mt7621-dts/gbpc1.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts







Best Regards

Masahiro Yamada
