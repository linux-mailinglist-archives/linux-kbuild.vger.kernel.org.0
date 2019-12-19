Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603141261A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 13:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfLSMFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 07:05:23 -0500
Received: from mout.gmx.net ([212.227.17.20]:47773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbfLSMFX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 07:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576757117;
        bh=oHbd8+naRUDak1t7HyPoUb8otyLjLJCOQAcfK+Mtclw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BUj3BqTBMoOpb5xvOJVATNemxDnFJpV9ikmWOi/eIwg5ozA/WbgDfSTVEqE1z2L6N
         lj4Bhgi546G3avdCloexk27s3O+Qi2s6Vy+iqzDwTO7XxZ9gKB7KCb4U2v5fMnuL0/
         aa78MZPQJWt1Fc6hEf8WayNG2Xq5sKm9SoE3Hz2U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.99.135] ([185.76.99.135]) by web-mail.gmx.net
 (3c-app-gmx-bap68.server.lan [172.19.172.68]) (via HTTP); Thu, 19 Dec 2019
 13:05:17 +0100
MIME-Version: 1.0
Message-ID: <trinity-76f78a91-fc1f-479c-bd38-a7b989b28234-1576757117258@3c-app-gmx-bap68>
From:   "Frank Wunderlich" <frank-w@public-files.de>
To:     "Rob Herring" <robh+dt@kernel.org>
Cc:     "Masahiro Yamada" <masahiroy@kernel.org>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        "Michal Marek" <michal.lkml@markovi.net>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Frank Rowand" <frowand.list@gmail.com>,
        DTML <devicetree@vger.kernel.org>
Subject: Aw: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 19 Dec 2019 13:05:17 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
References: <20191218114625.28438-1-frank-w@public-files.de>
 <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
 <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:DinXypny3FYqi5CzziIi3ovA308cTpeTvs+7Oy2eWnoyOsphl0VSMhahYhaMGtihK1fXV
 vpN/wCa5IDmiyqUhmKUQQNDZ1vWBbirdvM0YPz5A1vG40flYbB4dFXBvRtFDbY7xcSdWEPl9wUVP
 SVq/Sk7qK+aHohKkYAYVtvJ1c1FblmjShV+5u/z5LFCY1N3xM7THpUCzExldJreEIWAetivgrst4
 twq6rizclVTQyWi5z2hQLR/y/euTJfVENSrqX8eBVuxL7ZbOdf5teOCQ3kuB/fyUVV1IBy7vKRvU
 4U=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mDqwi3hrEVw=:1T4JUV+00BktsWI/C2ulmh
 ZsMYnSjqf/cLm7gKHivmgzw3MUl33Qz8WAHPJgMq7luSL25eShs2KWVmPkGIOP1+3+3g5M1QF
 0RRz3JNze9TJdOmEOlJSJpphwXRrUjrgAAyGp5So0sVZ3i2qRIJ72kwrWQspOWg71jsJ0Swvv
 k+EEoayHcf4mTCRBtkw56ZfBndtvxw4uznk4pVn4G+ET9DZHOsvJEQIoOTJ7lkODRfifiW1kp
 Xk96mPO/G3TBp2boZBYJjJxQ8Mjkb7qQwrjMfUD+ogvTPugMutXO0uJ5iascIeTBmaVwX+477
 +hrqL8MnzkNM1nE1b9rE78TJpsVmfZJXdYB9XQEwyX1rn0Oa/qT4+ctx7T5Nc4yzXxcTKXDwx
 fmEtTi4LTrvroKdlT94qhgxPkTvavtkZmSbf9hlEp6FZi0jw2iPq2oBjAgJUP84HTZaQ+JjP2
 NdQGH1vGlKtuUSncxNAGo+ozteS02X8QmR/073aOl16puqLT+JTqDeiBB9qvdbjfMFv+n3dNS
 XCo4bswfiN3edBY/zUDSNPGRKfl2Z5rRum5wz1r336hUCHaMCYnXuL257DAC1VpPeiXBBJgWV
 7n4CgiR9pscLdWHu5yvYAZGzWnAV1FG48NMnU3uuRSX0r0hg/3Uo287r6RpZE5NpOfsD3ZQpS
 9eWitBN15Ai7KKI3+3wKaO7HF5KR/n6g7QKFhK5f5y5+8i+7OETtS/sPnIJosEZe6KMg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

so the way you prefer is this one (use new file for additions and includin=
g the board dts):

arch/arm64/boot/dts/mediatek/mt7622-bpi-r64-mt7531.dts (example for mt7531=
-phy)

/*
 * Copyright (c) 2018 MediaTek Inc.
 * Author:
 *
 * SPDX-License-Identifier: (GPL-2.0 OR MIT)
 */

/dts-v1/;

#include "mt7622-bananapi-bpi-r64.dts"

/ {
        gsw: gsw@0 {
                compatible =3D "mediatek,mt753x";
                mediatek,ethsys =3D <&ethsys>;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
        };
};

&gsw {
        mediatek,mdio =3D <&mdio>;
        mediatek,portmap =3D "wllll";
        mediatek,mdio_master_pinmux =3D <0>;
        reset-gpios =3D <&pio 54 0>;
        interrupt-parent =3D <&pio>;
        interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
        status =3D "okay";

        port5: port@5 {
                compatible =3D "mediatek,mt753x-port";
                reg =3D <5>;
                phy-mode =3D "rgmii";
                fixed-link {
                        speed =3D <1000>;
                        full-duplex;
                };
        };

        port6: port@6 {
                compatible =3D "mediatek,mt753x-port";
                reg =3D <6>;
                phy-mode =3D "2500base-x";
                fixed-link {
                        speed =3D <2500>;
                        full-duplex;
                };
        };
};

at least it compiles and after decompile the new nodes are visible...

is there any way to drop nodes (in case dsa-driver gets merged i don't nee=
d it in the other 2)? i can disable them, but they will be present.

regards Frank


> Gesendet: Mittwoch, 18. Dezember 2019 um 14:51 Uhr
> Von: "Rob Herring" <robh+dt@kernel.org>
> NAK. #ifdefs and complex macros in particular are features we don't
> want in dts files.
>
> Rob
