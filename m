Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565CD5306A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 May 2022 01:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiEVXBZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 May 2022 19:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbiEVXBY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 May 2022 19:01:24 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A73635E
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2022 16:01:22 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id b13-20020a92c56d000000b002d125a2ab95so7714154ilj.13
        for <linux-kbuild@vger.kernel.org>; Sun, 22 May 2022 16:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=YrcTIdBzlhFbW1DUwzFuoJ4+fGDzeWoyUkKuicb3UxE=;
        b=2mLCMnQuMdC2INDcUMVx8YMW6E1D4Sc53Hmxpi1kbgnJDggzjsOdZC/cHOwDnUeshb
         LntR+mNk/lOOeeaXtBjoTnQo88LduRJN0oDpHuGsod39ZLiuylZrYu3vLpPCn+B5nY25
         fB7XDoGVgPRwaQICq8NqHOxILhe0AtQ4wAHxPGxVGOgmUPalNY1EUG7ov4rTpBWyDASh
         OkhH7PdRrNcXEV2gL43HCX78psdEXWwXoHGf2I9aGjKmdHi/gteBtvD1rAdSkxQy+HE5
         xS1sbY9vHCCA3Ki0eywxlhgxpvKQEMuvDP6k67BSrRauBNXnNw6TZzeeoPMmSfiZjfY4
         DWVw==
X-Gm-Message-State: AOAM530zq79whzFoD9aYlZRtC0KEuwvPxyey2QTe+/SbAx1oQMH2GC7p
        8n1RoazUT3HPMFXq7I+AqPU/KhoNXtl1imPoqvKAxPjPrfwx
X-Google-Smtp-Source: ABdhPJxkr9MRZVkKwj1jCTeTeNZ3p88YkYYEjxEnz7bc8f1WpWfDln6VyWPiad0yOlBtElybkDQd3jxjSSsKm8sk0Yhx2rMYrHjp
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr4116397ilo.211.1653260481375; Sun, 22
 May 2022 16:01:21 -0700 (PDT)
Date:   Sun, 22 May 2022 16:01:21 -0700
In-Reply-To: <000000000000c1925305ac997812@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b6b4eb05dfa1b325@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in corrupted (4)
From:   syzbot <syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com>
To:     applications@thinkbigglobal.in, davem@davemloft.net,
        gustavo@padovan.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, marcel@holtmann.org,
        mingo@redhat.com, mmarek@suse.com, netdev@vger.kernel.org,
        peterz@infradead.org, syzkaller-bugs@googlegroups.com,
        torvalds@linux-foundation.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    eaea45fc0e7b Merge tag 'perf-tools-fixes-for-v5.18-2022-05..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1315c161f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=902c5209311d387c
dashboard link: https://syzkaller.appspot.com/bug?extid=48135e34de22e3a82c99
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a076d6f00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f76a3df00000

The issue was bisected to:

commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 19 22:34:00 2017 +0000

    Linux 4.10

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=128bb53a900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=118bb53a900000
console output: https://syzkaller.appspot.com/x/log.txt?x=168bb53a900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com
Fixes: c470abd4fde4 ("Linux 4.10")

traps: syz-executor229[3615] general protection fault ip:7feb96eb56a1 sp:20000fd0 error:0 in syz-executor2295634012[7feb96e75000+84000]

