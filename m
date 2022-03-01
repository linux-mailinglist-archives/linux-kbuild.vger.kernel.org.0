Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581D24C979B
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 22:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238473AbiCAVQL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 16:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiCAVQK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 16:16:10 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722FA60A9C
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 13:15:28 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u7so23557686ljk.13
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AFFQZ5G9629SYwN4GslubcgtNOJHtDCYyH5rTLKNhPs=;
        b=J7SNKN4+VaeirWCC/sELTWGxD9feSOxwo5q96qWEAmukJiV3VyojWYDxtxuMGxCyR3
         YrpHXPdAb07nriCJ8cCpxklbaMU6iL5ozLyyOZQ0PKB6soH/RogNt2jYscdgsizouIbx
         qbKugFzE7mJwHl02BxHXOCWjpLGFgeV/WWue0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AFFQZ5G9629SYwN4GslubcgtNOJHtDCYyH5rTLKNhPs=;
        b=4FFw1Pbxf4y98PCQGAQ/qqLmvFDM7kegFaGjxC+iosWyrr2Xi04xq2hJnkLbnOfUzV
         GV4zC63KzroHGfPOfXYAcTRi0BHcM55arHYgb677m5ud+yJuKXwtQZRW2giGHHt+UvV7
         aMpVlsgmRYSGk8GF+W5j9FnQXnZyPU34y8gO5hGyBvcxktRSHjw+/5E98IvA4puTdpwb
         FTuns6zjVlfkEmx/IXDYKgGk8DHWVgUUdlkeqlyDmB3ixTV0FYp8PlznYcnXJpEu7LeB
         6UETQvZG0CnFEeOZSJ+rXysQce6h+Ppg8oRsxDHmWnRP2SGpByzXhVLi9UfxOg5/2/sT
         VfNg==
X-Gm-Message-State: AOAM532G1nALxKvTCcmq1aPNY907JL8ymnXdFNYSzNMXsdm7aIS7bHu/
        IsS7Qm+lo9h3Qw7eH66KsxPXgw80suuRBnih6Gg=
X-Google-Smtp-Source: ABdhPJySG30Mb4ap//ABpOhY6j5xBut8h9qkR8QJQWTyN/4MwOUeoHFrNyxtY3e55/JaObBx58lxdg==
X-Received: by 2002:a2e:6818:0:b0:235:3ae:c2c8 with SMTP id c24-20020a2e6818000000b0023503aec2c8mr18100511lja.252.1646169326192;
        Tue, 01 Mar 2022 13:15:26 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b00443d571f256sm1673550lfc.66.2022.03.01.13.15.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 13:15:23 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id v22so23599042ljh.7
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 13:15:23 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr18180017ljw.291.1646169323173; Tue, 01
 Mar 2022 13:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20220301075839.4156-2-xiam0nd.tong@gmail.com> <202203020135.5duGpXM2-lkp@intel.com>
 <CAHk-=wiVF0SeV2132vaTAcL1ccVDP25LkAgNgPoHXdFc27x-0g@mail.gmail.com>
 <CAK8P3a0QAECV=_Bu5xnBxjxUHLcaGjBgJEjfMaeKT7StR=acyQ@mail.gmail.com> <CAHk-=wiFbzpyt1-9ZAigFYU7R8g9mEgJho3w7yGYe0h-W==nsw@mail.gmail.com>
In-Reply-To: <CAHk-=wiFbzpyt1-9ZAigFYU7R8g9mEgJho3w7yGYe0h-W==nsw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 13:15:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiuZGzc2UaNVPr6rZnK7buvaQWfadZMcDXavE=MeCXw3g@mail.gmail.com>
Message-ID: <CAHk-=wiuZGzc2UaNVPr6rZnK7buvaQWfadZMcDXavE=MeCXw3g@mail.gmail.com>
Subject: Re: [PATCH 1/6] Kbuild: compile kernel with gnu11 std
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel test robot <lkp@intel.com>,
        Xiaomeng Tong <xiam0nd.tong@gmail.com>,
        kbuild-all@lists.01.org, Jakob Koschel <jakobkoschel@gmail.com>,
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

On Tue, Mar 1, 2022 at 1:04 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, looks like that "<< 16" is likely just wrong.

.. and perhaps more importantly, I guess that means that -Wshift-overflow is

 (a) somehow new to -std=gnu11

 (b) possibly a lot more relevant and good than that
-Wshift-negative-value thing was

doing some grepping, it seems like we have never had that
'-Wshift-overflow' even in any extra warnings.

And trying it myself (keeping -std=gnu89), enabling it doesn't report
anything on a x86-64 allmodconfig build.

So I think this is likely a good new warning that -std=gnu11 brought
in by accident. No false positives that I can see, and one report for
a MIPS bug that looks real (but admittedly not a "sky-is-falling" one
;)

There's apparently a '-Wshift-overflow=2' mode too, but that warns
about things that change the sign bit, ie expressions like

        1<<31

warns.

And I would not be in the least surprised if we had a ton of those
kinds of things all over (but I didn't check).

So the plain -Wshift-overflow seems to work just fine, and while it's
surprising that it got enabled by gnu11, I think it's all good.

Famous last words.

                     Linus
