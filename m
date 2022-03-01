Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CC64C962B
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 21:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237927AbiCAUTv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 15:19:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238041AbiCAUR4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 15:17:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E6B78065
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 12:16:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y24so28832187lfg.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 12:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IVJCWuEom0kHlh/OKXDsN3qCzQx/9M9wC7RTfclR0WE=;
        b=BpAEsMmHbz6DldI3lrXW/NoVL9h7Y1Bb3g4jW8C7mdmGyS8h6DJzcjMNPCcb5i0eTv
         U7LBxmxLpMxQLSdiNBGQ/nOQ2K++bwghf8WSxi5cejyHlrOc1Q0Y3NIYV/Er9JexFbTd
         wZkpV/0FlL02n71JKK++Oi+26AojFvTWPs3FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IVJCWuEom0kHlh/OKXDsN3qCzQx/9M9wC7RTfclR0WE=;
        b=qm9hGTCSmPHMVltasYVESsGV77r+7QVeVgMhgXVo/v9/q1iAyqT34XdINpsHZ2NY1a
         +nReTVsadfNuIq208MRGFM1HJlsJN22Yh0MGYXPoo02dofqLRiuoDD4H8gENcXfRF/3z
         RL0wTEGIjVgSpr0c+JnkVVz4voZCmSAKBQXPyzE/4WOobEQFngLfU5UJq3wLde6pTuJ6
         XK6MBf0fUl4/XaslS2yThc2ByZJ8ZrbWMCpgcYwu86Rm833LdmoXKiHGpDh2+h2yW+Ud
         SsGbLztZ7lk/Chb2Pvsf5RAj1I3wgNc1trnFa1Y+qgVGq28CoC505RSeOgD/4ohIp4Nf
         oQNA==
X-Gm-Message-State: AOAM530n4TRAuvuyvjQiACrY99uxAXqxJ6KTORabVkwtEh0lV5AnGMtH
        /5evSPENQnDyWjcuImrf/nn91Px+Yb6VfSOuNPo=
X-Google-Smtp-Source: ABdhPJyetMNEwluJssDGf99VkDQFwycD0I8RCBL0FAoqsAdelMhALsTeK7JIU3AYEGTcx9cry02k4A==
X-Received: by 2002:ac2:47e9:0:b0:445:8e83:db7c with SMTP id b9-20020ac247e9000000b004458e83db7cmr11025504lfp.42.1646165808961;
        Tue, 01 Mar 2022 12:16:48 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b00443d980bbaasm1653425lfc.96.2022.03.01.12.16.45
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 12:16:45 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id d23so28745474lfv.13
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 12:16:45 -0800 (PST)
X-Received: by 2002:ac2:5313:0:b0:443:99c1:7e89 with SMTP id
 c19-20020ac25313000000b0044399c17e89mr16012940lfh.531.1646165804889; Tue, 01
 Mar 2022 12:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20220301075839.4156-2-xiam0nd.tong@gmail.com> <202203020135.5duGpXM2-lkp@intel.com>
In-Reply-To: <202203020135.5duGpXM2-lkp@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 12:16:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiVF0SeV2132vaTAcL1ccVDP25LkAgNgPoHXdFc27x-0g@mail.gmail.com>
Message-ID: <CAHk-=wiVF0SeV2132vaTAcL1ccVDP25LkAgNgPoHXdFc27x-0g@mail.gmail.com>
Subject: Re: [PATCH 1/6] Kbuild: compile kernel with gnu11 std
To:     kernel test robot <lkp@intel.com>
Cc:     Xiaomeng Tong <xiam0nd.tong@gmail.com>, kbuild-all@lists.01.org,
        Arnd Bergmann <arnd@arndb.de>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 1, 2022 at 10:00 AM kernel test robot <lkp@intel.com> wrote:
>
> All warnings (new ones prefixed by >>):
>
> >> cc1: warning: result of '-117440512 << 16' requires 44 bits to represent, but 'int' only has 32 bits [-Wshift-overflow=]

So that's potentially an interesting warning, but this email doesn't
actually tell *where* that warning happens.

I'm not entirely sure why this warning is new to this '-std=gnu11'
change, but it's intriguing.

Instead it then gives the location for another warning:

>    arch/mips/pci/pci-rc32434.c: In function 'rc32434_pcibridge_init':
>    arch/mips/pci/pci-rc32434.c:111:22: warning: variable 'dummyread' set but not used [-Wunused-but-set-variable]
>      111 |         unsigned int dummyread, pcicntlval;
>          |                      ^~~~~~~~~

but that wasn't the new one (and that 'dummyread' is obviously
_intentionally_ set but not used, as implied by the name).

Is there some place to actually see the full log (or some way to get a
better pointer to just the new warning) to see that actual shift
overflow thing?

              Linus
