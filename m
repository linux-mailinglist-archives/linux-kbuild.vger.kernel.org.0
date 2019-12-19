Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30458126794
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 18:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbfLSRCP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 12:02:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbfLSRCP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 12:02:15 -0500
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E449124672;
        Thu, 19 Dec 2019 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576774934;
        bh=Gf6fKzJZuUvXAHQkWvxm55YxdWNDzJNdosA6mUGKHjA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TQSEStuFgF7/JuT7Nq1X2HLaXZOiPmH15GI9c3S5NciCRZgcu5ua6eFxscAd1vxoY
         EdgjxJzrKnIySNbcSpK0IFtvqkoc7XnQGZvin7Di/w1GBEQqrIhjtK4sBdUQnnIBtm
         fR99zovTezoaed3BLXJsuvAzjSHYyOeL+svDUu2E=
Received: by mail-qk1-f173.google.com with SMTP id x1so5181803qkl.12;
        Thu, 19 Dec 2019 09:02:13 -0800 (PST)
X-Gm-Message-State: APjAAAWvCHVTdrPKnNkbBKyObKgdmcF0A4i0Q8yTLIOF8hNHDYaXeV0y
        S2l43uR9OZz4Y8jFSTl1h1BBgM6bglje+lHE0A==
X-Google-Smtp-Source: APXvYqxfo/7e9wzlMy580Vd/102R/rWBP0PwZ//fNoQ8yxxiQhL+I/hOaEas3Y+kT2x51tzh7mSZJnDkNL/eoDWO7/0=
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr8421615qkl.119.1576774933015;
 Thu, 19 Dec 2019 09:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20191218114625.28438-1-frank-w@public-files.de>
 <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
 <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com> <trinity-76f78a91-fc1f-479c-bd38-a7b989b28234-1576757117258@3c-app-gmx-bap68>
In-Reply-To: <trinity-76f78a91-fc1f-479c-bd38-a7b989b28234-1576757117258@3c-app-gmx-bap68>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 19 Dec 2019 11:02:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9gZbVC5X3gwYWpYc9-Geb4FvUP0cED8NC_MCEGQCy3g@mail.gmail.com>
Message-ID: <CAL_JsqL9gZbVC5X3gwYWpYc9-Geb4FvUP0cED8NC_MCEGQCy3g@mail.gmail.com>
Subject: Re: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 6:05 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Hi Rob,
>
> so the way you prefer is this one (use new file for additions and including the board dts):

Yes, or you could use an overlay, but that will raise other issues
(current lack of support building them in the kernel).

> arch/arm64/boot/dts/mediatek/mt7622-bpi-r64-mt7531.dts (example for mt7531-phy)
>
> /*
>  * Copyright (c) 2018 MediaTek Inc.
>  * Author:
>  *
>  * SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  */
>
> /dts-v1/;
>
> #include "mt7622-bananapi-bpi-r64.dts"
>
> / {
>         gsw: gsw@0 {
>                 compatible = "mediatek,mt753x";
>                 mediatek,ethsys = <&ethsys>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>         };
> };
>
> &gsw {
>         mediatek,mdio = <&mdio>;
>         mediatek,portmap = "wllll";
>         mediatek,mdio_master_pinmux = <0>;
>         reset-gpios = <&pio 54 0>;
>         interrupt-parent = <&pio>;
>         interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
>         status = "okay";
>
>         port5: port@5 {
>                 compatible = "mediatek,mt753x-port";
>                 reg = <5>;
>                 phy-mode = "rgmii";
>                 fixed-link {
>                         speed = <1000>;
>                         full-duplex;
>                 };
>         };
>
>         port6: port@6 {
>                 compatible = "mediatek,mt753x-port";
>                 reg = <6>;
>                 phy-mode = "2500base-x";
>                 fixed-link {
>                         speed = <2500>;
>                         full-duplex;
>                 };
>         };
> };
>
> at least it compiles and after decompile the new nodes are visible...
>
> is there any way to drop nodes (in case dsa-driver gets merged i don't need it in the other 2)? i can disable them, but they will be present.

Yes, use '/delete-node/'.

Rob
