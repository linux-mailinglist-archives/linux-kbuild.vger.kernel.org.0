Return-Path: <linux-kbuild+bounces-11873-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD4uOZQismnlIwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11873-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 03:19:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A226C266
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 03:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77573306585B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 02:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8A433F8C4;
	Thu, 12 Mar 2026 02:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLM2wnaF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E433F39C;
	Thu, 12 Mar 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281904; cv=none; b=BnHvNg+kNva9q58BYx10GdZWDHDYQ34Y3Wl79buKX1LeZUKCf//PQ3DMpN+Syf7VWWTzQ3tLxrchoFUY7LoaU7ELiEL8oFO68LsSNHaqRd3Q4h/pBp8XMLyn/DzPWvkX9DFNoWib38J3g3e8omBCvPfNMJAFKfkStk7QXYApLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281904; c=relaxed/simple;
	bh=wJRNGLgBDv9oro+nAnU2bDCWCxixiUzUxLN0YtCkQLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml1h7rEubuINYHzL6zpDfry1lr8Tf/2E2sZxucLpNI+mlHW4DOUl99MT0scGH7QXts69/Ho8v1k1EWB+tv+SFJ2AahbieV1vZz1TxQeTk9mYqE7SHuG0RHVRm8zoPGTDHGiRQAQSN1waMShWsdN0axBocMRNAfEBvzF8G7E/7o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLM2wnaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819F3C4CEF7;
	Thu, 12 Mar 2026 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773281903;
	bh=wJRNGLgBDv9oro+nAnU2bDCWCxixiUzUxLN0YtCkQLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLM2wnaFvrliAjpMpXLqcidlLlx/Mt6c7GH2rDY9DvwBsKqm0UE3Xnsokh641fyf4
	 ra4lTkOmcBHYSu9saXHoXowx7EdJEPHscv7wqMCZlz24CUpgnIc1yKBvBkSA6xctW5
	 3wFECBec42I/yP+2ooiy8vtCXsD3bV89mppPBETKcElRlYc6suIo3H5W+qtnAvI//v
	 tj5Y5F3nvKeelVwgVjmNLt+lQiMa/tg6PF6+TRq9vqWS+/xfnyx5iSKWDYTPFhmJ/W
	 M29oE2ncEw/isL0ZqlwQvdeBenS8agaKgvkZVTB0u2+UAXJFaZJj1qHWYpAYtaV8e9
	 Cw6XJ68lIYUvQ==
Date: Wed, 11 Mar 2026 22:18:22 -0400
From: Sasha Levin <sashal@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
Message-ID: <abIiboWICm309vVd@laps>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-4-sashal@kernel.org>
 <e393e07f-368f-4b38-b2ed-937ddcc0a217@iscas.ac.cn>
 <abGBA0QhAI-kf0mq@laps>
 <b4b8d277-f6af-4207-ac1f-9c352b05995c@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4b8d277-f6af-4207-ac1f-9c352b05995c@iscas.ac.cn>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11873-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 823A226C266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:03:55AM +0800, Vivian Wang wrote:
