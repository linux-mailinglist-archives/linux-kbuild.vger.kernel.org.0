Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390A01248C7
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 14:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLRNyJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 08:54:09 -0500
Received: from mout.gmx.net ([212.227.17.22]:47233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbfLRNyI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1576677243;
        bh=ZhcDDcNfsfafFdvs1JQcGHU/hpgdybDLx7pCjlP+xVM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XK1rBebkH++Y1QL+eER5du3AZsBxW6t/Gmc0yw30HIR8Ck6ty8siCmjRLlOq9VY1S
         f8rK3dtAYf2lALCFwZTzrT19Ta+gh/R3TXxQVzHJ4y4/aR7iCZsrdSjHMZwbjGYCxn
         thnuBI7n/Zcm9BWdNvE8KzRYSOm8dLYgdLfUnFVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.99.135] ([185.76.99.135]) by web-mail.gmx.net
 (3c-app-gmx-bap62.server.lan [172.19.172.132]) (via HTTP); Wed, 18 Dec 2019
 14:54:03 +0100
MIME-Version: 1.0
Message-ID: <trinity-d7a098bf-51a2-4579-93c9-963826ed2895-1576677243636@3c-app-gmx-bap62>
From:   "Frank Wunderlich" <frank-w@public-files.de>
To:     "Masahiro Yamada" <masahiroy@kernel.org>
Cc:     "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        "Michal Marek" <michal.lkml@markovi.net>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Frank Rowand" <frowand.list@gmail.com>,
        DTML <devicetree@vger.kernel.org>
Subject: Aw: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 18 Dec 2019 14:54:03 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
References: <20191218114625.28438-1-frank-w@public-files.de>
 <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IPEYO5erNR3VIgkP26Ywy22WTWQkOf9vN8fjbS56GYJQF0o6de1mtWEGI8IjV1m+jU8TF
 3k76khgIJtZ6dmgLTKOuR3djzyaqRsERlxXcPq/ov0DxOQv0xSq740gNPqZBhdffYA5EuukAokko
 9boOvproSK4KWQ/MY5/YNELjGh8WGFILYQtgAJM0rnQZPujUhB89vhNWl6xIf3e33yDAHa+YantC
 ntLllE7GdbDVNceTMN+7KG3qbfzvb9AMflXfOijv8HQoWnCZ1eD6HMRKRIbR6Sononw2Qimr1P0u
 d4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s4mPEd+k28k=:K9yIMO1inLEXGbGxzMcLZt
 kxi2OI5xu/PLSRGCYa8rgEvelPZvFG7ScNxj59El6atgpkLps4J0J7OpDTmk0DqTMQu4ILPw5
 RcKuYnhTiRK8D/TZ1ooLUXG/OFLEsEPy2Cent4kgR3+zNwGQwVlC4cxkpyiRemeJcfln89kP7
 wo/BTXQ8x5XxKFY7NhHxIubfgXowzLfpfkJnZYJSBBR3Ny35Axt9/yl0gh6CGxNP9WocpO7pC
 9+q2fUe9mYfJiLX8+yVD9wG+iyZfEw7kgf/+E9jMpT7gcwaOtKt4qz2PiME2k6wMoT6cpuLcq
 wODlqkagwlWUt7eq0XpfmUp6fVKUPjN2DYh6TyILnRD8pOH6MGdCOvw26bftMKK9QyYD2NWxZ
 MNs3FwOddJjd1ql/0Y/oE9lyRW2MEqML3jGaoJmShuNw7JNjVd+qDi5J1+lMEIA8Lf0CMWMRp
 LIpz6NYKTkMle2hSM7CDpeuSvK3T5Wob+ixDutg8V7vlFNjhW8MUX5PFbIUi2iZmKwR6QGH+v
 BhCVRYf7TOVz30C7SSYQ4NMz/clRBkLC/n5el1BDLAzq+bUQ2gEXqPs+zpXd+XNIDUrUfvNOT
 9o5putGwzFXN9OY/WF4BwtO3LVSBI13XxV7O1Tloc0gIinlyVefrutQpB/mx4/ECohe/UbI8l
 Igq3b96srX3rzn9vSNoKrXOFnbBu9pbrQJBINL6aOB7Ao8qBBPV9hs4sDC33HQpgHlKw=
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

thank you for your answer... i waited for this argument ;) so here an exam=
ple (don't wanted to add in patch itself):

i have 2 different Bananapi-r64 boards with different switch-chips (v0.x r=
tl8367,v1.x xmt7531). for 1 of the switches (mt7531) there are 2 drivers (=
phy-driver + dsa driver) available and so i have 3 different configs in DT=
S.

Imho dtsi should contain only config for 1 chip, but the board has only 1 =
dts. Till now i have copied the whole dts twice, so i have 3 independent d=
ts. if i Patch any other in one like for bluetooth, wifi, which is same on=
 each board i have to do it on all 3 dts files.

so i tried to make the switch-part conditionally, include the right dtsi f=
or switch to 1 bpi-r64 dts based on -D param passed to the build-chain.

#ifdef __SWITCH_RTL8367__
       #include "rtl8367.dtsi"
#endif
#ifdef __SWITCH_MT7531_DSA__
       #include "mt7531.dtsi"
#endif

imho i can/should not include a dtsi to a dtsi and no dts to dts, so i can=
not have a small dts (with the switch-config) including the whole r64 boar=
d. Am i right?

and this change should be less interferring than other ideas i'm thinking =
about.

Another example: I had tried adding the include/generated/autoconf.h to dt=
si (same reason) which needs a change in scripts/dtc/include-prefixes/ (ad=
d symlink) or an odd include in the dtsi (#include "../../../../../include=
/generated/autoconf.h"). Both ways not nice...

regards Frank


> Gesendet: Mittwoch, 18. Dezember 2019 um 14:31 Uhr
> Von: "Masahiro Yamada" <masahiroy@kernel.org>
> I think this is questionable
> since DT is supposed to describe hardware.
> Does it depends on #ifdef or some external defines?
>
> If you want to add variations,
> you can add a new DTS which includes other DTS(I) files.

