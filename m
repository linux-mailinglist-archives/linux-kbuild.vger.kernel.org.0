Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49C767A511
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jan 2023 22:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234450AbjAXVht (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Jan 2023 16:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbjAXVhq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2023 16:37:46 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340EA4689;
        Tue, 24 Jan 2023 13:37:45 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 7B6D03200033;
        Tue, 24 Jan 2023 16:37:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 24 Jan 2023 16:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1674596261; x=1674682661; bh=MkvJpaIoWi
        Y2nfRzftcUt2rDwhUJg4hoUzHTirY6S/I=; b=Qu9kwRBh2VFDOJEnh2TIWnu/dg
        EJeHcrndgpg5GPAHfS9vjrVQLiEUUuV1JL9ErKZGB+vNooqNSQodD0OAdVErhVY1
        VrekgA60btAghP4MdgR8OiJDlpgL5BNpEapmSnLwGnB9Tb3f2fqeKKEOaB0gTjqB
        xA+spq7rU7reybytaL4unmPdlZUGe8Dwtacjw95uDYqO7omcw+/HdSbyWawH5e0Q
        m1Uh3Iw9jcS+b/xRAAW3IsV9O4v+OkxCMCBWJIPqiQTUGANx0VoaOzOEfWPSxOXC
        ARCXbazO3IekSWnZBdh2gycspiMS9DZROnN9xpwS4xR6crIV2DN9Hwmtk4XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674596261; x=1674682661; bh=MkvJpaIoWiY2nfRzftcUt2rDwhUJ
        g4hoUzHTirY6S/I=; b=Fval1w2UY74WJLSDcjr0LF1kFnvcvmMh7NZKYSXdT5nh
        4s6KQYN5NADKDOGSdr8oVVMbFdnImnnKMvX5zRyQJecjnzL9+m4vOMMX9xp5lXSg
        /FqPyOQBtnBZK+EUXbIdaB1DTyoZoBSkeexf8LHf+7v4lhx38trOPGhVgQWfba8z
        DNX39PBg/sYYqr/8ow7+rqhbC03f8CMG3RIbbYXxk2aFlQ1NmKihbmmjgwvPCCyJ
        k7VnTu4VTbG4krw1rQJTEq4rj/zDTNz8+i/5TJmO3CiCPD5m+Xe5LlyUELgqU1Td
        Ej6YYdHHO63tS17w8MqXPSKsoWYi91+xvERVHo8lgA==
X-ME-Sender: <xms:pE_QY2WVgV6qfhCzfqFQFVghixOstecb9fvTYxCQRg-zkfot62I4GA>
    <xme:pE_QYyl2d0BQaw9w6RCvUqkPgzJJOml5H8h_QuXy1Misue_2-fpmKAXHt1VQfC5WS
    PMqMgO-vw6nhO3RWnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvtddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:pE_QY6Z9Mjrf7RGnpdQ4GBn_iBXD7YEUn70vVeNCFMYqlAYJGuxhMQ>
    <xmx:pE_QY9UPTjIm1d9na8nvMeoVg-AmWNzskEsSPj1W2jhaujlHRCRYEQ>
    <xmx:pE_QYwngFRg-OfvGGZb_Gamp8gJggzeX-BQvj0dIWDn4rzhG2k9IwA>
    <xmx:pU_QY_cTCaA0Fvpl8fimDafUFyeW7caF8uIjq3MUK9JnZXoWGF0kDA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 29C83B60086; Tue, 24 Jan 2023 16:37:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <5fd66e0f-410c-4198-bede-394d05bb0952@app.fastmail.com>
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
Date:   Tue, 24 Jan 2023 22:37:20 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Alexander Stein" <alexander.stein@ew.tq-group.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Olof Johansson" <olof@lixom.net>,
        "Shawn Guo" <shawnguo@kernel.org>, "Li Yang" <leoyang.li@nxp.com>,
        "Russell King" <linux@armlinux.org.uk>,
        "Marek Vasut" <marex@denx.de>,
        "Marcel Ziswiler" <marcel.ziswiler@toradex.com>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        "Nathan Chancellor" <nathan@kernel.org>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        "Nicolas Schier" <nicolas@fjasle.eu>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 00/10] TQMLS1021A support
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 24, 2023, at 12:02, Alexander Stein wrote:
>
> thanks everyone for the feedback. This is the third round of this series to
> add support for the TQMLS1021A using the MBLS1021A mainboard.
> The changelog is included in the individual patches.
>
> Best regards,
> Alexander
>
> Alexander Stein (7):
>   ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
>   ARM: dts: ls1021a: add TQMLS1021A flash partition layout
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
>   ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
>   ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
>
> Matthias Schiffer (1):
>   dt-bindings: arm: fsl: add TQ-Systems LS1021A board
>
> Nicolas Saenz Julienne (2):
>   kbuild: Add config fragment merge functionality
>   ARM: add multi_v7_lpae_defconfig

I have applied the last three patches in the defconfig branch
to make things easier here. The dts patches should go through
the layerscape tree, so I'll wait for Shawn Guo or Li Yang
to pick those up once everyone is happy with them.

     Arnd
