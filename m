Return-Path: <linux-kbuild+bounces-11620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK4AK7UCq2nDZQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11620-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:37:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 510AC225371
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 076223039347
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 16:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403B82472AA;
	Fri,  6 Mar 2026 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q7SV/huA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D4395DBC
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815004; cv=none; b=ZU1syFU+YLcjAstYtOC2QYunKAMBF1/ogcYxFQfKjYDgjkcJBR2d/6c4qgQg+PF4jWkxjrGtQfs289wQAADUZsqNnCOhya/W42577YVVIFhncp3K6v1ie+7QUzXaYx+9qND4rjKuGMde/90gUjoMUT4x918a8yKk5Glk1OsyeH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815004; c=relaxed/simple;
	bh=VZ91cyYDU1kzu2IjGEHQXiTnwLVV6D1AQC8ePcWTfUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7pwMA9Z72M1dibN4zbpgp8hj6iB1el5fN0FLlzeMI0wLF204pSGNRtDRkvWagnMWBjAFgEKoeHkQ8FcPcGbjBnSdFUXSsrgAvSS0rqgdwSuUYwVFbXk0VBT8HgIehwRLGBXb0NejHIctyPY0Gtg31L2uFO5jjO6RUTVN4DdIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q7SV/huA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso82273885e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Mar 2026 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772814999; x=1773419799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9LJVm9jqaYh2hpW6Zg3OvyIX99DBGLgmLsztlka6wY=;
        b=Q7SV/huA6yclIV8EhzfTrLnW7pQaLp/qDctVaadC13oT+837nl/rLIykkLJt/3RuD0
         XiWuJp9hgTJkv2UO2fS0XcTvN3u+zTYj+x4XHoMl2BHmsJH22FYUIfNYPSRq+tAUgttY
         lRttEhLpPGIyowywmzaxU7xxvVyggSRdWWEI9MTvIKAxbVJbEj4SekERVPxDt7s+NJCb
         Sd6kuH/3xlZry+6hUAStBJ1mdXrfBNuVORmXpV6XxBsoM+MQS1BVaX3G3OtYlYF26Nm9
         /W3cI7SoPhliLOO9NOaZE5+PF9d9D1Ta8F8jz3xPC4GsAoU1E6VI9F4u+qgL826BvZx1
         X6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814999; x=1773419799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9LJVm9jqaYh2hpW6Zg3OvyIX99DBGLgmLsztlka6wY=;
        b=ZzHleSAbA7M4Tek5tZTVQdZiE0WLg8kEqT4WT6N4aunfsWKTxCIVwQkqDW7VwxDUMS
         CYcjQlBjCkA321aXFoNBlVHbsqlega5gdlaVnXu5UnoBhMF/4z6tZKCbesBTx3M4ToBP
         qYu5ImryxL5Ffn3hgBmLa4vAAGogRIKZu44wTtR5w2Uef9PJvmfhYbYegJeWwiIrMVW/
         85FJ7hPIRYtjGKN9PWU3mWUhTDygD1KwcAtvoRxxwOerfc/BIWrfDWY7Sp21habA4mtI
         j8rEcOTHA5r1TDYnMionFHfvMtFzuSq/9DquNd0bRgSsihSpCfN5gFLYE5kaIRR7Yt9N
         2lVg==
X-Forwarded-Encrypted: i=1; AJvYcCXMoWOUzG2a+cnOlxUJFZo3WDq+mBarG5xZsQGTsIzB3dXno0mfzNoNhX7EZCnRTYJAMaGGJiDUZ3/OKM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYnbsAnxlApqnt2pru9Y7gm2wkYl4TtFRmjlX2WTebk9jUTwz
	4wfqDmFeR/PToa3PS5Bh6T3Eli32R6gxEA/d5f9XZcVMEMx8x6sJ3pSq+RiNkhyhRk4=
