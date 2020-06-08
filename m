Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8184F1F126A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 07:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgFHFAm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jun 2020 01:00:42 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:52767 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgFHFAm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 01:00:42 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 05850PgG006595;
        Mon, 8 Jun 2020 14:00:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 05850PgG006595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591592426;
        bh=RnwdU5VcWRoU23GcuPYkPtqQl5L5moq3GNmmQqtecXM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cpnZKBe8fZo0g0lcEKc6G4ihG+nmDl3sODFW6U1SFAudgMSIYJsOxINTc7cN4hRPj
         a+6lO/P90mLQfdUsSeM1RlD5tEN5GQ9I/ii5s0Uh+uCRtsMd4bgZXgZkQmc96eyzOG
         z/17OQua02x94yZ4NCrV1DvzHZ9RpatMxySPEjV1jbx3RFb8Z0H5k9eNyyRlJoJUl/
         1Fy2dklPdF3BbCDrY0ifH5O1McIBgrMTTxKafZlz1kzoz2e7MF1Ir1WyTnVsXqPuxv
         1HXpOERwiH2+9gxr8n7AgMhhNX44KoBGPBy+0lwEYBnG4uf5eM7sm++efDkr6AueLe
         xFQjnCWwG6L1w==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id k13so9008256vsm.13;
        Sun, 07 Jun 2020 22:00:25 -0700 (PDT)
X-Gm-Message-State: AOAM530ptaNKSP2uZ2ZKKeDQJk+Jfoj9bbHbTktGjSIveVWSvURThxtd
        rDbTBcGu6AO66i8CKR//oeTqlBIC6nQbaqb3nEY=
X-Google-Smtp-Source: ABdhPJxoCzsOmrjk8+pcX9urF2DsV5Fewt7fzrJ6aQGZ6GfxIxpDEzz2v8bBvjlysLo3YY9RkTgtDPkdVMoYh9PjIKg=
X-Received: by 2002:a67:6383:: with SMTP id x125mr14967732vsb.54.1591592424754;
 Sun, 07 Jun 2020 22:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200605073955.6384-1-efremov@linux.com>
 <20200608013012.GA216607@roeck-us.net>
In-Reply-To: <20200608013012.GA216607@roeck-us.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 8 Jun 2020 13:59:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
Message-ID: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Denis Efremov <efremov@linux.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 8, 2020 at 10:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
> > Allow user to use alternative implementations of compression tools,
> > such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> > speed up the build:
> > $ make GZIP=pigz BZIP2=pbzip2
> >
> > Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> > vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> > since 2015. However, alternative implementations (e.g., pigz) still rely
> > on it. BZIP2, BZIP, LZOP vars are not obsolescent.
> >
>
> When building mips:defconfig, this patch results in:
>
> Building mips:defconfig ... failed
> --------------
> Error log:
> /bin/sh: -n: command not found
> make[3]: *** [kernel/config_data.gz] Error 127
> make[3]: *** Deleting file 'kernel/config_data.gz'
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [autoksyms_recursive] Error 2
> make: *** [__sub-make] Error 2
>
> Reverting this patch fixes the problem. Bisect log is attached.
>
> Guenter


Agh, this is because of CONFIG_TRIM_UNUSED_KSYMS.

Also, the distro package builds are broken
e.g.  make GZIP=gzip bindeb-pkg


Denis,

I think we should go back to the original
KGZIP, KBZIP2, KLZOP.




>
> ---
> # bad: [cf0c97f148e9e50aa5a7ddd1984a604dd2bde4af] Merge tag 'pinctrl-v5.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> # good: [aaa2faab4ed8e5fe0111e04d6e168c028fe2987f] Merge tag 'for-linus-5.8-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux
> git bisect start 'HEAD' 'aaa2faab4ed8'
> # good: [77f55d1305c11fb729b88f2c3f7881ba0831fa6f] staging: rtl8723bs: Use common packet header constants
> git bisect good 77f55d1305c11fb729b88f2c3f7881ba0831fa6f
> # bad: [e611c0fe318c6d6827ee2bba660fbc23cf73f7dc] Merge tag 'usb-5.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> git bisect bad e611c0fe318c6d6827ee2bba660fbc23cf73f7dc
> # bad: [cff11abeca78aa782378401ca2800bd2194aa14e] Merge tag 'kbuild-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> git bisect bad cff11abeca78aa782378401ca2800bd2194aa14e
> # good: [2bd81cd04a3f5eb873cc81fa16c469377be3b092] Merge branch 'remotes/lorenzo/pci/vmd'
> git bisect good 2bd81cd04a3f5eb873cc81fa16c469377be3b092
> # good: [269a535ca931b754a40dda3ab60514e68773c759] modpost: generate vmlinux.symvers and reuse it for the second modpost
> git bisect good 269a535ca931b754a40dda3ab60514e68773c759
> # good: [e542e0dc3ee3eafc46dd8e3073388079d69cace0] Merge branch 'dmi-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging
> git bisect good e542e0dc3ee3eafc46dd8e3073388079d69cace0
> # good: [4de7b62936122570408357417f21072e78292926] modpost: remove is_vmlinux() helper
> git bisect good 4de7b62936122570408357417f21072e78292926
> # good: [1ee18de92927f37e6948d5a6fc73cbf89f806905] Merge tag 'dma-mapping-5.8' of git://git.infradead.org/users/hch/dma-mapping
> git bisect good 1ee18de92927f37e6948d5a6fc73cbf89f806905
> # bad: [8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294] kbuild: add variables for compression tools
> git bisect bad 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
> # good: [c0901577e1dcc8d1c0fd1a11c8d571f650df845f] kbuild: doc: rename LDFLAGS to KBUILD_LDFLAGS
> git bisect good c0901577e1dcc8d1c0fd1a11c8d571f650df845f
> # good: [e0b250b57dcf403529081e5898a9de717f96b76b] Makefile: install modules.builtin even if CONFIG_MODULES=n
> git bisect good e0b250b57dcf403529081e5898a9de717f96b76b
> # first bad commit: [8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294] kbuild: add variables for compression tools



-- 
Best Regards
Masahiro Yamada
