Return-Path: <linux-kbuild+bounces-8906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED397B86B98
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 21:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D1F162B89
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 19:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0F62DCF57;
	Thu, 18 Sep 2025 19:41:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91F2DCBE2
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758224490; cv=none; b=os2FWEalxfnkqU+n56uu74IIRQqAhoaE2kGU/2Zxdg+dylssY0oeCY8LGUbbCMKVoFWDT8P6S2Ki+h+ggH0IJNshIBf7GX9DlOXNzGlUtWjMQLVUli7QjuO78u1mgkIEuOqhwvXC16R3K5+MGbIdv4k40KDHe9TCiHPenKR5p9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758224490; c=relaxed/simple;
	bh=T/vMTlrI2wJvYyocljij2z38BbG6i8y7B8tVboZ9r2c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=MNf3qeRxhmiqdCy4mrJNXYo8VoY0+DcMJ7dH9rRrmIXEp3roUVj5vzKzVVOawj3m42FRGWsomvPwJzFNdo9a5K5t5fFi0KBUL20pF2f40PLzu3649IwusdGVG5z8AYqCuihyrfgdsy0qVDKl9OlSLyW8WlCNwzkFChiidFZS3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-4247d389921so10285755ab.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 12:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758224487; x=1758829287;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFuQa+Y4FpaQQeM/M6InReVDIhcGmsMw+atLDwBDLk8=;
        b=wuj8+4Hu8Sx3bz+twtXkaZi8pIAzKdn2LYBXAkS6+9734jXnyv105UNz6trMzvxASc
         TkeNVC2q66OaKDJe0903PHIpTAB37fxG2gSmvQEzaJ4fyDbwRH6WiNV526BCT/TPLEee
         GJWxy/SGsXt/QpG9PAEvX8urcw7hTOBvQi9y/eXEKr8M8gP4+g7+EoNhxnPpMbJkw9Fi
         cQI9d0QBGNbGUrSUQJUdaxsjuR+nlR89zpJEgewUXA0sOrkt4jRnZFeBE5qXxXT/lP04
         aJP+OqorxdPpnUhnPiPGORGncnQRm0VV1lMdo+ywrzyjS5SAuCjHt3Y74TfRl7eJa5hz
         wruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwk6bxbSS56UWndlQPmJBBzCmtbfH4aNc9wEfNfqOlMYVHsyU/sh1pzUDQOmtcVI+Ux/hqK9/i4zWGsNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7lQ6kRIjrrKRvCBEbHEd7mCRvD6OPXzKUoZ2gH03q/C8X5wMd
	Jd0Sc9P6ZAczDdPJz2usaEOcMHDrDGG16LoDlw2Rv9Btx1uX1q3poKtI1S0oYumA3jiYh2rsDAh
	1rQEEaKfxNnuTIMl8h02IjlP4GhRnKGSnUqAeTrz2FS4kttnPqATTh3YNpxw=
X-Google-Smtp-Source: AGHT+IHp+WmIL2IJ68tyFld/0nIXw957th39hMRbu6ab9TAjY+iGCLjCAkmJaJtBL9BpNCxThFERyAxXTWPP+JGSPca9tDNIDuO7
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184d:b0:40c:cf06:ea2a with SMTP id
 e9e14a558f8ab-424816f2c45mr17310755ab.2.1758224487064; Thu, 18 Sep 2025
 12:41:27 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:41:27 -0700
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68cc6067.a00a0220.37dadf.0003.GAE@google.com>
Subject: [syzbot ci] Re: Compiler-Based Capability- and Locking-Analysis
From: syzbot ci <syzbot+ciac51bb7578ba7c59@syzkaller.appspotmail.com>
To: arnd@arndb.de, boqun.feng@gmail.com, bvanassche@acm.org, corbet@lwn.net, 
	davem@davemloft.net, dvyukov@google.com, edumazet@google.com, 
	elver@google.com, frederic@kernel.org, glider@google.com, 
	gregkh@linuxfoundation.org, hch@lst.de, herbert@gondor.apana.org.au, 
	irogers@google.com, jannh@google.com, joelagnelf@nvidia.com, 
	josh@joshtriplett.org, justinstitt@google.com, kasan-dev@googlegroups.com, 
	kees@kernel.org, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com, 
	luc.vanoostenryck@gmail.com, lukas.bulwahn@gmail.com, mark.rutland@arm.com, 
	mathieu.desnoyers@efficios.com, mingo@kernel.org, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, neeraj.upadhyay@kernel.org, 
	nick.desaulniers@gmail.com, ojeda@kernel.org, paulmck@kernel.org, 
	penguin-kernel@i-love.sakura.ne.jp, peterz@infradead.org, rcu@vger.kernel.org, 
	rostedt@goodmis.org, takedakn@nttdata.co.jp, tglx@linutronix.de, 
	tgraf@suug.ch, urezki@gmail.com, will@kernel.org
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v3] Compiler-Based Capability- and Locking-Analysis
https://lore.kernel.org/all/20250918140451.1289454-1-elver@google.com
* [PATCH v3 01/35] compiler_types: Move lock checking attributes to compiler-capability-analysis.h
* [PATCH v3 02/35] compiler-capability-analysis: Add infrastructure for Clang's capability analysis
* [PATCH v3 03/35] compiler-capability-analysis: Add test stub
* [PATCH v3 04/35] Documentation: Add documentation for Compiler-Based Capability Analysis
* [PATCH v3 05/35] checkpatch: Warn about capability_unsafe() without comment
* [PATCH v3 06/35] cleanup: Basic compatibility with capability analysis
* [PATCH v3 07/35] lockdep: Annotate lockdep assertions for capability analysis
* [PATCH v3 08/35] locking/rwlock, spinlock: Support Clang's capability analysis
* [PATCH v3 09/35] compiler-capability-analysis: Change __cond_acquires to take return value
* [PATCH v3 10/35] locking/mutex: Support Clang's capability analysis
* [PATCH v3 11/35] locking/seqlock: Support Clang's capability analysis
* [PATCH v3 12/35] bit_spinlock: Include missing <asm/processor.h>
* [PATCH v3 13/35] bit_spinlock: Support Clang's capability analysis
* [PATCH v3 14/35] rcu: Support Clang's capability analysis
* [PATCH v3 15/35] srcu: Support Clang's capability analysis
* [PATCH v3 16/35] kref: Add capability-analysis annotations
* [PATCH v3 17/35] locking/rwsem: Support Clang's capability analysis
* [PATCH v3 18/35] locking/local_lock: Include missing headers
* [PATCH v3 19/35] locking/local_lock: Support Clang's capability analysis
* [PATCH v3 20/35] locking/ww_mutex: Support Clang's capability analysis
* [PATCH v3 21/35] debugfs: Make debugfs_cancellation a capability struct
* [PATCH v3 22/35] compiler-capability-analysis: Remove Sparse support
* [PATCH v3 23/35] compiler-capability-analysis: Remove __cond_lock() function-like helper
* [PATCH v3 24/35] compiler-capability-analysis: Introduce header suppressions
* [PATCH v3 25/35] compiler: Let data_race() imply disabled capability analysis
* [PATCH v3 26/35] MAINTAINERS: Add entry for Capability Analysis
* [PATCH v3 27/35] kfence: Enable capability analysis
* [PATCH v3 28/35] kcov: Enable capability analysis
* [PATCH v3 29/35] kcsan: Enable capability analysis
* [PATCH v3 30/35] stackdepot: Enable capability analysis
* [PATCH v3 31/35] rhashtable: Enable capability analysis
* [PATCH v3 32/35] printk: Move locking annotation to printk.c
* [PATCH v3 33/35] security/tomoyo: Enable capability analysis
* [PATCH v3 34/35] crypto: Enable capability analysis
* [PATCH v3 35/35] sched: Enable capability analysis for core.c and fair.c

