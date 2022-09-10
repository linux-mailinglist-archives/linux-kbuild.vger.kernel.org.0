Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83275B47B8
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Sep 2022 19:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiIJR3O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Sep 2022 13:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIJR3M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Sep 2022 13:29:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834D0481EF
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Sep 2022 10:29:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq23so8000803lfb.7
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Sep 2022 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1kYjnl4fDCj70xdf6hD4EujUSRWcPi+E61T6h9PVR1A=;
        b=gYQ9Ys76Val3aAQiPAESCWsSvNL9GvA4zd862suf1MxfYwf+er8TAUtIGNYLELNhjU
         4MXVOi9QmL7UAisKDBwG/9tRG/uLnS95TKRKZcZHhB2Mur7bCz9KvC6EjZzm2+wQATeO
         MVT3WeLRI1qTqTaEVcnQ5VSN67uYZAPGGdZvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1kYjnl4fDCj70xdf6hD4EujUSRWcPi+E61T6h9PVR1A=;
        b=g2G/KtHdl9lj+o8b8Mh9mJzsAyMR2Sm7pj0sg/okumJYuBwLDi9OTj1W9F6iOkNjj5
         Q78oi5fy6cdoy3G8d59/+LOelBG6FsXamVG19MSoIaUIg6luAdspNEvQvyoR43knwlAX
         zWMkyMDYOhx5q1tCBQxyipGVvB7vxK1/fkY3poQvU9B0bBRsCmTItfankB34scsjiFiZ
         XRDZn0tnqQePxORK+oo9h+Eyx7r2gOYMAp8E+cbMZcK0sXTC/AiIUb4ClpI1AhysKvHQ
         VYDgR9wyZ1Tfa9uZ+/c5La6+c8sWMFpe0M00N8ITZSDaha7TODXHRKQftS2JnNWtMiB9
         a7Cw==
X-Gm-Message-State: ACgBeo2k6Pts6UvjtmITTSXY3JhJa/IiFjZbPLfYMuBT7oxZFL0L5R/D
        ZCy8egwMMUkDOeksTLYieI0BNruFkloAMEcrwtU=
X-Google-Smtp-Source: AA6agR69syr87wCNc7mn6P7N2A52aNViW0wSESlDclnTFKUdy72+OFjMqwC5YNazgxerlt3hTOscbA==
X-Received: by 2002:a19:d611:0:b0:492:8e15:ba18 with SMTP id n17-20020a19d611000000b004928e15ba18mr6110188lfg.524.1662830949586;
        Sat, 10 Sep 2022 10:29:09 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 25-20020ac25f59000000b00494974f951esm315813lfz.267.2022.09.10.10.29.07
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 10:29:07 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id f11so7994474lfa.6
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Sep 2022 10:29:07 -0700 (PDT)
X-Received: by 2002:a05:6512:31c1:b0:498:fe7:b46 with SMTP id
 j1-20020a05651231c100b004980fe70b46mr4653024lfe.549.1662830946873; Sat, 10
 Sep 2022 10:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <YjsCpoRK7W4l6tSh@zn.tnic> <CAHk-=wi9pLxm+dXoCaiGO+f0EbhyfAR_L510vD0c2=hj6rbMXg@mail.gmail.com>
 <YjwsUT/6PkRPjnHE@gmail.com> <YjySjys3QZAWFlfo@dev-arch.thelio-3990X>
 <YkC08gKqJOUM7CA8@gmail.com> <YkHXQTKImf7Wr+Sk@dev-arch.thelio-3990X>
 <YxHD1MkulyL3yB9y@gmail.com> <CAK7LNASyp8SzO3G+th5RgmRNBM_ryKuy0XzaMrdUdo8Sd6RR0A@mail.gmail.com>
 <YxR0UlS0Jpz9uqb7@gmail.com> <CAK7LNATnGO3LHZ7VvJRziDqz50gRq7MUJPOJLMfcv=pCiA=-mg@mail.gmail.com>
 <YxXHTMl/7PhVRSA9@gmail.com> <CAK7LNAQyiNpbLuVjjQ8-GOQECtfQZqsNS8xH0E2ZkLAHYtXt7A@mail.gmail.com>
In-Reply-To: <CAK7LNAQyiNpbLuVjjQ8-GOQECtfQZqsNS8xH0E2ZkLAHYtXt7A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 10 Sep 2022 13:28:50 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiS0rpOSRyh-8hOQm3yT3q_JkLgQj0ur9QuyUKxWU2sdQ@mail.gmail.com>
Message-ID: <CAHk-=wiS0rpOSRyh-8hOQm3yT3q_JkLgQj0ur9QuyUKxWU2sdQ@mail.gmail.com>
Subject: Re: [PATCH] x86/config: Make the x86 defconfigs a bit more usable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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

On Fri, Sep 9, 2022 at 6:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If you do not like the inconsistency,
> the support for ARCH=i386 and ARCH=x86_64 must be removed.

Is there any sane alternative for "do cross-architecture test builds"?

I do things like "make ARCH=i386 allmodconfig" myself, and I have to
admit that it's annoying that you have to then remember to do "make
ARCH=ii386" to do the actual build too, because otherwise Kcoinfig
will mess up the architecture, because it didn't make it into the
final simplified .config.

This is probably more noticeable with "defconfig" because then the
"ARCH=xyz" part has *other* effects too (ie it is also what says
*which* defconfig to pick).

So this is a bit of an annoyance, in that it's not trivial to just
"make the config for ARCH xyz" and then "make".

                       Linus
