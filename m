Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A04D4D710E
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Mar 2022 22:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbiCLVpS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Mar 2022 16:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbiCLVpR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Mar 2022 16:45:17 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262391DB8AB
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Mar 2022 13:44:11 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id c15so165591ljr.9
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Mar 2022 13:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Al6bnHgVgcqWGS7SzpEP6EcNnlitYzP4oWhkmGFLRYg=;
        b=TUNQe6vdMdyq5Mk9RcZa0WrgFWSQNBekv3itbnQYPfxEcKkulC5M9G35QESGHx3lCs
         CkiAAaqI2HmrSs4euU/9PrCa+nGQ4kj+UavhRfZqSrLFd9YMMCelxwBYrKyghkz/zT4k
         cSm+n0RWPhJ3qKq/xEsoqAW/Ef3Ix0mfhyfWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Al6bnHgVgcqWGS7SzpEP6EcNnlitYzP4oWhkmGFLRYg=;
        b=V/M25Hw2h8qv1Y+g1EiIfMnMPL1Yyr+i1YIRtGyEMllpDGG0F7MKaSLUSIfD0cyr1e
         kuRB/YDAXAZimTFIvh8XgE85NcrzNcxqbiHDmders8WTbtNlF7s+k+48YELh+zV98qjC
         9+a2i+rpOPKfWOVN5IEIpRnzAnp213RKuXRt2sXl9rU2pt8F87O9DJ0JZd6v7xTyV/Rl
         Ukkff/lbicaBZ/c3xFUrxM5oXcKP2rSbw43yUEI8tzBpJcvNkO2ux6xadfeDwe4ao+e8
         FszRySbgSoNFmHp0VRDGmVHBdb+sxB1fLHIdAUw3qxs/5WotmwOsp92Ky2ACZDprQH/w
         HOGw==
X-Gm-Message-State: AOAM532+HUacAJBIhguUr/OCRtHF8tmaLObL3IsPN9S730qg6vOOqlAk
        D+7llQXFkJJ3Alk+FP6MM2eDPOAyG/inT++9HO8=
X-Google-Smtp-Source: ABdhPJzTU+AZqVnLKPqY80vo2dqHTMF1GuiMTsY2rHaSfrVbC91UpEYINB2bmJY4ISo7fd1OQQeEFg==
X-Received: by 2002:a2e:808b:0:b0:243:f7ef:fbb6 with SMTP id i11-20020a2e808b000000b00243f7effbb6mr9861003ljg.30.1647121449262;
        Sat, 12 Mar 2022 13:44:09 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id r7-20020ac25f87000000b004484fed8a9esm2388033lfe.268.2022.03.12.13.44.06
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Mar 2022 13:44:07 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id z11so20817529lfh.13
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Mar 2022 13:44:06 -0800 (PST)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr147974lfu.542.1647121446538; Sat, 12
 Mar 2022 13:44:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wiacQM76xec=Hr7cLchVZ8Mo9VDHmXRJzJ_EX4sOsApEA@mail.gmail.com>
 <YiqPmIdZ/RGiaOei@qmqm.qmqm.pl> <CAADWXX-Pr-D3wSr5wsqTEOBSJzB9k7bSH+7hnCAj0AeL0=U4mg@mail.gmail.com>
 <Yix06B9rPaGh0dp8@qmqm.qmqm.pl>
In-Reply-To: <Yix06B9rPaGh0dp8@qmqm.qmqm.pl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 12 Mar 2022 13:43:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgxtcTbBdtm9ewarth476Wr5vYYnptaWpwdHcML8-xayA@mail.gmail.com>
Message-ID: <CAHk-=wgxtcTbBdtm9ewarth476Wr5vYYnptaWpwdHcML8-xayA@mail.gmail.com>
Subject: Re: [PATCH 2/6] list: add new MACROs to make iterator invisiable
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Xiaomeng Tong <xiam0nd.tong@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 12, 2022 at 2:24 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> The source type is not needed for the macros [..]

Ahh. Yeah, as long as we don't do typedefs, it looks like we don't
need to pre-declare the member access types.

I expected that to be required, because function declarations taking
arguments need it, but that's because they create their own scope.
Just doing it in a regular struct (or in this case union) declaration
is fine.

So we would only need that post-declaration.

That said, your naming is wrong. It's not just about "self". It's any
case where the type we iterate over is declared after the type that
has the head.

So I suspect it would be a lot better to just always do it, and not do
that "self vs non-self" distinction.

              Linus
