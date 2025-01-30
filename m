Return-Path: <linux-kbuild+bounces-5570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D051A22D92
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 14:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14D4B1680ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 13:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10661E47C2;
	Thu, 30 Jan 2025 13:20:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B11E3774
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243223; cv=none; b=i/JpTlhmSyAkcNkwi0R/30+Fl8R7bS15CmDHtclAU388rnD/iL2wpEYZXjiiq6lcoMpPe+xxLQErjZ9M+fc2NZi8rgEEsUmn4rQNiFrB2Ejrkev9rotlAFy1U0RK/Zp37WlBVzvQUWq/atD71bIixTXslvcKciqAnri2XkqF7Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243223; c=relaxed/simple;
	bh=gfNrwLh31RJ+nqCVy/pGNDN/uYfgux1yzAMDandeUvg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QpTsqU5NqQ6vjtr76EWXU9HhWmP4mbIsHwf0bn4v78TtObhtxDZRIAIrc/UNjyCyqFc8EO9jqo9JUbi04LA0FrWGrk6W7tLiI2Y819pr7GGcZJ/CEgsC7t7Xng8aNLiwLeWGPnb7+lo5eAc26IpVGYWbRPJK/0+1UQVC3JcybPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce7a0ec1easo5520145ab.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 05:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243221; x=1738848021;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wo5+/q+lEeJCbAsUCbSQ6PYEetiAqRpvHNIHfpexH7U=;
        b=gYDmHM3ocTti7CF+zBEzy8ne8ta8D/tiDyOnco/br8jjXpq63e4m+4rheIa5bJiPBz
         VymqCdYDkRptkN96Q9LNgtKyWCt8Vf0AheA23biIAUKuTVlEsHwJomzQfLEzZzDoS+hf
         wHO4qY4/6JBZ7e/0nt39bSVO9GQ3zkUv/17H1UEKZiGvNlavmoODi72mGLod5aYINkYk
         tDAuwnNEdsRgqFiZ8kjpPUvGEFLfO8dFyPWMTjBSThE8S8r8BOWdUrvxlgGdGB26WAy3
         bUXEPVVTf4JzWaaNIQ1JClNptD0tCyHG6bMI3xS4M2Jj3Eka0/XIkaNgjCBuN5zASGZj
         SCSg==
X-Gm-Message-State: AOJu0Yy8EwQ0CVqZY6pRsIcx47BLkEZ5iOsyjf4nBUSQJnNgutJ0QSo9
	IMn1H/gD02YXgJMNXVUErTFls6EJfHYnC3+ZEWcLxsPn9YfRLqB8cu46JPWLbg5mf0bM6lUjR/C
	VZeLvtIRIYcLHvwRZAx3FBnL5s/PyXS8CQ3cEK+3VziJQUChNTtOXCEI=
X-Google-Smtp-Source: AGHT+IHViKgfvzY1lTUxx5aoCaO55RBgNQZZD/mrRkMpBCCo5X1rpdex8BU1V+tHAnGxZUyINIEsHIo7xLys7ZnK/MTLsOYfYmjE
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c84:b0:3cf:c92e:b3a9 with SMTP id
 e9e14a558f8ab-3cffe6b8499mr62911605ab.22.1738243221306; Thu, 30 Jan 2025
 05:20:21 -0800 (PST)
Date: Thu, 30 Jan 2025 05:20:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679b7c95.050a0220.d7c5a.0014.GAE@google.com>
Subject: [syzbot] linux-next build error (19)
From: syzbot <syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-next@vger.kernel.org, 
	samitolvanen@google.com, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a13f6e0f405e Add linux-next specific files for 20250130
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10221ddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3445081dab63716c
dashboard link: https://syzkaller.appspot.com/bug?extid=62ba359e1dfec1473c57
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62ba359e1dfec1473c57@syzkaller.appspotmail.com

scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: dwarf.h: No such file or directory

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

