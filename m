Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F770A5A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 May 2023 07:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjETFVq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 May 2023 01:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjETFVp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 May 2023 01:21:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D201B0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 May 2023 22:21:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 153A5617A4
        for <linux-kbuild@vger.kernel.org>; Sat, 20 May 2023 05:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9B8C433EF
        for <linux-kbuild@vger.kernel.org>; Sat, 20 May 2023 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684560103;
        bh=SvZXwAxSu5nwvgbSmYacv0D576gGEw6J/t5wsal5Xko=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YC8TgiIIpeRweuUBo1Wd2a0gJunUqjb+MiRJKhLVxFrPPyKMP/ThqMsXGgEAnoYp1
         QM6mM1yGOlLduRwm/bwU1eMErsj1E7hNRAMw1mpH2STBCLSIGbHGnkbeilJXamuINa
         Zhw6NPEt4IWHPOubg6VWZgvki+VNCqLER04K+IvPF/2LR/YUO4YaaXl31VMMLzxVaG
         8eIZUcIGOvy7AM28MfflttJG8vA9d3mopMJ9pszJjevaORCICOpo3Npdn6B9SBpbfw
         QvA4PuoSv46p+HSGCouB7DI51y0d2mgsJFS6VxvgLXxT78TbaDYliED5KOOVlxHHr/
         Y6xnVJC3EnVMA==
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3943fdc59f9so2257557b6e.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 May 2023 22:21:43 -0700 (PDT)
X-Gm-Message-State: AC+VfDwssEU2exBH84Pof1bypwZAi6CF5Cn+89emJKHnQ/Y76RFgkLI8
        57lX4VEO2VezWHT/T68ASxRoGwf0+rqULP6/3BY=
X-Google-Smtp-Source: ACHHUZ7le24rziBquheHTI6tCUMDmbdvBcEAtyM2vFSg/ICuzyVVJCrNoY8hjdTz6uy+0QNTvv2pb5Xu/M0TTgeyUHo=
X-Received: by 2002:a54:400c:0:b0:395:f7d3:d4b8 with SMTP id
 x12-20020a54400c000000b00395f7d3d4b8mr2262827oie.36.1684560102666; Fri, 19
 May 2023 22:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
In-Reply-To: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 20 May 2023 14:21:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com>
Message-ID: <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com>
Subject: Re: Suggestion: Improve the dependency information during Kconfig compilation
To:     sunying@nj.iscas.ac.cn
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 18, 2023 at 4:13=E2=80=AFPM <sunying@nj.iscas.ac.cn> wrote:
>
> Hi,
>
>
> We found that the Kconfig build system silently changes invalid values in=
 the. config file,
> which may prevent users from getting their desired kernel, and also make =
it hard to know
> which configuration option caused the forced change based on the compilat=
ion information.
>
> There are similar questions on stack overflow, where people find it diffi=
cult to get
> the complete dependency chain and other information=EF=BC=9A
>
>   ex1. How can I disable CONFIG_PM when building Linux kernel for x86_64 =
- Stack Overflow
>   https://stackoverflow.com/questions/64499221/how-can-i-disable-config-p=
m-when-building-linux-kernel-for-x86-64/64501647#64501647
>
>   ex2. c - kernel symbol enabled but doesn't shows up in .config - Stack =
Overflow
>   https://stackoverflow.com/questions/24074116/kernel-symbol-enabled-but-=
doesnt-shows-up-in-config)
>
>   ex3. makefile - update menuconfig entries without recompiling all the k=
ernel - Stack Overflow
>   https://stackoverflow.com/questions/71075113/update-menuconfig-entries-=
without-recompiling-all-the-kernel
>
>   ex4. linux - disabling CONFIG_NET_DMA - Stack Overflow
>   https://stackoverflow.com/questions/30794576/disabling-config-net-dma/3=
0796820#30796820
>
> We plan to optimize the conf_read() function in /scripts/kconfig/confdata=
.c,
> and add information for the mismatched configuration options to help user=
s get the desired Linux kernel.
> Do you think it's necessary? Any suggestions?
>


It may be helpful.
I do not know if such warnings should be turned on by default,
or under some verbose mode, though.




> Best regards,
> Siyuan Guo
> Ying Sun
>
>


--=20
Best Regards
Masahiro Yamada