X-Gm-Gg: ATEYQzxMWKm28qsgEt6+ACq3PnJUipXU8UJGjRGMpw8gEbiv9xH46HiD5T/SzleLPhg
	kfmI51usCEymqTRu7OuI4/ZbC6Iuf0ui+u8fnIe3TU0s4bsHFcRLyYT6N4tbE1tKEmRrqWtMWUG
	l4cDsvkyRizjA9LwakPWe6sPSx0QilQCWbT4BXzrxQrd0/ExvZK4e/tXZZ1li95rk8Ue7HfTl3a
	Q8JMsn0bKHx3E4hvvl2OprdorEavGEcvPh6wwREWUMpzcSn7YbKiNbQrPW7ZDtF5CrJjPzECRGk
	yW5TtOYwFCSULwgnx2J+vaHPC6UBPhve3KnEmhASSEwQRJv8UHJu8IYh82JxGVR3iK5WARDA0HY
	dSQPxPf5DAl28VawlGug+JJu5S12Jky+trCkvVvM/X4Ld98LfwHet7Yhbp2IGOF51rsXSjbPcfQ
	O4jDnDvTnfaE3E58gDSLi5W1gGV1hdf4/2rxmx
X-Received: by 2002:a05:600c:1913:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-4852696d4abmr41381685e9.30.1772814999330;
        Fri, 06 Mar 2026 08:36:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb3668csm216895785e9.13.2026.03.06.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:36:38 -0800 (PST)
Date: Fri, 6 Mar 2026 17:36:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
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
Message-ID: <aasClESfxETxliLB@pathway.suse.cz>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303182103.3523438-2-sashal@kernel.org>
X-Rspamd-Queue-Id: 510AC225371
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11620-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.939];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,localhost:email,suse.com:dkim]
X-Rspamd-Action: no action

