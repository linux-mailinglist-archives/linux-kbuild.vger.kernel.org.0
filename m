Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F1F33CF2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 09:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhCPIBq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 04:01:46 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:41757 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhCPIBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 04:01:42 -0400
Received: by mail-vs1-f45.google.com with SMTP id s8so17704182vsc.8;
        Tue, 16 Mar 2021 01:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgL2LNXP2lxwXX8HbYLpL0RwruXL8cdBwmu8w2k8t08=;
        b=CCB0ImslYTj4FnGP+pVbmUKey4ZdARZ1OrXDAUXl2+qxxZMAPsnXLQzci/dWsHFQvH
         EPw1egcFymEMPzFE5TwycIl6DkAhLyT4a7nXOMDmUwx1p3Z7n+JQ7tI0C6hFub/gv+7G
         m1Oh0noabifxQEKETinuZYbLBsXsNOPzMX/QVh9UQshqnGFaR/0yqATlI3e/uljBYFXu
         56AlGurXiwT2SRps8duWgGOvh2c4HGbQy3zazmwJVnsJHQC+N+iqIwW4jNbKFcPxkcth
         f0+5SrX0abz3gTNrmdmP/KpCQnSgiSV+do4PV2LWSvDgSFXQEOoxLz8bi/gwfG7nt23Y
         BIXw==
X-Gm-Message-State: AOAM531A4pi81oRcUIXZHi3Ha0OHCURgo7WMG1G8cGjBJ7omaswsimBJ
        J53IuKriimXFI9RUvWW3x+ouQiEdr12YBnFfnrY=
X-Google-Smtp-Source: ABdhPJyIladf8aoZOGNW+MTWZTIxZvN/Fhqb4neeaMebTTaWn2gGdiaUzi+iSSTsW9PiA+Ep6nnX+KMixr66IfiduyU=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr7557528vsp.3.1615881701627;
 Tue, 16 Mar 2021 01:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7> <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com> <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com> <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7> <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
 <YE/bzbU4jbgd6uNW@pendragon.ideasonboard.com> <e08f4006-af23-6c58-8557-263901193229@gmail.com>
In-Reply-To: <e08f4006-af23-6c58-8557-263901193229@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 09:01:30 +0100
Message-ID: <CAMuHMdWCUQRwUy3s_ApH8Pzafdvh61VRNkMcbZ0OnGcqtJxdkw@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
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

Hi Frank,

On Tue, Mar 16, 2021 at 6:39 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 3/15/21 5:12 PM, Laurent Pinchart wrote:
> > On Tue, Mar 16, 2021 at 02:43:45AM +0900, Masahiro Yamada wrote:
> >> But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
> >> if these are doing bad things.
> >> They seem to be overlay files even though the file name suffix is .dts
> >
> > That is correct, they are overlays. I have no issue with those files
> > being renamed to .dtso if that can help (but I haven't checked if that
> > would have any adverse effect on the R-Car DU driver).
>
> As Laurent replied, yes these are overlays.  They were grandfathered in
> as a deprecated use of overlays.
>
> > These files are there to ensure backward compatibility with older DT
> > bindings. The change was made 3 years ago and I wouldn't object to
> > dropping this completely, but I understand I may not be the most
> > cautious person when it comes to ensuring DT backward compatibility :-)
>
> My memory is that the goal was to eventually remove these overlays
> at some point in the future.  If everyone agrees that today is the
> proper time, it would be helpful to go ahead and remove these .dts
> files and the code that uses them.

Given [1][2][3] were merged in v4.17, and [4] was merged in v4.20, and
all were backported to the old v4.14-based R-Car BSP v3.8.0, I think
it's safe to assume all users have the DTS updates, so the backward
compatibility mode can be removed?

> >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> >> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts

[1] 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings")
[2] e5c3f4707f3956a2 ("ARM: dts: r8a7791: Convert to new LVDS DT bindings")
[3] edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings")
[4] 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS DT bindings")

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
