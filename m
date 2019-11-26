Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 971A110A167
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2019 16:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbfKZPrC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Nov 2019 10:47:02 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:50845 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbfKZPrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Nov 2019 10:47:02 -0500
Received: by mail-io1-f70.google.com with SMTP id t193so13578339iof.17
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2019 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=NMIhDQ1/TzZzQjr2wWUncjr9UXV8W0Q6CWNH9QCoYyc=;
        b=QYVBLFCtNP2JZ8w5qU2phIKjlc1TCk5QCwXgCJJCsVrROohPgxsvq6Rl8TZtPC9/2d
         yNgXQpe10TvIRjOTPPi65pzI2i5EIW4eHw3vO01HGjVlX6pxAG+Z2f6BaXlR+9ELZqet
         xpl4d8a1U23Gf/Y6qW++OmQ7WdL/l+LXB+T8rqcARaQSxa0iHR+RO1PHkNMBY5qKvbsE
         S+Q9SpSQfLA+MGYQ+DqnQvtXLQdLVuDrmU2vUk9IfiCch1DzyaBcz6CbGtBJ8HUoTjx7
         oIv/yIiE1lfBdKYp6EvTXxN//3kKp3NIOf8nl6chHwJhfgYD3y+IlZqs4sR52R5Ou49e
         gWwA==
X-Gm-Message-State: APjAAAXwllnCPzTGb0zPXaqtHbCWDl9xOQWUvHFVwMbrr3IL8iFIaySv
        /DAFnaxy7t51tNrOepuSvKLyMuM7B9NDiktR42HWfRSpyZ5+
X-Google-Smtp-Source: APXvYqwGLVmd6lBzBXRckmAQHo5bBkT8ic7o+qm5KSqWVZbE1t3yqtpg3LGxYvDX6Q2q+YWCGwHbZNwPiZQhQ+pyU2BTIV7K7AFJ
MIME-Version: 1.0
X-Received: by 2002:a6b:3b06:: with SMTP id i6mr14691402ioa.185.1574783220874;
 Tue, 26 Nov 2019 07:47:00 -0800 (PST)
Date:   Tue, 26 Nov 2019 07:47:00 -0800
In-Reply-To: <94eb2c059ce0bca273056940d77d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a85c4059841ca66@google.com>
Subject: Re: INFO: task hung in do_ip_vs_set_ctl (2)
From:   syzbot <syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com>
To:     coreteam@netfilter.org, davem@davemloft.net, fw@strlen.de,
        horms@verge.net.au, ja@ssi.bg, kadlec@blackhole.kfki.hu,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        lvs-devel@vger.kernel.org, mmarek@suse.com, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org,
        wensong@linux-vs.org, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

syzbot has bisected this bug to:

commit 6f7da290413ba713f0cdd9ff1a2a9bb129ef4f6c
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 2 23:07:02 2017 +0000

     Linux 4.12

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11a2b78ce00000
start commit:   17dec0a9 Merge branch 'userns-linus' of git://git.kernel.o..
git tree:       net-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=da08d02b86752ade
dashboard link: https://syzkaller.appspot.com/bug?extid=7810ed2e0cb359580c17
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130abb47800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150a15bb800000

Reported-by: syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com
Fixes: 6f7da290413b ("Linux 4.12")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
