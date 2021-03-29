Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AB734D24E
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Mar 2021 16:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhC2OYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Mar 2021 10:24:12 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54274 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhC2OXw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Mar 2021 10:23:52 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 12TENLPN021179
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2021 23:23:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12TENLPN021179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617027802;
        bh=1dCqZvfY1CpG7oYmBhuKTb9N8xNY+SRS2/1UThfJO9U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Vjkcn+emW2g1LRR80eZG1YYERCGZcPytirhsGnw3HUf0KfysPBnBTauS3I9bYhO1W
         YVY4Hh+Z0EaUiNg3WnqeCW7fTmqjemlZLq81p7om6FCjlJe9dsPSoFYJfMkzlf2myu
         sOaLuDIVZcXBKTH/oyUdiWMygE8ytRJ20txb2U5yE3aHD3tlcToPYCMAIF/EplJxLM
         oUyOW+eWux5xT3MTsUzGMshtMZyX/gEtual/QsfpFVGF+ssmiRjFxrn2PzEx4LBfoY
         0U0tHwj0mpnhKvFuivTcSu0oKW71+gZBEVK6y6Ai4yKhRb4M028R+QYwxT8kaO9VWJ
         3SNbldq8ycjUg==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id h8so4464061plt.7
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2021 07:23:21 -0700 (PDT)
X-Gm-Message-State: AOAM533CnemWBCCDqs+KF5HM5gH30zjfiLWhZNTJX9aSFwPN0M6iLbjG
        7W+Jw+du9QK4dbEhvfOYiCG6e7gKfzKrkOeh6NQ=
X-Google-Smtp-Source: ABdhPJylL4F72htDXWz+MbZjKKmFIBA6b7SA1QI5o7JlRYri9D1zW+vbYIOolTHQKm8H2385nPdV/nrClm7i7exKl1A=
X-Received: by 2002:a17:902:c48c:b029:e4:c093:593a with SMTP id
 n12-20020a170902c48cb02900e4c093593amr28510627plx.1.1617027800956; Mon, 29
 Mar 2021 07:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPotdmSVe-0iRfoCpSuTa-kR3V-QQKw2QG6PbQkP21gaBhd2Xw@mail.gmail.com>
In-Reply-To: <CAPotdmSVe-0iRfoCpSuTa-kR3V-QQKw2QG6PbQkP21gaBhd2Xw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 Mar 2021 23:22:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASXuKkYXKS0gxOORhTPP=+37xQGe8PCYPiRGAO10kiwAw@mail.gmail.com>
Message-ID: <CAK7LNASXuKkYXKS0gxOORhTPP=+37xQGe8PCYPiRGAO10kiwAw@mail.gmail.com>
Subject: Re: Possible Regression Regarding bcf637f5 interfering with dkms
 automatic module builds
To:     John S Gruber <johnsgruber@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 28, 2021 at 5:53 AM John S Gruber <johnsgruber@gmail.com> wrote=
:
>
> I've run into a problem installing 5.12 test kernels. When dkms tries to =
build a module invoked by kernel make install it cleans the linux tree and =
tries to do a make modules there (both by root). The dkms module is left un=
built.
>
> I bisected to the above commit -- kbuild: parse C=3D and M=3D before chan=
ging the working directory
>
> This commit changes the main Makefile so that make doesn't parse the M=3D=
 parameter if the variable sub_make_done is in the environment and set to 1=
.
>
> On my and on similar systems make install uses /sbin/installkernel to do =
the installation. /sbin/installkernel uses run-parts on /etc/kernel/postins=
t.d/ to perform various elements in the installation, e.g. boot loader conf=
iguration. One of these is dkms to build an out-of-tree module. dkms autoin=
stall then attempts to make clear and make build the module(s) in a source =
directory using the linux source tree.
>
> The sub_make_done=3D1 variable is still in the environment after all this=
 and the above make commands therefore don't parse the necessary M=3D param=
eter pointing to the source tree. Thus the initiated make invocations, igno=
ring the two parameters, process against the linux source tree instead.
>
> I was able to get proper function by unsetting sub_make_done in either dk=
ms or in arch/x86/boot/install.sh
>
> This kind of problem is obtuse enough I wonder if the optimization attemp=
ted in the above commit is worth the complexity. On the other hand if it pr=
oduces meaningful performance improvement perhaps changes to the architectu=
re Makefiles or install scripts could be patched.


If my motivation were such small performance improvement,
I would agree to revert bcf637f54f6d2515d4c9c81808faf01848916152.

Actually, bcf637f54f6d2515d4c9c81808faf01848916152 is a prerequisite
of my future improvement for external module builds,
(but I have not been able to find enough time to complete my work,
and presumably I cannot send patches any time soon).

So, it is unfortunate dkms is hooked by arch/x86/boot/install.sh
One down-side is that external modules are built under the root privilege.
In general, building should be done by a normal user, and installation
should be done by the root user.
But, I do not have a better idea than doing that in
the arch/x86/boot/install.sh hook.






> I'd be happy to test patches on my system. Are there any questions or iss=
ues I've neglected?
>
> Thanks.



--
Best Regards
Masahiro Yamada
