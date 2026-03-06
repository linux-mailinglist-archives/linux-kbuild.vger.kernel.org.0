Return-Path: <linux-kbuild+bounces-11623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM7+JXMNq2k/ZgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11623-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 18:22:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52B225F97
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 18:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A581630B95CE
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 17:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43DD411618;
	Fri,  6 Mar 2026 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7up+pTV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1123F0775;
	Fri,  6 Mar 2026 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817287; cv=none; b=mNfpbLHu5xJyL2xH6ZpGY7tRg6t1gLVboMPbIdy7Ui4CIGNywE0HJF9z5p9iyiS5+kh0JjPNM+UHA9FVsQiGz64c7KfSh9hR1CB7j+U/TBm7d3KaxMoXPyePne08mUfp3Xilq71xbCnnjIMwYbtSp72pC1CvEuZYpzaLHe6Dpjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817287; c=relaxed/simple;
	bh=lpakn6rDgrUOoPMBtHcGIDZVCwWXH4+PKRrLVmfU6ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqDqMY4Dovy/e5a/kyEc4Yci4YgKb1JL2TraMxgZi4bSGFxfOWEBcXkzq/d1NgOKNAWP0+PqSvqdcdiB8RkcH4AZSnTGnZV45PFSWQ8Y9HRK6UE7FRHsxgDOKohzJe/e4fFf5qwfnRrXY08qK1kd2qJeuA8a7yZYWfkKgpceZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7up+pTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C404DC4CEF7;
	Fri,  6 Mar 2026 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817287;
	bh=lpakn6rDgrUOoPMBtHcGIDZVCwWXH4+PKRrLVmfU6ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7up+pTVJoNlVgn/INPXa3TulXtn7QufEdeCHdlp/W2RYrBdPDAR7AgHoggI6XcMx
	 vUZt3PAEbHwa3L9vxNv1CDHw/ZVi0OdW6dNNyJaexBo/Jz8Onf5uhnHa+9d9TaGZ3l
	 feSe2v+fx/ZClwGd3C+CO3RbRdYs7gNzps7GiwbG2YMuRMk3RihBAkzUZeFPeKI83o
	 a9OJFSmWZwl++Yg9iqoz73qG2735DPl4wpIBXI2sUhFVw+9XuK/l22aWyxmfRdgMCp
	 vAvwNABlRCruuBAtpa/LQsXvAeFYRLgUBo4awwkW1jE5JRplOec8bv0CgNfZGELqXh
	 njtYujszVwJfw==