>Hi Sasha,
>
>On 3/11/26 22:49, Sasha Levin wrote:
>> Thanks for the review!
>>
>> On Wed, Mar 11, 2026 at 11:34:24AM +0800, Vivian Wang wrote:
>>> Hi Sasha,
>>>
>>> I've been trying this out and AFAICT this does work perfectly. Thank you
>>> for this.
>>>
>>> There are a few oddities I found:
>>>
>>> Firstly I've been building with something like O=_riscv out of
>>> convenience, and the file names have an extra ../ in the front. (This is
>>> just me exiting out of init=/bin/sh.) 
>>> [    2.317268] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>>> [    2.320283] CPU: 0 UID: 0 PID: 1 Comm: sh Not tainted 7.0.0-rc3-00004-g8ad18f1a1a2f #31 PREEMPTLAZY
>>> [    2.322048] Hardware name: riscv-virtio,qemu (DT)
>>> [    2.323220] Call Trace:
>>> [    2.324465] [<ffffffff800172a8>] dump_backtrace+0x1c/0x24 (../arch/riscv/kernel/stacktrace.c:150)
>>> [    2.329061] [<ffffffff8000241e>] show_stack+0x2a/0x34 (../arch/riscv/kernel/stacktrace.c:156)
>>> [    2.330334] [<ffffffff8000fe32>] dump_stack_lvl+0x4a/0x68 (../lib/dump_stack.c:122)
>>> [    2.331462] [<ffffffff8000fe64>] dump_stack+0x14/0x1c (../lib/dump_stack.c:130)
>>> [    2.332571] [<ffffffff80002a88>] vpanic+0x108/0x2bc (../kernel/panic.c:651)
>>> [    2.333674] [<ffffffff80002c6e>] panic+0x32/0x34 (../kernel/panic.c:787)
>>> [    2.334427] [<ffffffff8002e97a>] do_exit+0x7ee/0x7f4 (../kernel/exit.c:930)
>>> [    2.335194] [<ffffffff8002eade>] do_group_exit+0x1a/0x88 (../kernel/exit.c:1099)
>>> [    2.335945] [<ffffffff8002eb62>] __riscv_sys_exit_group+0x16/0x18 (../kernel/exit.c:1129)
>>> [    2.336763] [<ffffffff80b3e868>] do_trap_ecall_u+0x260/0x45c (../arch/riscv/include/asm/syscall.h:112)
>>> [    2.337765] [<ffffffff80b4c034>] handle_exception+0x168/0x174 (../arch/riscv/kernel/entry.S:233)
>>> This is fine by me, but I've seen mentions of O= builds but I'm not sure
>>> if it's expected.
>>
>> Could you try v2 and see if it makes it prettier? I tried to tackle
>> this :)
>
>Thanks, I'll try it out and see.
>
>>
>>> Also, toggling CONFIG_KALLSYMS_LINEINFO seems to rebuild every single
>>> file. I haven't debugged why, but is this expected?
>>
>> I think that this is because we increase KSYM_SYMBOL_LEN when lineinfo is
>> enabled. I suppose we can just increase the size irregardless of whether
>> lineinfo is enabled and ignore the waste?
>>
>> Or, folks really won't be toggling this option too often for the
>> rebuilds to
>> matter too much, so we can just enjoy the savings? 
>
>Yeah I understand now. The size affects some fundamental headers.
>
>I just thought it was odd. The current situation is fine by me - if I'm
>building a kernel and toggling configs, it means I have the vmlinux file
>and can use scripts/decode_stacktrace.sh :)
>
>>> I have a few ideas about the code as well. Since this patch 3 touches
>>> most of the files involved, I'll just dump my thoughts on the whole
>>> series here. I want to note that I haven't read the RFC thread too
>>> carefully, but I don't think there were many comments on the
>>> implementation.
>>>
>>> On 3/4/26 02:21, Sasha Levin wrote:
>>>> Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
>>>> lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
>>>> delta-encoded, ULEB128 varint compressed format.
>>>>
>>>> The sorted address array has small deltas between consecutive entries
>>>> (typically 1-50 bytes), file IDs have high locality (delta often 0,
>>>> same file), and line numbers change slowly.  Delta-encoding followed
>>>> by ULEB128 varint compression shrinks most values from 4 bytes to 1.
>>>>
>>>> Entries are grouped into blocks of 64.  A small uncompressed block
>>>> index (first addr + byte offset per block) enables O(log(N/64)) binary
>>>> search, followed by sequential decode of at most 64 varints within the
>>>> matching block.  All decode state lives on the stack -- zero
>>>> allocations, still safe for NMI/panic context.
>>>>
>>>> Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
>>>> source files, 47,144 blocks):
>>>>
>>>>   Before (flat arrays):
>>>>     lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
>>>>     lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
>>>>     lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
>>>>     Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)
>>>>
>>>>   After (block-indexed delta + ULEB128):
>>>>     lineinfo_block_addrs[]    188,576 bytes (184 KiB)
>>>>     lineinfo_block_offsets[]  188,576 bytes (184 KiB)
>>>>     lineinfo_data[]        10,926,128 bytes (10.4 MiB)
>>>>     Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entry)
>>>>
>>>>   Savings: 18.0 MiB (2.7x reduction)
>>>>
>>>> Booted in QEMU and verified with SysRq-l that annotations still work:
>>>>
>>>>   default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
>>>>   default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
>>>>   do_idle+0x335/0x490 (kernel/sched/idle.c:191)
>>>>   cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
>>>>   rest_init+0x1aa/0x1b0 (init/main.c:760)
>>>>
>>>> Suggested-by: Juergen Gross <jgross@suse.com>
>>>> Assisted-by: Claude:claude-opus-4-6
>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>> ---
>>>>  .../admin-guide/kallsyms-lineinfo.rst         |   7 +-
>>>>  include/linux/mod_lineinfo.h                  | 103 ++++++++--
>>>>  init/Kconfig                                  |   8 +-
>>>>  kernel/kallsyms.c                             |  91 +++++++--
>>>>  kernel/kallsyms_internal.h                    |   7 +-
>>>>  kernel/module/kallsyms.c                      | 107 +++++++---
>>>>  scripts/gen_lineinfo.c                        | 192 ++++++++++++++----
>>>>  scripts/kallsyms.c                            |   7 +-
>>>>  scripts/link-vmlinux.sh                       |  16 +-
>>>>  9 files changed, 423 insertions(+), 115 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
>>>> index 21450569d5324..fe92c5dde16b3 100644
>>>> --- a/Documentation/admin-guide/kallsyms-lineinfo.rst
>>>> +++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
>>>> @@ -76,10 +76,11 @@ Memory Overhead
>>>>  ===============
>>>>
>>>>  The vmlinux lineinfo tables are stored in ``.rodata`` and typically add
>>>> -approximately 44 MiB to the kernel image for a standard configuration
>>>> -(~4.6 million DWARF line entries, ~10 bytes per entry after deduplication).
>>>> +approximately 10-15 MiB to the kernel image for a standard configuration
>>>> +(~4.6 million DWARF line entries, ~2-3 bytes per entry after delta
>>>> +compression).
>>>>
>>>> -Per-module lineinfo adds approximately 10 bytes per DWARF line entry to each
>>>> +Per-module lineinfo adds approximately 2-3 bytes per DWARF line entry to each
>>>>  ``.ko`` file.
>>>
>>> Maybe this could be given in terms of percentages? It wasn't obvious to
>>> me what 10-15 MiB amounts to.
>>>
>>> On riscv64, I'm seeing a 24.2 MiB to 30.2 MiB increase in
>>> arch/riscv/boot/Image size on an approximately defconfig+mod2noconfig
>>> build, which is about a 25% increase. I haven't checked yet, but if 25%
>>> is similar to what other archs get, that's a more useful figure than
>>> 10-15 MiB, given that the size increase is correlated to the total
>>> amount of code linked into the kernel/module.
>>
>> I ended up giving an example instead of percentages because it seemed
>> to vary
>> wildly between configs and archs. For example, defconfig on x86 yields
>> a 15%
>> increase compared to the 25% you see with your config on riscv,
>> compared to a
>> 39% increase with defconfig on riscv. 
>
>That's fair. I guess it also depends on arch code density and compiler
>codegen.
>
>[...]
>
>>>> +/*
>>>> + * Read a ULEB128 varint from a byte stream.
>>>> + * Returns the decoded value and advances *pos past the encoded bytes.
>>>> + * If *pos would exceed 'end', returns 0 and sets *pos = end (safe for
>>>> + * NMI/panic context -- no crash, just a missed annotation).
>>>
>>> What does that last bit mean...?
>>
>> This goes back to your previous point about correctness and checks in the
>> lineinfo code :)
>>
>> It just means that this function never faults or allocates. On bad
>> input it
>> returns 0, so the worst case is a missing annotation, not a crash. 
>
>Ah, right, it didn't occur to me it was "annotation" as in the lineinfo
>annotation in the stack trace. I thought it was something like noinstr
>or lockdep stuff at first. This checks out.

Thanks again for the review! I'll send a v3 :)

-- 
Thanks,
Sasha

