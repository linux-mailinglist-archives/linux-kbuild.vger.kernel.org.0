Return-Path: <linux-kbuild+bounces-12225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFMeMcS2wmlilAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12225-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:07:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48526318B30
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04CC30F582E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105ED3921DC;
	Tue, 24 Mar 2026 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBA4Ikkm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF8391820;
	Tue, 24 Mar 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368053; cv=none; b=OuqL5KJJR8AtmbKJd9uZNG+h40wL+rTSvhVvEtT9rwn0fUK5gOxDt4d36EG8q/Fp0jKyzSQHcJdzd2Lx3+dU1XiHSb40kzK30t3D5dXxH4LceDxlsi0I+zOwvZPuGI92i846BFlSPZBwKwgXTa6lYALs1BNZ8Vk8QL5XWrymwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368053; c=relaxed/simple;
	bh=8RaYjZXsvjEKffpi5M4eBw0CuUbzJ4yG2TQpC1Z8emA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSjctEFZz38amekqDfqCF3mMJ6v2K6NzHdtO49E9vsZUNYSDJl11MHGPiMc10H2+/jALZiFqEqCMT7hmxyRSStFjINzlUSlVZQwmLXtKU0uOMc7MJTPeh7zZY+2QNKY2uvSsWukciUYYxzov8KBsM+V9mzh/IPoas9zbU+hklKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBA4Ikkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2CCC19424;
	Tue, 24 Mar 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774368053;
	bh=8RaYjZXsvjEKffpi5M4eBw0CuUbzJ4yG2TQpC1Z8emA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBA4IkkmTD174x1FH18UsrH1IDgfvtKZSkGBB1f/PPwWKOAVFVjXnsnttPvgieXWx
	 VMRERsR11XHRXHfrrTaeg8So7mS5HV9qklD0XG97vxgVgFbBkH1n9esTZBnF4YMT7P
	 F+5V6p2hcK/OoVAsxhnmhlpuTsWYBuGJkEQdZjq+I0bRqNc+4fFGNthu/uYhf2cBhS
	 hM4JJsBUuo9JTIMRE/AhHNZbn+Yq8ZAh9Znjh1Ac2jQrKvqvPkJ0S/fkd3/plpabc5
	 iXtDFUD3+7LhNHHDGuDGKOJ56760aTrzqa4WuPvL1Q+YppSdB9xi+KXb81/g4i88aX
	 Rs5KiUhSZPJbA==
Date: Tue, 24 Mar 2026 12:00:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>,
	Kees Cook <kees@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Juergen Gross <jgross@suse.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Petr Pavlu <petr.pavlu@suse.com>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	linux-modules@vger.kernel.org, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH 1/2] kallsyms: show function parameter info in oops/WARN
 dumps
Message-ID: <acK1M_CvbYCtq7im@laps>
References: <20260323164858.1939248-1-sashal@kernel.org>
 <20260323164858.1939248-2-sashal@kernel.org>
 <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12225-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,hansenpartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48526318B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 08:03:30AM -0700, Alexei Starovoitov wrote:
>On Mon, Mar 23, 2026 at 9:49 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> Embed DWARF-derived function parameter name and type information in the
>> kernel image so that oops and WARN dumps display the crashing function's
>> register-passed arguments with their names, types, and values.
>>
>> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
>> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
>> parameter names and human-readable type strings. The resulting tables are
>> stored in .rodata using the same two-phase link approach as lineinfo.
>>
>> At runtime, kallsyms_show_paraminfo() performs a binary search on the
>> paraminfo tables, maps parameters to x86-64 calling convention registers
>> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
>> and value from pt_regs. If a parameter value matches the page fault
>> address (CR2), it is highlighted with "<-- fault address".
>>
>> Integration at show_regs() means this works for both oops and WARN()
>> automatically, since both paths provide full pt_regs at the exception
>> point.
>>
>> Example output:
>>
>>   Function parameters (ext4_readdir):
>>     file     (struct file *)         = 0xffff888123456000
>>     ctx      (struct dir_context *)  = 0x0000000000001234  <-- fault address
>>
>> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEINFO).
>> Adds approximately 1-2 MB to the kernel image for ~58K functions.
>>
>> Assisted-by: Claude:claude-opus-4-6
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Nack.
>
>You asked claude to reinvent pahole and BTF and it did it
>completely missing years of fine tuning that pahole does.

Let's keep this on the technical side please.

>dwarf cannot be trusted as-is. pahole converts it carefully
>by analyzing optimized out arguments and dropping signatures

Fair point about pahole and optimized-out args. The problem is that BTF depends
on BPF_SYSCALL, and the environments I care about can't enable either.
Automotive, robotics, and safety configs all have DWARF and KALLSYMS but no
path to BTF.

>from BTF that are not accurate. This work is still ongoing.
>For example see this set:
>https://lore.kernel.org/bpf/20260320190917.1970524-1-yonghong.song@linux.dev/

Ack. I wasn't familiar with this, and looks like it makes the 2nd patch in this
series unnecessary.

>pahole isn't perfect, but what you attempted to do here
>is just broken.

I hear you that raw DWARF isn't perfect with optimized code, but I'd rather
show best-effort info than nothing. Happy to mark it as such in the output.
Open to suggestions on improving accuracy without the BTF dependency.

-- 
Thanks,
Sasha