and found the following issue:
general protection fault in validate_page_before_insert

Full report is available here:
https://ci.syzbot.org/series/81182522-74c0-4494-bcf8-976133df7dc7

***

general protection fault in validate_page_before_insert

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      f83ec76bf285bea5727f478a68b894f5543ca76e
arch:      amd64
compiler:  Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
config:    https://ci.syzbot.org/builds/8f7ff868-4cf7-40da-b62b-45ebfec4e994/config

cgroup: Unknown subsys name 'net'
cgroup: Unknown subsys name 'cpuset'
cgroup: Unknown subsys name 'rlimit'
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 5775 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:validate_page_before_insert+0x2a/0x300
Code: 55 41 57 41 56 41 55 41 54 53 48 89 f3 49 89 fe 49 bd 00 00 00 00 00 fc ff df e8 f1 3f b3 ff 4c 8d 7b 08 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 17 b3 16 00 4d 8b 3f 4c 89 fe 48
RSP: 0018:ffffc90002a5f608 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffff888022891cc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888028c71200
RBP: ffffc90002a5f720 R08: 0000000000000000 R09: 1ffff11021cf81e0
R10: dffffc0000000000 R11: ffffed1021cf81e1 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888028c71200 R15: 0000000000000008
FS:  00005555815ad500(0000) GS:ffff8880b8615000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1788fd20b8 CR3: 000000010d8a4000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 insert_page+0x90/0x2c0
 kcov_mmap+0xc3/0x130
 mmap_region+0x18ae/0x20c0
 do_mmap+0xc45/0x10d0
 vm_mmap_pgoff+0x2a6/0x4d0
 ksys_mmap_pgoff+0x51f/0x760
 do_syscall_64+0xfa/0x3b0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1788d8ebe3
Code: f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 41 89 ca 41 f7 c1 ff 0f 00 00 75 14 b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 25 c3 0f 1f 40 00 48 c7 c0 a8 ff ff ff 64 c7
RSP: 002b:00007ffc8a37e638 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007ffc8a37e670 RCX: 00007f1788d8ebe3
RDX: 0000000000000003 RSI: 0000000000400000 RDI: 00007f17867ff000
RBP: 00007ffc8a37e940 R08: 00000000000000d8 R09: 0000000000000000
R10: 0000000000000011 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000000 R14: 00007f1788fa11c0 R15: 00007f1788e2e478
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:validate_page_before_insert+0x2a/0x300
Code: 55 41 57 41 56 41 55 41 54 53 48 89 f3 49 89 fe 49 bd 00 00 00 00 00 fc ff df e8 f1 3f b3 ff 4c 8d 7b 08 4c 89 f8 48 c1 e8 03 <42> 80 3c 28 00 74 08 4c 89 ff e8 17 b3 16 00 4d 8b 3f 4c 89 fe 48
RSP: 0018:ffffc90002a5f608 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffff888022891cc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888028c71200
RBP: ffffc90002a5f720 R08: 0000000000000000 R09: 1ffff11021cf81e0
R10: dffffc0000000000 R11: ffffed1021cf81e1 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888028c71200 R15: 0000000000000008
FS:  00005555815ad500(0000) GS:ffff8880b8615000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1788fd20b8 CR3: 000000010d8a4000 CR4: 00000000000006f0


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