Date: Fri, 6 Mar 2026 12:14:45 -0500
From: Sasha Levin <sashal@kernel.org>
To: Petr Mladek <pmladek@suse.com>
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
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <aasLhbZmvcQ8sA9P@laps>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <aasClESfxETxliLB@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aasClESfxETxliLB@pathway.suse.cz>
X-Rspamd-Queue-Id: 3F52B225F97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11623-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:36:36PM +0100, Petr Mladek wrote:
>On Tue 2026-03-03 13:21:01, Sasha Levin wrote:
>> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>> lookup table in the kernel image so stack traces directly print source
>> file and line number information:
>>
>>   root@localhost:~# echo c > /proc/sysrq-trigger
>>   [   11.201987] sysrq: Trigger a crash
>>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>>   [   11.206218] Call Trace:
>>   [   11.206501]  <TASK>
>>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>>   [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>>   [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
>>   [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>>   [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
>>   [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
>>   [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>>   [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>>   [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>>   [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>>   [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>>   [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>>   [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
>>   [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)
>>
>> --- a/include/linux/kallsyms.h
>> +++ b/include/linux/kallsyms.h
>> @@ -16,10 +16,19 @@
>>  #include <asm/sections.h>
>>
>>  #define KSYM_NAME_LEN 512
>> +
>> +#ifdef CONFIG_KALLSYMS_LINEINFO
>> +/* Extra space for " (path/to/file.c:12345)" suffix */
>> +#define KSYM_LINEINFO_LEN 128
>> +#else
>> +#define KSYM_LINEINFO_LEN 0
>> +#endif
>> +
>>  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
>
>I guess that this is used also in ftrace where there formatting
>is delayed. We might want:
>
>  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s] (%s:%u)") + \

KSYM_LINEINFO_LEN already covers the full expansion of the path and line
number, not just the literal format characters. ftrace stores raw addresses and
formats via %pS at print time into a KSYM_SYMBOL_LEN-sized buffer, so there
shouldn't be an issue here.

>>  			(KSYM_NAME_LEN - 1) + \
>>  			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
>> -			(BUILD_ID_SIZE_MAX * 2) + 1)
>> +			(BUILD_ID_SIZE_MAX * 2) + 1 + \
>> +			KSYM_LINEINFO_LEN)
>>
>>  struct cred;
>>  struct module;
>> --- a/kernel/kallsyms.c
>> +++ b/kernel/kallsyms.c
>> @@ -467,6 +467,62 @@ static int append_buildid(char *buffer,   const char *modname,
>>
>>  #endif /* CONFIG_STACKTRACE_BUILD_ID */
>>
>> +#ifdef CONFIG_KALLSYMS_LINEINFO
>> +bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
>> +			      const char **file, unsigned int *line)
>> +{
>> +	unsigned long long raw_offset;
>> +	unsigned int offset, low, high, mid, file_id;
>> +	unsigned long line_addr;
>> +
>> +	if (!lineinfo_num_entries)
>> +		return false;
>> +
>> +	/* Compute offset from _text */
>> +	if (addr < (unsigned long)_text)
>> +		return false;
>> +
>> +	raw_offset = addr - (unsigned long)_text;
>> +	if (raw_offset > UINT_MAX)
>> +		return false;
>> +	offset = (unsigned int)raw_offset;
>> +
>> +	/* Binary search for largest entry <= offset */
>> +	low = 0;
>> +	high = lineinfo_num_entries;
>> +	while (low < high) {
>> +		mid = low + (high - low) / 2;
>> +		if (lineinfo_addrs[mid] <= offset)
>> +			low = mid + 1;
>> +		else
>> +			high = mid;
>> +	}
>> +
>> +	if (low == 0)
>> +		return false;
>> +	low--;
>> +
>> +	/*
>> +	 * Validate that the matched lineinfo entry belongs to the same
>> +	 * symbol.  Without this check, assembly routines or other
>> +	 * functions lacking DWARF data would inherit the file:line of
>> +	 * a preceding C function.
>> +	 */
>> +	line_addr = (unsigned long)_text + lineinfo_addrs[low];
>> +	if (line_addr < sym_start)
>> +		return false;
>
>This is suspicious. The binary search does "low = mid + 1".
>I would expect that lineinfo_addrs[low] would point to
>a higher address when the exact match is not found.
>
>Anyway, I think that we should accept only the exact match and do:
>
>	if (lineinfo_addrs[low] != offset)
>		return false;
>
>Or do I miss something? (Friday evening here ;-)

Right, when there's no exact match, low ends up pointing to the next higher
entry. The table is sparse, with one entry per source-line transition, not per
instruction address. The correct result for a given PC is the nearest
preceding entry, so the code uses low - 1 in that case. Same semantics as
kallsyms symbol lookup.

>> +	file_id = lineinfo_file_ids[low];
>> +	*line = lineinfo_lines[low];
>> +
>> +	if (file_id >= lineinfo_num_files)
>> +		return false;
>> +
>> +	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
>> +	return true;
>> +}
>> +#endif /* CONFIG_KALLSYMS_LINEINFO */
>> +
>>  /* Look up a kernel symbol and return it in a text buffer. */
>>  static int __sprint_symbol(char *buffer, unsigned long address,
>>  			   int symbol_offset, int add_offset, int add_buildid)
>> @@ -497,6 +553,19 @@ static int __sprint_symbol(char *buffer, unsigned long address,
>>  		len += sprintf(buffer + len, "]");
>>  	}
>>
>> +#ifdef CONFIG_KALLSYMS_LINEINFO
>> +	if (!modname) {
>> +		const char *li_file;
>> +		unsigned int li_line;
>> +		unsigned long sym_start = address - offset;
>> +
>> +		if (kallsyms_lookup_lineinfo(address, sym_start,
>> +					     &li_file, &li_line))
>> +			len += snprintf(buffer + len, KSYM_SYMBOL_LEN - len,
>
>s/KSYM_SYMBOL_LEN/KSYM_LINEINFO_LEN/

KSYM_SYMBOL_LEN - len is the remaining capacity of the output buffer.  len
tracks total bytes written (symbol + offset + module + buildid), which can
easily exceed 128.

>> +					" (%s:%u)", li_file, li_line);
>> +	}
>> +#endif
>> +
>>  	return len;
>>  }
>
>
>I was rather curious how the code looked like and the mentioned things
>caught my eyes. And I focused on the kernel/kallsyms code.
>
>Unfortunately, I do not have time for a proper full review at the
>moment.
>
>The code seems to work. And it generates relative paths for me, for example:
>
>[  305.678609] sysrq: Show backtrace of all active CPUs
>[  305.680615] NMI backtrace for cpu 0
>[  305.680620] CPU: 0 UID: 0 PID: 1540 Comm: bash Kdump: loaded Not tainted 7.0.0-rc2-default+ #561 PREEMPT(full)  0d0ba470fd9bf64113a65472ab47c033a2658d88
>[  305.680626] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
>[  305.680628] Call Trace:
>[  305.680631]  <TASK>
>[  305.680640]  dump_stack_lvl+0x6c/0xa0 (lib/dump_stack.c:94)
>[  305.680680]  nmi_cpu_backtrace.cold+0x51/0x6a (lib/nmi_backtrace.c:113)
>[  305.680689]  ? __pfx_nmi_raise_cpu_backtrace+0x10/0x10
>[  305.680702]  nmi_trigger_cpumask_backtrace+0x113/0x130 (lib/nmi_backtrace.c:62)
>[  305.680720]  __handle_sysrq.cold+0x9b/0xde (drivers/tty/sysrq.c:611)
>[  305.680734]  write_sysrq_trigger+0x6a/0xb0 (drivers/tty/sysrq.c:1221)
>[  305.680750]  proc_reg_write+0x59/0xa0 (fs/proc/inode.c:330)
>[  305.680763]  vfs_write+0xd0/0x570 (fs/read_write.c:686)
>[  305.680771]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
>[  305.680776]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
>[  305.680779]  ? __lock_release.isra.0+0x1c9/0x300 (kernel/locking/lockdep.c:342)
>[  305.680796]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
>[  305.680813]  ksys_write+0x70/0xf0 (fs/read_write.c:738)
>[  305.680826]  do_syscall_64+0x11d/0x660 (arch/x86/entry/syscall_64.c:63)
>[  305.680832]  ? irqentry_exit+0x94/0x5f0 (./include/linux/irq-entry-common.h:298)
>[  305.680846]  entry_SYSCALL_64_after_hwframe+0x76/0x7e (arch/x86/entry/entry_64.S:121)

Thanks for the review and testing! Have a great weekend!

-- 
Thanks,
Sasha

