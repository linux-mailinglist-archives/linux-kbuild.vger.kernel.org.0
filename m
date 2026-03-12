Return-Path: <linux-kbuild+bounces-11872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OALsLkwfsmmyIwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11872-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 03:05:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127826C119
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 03:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A80683046E8C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 02:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BED5375F64;
	Thu, 12 Mar 2026 02:04:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6D175A85;
	Thu, 12 Mar 2026 02:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281098; cv=none; b=mzqKrWFPtJQxS+qXNvjD6mMDMC+zHhI7N7voDYc7h7D0RgeyDx8CCMzFQF0ZLFuIJkcgKnA86RV4SazCsuIYMuzTUllDD2LGxMZM0EHAIRDnZk5bGf8VOQDIjuIu139CVGH5+bm+hPL2YkC5OwgGl+c1DjS3YfmQFu3K7TMRI70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281098; c=relaxed/simple;
	bh=VpIgxxUyFIkYhk2RY03Gd/AgFWTDejEWM/mhGsxaHDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JL8o/UTG4hRTtDB13IVrYopibucrDvK+gebeXZH7CZ2uoEuFzKcfHrlTaJb2NqrL/Apr/n0CoVgM/+kMw2ChCYMNSi1I69h9PiPOxvozZ1E3+wtFmRHDkB7H4gccuGlh4NRDv+Zay/tdaBCqY6ePU1DDlr2zex2YnbKYdqCHsIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.19.38] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowADX8tkLH7Jp5U5pCg--.11376S2;
	Thu, 12 Mar 2026 10:03:55 +0800 (CST)
Message-ID: <b4b8d277-f6af-4207-ac1f-9c352b05995c@iscas.ac.cn>
Date: Thu, 12 Mar 2026 10:03:55 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-4-sashal@kernel.org>
 <e393e07f-368f-4b38-b2ed-937ddcc0a217@iscas.ac.cn> <abGBA0QhAI-kf0mq@laps>
Content-Language: en-US
In-Reply-To: <abGBA0QhAI-kf0mq@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:rQCowADX8tkLH7Jp5U5pCg--.11376S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1kJF4UAFykJr4UAr4kXrb_yoW3tr1Dpr
	Z8K3Wjkr48Xr17Cr4IyF1j9a4Svws3W3W3Xr93Krn5AF4q9rn2vrnaqF1a93Wqvr1rCFyx
	Xw4qyF9I9r98A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU9O6JUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.953];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11872-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2127826C119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sasha,

