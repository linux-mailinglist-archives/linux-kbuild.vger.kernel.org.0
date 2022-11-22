Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7345D633E2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Nov 2022 14:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiKVNym (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Nov 2022 08:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiKVNyk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2022 08:54:40 -0500
X-Greylist: delayed 174 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Nov 2022 05:54:39 PST
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072DA6584E;
        Tue, 22 Nov 2022 05:54:38 -0800 (PST)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-09.nifty.com with ESMTP id 2AMDn4PY011036;
        Tue, 22 Nov 2022 22:49:04 +0900
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2AMDmlN1010447;
        Tue, 22 Nov 2022 22:48:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2AMDmlN1010447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669124928;
        bh=mB9MB0wmXgKDnvTvLQGXp+po5aE+iQw2dlQ5Zq7YtEY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w0lm5hj2w8XZ9k5PgjO7zeRmAvGp1woKAD7jJ5+Qo6A0EKcPDU9trrKIZbN+ZvljH
         yrkx62M6BkGHbYg+wG01UIYyuCjk+QhAbpOLSk4j3hcgEypeo/2U3fUntPz1DI8JGO
         aOzx1XMC89/shhkOvzZZYD9rOqSaFZE+Kxe6pNUXjRZXeALReihL2YBOu/0xhyX73T
         D28qwAhcExOi/QzfBiquUmq4Kr/dQ5/OTPM5idiWB2RO8Sswjbz5I/PC54hScMtx3/
         Jp12FCIRfMB05xDv/4hLI78EmU8qvlVVFu7RR1sInKXPC4Lk4ICDbIdiJvk5KvOESZ
         YPABeugITWp2w==
X-Nifty-SrcIP: [209.85.210.53]
Received: by mail-ot1-f53.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so9335953otb.1;
        Tue, 22 Nov 2022 05:48:48 -0800 (PST)
X-Gm-Message-State: ANoB5pmOnAOxLOZSmMnL/WNA0SXxOHvpHOTaIg0HqIzILP49z/0v/Kso
        uRQrRSrIqNMP3B0qSKBsy50f+S65hzZAcDfM2FU=
X-Google-Smtp-Source: AA0mqf5pHVS629/y7ez0rQm3aPO/Mua/2z0tq2Bz9Irr2iEKShjJJ1xvJ3afZy4dqWEvHSz3nM4DwFlgaJT0X2KB/Fg=
X-Received: by 2002:a9d:282:0:b0:66c:794e:f8c6 with SMTP id
 2-20020a9d0282000000b0066c794ef8c6mr12425329otl.343.1669124927056; Tue, 22
 Nov 2022 05:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20221121162016.GA2422@DESKTOP-NK4TH6S.localdomain> <CANiq72nGhJqrZOXhNio0Uu-OfUC5BOTzMLgAMO4r0WZdt1uzCw@mail.gmail.com>
In-Reply-To: <CANiq72nGhJqrZOXhNio0Uu-OfUC5BOTzMLgAMO4r0WZdt1uzCw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Nov 2022 22:48:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARf8gQTqz=xksoxL_DYB8qW6ii5s2gKqY_+1LuUF7H7_g@mail.gmail.com>
Message-ID: <CAK7LNARf8gQTqz=xksoxL_DYB8qW6ii5s2gKqY_+1LuUF7H7_g@mail.gmail.com>
Subject: Re: [PATCH] scripts: add rust in scripts/Makefile.package
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Paran Lee <p4ranlee@gmail.com>, ojeda@kernel.org,
        austindh.kim@gmail.com, pmnxis@gmail.com,
        rust-for-linux@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 22, 2022 at 10:00 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Paran,
>
> On Mon, Nov 21, 2022 at 5:26 PM Paran Lee <p4ranlee@gmail.com> wrote:
> >
> > -               security sound tools usr virt \
> > +               security sound tools usr virt rust \
>
> Looks like this list is intended to be sorted, right?


Yes, it is better to keep it sorted.


>
> Thanks for the patch!
>
> (Also, please use `scripts/get_maintainers.pl` to find the most
> relevant maintainers and lists -- I have Cc'd them here)


Yeah, presumably it should go to kbuild.

Please send v2 to
linux-kbuild@vger.kernel.org

Thanks.

> Cheers,
> Miguel



-- 
Best Regards
Masahiro Yamada
