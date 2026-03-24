Return-Path: <linux-kbuild+bounces-12235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIBdGG7cwmm0mwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12235-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 19:48:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D031B0B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 19:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDA0230A279A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9913F54D3;
	Tue, 24 Mar 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJGsWAW9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851D248883;
	Tue, 24 Mar 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377885; cv=none; b=Hs7rjwHUXbF84UpXlEZB6SdLOcGZ6apnplo/s8SeLN7cn4wSvzKF6OQUpUY3ia+gaRXlE/Bi12a4+w7+MBwdt3qEfPlHqe2JpARDJ179U7EBrDIs4qif8ATZuInWtEQmBuZoiiGQv2CtgRCq93M6wPiSkOBoc8RqvpZK9DLHnoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377885; c=relaxed/simple;
	bh=z+p7Gwoog4oyUayKVFnyDMtWHllATA6TDDFTEc5K0Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgvu7yAwAMb1OiFxeCbpMyMVmPTPkJH5jEGkDN3fVFa0jac+Pg46E1VRenz0tvzO9tyiKoDAiHPigY5YVusTTLJecWbbpGYzN0KD6w4JeDAiDG/k+hZf2ZSUJ/Ug1sGgiRhfY5x33dTmWZWvDiZv16B+jMViLCrgRn44np896XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJGsWAW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEF0C19424;
	Tue, 24 Mar 2026 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774377885;
	bh=z+p7Gwoog4oyUayKVFnyDMtWHllATA6TDDFTEc5K0Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJGsWAW9b/XOuu7CKFWkcT0DYdJk55Q5/rWczpgcokcv14bHqZV9ldkwtBIlH1CBn
	 1plMs2T/E99bQj/dGIlW2R3l/d+0rBIpeyQ1yqaZQ052qHVlbRDr8anawNGPv6/bIr
	 0A5JOD/y5vBgcBO5XI8ROpjzeMTFde88DcN7QsNf1+WLp9ScCvbYDJePqBj5/rHxfW
	 w3Sdzmua0VP6egyB7EEng4fQR4z4g13jIIpfobWnQVKOGehzqD5c/xeDPS8i56iUFX
	 0kNLD45BouUprlYPKfTLHLFHgxLGa1xRvfwA5IQDQ9QlUQHc5s1mFqIo0cH6JZafeO
	 3UFI2hnDYNJ/w==
Date: Tue, 24 Mar 2026 14:44:44 -0400
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
Message-ID: <acLbnMAPrHCpoIpr@laps>
References: <20260323164858.1939248-1-sashal@kernel.org>
 <20260323164858.1939248-2-sashal@kernel.org>
 <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
 <acK1M_CvbYCtq7im@laps>
 <CAADnVQLr5Sx+vG6D4Jxm8r2vPxu7ygFz60LGwmqfkc=VB0-Miw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLr5Sx+vG6D4Jxm8r2vPxu7ygFz60LGwmqfkc=VB0-Miw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-12235-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: DA2D031B0B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 09:04:03AM -0700, Alexei Starovoitov wrote:
>On Tue, Mar 24, 2026 at 9:00 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Tue, Mar 24, 2026 at 08:03:30AM -0700, Alexei Starovoitov wrote:
>> >On Mon, Mar 23, 2026 at 9:49 AM Sasha Levin <sashal@kernel.org> wrote:
>> >>
>> >> Embed DWARF-derived function parameter name and type information in the
>> >> kernel image so that oops and WARN dumps display the crashing function's
>> >> register-passed arguments with their names, types, and values.
>> >>
>> >> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
>> >> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
>> >> parameter names and human-readable type strings. The resulting tables are
>> >> stored in .rodata using the same two-phase link approach as lineinfo.
>> >>
>> >> At runtime, kallsyms_show_paraminfo() performs a binary search on the
>> >> paraminfo tables, maps parameters to x86-64 calling convention registers
>> >> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
>> >> and value from pt_regs. If a parameter value matches the page fault
>> >> address (CR2), it is highlighted with "<-- fault address".
>> >>
>> >> Integration at show_regs() means this works for both oops and WARN()
>> >> automatically, since both paths provide full pt_regs at the exception
>> >> point.
>> >>
>> >> Example output:
>> >>
>> >>   Function parameters (ext4_readdir):
>> >>     file     (struct file *)         = 0xffff888123456000
>> >>     ctx      (struct dir_context *)  = 0x0000000000001234  <-- fault address
>> >>
>> >> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEINFO).
>> >> Adds approximately 1-2 MB to the kernel image for ~58K functions.
>> >>
>> >> Assisted-by: Claude:claude-opus-4-6
>> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> >
>> >Nack.
>> >
>> >You asked claude to reinvent pahole and BTF and it did it
>> >completely missing years of fine tuning that pahole does.
>>
>> Let's keep this on the technical side please.
>>
>> >dwarf cannot be trusted as-is. pahole converts it carefully
>> >by analyzing optimized out arguments and dropping signatures
>>
>> Fair point about pahole and optimized-out args. The problem is that BTF depends
>> on BPF_SYSCALL, and the environments I care about can't enable either.
>
>This is trivially fixable without reinventing pahole.

Hmm...

Looking at the code, I'd need to:

- Split BTF parsing from kernel/bpf/btf.c to somewhere outside of kernel/bpf/.
- New init path for btf_vmlinux outside BPF verifier.
- Refactor btf_parse_vmlinux() BPF-specific bits.
- Remove BPF_SYSCALL dependency from DEBUG_INFO_BTF.
- Somehow make BTF work with DEBUG_INFO_REDUCED.

I suppose that the first 4 are straightforward, but I don't have an idea about
DEBUG_INFO_REDUCED. Though we can probably tackle it later.

Does that make sense? Did I miss anything?

-- 
Thanks,
Sasha

