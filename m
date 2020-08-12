Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C757242393
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 03:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgHLBHG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Aug 2020 21:07:06 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:51940 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgHLBHG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Aug 2020 21:07:06 -0400
Received: by mail-io1-f70.google.com with SMTP id p12so444749iom.18
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2020 18:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=X3NiX6nVSgp11EpijWT3pX7H1MOgqhCnBt3mOeEwKPI=;
        b=THyUIxlF6alZ3nH0jd58+mGcthc22wZxRiyk+676VTjL7k0kQfgpBoxgdGsq+MU8KE
         cnLtevXZB3Qb6Z9jAQmLhO44h7sVhNx7GcBeZLROis6xPMwzp7eByPhiMem+TFeheMhz
         0nlioiIlTAGNClJ1q6XvVh/I/223yfToljAJa0xKfvrBptcdEvX3uYWUeoTOjIPQYhir
         A2bq8FiNuP9hXRqIzqn4nocbVhQiaIWkOa6tSYH4FqtuTEFO5FKngLVF8v4HbEjUWE+K
         FweLa93shnkY/uUE2iDE8x7hGD+pSqSpFejkwvbWgl9GzQvJ/eZCHyalQSPCDoliL4Cx
         hL3A==
X-Gm-Message-State: AOAM533sY6odWVzRh25a5ijQt++cJy8RAk4yC2sZhEOWhbKB8p0S+Pju
        x/5DA2WvDdYY5Pw5MVpfq863QNJgtS0Fmpe9MIRhOYDr6+4X
X-Google-Smtp-Source: ABdhPJzflhizS6nniBWRSpW8mHijAZdmSAeiEp/VNDrTlrQJdIKYs08rqIEDvlb4OOzwu63y0W80MTCFDtmUkUL4JXTKE6e0ZT1S
MIME-Version: 1.0
X-Received: by 2002:a92:bbc6:: with SMTP id x67mr26231257ilk.235.1597194425363;
 Tue, 11 Aug 2020 18:07:05 -0700 (PDT)
Date:   Tue, 11 Aug 2020 18:07:05 -0700
In-Reply-To: <000000000000b6b450059870d703@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005c72d405aca3ce17@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in precalculate_color
From:   syzbot <syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com>
To:     a.darwish@linutronix.de, akpm@linux-foundation.org,
        bsegall@google.com, changbin.du@intel.com,
        clang-built-linux@googlegroups.com, davem@davemloft.net,
        dietmar.eggemann@arm.com, dvyukov@google.com, elver@google.com,
        ericvh@gmail.com, hverkuil-cisco@xs4all.nl, jpa@git.mail.kapsi.fi,
        juri.lelli@redhat.com, kasan-dev@googlegroups.com,
        keescook@chromium.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sparse@vger.kernel.org, luc.vanoostenryck@gmail.com,
        lucho@ionkov.net, mark.rutland@arm.com, masahiroy@kernel.org,
        mchehab@kernel.org, mgorman@suse.de, mhiramat@kernel.org,
        michal.lkml@markovi.net, miguel.ojeda.sandonis@gmail.com,
        mingo@redhat.com, netdev@vger.kernel.org, paulmck@kernel.org,
        peterz@infradead.org, rminnich@sandia.gov, rostedt@goodmis.org,
        rppt@kernel.org, samitolvanen@google.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        v9fs-developer@lists.sourceforge.net, vincent.guittot@linaro.org,
        viro@zeniv.linux.org.uk, vivek.kasireddy@intel.com,
        will@kernel.org, yepeilin.cs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit dfd402a4c4baae42398ce9180ff424d589b8bffc
Author: Marco Elver <elver@google.com>
Date:   Thu Nov 14 18:02:54 2019 +0000

    kcsan: Add Kernel Concurrency Sanitizer infrastructure

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13eb65d6900000
start commit:   46cf053e Linux 5.5-rc3
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed9d672709340e35
dashboard link: https://syzkaller.appspot.com/bug?extid=02d9172bf4c43104cd70
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147e5ac1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14b49e71e00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: kcsan: Add Kernel Concurrency Sanitizer infrastructure

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