On Tue 2026-03-03 13:21:01, Sasha Levin wrote:
> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> lookup table in the kernel image so stack traces directly print source
> file and line number information:
> 
>   root@localhost:~# echo c > /proc/sysrq-trigger
>   [   11.201987] sysrq: Trigger a crash
>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>   [   11.206218] Call Trace:
>   [   11.206501]  <TASK>
>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>   [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>   [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
>   [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>   [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
>   [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
>   [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>   [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>   [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>   [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>   [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>   [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>   [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
>   [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)
> 
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -16,10 +16,19 @@
>  #include <asm/sections.h>
>  
>  #define KSYM_NAME_LEN 512
> +
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +/* Extra space for " (path/to/file.c:12345)" suffix */
> +#define KSYM_LINEINFO_LEN 128
> +#else
> +#define KSYM_LINEINFO_LEN 0
> +#endif
> +
>  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \

I guess that this is used also in ftrace where there formatting
is delayed. We might want:

  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s] (%s:%u)") + \

>  			(KSYM_NAME_LEN - 1) + \
>  			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
> -			(BUILD_ID_SIZE_MAX * 2) + 1)
> +			(BUILD_ID_SIZE_MAX * 2) + 1 + \
> +			KSYM_LINEINFO_LEN)
>  
>  struct cred;
>  struct module;
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -467,6 +467,62 @@ static int append_buildid(char *buffer,   const char *modname,
>  
>  #endif /* CONFIG_STACKTRACE_BUILD_ID */
>  
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
> +			      const char **file, unsigned int *line)
> +{
> +	unsigned long long raw_offset;
> +	unsigned int offset, low, high, mid, file_id;
> +	unsigned long line_addr;
> +
> +	if (!lineinfo_num_entries)
> +		return false;
> +
> +	/* Compute offset from _text */
> +	if (addr < (unsigned long)_text)
> +		return false;
> +
> +	raw_offset = addr - (unsigned long)_text;
> +	if (raw_offset > UINT_MAX)
> +		return false;
> +	offset = (unsigned int)raw_offset;
> +
> +	/* Binary search for largest entry <= offset */
> +	low = 0;
> +	high = lineinfo_num_entries;
> +	while (low < high) {
> +		mid = low + (high - low) / 2;
> +		if (lineinfo_addrs[mid] <= offset)
> +			low = mid + 1;
> +		else
> +			high = mid;
> +	}
> +
> +	if (low == 0)
> +		return false;
> +	low--;
> +
> +	/*
> +	 * Validate that the matched lineinfo entry belongs to the same
> +	 * symbol.  Without this check, assembly routines or other
> +	 * functions lacking DWARF data would inherit the file:line of
> +	 * a preceding C function.
> +	 */
> +	line_addr = (unsigned long)_text + lineinfo_addrs[low];
> +	if (line_addr < sym_start)
> +		return false;

This is suspicious. The binary search does "low = mid + 1".
I would expect that lineinfo_addrs[low] would point to
a higher address when the exact match is not found.

Anyway, I think that we should accept only the exact match and do:

	if (lineinfo_addrs[low] != offset)
		return false;

Or do I miss something? (Friday evening here ;-)

> +	file_id = lineinfo_file_ids[low];
> +	*line = lineinfo_lines[low];
> +
> +	if (file_id >= lineinfo_num_files)
> +		return false;
> +
> +	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
> +	return true;
> +}
> +#endif /* CONFIG_KALLSYMS_LINEINFO */
> +
>  /* Look up a kernel symbol and return it in a text buffer. */
>  static int __sprint_symbol(char *buffer, unsigned long address,
>  			   int symbol_offset, int add_offset, int add_buildid)
> @@ -497,6 +553,19 @@ static int __sprint_symbol(char *buffer, unsigned long address,
>  		len += sprintf(buffer + len, "]");
>  	}
>  
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +	if (!modname) {
> +		const char *li_file;
> +		unsigned int li_line;
> +		unsigned long sym_start = address - offset;
> +
> +		if (kallsyms_lookup_lineinfo(address, sym_start,
> +					     &li_file, &li_line))
> +			len += snprintf(buffer + len, KSYM_SYMBOL_LEN - len,

s/KSYM_SYMBOL_LEN/KSYM_LINEINFO_LEN/

> +					" (%s:%u)", li_file, li_line);
> +	}
> +#endif
> +
>  	return len;
>  }


I was rather curious how the code looked like and the mentioned things
caught my eyes. And I focused on the kernel/kallsyms code.

Unfortunately, I do not have time for a proper full review at the
moment.

The code seems to work. And it generates relative paths for me, for example:

[  305.678609] sysrq: Show backtrace of all active CPUs
[  305.680615] NMI backtrace for cpu 0
[  305.680620] CPU: 0 UID: 0 PID: 1540 Comm: bash Kdump: loaded Not tainted 7.0.0-rc2-default+ #561 PREEMPT(full)  0d0ba470fd9bf64113a65472ab47c033a2658d88
[  305.680626] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
[  305.680628] Call Trace:
[  305.680631]  <TASK>
[  305.680640]  dump_stack_lvl+0x6c/0xa0 (lib/dump_stack.c:94)
[  305.680680]  nmi_cpu_backtrace.cold+0x51/0x6a (lib/nmi_backtrace.c:113)
[  305.680689]  ? __pfx_nmi_raise_cpu_backtrace+0x10/0x10
[  305.680702]  nmi_trigger_cpumask_backtrace+0x113/0x130 (lib/nmi_backtrace.c:62)
[  305.680720]  __handle_sysrq.cold+0x9b/0xde (drivers/tty/sysrq.c:611)
[  305.680734]  write_sysrq_trigger+0x6a/0xb0 (drivers/tty/sysrq.c:1221)
[  305.680750]  proc_reg_write+0x59/0xa0 (fs/proc/inode.c:330)
[  305.680763]  vfs_write+0xd0/0x570 (fs/read_write.c:686)
[  305.680771]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
[  305.680776]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
[  305.680779]  ? __lock_release.isra.0+0x1c9/0x300 (kernel/locking/lockdep.c:342)
[  305.680796]  ? srso_alias_return_thunk+0x5/0xfbef5 (arch/x86/lib/retpoline.S:220)
[  305.680813]  ksys_write+0x70/0xf0 (fs/read_write.c:738)
[  305.680826]  do_syscall_64+0x11d/0x660 (arch/x86/entry/syscall_64.c:63)
[  305.680832]  ? irqentry_exit+0x94/0x5f0 (./include/linux/irq-entry-common.h:298)
[  305.680846]  entry_SYSCALL_64_after_hwframe+0x76/0x7e (arch/x86/entry/entry_64.S:121)

HTH,
Petr

