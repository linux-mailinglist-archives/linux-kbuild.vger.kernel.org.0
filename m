Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E088633C3D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 18:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbhCOROL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 13:14:11 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:37314 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhCOROB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 13:14:01 -0400
Received: by mail-io1-f54.google.com with SMTP id y20so15854357iot.4;
        Mon, 15 Mar 2021 10:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iFQlGUPMwfnpBCqbpSRGkYh/7C2oaLwfautQirfFp7M=;
        b=pudu/QMZCjnInZnPiSyISnkrMhT7v6V9a2kUN6uiOu+fkblkomsisT3zUDkNZAnCH/
         Tlu9b+/0Lvbz4KKues8sVhulhGg4BxNDrdmij32w9sfNxb11zKDEFopwI6nk1Tw66hKf
         VHoED6ffQLj+kCAz8kVCN+1NlCCaPLXghwSMITM57vkREVE3Xs4cX0APBjsiSbrGdK8q
         067mOB0nDEvNWKZbjsWektA750Pbv7Q0dGrER5/UlWHoEnHXhCeY6D2gEuyD4eh9zM0d
         cEqWuviGNYp3dGYDNu9DrachtwaRoo9GXPfZ4leJkX9rnPo21+sPnRALMJ6xzb3W+vWw
         ex6g==
X-Gm-Message-State: AOAM531z1njY1J0gwqNBijAv2C23WFpgMcbJ4nDwXDY9JHEiwXe/swEX
        gjikPLkNmDIbeGCnumTseSto9K8mUQ==
X-Google-Smtp-Source: ABdhPJybHmYcrgjGA8sZJsjU3Vw+8gF5icFgDP64gDoqeaSzp6mjU+fJJj15xeY3CTGq96COYxgfIA==
X-Received: by 2002:a02:cc1a:: with SMTP id n26mr10519485jap.21.1615828440953;
        Mon, 15 Mar 2021 10:14:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h128sm7358623ioa.32.2021.03.15.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:14:00 -0700 (PDT)
Received: (nullmailer pid 1063744 invoked by uid 1000);
        Mon, 15 Mar 2021 17:13:57 -0000
Date:   Mon, 15 Mar 2021 11:13:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Masahiro Yamada <masahiroy@kernel.org>, anmar.oueja@linaro.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Bill Mills <bill.mills@linaro.org>
Subject: Re: [PATCH V11 0/5] dt: Add fdtoverlay rule and statically build
 unittest
Message-ID: <20210315171357.GA1063052@robh.at.kernel.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615354376.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 10 Mar 2021 11:05:28 +0530, Viresh Kumar wrote:
> Hi,
> 
> This patchset adds a generic rule for applying overlays using fdtoverlay
> tool and then updates unittests to get built statically using the same.
> 
> V10->V11:
> - Update patch 4/5 to fix checkpatch warning on spaces and tabs.
> - Added Acked-by from Masahiro for patch 2/5.
> 
> V9->V10:
> - Add a new patch to allow .dtso files.
> - Update 2/5 to be more efficient and also generate symbols for base
>   files automatically.
> - No need to add lines like DTC_FLAGS_foo_base += -@ in patch 5/5.
> - Add Ack by Masahiro for 1/5.
> 
> V8->V9:
> - Added some comment in patch 3/4 based on Frank's suggestions.
> 
> V7->V8:
> - Patch 1 is new.
> - Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
>   foo.dtb.
> - Use multi_depend instead of .SECONDEXPANSION.
> - Use dtb-y for unittest instead of overlay-y.
> - Rename the commented dtb filess in unittest Makefile as .dtbo.
> - Improved Makefile code (I am learning a lot every day :)
> 
> V6->V7:
> - Dropped the first 4 patches, already merged.
> - Patch 1/3 is new, suggested by Rob and slightly modified by me.
> - Adapt Patch 3/3 to the new rule and name the overlay dtbs as .dtbo.
> 
> --
> Viresh
> 
> Rob Herring (1):
>   kbuild: Add generic rule to apply fdtoverlay
> 
> Viresh Kumar (4):
>   kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
>   kbuild: Allow .dtso format for overlay source files
>   of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
>   of: unittest: Statically apply overlays using fdtoverlay
> 
>  drivers/of/unittest-data/Makefile             | 48 ++++++++++
>  drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
>  drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
>  drivers/of/unittest-data/static_base_1.dts    |  4 +
>  drivers/of/unittest-data/static_base_2.dts    |  4 +
>  drivers/of/unittest-data/testcases.dts        | 23 ++---
>  .../of/unittest-data/testcases_common.dtsi    | 19 ++++
>  .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
>  scripts/Makefile.lib                          | 40 ++++++--
>  9 files changed, 218 insertions(+), 112 deletions(-)
>  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
>  create mode 100644 drivers/of/unittest-data/static_base_1.dts
>  create mode 100644 drivers/of/unittest-data/static_base_2.dts
>  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
> 
> 
> base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> --
> 2.25.0.rc1.19.g042ed3e048af
> 
> 
> 

Applied patches 1,2,4,5, thanks!
