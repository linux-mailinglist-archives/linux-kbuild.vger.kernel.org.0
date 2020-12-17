Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970E32DD1AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 13:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgLQMsi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 07:48:38 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36973 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQMsi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 07:48:38 -0500
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BHCliSu026220;
        Thu, 17 Dec 2020 21:47:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BHCliSu026220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608209265;
        bh=67yXPcU8FKCHmZkgDL0pL8HsXUbLZ0uzAFhT8NKE96g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R7XI3osBVMrmnhK6hSF2OUkjA91LelSMrSjRM88WWoGVMP0oKu9VMkytuEIHiEvT3
         Z9FgdyPGMefVs0olo59R2f+L2+Cjro9mHR+CQJ9mLDIJ24ARWy8rZ870qJbEA8o1h5
         t9tgjXgVjMzAlmTE1br63j9Z/Iuw6HonSb27n/nwFZWGc3t3vh/GUbhqyH5WTOtA8l
         yp1n7k8IRTXlY0VKDc0buLr7+x13ZEm5qLCu1u7xuFETDn0jEMUAJdeRwz5cQL4W/U
         PZXqe0uBJev1ON2//gWT6h6zmR5bq+Fg8Aksh2+FF73zNTCHMG4OhS+8UjYzWl8QkK
         UBm1jSZgz6Vnw==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id 4so15085214plk.5;
        Thu, 17 Dec 2020 04:47:44 -0800 (PST)
X-Gm-Message-State: AOAM533dLVDUURSgTrH/n0p6p8PUIuhbRRLwhiD5clxVoNACbLzqhYTF
        uGNTGmOLkvO9YGXQc+sbvYJYDObXwZbv8Me4h00=
X-Google-Smtp-Source: ABdhPJwq1JZZr9/yHEtjAKxT1qbpSOiyU7OsPgY5NumvpFRuLkiSwFnHL0NQin8jf4cjm9UVQrSvccLF+ILR0Kq8blw=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr7677563pjb.153.1608209264080;
 Thu, 17 Dec 2020 04:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20201217121725.16842-1-bp@alien8.de>
In-Reply-To: <20201217121725.16842-1-bp@alien8.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Dec 2020 21:47:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgCu+FJCPtcNBQJxHJiLwYbTXi2WYCvptPrspTAK7x_w@mail.gmail.com>
Message-ID: <CAK7LNARgCu+FJCPtcNBQJxHJiLwYbTXi2WYCvptPrspTAK7x_w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add {kvm_guest,xen}.config targets to make
 help's output
To:     Borislav Petkov <bp@alien8.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 9:18 PM Borislav Petkov <bp@alien8.de> wrote:
>
> From: Borislav Petkov <bp@suse.de>
>
> Add the targets which add Kconfig items to the .config so that the
> kernel can be run as a guest, to the main 'make help' output so that
> they can be found easier and there's no need to grep the tree each time
> to remember what they should be called.
>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  scripts/kconfig/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index e46df0a2d4f9..fdfae4f6943e 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -143,6 +143,8 @@ help:
>         @echo  '                    default value without prompting'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
>         @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
> +       @echo  '  kvm_guest.config - Enable Kconfig items for running this kernel as a KVM guest'
> +       @echo  '  xen.config      - Enable Kconfig items for running this kernel as a Xen guest'
>
>  # ===========================================================================
>  # object files used by all kconfig flavours
> --
> 2.29.2
>

No.

I do not want to touch scripts/kconfig/Makefile
every time somebody adds a new file to
kernel/configs/*.config or arch/$(ARCH)/configs/*.config




-- 
Best Regards
Masahiro Yamada
