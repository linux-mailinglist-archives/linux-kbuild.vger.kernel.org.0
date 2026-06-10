Return-Path: <linux-kbuild+bounces-13694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxeWNVp3KWoTXQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13694-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:40:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A42B66A4C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:40:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LEtZ3tx1;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13694-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13694-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E44603062A51
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 14:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85276413256;
	Wed, 10 Jun 2026 14:37:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71023409E0F;
	Wed, 10 Jun 2026 14:37:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102247; cv=none; b=YaZV0Xu/xMWLE3O8KnUk092aJTaW/EaYeeWBywdnmg5bByoxm14GwSWE2agFLnXjAljW2j/lbBphnXTHEdh7IgKem1OBsVYfOMQWKKMXIY2n6Grt9rLoKb/PFBxlWsj/JAcbApqM0mJ/IF9zLP/K+MH5PWA4xNvcAWgCPPccmOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102247; c=relaxed/simple;
	bh=14MudBlUo/MiPH62vrRijCz+mEnKk/r8tJPHbsWJiTE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SFGP8GvQQ9F2oeDFORad4uerfoyGnI6sWuVyG2CM1rr+fRsqVDRK+iz2LOhvv+qEly7kkzuIZr3FocEL3FSro5/ljvIQLlIFjN8Pfh88yT9MiG9vK1tSICwDOON82k/JZJiPE957LicVDxc22t9zjrYg2u+BGdwQAoi1iWkEUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEtZ3tx1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C6C1F00893;
	Wed, 10 Jun 2026 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781102246;
	bh=+aUpp/Xae8vWFXmLRO1/JAbTv8IzKAGIRt8w/cXpVdQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LEtZ3tx1sTTlNW8kg8MsrEOL+4bev4KawN4LIsraa35YLBdb+AoV0/bvVL+ILpTrf
	 vAspeoHdgoo1SU7lbnRtKZLwKg+XDy3v2iTnjfumEgeF2lSJh0FVuako2GEg1D7bPj
	 qH6mEM/ipHlZfPBdoSIIfBQ+clOUsAxvMWel4inbHxFxegfV0dM7dMkwItVrK2/AMn
	 3IIrur9Xcr2IeLkE6rFtdoA9aR9caCxKG9WTHKdpSqy1bOmnV5RsHAQTTdaDcoEozb
	 xIaxnW13GNdUcTsSPKjY0seom93MdmAMe7PfJbPjN70mUpFLdCD8TpGibcjxd4FzLY
	 PJAhbotN9CkPQ==
Date: Wed, 10 Jun 2026 23:37:20 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 6/7] Documentation: bootconfig: document build-time
 cmdline rendering
Message-Id: <20260610233720.82fe59cf42aa57659c2e5697@kernel.org>
In-Reply-To: <20260609-bootconfig_using_tools-v4-6-73c463f03a97@debian.org>
References: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
	<20260609-bootconfig_using_tools-v4-6-73c463f03a97@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13694-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A42B66A4C1

On Tue, 09 Jun 2026 03:28:33 -0700
Breno Leitao <leitao@debian.org> wrote:

> Add a section describing CONFIG_BOOT_CONFIG_EMBED_CMDLINE: what it
> does (renders the embedded "kernel" subtree to a flat cmdline at
> build time so early_param() handlers see the values), what it
> requires (BOOT_CONFIG_EMBED, a non-empty BOOT_CONFIG_EMBED_FILE,
> and ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG -- currently x86 only),
> the bootconfig opt-in semantics, the initrd-vs-embedded precedence,
> and the soft-error overflow behavior.

Hi Breno,

Thanks for adding the document. But related to the Sashiko's comment,
I believe it's necessary to pre-describe in this document how the
kernel behaves with various combinations of cmdline and bootconfig,
both embbedded and initrd/bootloader.

We can have these ways to pass the kernel options.

- bootloader cmdline
- embedded cmdline
- initrd bootconfig
- embedded bootconfig (standard/cmdline)

Clearly, we will have the option to choose between a standard embedded
boot configuration or a command-line one, not either, but the behavior
is different. I confirmed that is covered.

Embedded bootconfig is a kind of default bootconfig, which is NOT used
when initrd has another bootconfig. I made this design because of
/proc/bootconfig, which is not merged with embedded one. However, 
CONFIG_BOOT_CONFIG_EMBED_CMDLINE will be a bit different, if it is
embedded and "bootconfig" feature is enabled, the embbedded one
has been used already. 

To avoid confusion, when this option is used, shouldn't we treat it
the same way as if embedded command lines were enabled, and either
not display it in /proc/bootconfig (or always display it, by merging
the rendered string)?

Thank you,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