On 3/11/26 22:49, Sasha Levin wrote:
> Thanks for the review!
>
> On Wed, Mar 11, 2026 at 11:34:24AM +0800, Vivian Wang wrote:
>> Hi Sasha,
>>
>> I've been trying this out and AFAICT this does work perfectly.=C2=A0Th=
ank you
>> for this.
>>
>> There are a few oddities I found:
>>
>> Firstly I've been building with something like O=3D_riscv out of
>> convenience, and the file names have an extra ../ in the front. (This =
is
>> just me exiting out of init=3D/bin/sh.)=C2=A0
>> [    2.317268] Kernel panic - not syncing: Attempted to kill init! exi=
tcode=3D0x00000000
>> [    2.320283] CPU: 0 UID: 0 PID: 1 Comm: sh Not tainted 7.0.0-rc3-000=
04-g8ad18f1a1a2f #31 PREEMPTLAZY
>> [    2.322048] Hardware name: riscv-virtio,qemu (DT)
>> [    2.323220] Call Trace:
>> [    2.324465] [<ffffffff800172a8>] dump_backtrace+0x1c/0x24 (../arch/=
riscv/kernel/stacktrace.c:150)
>> [    2.329061] [<ffffffff8000241e>] show_stack+0x2a/0x34 (../arch/risc=
v/kernel/stacktrace.c:156)
>> [    2.330334] [<ffffffff8000fe32>] dump_stack_lvl+0x4a/0x68 (../lib/d=
ump_stack.c:122)
>> [    2.331462] [<ffffffff8000fe64>] dump_stack+0x14/0x1c (../lib/dump_=
stack.c:130)
>> [    2.332571] [<ffffffff80002a88>] vpanic+0x108/0x2bc (../kernel/pani=
c.c:651)
>> [    2.333674] [<ffffffff80002c6e>] panic+0x32/0x34 (../kernel/panic.c=
:787)
>> [    2.334427] [<ffffffff8002e97a>] do_exit+0x7ee/0x7f4 (../kernel/exi=
t.c:930)
>> [    2.335194] [<ffffffff8002eade>] do_group_exit+0x1a/0x88 (../kernel=
/exit.c:1099)
>> [    2.335945] [<ffffffff8002eb62>] __riscv_sys_exit_group+0x16/0x18 (=
=2E./kernel/exit.c:1129)
>> [    2.336763] [<ffffffff80b3e868>] do_trap_ecall_u+0x260/0x45c (../ar=
ch/riscv/include/asm/syscall.h:112)
>> [    2.337765] [<ffffffff80b4c034>] handle_exception+0x168/0x174 (../a=
rch/riscv/kernel/entry.S:233)=20
>> This is fine by me, but I've seen mentions of O=3D builds but I'm not =
sure
>> if it's expected.
>
> Could you try v2 and see if it makes it prettier? I tried to tackle
> this :)

Thanks, I'll try it out and see.

>
>> Also, toggling CONFIG_KALLSYMS_LINEINFO seems to rebuild every single
>> file. I haven't debugged why, but is this expected?
>
> I think that this is because we increase KSYM_SYMBOL_LEN when lineinfo =
is
> enabled. I suppose we can just increase the size irregardless of whethe=
r
> lineinfo is enabled and ignore the waste?
>
> Or, folks really won't be toggling this option too often for the
> rebuilds to
> matter too much, so we can just enjoy the savings?=C2=A0

Yeah I understand now. The size affects some fundamental headers.

I just thought it was odd. The current situation is fine by me - if I'm
building a kernel and toggling configs, it means I have the vmlinux file
and can use scripts/decode_stacktrace.sh :)

>> I have a few ideas about the code as well. Since this patch 3 touches
>> most of the files involved, I'll just dump my thoughts on the whole
>> series here. I want to note that I haven't read the RFC thread too
>> carefully, but I don't think there were many comments on the
>> implementation.
>>
>> On 3/4/26 02:21, Sasha Levin wrote:
>>> Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
>>> lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
>>> delta-encoded, ULEB128 varint compressed format.
>>>
>>> The sorted address array has small deltas between consecutive entries=

>>> (typically 1-50 bytes), file IDs have high locality (delta often 0,
>>> same file), and line numbers change slowly.  Delta-encoding followed
>>> by ULEB128 varint compression shrinks most values from 4 bytes to 1.
>>>
>>> Entries are grouped into blocks of 64.  A small uncompressed block
>>> index (first addr + byte offset per block) enables O(log(N/64)) binar=
y
>>> search, followed by sequential decode of at most 64 varints within th=
e
>>> matching block.  All decode state lives on the stack -- zero
>>> allocations, still safe for NMI/panic context.
>>>
>>> Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
>>> source files, 47,144 blocks):
>>>
>>>   Before (flat arrays):
>>>     lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
>>>     lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
>>>     lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
>>>     Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)=

>>>
>>>   After (block-indexed delta + ULEB128):
>>>     lineinfo_block_addrs[]    188,576 bytes (184 KiB)
>>>     lineinfo_block_offsets[]  188,576 bytes (184 KiB)
>>>     lineinfo_data[]        10,926,128 bytes (10.4 MiB)
>>>     Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entr=
y)
>>>
>>>   Savings: 18.0 MiB (2.7x reduction)
>>>
>>> Booted in QEMU and verified with SysRq-l that annotations still work:=

