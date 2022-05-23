Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD3453082B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 May 2022 05:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiEWD4l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 May 2022 23:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiEWD4k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 May 2022 23:56:40 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9A611F
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2022 20:56:38 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q21so5851967ejm.1
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2022 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKAJkiWmW+IPGP1bXDKaiFUYpV46xzegx9oR3356eFs=;
        b=gVnl8EntcpMgwE29/c+bjMIurGfrhaKvHuVgNwokXlHj8f0HpRtVO2iTuf2t84JtcC
         4T8IWNKbLcn4nS8C8o54KCWd2cK+9MGM+jMuIbj4JCyR7HUtw+Hfe5LSZl4Mo/IfVzMY
         D4Ai8Dmf6YrLPSwpNE0xjpX1Lrp517SuOajXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKAJkiWmW+IPGP1bXDKaiFUYpV46xzegx9oR3356eFs=;
        b=GKJdfF1vA6f69Z9b2BK290jrIWT3dsDhjdaWdJvXcexpwfs551MwiSJs7zmrOo3vtQ
         f/ztmbZ0wazikBMK30zpQVp4U+TKUj8HrtjLv8M3voXp3mzkinYrBnr5bkyHMztw0mT5
         TbO78JMeCqmidO72Cj+M7L5WsVe+AmsoDv6yXky2zpGKCK/fraVcJcLMQUC49lU+Ixbk
         fI+VW8+VclLfZ+A0IFnY6iis+MerHLdTlKkS+iTa6kFkcSwRoYgHImhlyGk+P1w9YzFi
         LH9tF1XXkFwod6FQmAOz8utd4OPL7jLVBPV61WGm4u7sbeerGPGXKAoOpm7M/bAEVWpi
         r4kw==
X-Gm-Message-State: AOAM5327YEDuDVyUDkskiDsKfjYLRQh6YCF1JEDWYfo+95qvep2el6e+
        +GQrMOfB0IWnAwqhociS04WyReb4qH+ZCauF
X-Google-Smtp-Source: ABdhPJxHZ9PMOVjXe3M4rEwPY8zZj7OdZi6gTjXfPkR5rVECXQ6iLtAOSaFL6vZAXMF95wHjy1aZ0A==
X-Received: by 2002:a17:906:b7d6:b0:6fe:a34a:a813 with SMTP id fy22-20020a170906b7d600b006fea34aa813mr13230549ejb.551.1653278196509;
        Sun, 22 May 2022 20:56:36 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7cb45000000b0042aa7e0f892sm7731323edt.15.2022.05.22.20.56.34
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 20:56:35 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id u3so19484902wrg.3
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2022 20:56:34 -0700 (PDT)
X-Received: by 2002:a5d:5484:0:b0:20f:bf64:cae1 with SMTP id
 h4-20020a5d5484000000b0020fbf64cae1mr10390593wrv.281.1653278194596; Sun, 22
 May 2022 20:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c1925305ac997812@google.com> <000000000000b6b4eb05dfa1b325@google.com>
In-Reply-To: <000000000000b6b4eb05dfa1b325@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 22 May 2022 20:56:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=whH5pmgyzE6+6C==p2VQFUgGiPhSwX=R2zKs+iHZuX7_A@mail.gmail.com>
Message-ID: <CAHk-=whH5pmgyzE6+6C==p2VQFUgGiPhSwX=R2zKs+iHZuX7_A@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in corrupted (4)
To:     syzbot <syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com>
Cc:     applications@thinkbigglobal.in, David Miller <davem@davemloft.net>,
        gustavo@padovan.org, Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Ingo Molnar <mingo@redhat.com>, Michal Marek <mmarek@suse.com>,
        Netdev <netdev@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 22, 2022 at 4:01 PM syzbot
<syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com> wrote:
>
> The issue was bisected to:
>
> commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Feb 19 22:34:00 2017 +0000
>
>     Linux 4.10

Heh. That looks very unlikely, so the bisection seems to sadly have
failed at some point.

At least one of the KASAN reports (that "final oops") does look very
much like the bug fixed by commit 1bff51ea59a9 ("Bluetooth: fix
use-after-free error in lock_sock_nested()"), so this may already be
fixed, but who knows...

But that "update Makefile to 4.10" is not the cause...

               Linus
