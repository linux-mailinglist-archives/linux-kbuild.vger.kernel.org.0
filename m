Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6753C4F7F05
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 14:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245131AbiDGMdw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 08:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242882AbiDGMdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 08:33:51 -0400
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A696114090;
        Thu,  7 Apr 2022 05:31:50 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 237CVMY9012181;
        Thu, 7 Apr 2022 21:31:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 237CVMY9012181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1649334683;
        bh=L49yPoJkgTix15tBxldcDnRauyvSLkKMzpRMm3ApHi8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HAhCq47ZSVYvhDLmufNdJT9xEr6n6B4S5BMxH+BEJnZt1ifDTfty95EWpw4YEE4b4
         rJiWs3giNPvBRmsiMqFu7T/+8cYRoiL/nfJO+i5Q9PSzXMzH7AOhi3LXoA6Z4rAMat
         MIzHdIXgL3+SDAXtzlslf7k6asASgVLPVkTeAq735wUaBQLBoeMBYdgTCQbRnEbx40
         PirJmq9HVr9+nFEqzQ18+4YeeSh4KZA9+NHUV9XIs+Kc6kXVd7dPDLH/l9NzBnMLKn
         sTIrp75pgtnHbeEocfv3Yg6Sn0fitqwS61BtLV7RvPH+dCUAZ6PmyN+duf/SNP+l+J
         hx1A1/VRl6UNg==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id 32so2702269pgl.4;
        Thu, 07 Apr 2022 05:31:23 -0700 (PDT)
X-Gm-Message-State: AOAM531fRMtYjBhm5ULq5szm202WZCx6uI59228os+7tCpaWfb71XBtW
        rJqLWV6cR0hOqk+lD2feLJvMyJ7Xd67M4x+1niM=
X-Google-Smtp-Source: ABdhPJy3MNIJH2znZPkW5ifzB24VdY6SB0KQny93wDmA8rx6x8nviDrH6xL4hz4/Ijll0dmDzEJxLPlmPQ7vE9gO3n4=
X-Received: by 2002:a63:dc53:0:b0:381:7f41:3a2d with SMTP id
 f19-20020a63dc53000000b003817f413a2dmr11250539pgj.126.1649334681801; Thu, 07
 Apr 2022 05:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220407110522.122393-1-marex@denx.de>
In-Reply-To: <20220407110522.122393-1-marex@denx.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 Apr 2022 21:30:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATp4_Hjte3tj_tqVLzJu30fidAowkrBgXkjC-68FwFzkQ@mail.gmail.com>
Message-ID: <CAK7LNATp4_Hjte3tj_tqVLzJu30fidAowkrBgXkjC-68FwFzkQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] kbuild: Generate symbols for DTO application in DTBs
To:     Marek Vasut <marex@denx.de>, DTML <devicetree@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Marek.
(+CC Rob, DT ML)

On Thu, Apr 7, 2022 at 8:05 PM Marek Vasut <marex@denx.de> wrote:
>
> Emit symbols section in DTBs to permit symbol resolution when applying DTOs.

I CCed DT folks, but if I remember correctly, adding -@ globally
was NACKed because it would increase blob size for platforms that
do not need overlay.


> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> ---
> NOTE: I am sending this as RFC, because I suspect there is a better way how
>       to pass extra flags to DTC during kernel build ?
>       Maybe from shell environment somehow ?


For local use, yes, you can add -@ from the command line.

Try this:

    DTC_FLAGS=-@  make ARCH=arm64 dtbs


This is undocumented tip, but it seems to work
for the current code.



>       Or maybe b7e70391a5451 ("arm64: tegra: Enable device-tree overlay support")
>       is the way to go about this ?


Since commit 15d16d6dadf6947ac7f9a686c615995c5a426ce2,
adding -@ is automatic for platforms that support overlay.


If  <platform>-dtbs exists, -@ is automatically added.

See arch/arm64/boot/dts/xilinx/Makefile
as an example code.





> ---
>  arch/arm/boot/dts/Makefile   | 3 +++
>  arch/arm64/boot/dts/Makefile | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 252353fb4e3b3..2d50302d077dd 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +DTC_FLAGS += -@
> +
>  dtb-$(CONFIG_ARCH_ALPINE) += \
>         alpine-db.dtb
>  dtb-$(CONFIG_MACH_ARTPEC6) += \
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 1ba04e31a4387..f7b3c86517a0e 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +DTC_FLAGS += -@
> +
>  subdir-y += actions
>  subdir-y += allwinner
>  subdir-y += altera
> --
> 2.35.1
>


-- 
Best Regards
Masahiro Yamada
