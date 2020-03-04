Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9CE179376
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 16:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387706AbgCDPfC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Mar 2020 10:35:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:36738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbgCDPfC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 10:35:02 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D0FC24658;
        Wed,  4 Mar 2020 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583336101;
        bh=mGvRr//+DglMPcp75TxeFCBhxIqq00jQR1JrOSa+h4Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zya9ztGN4pWxB5+fYDdBdITZt8ZGTMnZo+22Td1X1Qkl1YcPxTJtwgEW7yB24Haq+
         wOH9dOkcSiPsrw87U0Tk8Wk2Tq3s+Wr3sYw90Yz9lQphYvnfFAvOkzS7qqj5f5ZT+m
         FgPMwPgBQq+rB5PPkPD5iSOjBJvxIg2zoi+0ijLg=
Received: by mail-qv1-f53.google.com with SMTP id r8so947916qvs.12;
        Wed, 04 Mar 2020 07:35:01 -0800 (PST)
X-Gm-Message-State: ANhLgQ0BAIu9rA2czjgJrViQMEE1HUlxKfarrGVvmgn4EUsQIYtCnhVA
        SUQikMt8hx06fUi2mSq29uMoHB+7SI7pVtdf6w==
X-Google-Smtp-Source: ADFU+vteyB29cYQ7Q1UB74Gv0vdvXOHZ+jzrw1aE7WliF9I8s/sqI/IDAw2TT3/P6koVZqmBoPO96WROOJctXEQuW7o=
X-Received: by 2002:a0c:fecb:: with SMTP id z11mr2571272qvs.85.1583336100783;
 Wed, 04 Mar 2020 07:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-2-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-2-masahiroy@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 4 Mar 2020 09:34:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3q4txoV6wE-Vk5X9oo0roVbBYpwMuPEngDiEv1XXinQ@mail.gmail.com>
Message-ID: <CAL_JsqJ3q4txoV6wE-Vk5X9oo0roVbBYpwMuPEngDiEv1XXinQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: avoid concurrency issue in parallel building
 dtbs and dtbs_check
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 3, 2020 at 9:20 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'make dtbs_check' checks the shecma in addition to building *.dtb files,

typo

> in other words, 'make dtbs_check' is a super-set of 'make dtbs'.
> So, you do not have to do 'make dtbs dtbs_check', but I want to keep
> the build system robust in any use.
>
> Currently, 'dtbs' and 'dtbs_check' are independent of each other.
> In parallel building, two threads descend into arch/*/boot/dts/,
> one for dtbs and the other for dtbs_check, then end up with building
> the same DTB simultaneously.
>
> This commit fixes the concurrency issue. Otherwise, I see build errors
> like follows:
>
> $ make ARCH=arm64 defconfig
> $ make -j16 ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dtbs dtbs_check
>   <snip>
>   DTC     arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
>   DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb
>   DTC     arch/arm64/boot/dts/zte/zx296718-pcbox.dtb
>   DTC     arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
>   DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
>   DTC     arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb
>   DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb
>   CHECK   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
> fixdep: error opening file: arch/arm64/boot/dts/allwinner/.sun50i-h6-orangepi-lite2.dtb.d: No such file or directory
> make[2]: *** [scripts/Makefile.lib:296: arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb] Error 2
> make[2]: *** Deleting file 'arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb'
> make[2]: *** Waiting for unfinished jobs....
>   DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb
>   DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
>   DTC     arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
> fixdep: parse error; no targets found
> make[2]: *** [scripts/Makefile.lib:296: arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb] Error 1
> make[2]: *** Deleting file 'arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb'
> make[1]: *** [scripts/Makefile.build:505: arch/arm64/boot/dts/allwinner] Error 2
> make[1]: *** Waiting for unfinished jobs....
>   DTC     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