>>>
>>>   default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
>>>   default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
>>>   do_idle+0x335/0x490 (kernel/sched/idle.c:191)
>>>   cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
>>>   rest_init+0x1aa/0x1b0 (init/main.c:760)
>>>
>>> Suggested-by: Juergen Gross <jgross@suse.com>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>> ---
>>>  .../admin-guide/kallsyms-lineinfo.rst         |   7 +-
>>>  include/linux/mod_lineinfo.h                  | 103 ++++++++--
>>>  init/Kconfig                                  |   8 +-
>>>  kernel/kallsyms.c                             |  91 +++++++--
>>>  kernel/kallsyms_internal.h                    |   7 +-
>>>  kernel/module/kallsyms.c                      | 107 +++++++---
>>>  scripts/gen_lineinfo.c                        | 192 ++++++++++++++--=
--
>>>  scripts/kallsyms.c                            |   7 +-
>>>  scripts/link-vmlinux.sh                       |  16 +-
>>>  9 files changed, 423 insertions(+), 115 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Docume=
ntation/admin-guide/kallsyms-lineinfo.rst
>>> index 21450569d5324..fe92c5dde16b3 100644
>>> --- a/Documentation/admin-guide/kallsyms-lineinfo.rst
>>> +++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
>>> @@ -76,10 +76,11 @@ Memory Overhead
>>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>>  The vmlinux lineinfo tables are stored in ``.rodata`` and typically =
add
>>> -approximately 44 MiB to the kernel image for a standard configuratio=
n
>>> -(~4.6 million DWARF line entries, ~10 bytes per entry after deduplic=
ation).
>>> +approximately 10-15 MiB to the kernel image for a standard configura=
tion
>>> +(~4.6 million DWARF line entries, ~2-3 bytes per entry after delta
>>> +compression).
>>>
>>> -Per-module lineinfo adds approximately 10 bytes per DWARF line entry=
 to each
>>> +Per-module lineinfo adds approximately 2-3 bytes per DWARF line entr=
y to each
>>>  ``.ko`` file.=20
>>
>> Maybe this could be given in terms of percentages? It wasn't obvious t=
o
>> me what 10-15 MiB amounts to.
>>
>> On riscv64, I'm seeing a 24.2 MiB to 30.2 MiB increase in
>> arch/riscv/boot/Image size on an approximately defconfig+mod2noconfig
>> build, which is about a 25% increase. I haven't checked yet, but if 25=
%
>> is similar to what other archs get, that's a more useful figure than
>> 10-15 MiB, given that the size increase is correlated to the total
>> amount of code linked into the kernel/module.
>
> I ended up giving an example instead of percentages because it seemed
> to vary
> wildly between configs and archs. For example, defconfig on x86 yields
> a 15%
> increase compared to the 25% you see with your config on riscv,
> compared to a
> 39% increase with defconfig on riscv.=C2=A0

That's fair. I guess it also depends on arch code density and compiler
codegen.

[...]

>>> +/*
>>> + * Read a ULEB128 varint from a byte stream.
>>> + * Returns the decoded value and advances *pos past the encoded byte=
s.
>>> + * If *pos would exceed 'end', returns 0 and sets *pos =3D end (safe=
 for
>>> + * NMI/panic context -- no crash, just a missed annotation).=20
>>
>> What does that last bit mean...?
>
> This goes back to your previous point about correctness and checks in t=
he
> lineinfo code :)
>
> It just means that this function never faults or allocates. On bad
> input it
> returns 0, so the worst case is a missing annotation, not a crash.=C2=A0=


Ah, right, it didn't occur to me it was "annotation" as in the lineinfo
annotation in the stack trace. I thought it was something like noinstr
or lockdep stuff at first. This checks out.

Vivian "dramforever" Wang


