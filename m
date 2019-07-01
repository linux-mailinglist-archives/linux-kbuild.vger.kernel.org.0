Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CA544DBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2019 22:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfFMUsE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Jun 2019 16:48:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40314 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfFMUsE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Jun 2019 16:48:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 01294308427C;
        Thu, 13 Jun 2019 20:48:04 +0000 (UTC)
Received: from [10.10.120.121] (ovpn-120-121.rdu2.redhat.com [10.10.120.121])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 593B060FBD;
        Thu, 13 Jun 2019 20:48:03 +0000 (UTC)
Subject: Re: [PATCH v4 00/10] klp-convert livepatch build tooling
From:   Joe Lawrence <joe.lawrence@redhat.com>
To:     Miroslav Benes <mbenes@suse.cz>
Cc:     linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1906131451560.22698@pobox.suse.cz>
 <b1a627a4-3702-9689-6c03-0c2123c06a2d@redhat.com>
Message-ID: <c9021573-11c6-b576-0aa6-97754c98a06e@redhat.com>
Date:   Thu, 13 Jun 2019 16:48:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b1a627a4-3702-9689-6c03-0c2123c06a2d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 13 Jun 2019 20:48:04 +0000 (UTC)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/13/19 9:15 AM, Joe Lawrence wrote:
> On 6/13/19 9:00 AM, Miroslav Benes wrote:
>> Hi Joe,
>>
>> first, I'm sorry for the lack of response so far.
>>
>> Maybe you've already noticed but the selftests fail. Well, at least in
>> my VM. When test_klp_convert1.ko is loaded, the process is killed with
>>
>> [  518.041826] BUG: kernel NULL pointer dereference, address: 0000000000000000
>> [  518.042816] #PF: supervisor read access in kernel mode
>> [  518.043393] #PF: error_code(0x0000) - not-present page
>> [  518.043981] PGD 0 P4D 0
>> [  518.044185] Oops: 0000 [#1] SMP PTI
>> [  518.044518] CPU: 2 PID: 2255 Comm: insmod Tainted: G           O  K   5.1.0-klp_convert_v4-193435-g67748576637e #2
>> [  518.045784] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58-prebuilt.qemu.org 04/01/2014
>> [  518.046940] RIP: 0010:test_klp_convert_init+0x1c/0x40 [test_klp_convert1]
>> [  518.047611] Code: 1b a0 48 89 c6 e9 a8 c0 f4 e0 0f 1f 40 00 0f 1f 44 00 00 53 48 c7 c7 00 30 1b a0 e8 5e 33 f6 e0 85 c0 89 c3 74 04 89 d8 5b c3 <48> 8b 35 5d ef e4 5f 48 c7 c7 28 20 1b a0 e8 75 c0 f4 e0 e8 6c ff
>> [  518.049779] RSP: 0018:ffffc90000f37cc8 EFLAGS: 00010246
>> [  518.050243] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000027de0
>> [  518.050922] RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff88807ab54f40
>> [  518.051619] RBP: ffffffffa01b1080 R08: 0000000096efde7a R09: 0000000000000001
>> [  518.052332] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000ffffffff
>> [  518.053012] R13: 0000000000000000 R14: ffff888078b55000 R15: ffffc90000f37ea0
>> [  518.053714] FS:  00007febece1fb80(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
>> [  518.054514] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  518.055078] CR2: 0000000000000000 CR3: 000000007a56a000 CR4: 00000000000006e0
>> [  518.055818] Call Trace:
>> [  518.056007]  do_one_initcall+0x6a/0x2da
>> [  518.056340]  ? do_init_module+0x22/0x230
>> [  518.056702]  ? rcu_read_lock_sched_held+0x96/0xa0
>> [  518.057125]  ? kmem_cache_alloc_trace+0x284/0x2e0
>> [  518.057493]  do_init_module+0x5a/0x230
>> [  518.057900]  load_module+0x17bc/0x1f50
>> [  518.058214]  ? __symbol_put+0x40/0x40
>> [  518.058499]  ? vfs_read+0x12d/0x160
>> [  518.058766]  __do_sys_finit_module+0x83/0xc0
>> [  518.059122]  do_syscall_64+0x57/0x190
>> [  518.059407]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> ...
>>
>> It crashes right in test_klp_convert_init() when print_*() using
>> supposed-to-be-converted symbols are called. I'll debug it next week. Can
>> you reproduce it too?
> 
> Hey, thanks for the report..
> 
> I don't recall the tests crashing, but I had put this patchset on the
> side for a few weeks now.  I'll try to fire up a VM and see what happens
> today.
> 

Hmm, I haven't been able to reproduce using my original base (Linux 5.1-rc6)
or when rebased ontop of livepatching.git/master + 997a55f3fb6d("stacktrace: Unbreak stack_trace_save_tsk_reliable()")


FWIW, my test_klp_convert1.ko has these klp-converted relocations:

Relocation section [36] '.klp.rela.vmlinux..text.unlikely' for section [ 5] '.text.unlikely' at offset 0x4a6b8 contains 1 entry:                                   
  Offset              Type            Value               Addend Name                                                                                              
  0x0000000000000003  X86_64_PC32     000000000000000000      -4 .klp.sym.vmlinux.saved_command_line,0 

Relocation section [37] '.klp.rela.test_klp_convert_mod..text.unlikely' for section [ 5] '.text.unlikely' at offset 0x4a6d0 contains 4 entries:                    
  Offset              Type            Value               Addend Name                                                                                              
  0x000000000000004e  X86_64_PC32     000000000000000000      -4 .klp.sym.test_klp_convert_mod.get_homonym_string,1                                                
  0x000000000000003d  X86_64_32S      000000000000000000      +0 .klp.sym.test_klp_convert_mod.homonym_string,1                                                    
  0x0000000000000027  X86_64_PC32     000000000000000000      -4 .klp.sym.test_klp_convert_mod.get_driver_name,0                                                   
  0x0000000000000016  X86_64_32S      000000000000000000      +0 .klp.sym.test_klp_convert_mod.driver_name,0

-- Joe
