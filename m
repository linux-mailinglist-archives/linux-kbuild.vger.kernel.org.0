Return-Path: <linux-kbuild+bounces-13642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rGMbGY7XJmo8lgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13642-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:54:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F8E65794C
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:54:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=wYgCwwxa;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13642-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13642-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21752310FE7E
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADC93D4104;
	Mon,  8 Jun 2026 14:41:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B423D3009;
	Mon,  8 Jun 2026 14:41:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929690; cv=none; b=TSPChthtii70UEi5VpxW++IIILFBAdT95h6k5ZXlsewdx7uOsPEUem8XslIENv29FJbFshGqx13F1d6Qzv614ct3j7PxFsveKd2suw4sr9TarkyRXdpWWHaLEWeU2FLfWWmk1PrKttjKnccyCjyvHp8QvT6E7+w8SfuN4mAdjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929690; c=relaxed/simple;
	bh=yUXqpasB+MSeeefpUH62TjJdO4x17t42vFlSY/OK84c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/zjUrNUy2Fp8R8GVkbfi0mf2//3PaH1vHE0JLzaq0a52w1kGSycyJbkS+U3NF6w8xykkb5twVINJHreZ2P2SgP8tUvEoxST+Aamt/4BiISLdinGqRohFlY58knJG8OeByVYTrSPg0BM2immhZtxTF/t9L8J3JU1P92ar2C1Pww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=wYgCwwxa; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=sEosvUGqJ+H4je3T3hSMYurtpjfcIhb58UDxG8taiBg=; b=wYgCwwxa4hwZCXQX8cyJFi8eGk
	KxcHLx6KXHB/4DcaEE/JQgjTNsztmKelouL6DkSto8QxLLTziemda4LueywKzzOujU9XkaB/P9iYA
	I7kP0lRk2Z0fq6W3sjFfD1hdYRzY+WHkO1QpCW63HxO93PVgCVljDo26QxvLsB8Y6/8PD/h2tNtrM
	IR74FpZnxNxwc6XuqUpzd6pzJGmEP/cZsa6ugakcVo/ewkAPiOSHGt2BEvcXcMQgqlb1Nru780XM5
	Gd8OQ0qtN2Hnb50P4ejc+F8gkHCbQo/F8tcFiuvoe/KbxZNsF580YANz+LDlWQps6k4wOAL9xn3q9
	NRcCEYfQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWbA6-007h6n-32;
	Mon, 08 Jun 2026 14:41:11 +0000
Date: Mon, 8 Jun 2026 07:41:05 -0700
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 6/6] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Message-ID: <aibSj4XeRWJmasCx@gmail.com>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
 <20260605-bootconfig_using_tools-v2-6-d309f544b5f7@debian.org>
 <20260608191928.d7d2dea899b94f05d397f891@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608191928.d7d2dea899b94f05d397f891@kernel.org>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13642-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2F8E65794C

On Mon, Jun 08, 2026 at 07:19:28PM +0900, Masami Hiramatsu wrote:
> On Fri, 05 Jun 2026 05:03:37 -0700
> Breno Leitao <leitao@debian.org> wrote:
> 
> > Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
> > CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
> > build-time-rendered embedded bootconfig "kernel" subtree is part of
> > boot_command_line by the time parse_early_param() runs. early_param()
> > handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
> > CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.
> > 
> > Gate the prepend on the bootconfig opt-in: only fold in the embedded
> > kernel.* keys when "bootconfig" is present on the command line, or
> > CONFIG_BOOT_CONFIG_FORCE is set. Applying the embedded cmdline
> > unconditionally would (a) diverge from how embedded init.* keys are
> > treated and (b) break fail-safe recovery: a malformed embedded
> > console=/mem= could panic the boot with no way for the admin to disable
> > it by dropping "bootconfig" from the bootloader cmdline.
> > cmdline_find_option_bool() runs before parse_early_param(), so the gate
> > is cheap and correctly ordered.
> > 
> > Select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG so the user-visible
> > CONFIG_BOOT_CONFIG_EMBED_CMDLINE option becomes selectable on x86.
> 
> This seems like a dummy config. what code does depend on this flag?

No C code reads ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG directly — it's
a silent gating symbol, the same ARCH_SUPPORTS_* idiom as
ARCH_SUPPORTS_CFI, ARCH_SUPPORTS_LTO_CLANG, etc.

Its only role is the depends on line of BOOT_CONFIG_EMBED_CMDLINE: an
arch selects it once its setup_arch() calls
xbc_prepend_embedded_cmdline(), and that makes the user-visible
BOOT_CONFIG_EMBED_CMDLINE selectable.

Right now, only x86 supports embedded bootconfig, thus, only x86 does
the following (last patch):

	config X86
	+       select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG

So, no other platform can see CONFIG_BOOT_CONFIG_EMBED_CMDLINE.

> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -378,12 +378,15 @@ static void __init setup_boot_config(void)
> >  	int pos, ret;
> >  	size_t size;
> >  	char *err;
> > +	bool from_embedded = false;
> >  
> >  	/* Cut out the bootconfig data even if we have no bootconfig option */
> >  	data = get_boot_config_from_initrd(&size);
> >  	/* If there is no bootconfig in initrd, try embedded one. */
> > -	if (!data)
> > +	if (!data) {
> >  		data = xbc_get_embedded_bootconfig(&size);
> > +		from_embedded = true;
> 
> Even from embedded bootconfig, if the arch set 
> ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG=n, this must be applied to
> the cmdline as we are doing.

Right — that path is preserved. When the arch doesn't select
ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, BOOT_CONFIG_EMBED_CMDLINE is
unselectable, so xbc_embedded_cmdline_applied() is the no-op stub
returning false.

> >  	strscpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> >  	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
> > @@ -421,8 +424,17 @@ static void __init setup_boot_config(void)
> >  	} else {
> >  		xbc_get_info(&ret, NULL);
> >  		pr_info("Load bootconfig: %ld bytes %d nodes\n", (long)size, ret);
> > -		/* keys starting with "kernel." are passed via cmdline */
> > -		extra_command_line = xbc_make_cmdline("kernel");
> > +		/*
> > +		 * keys starting with "kernel." are passed via cmdline. When
> > +		 * this bootconfig came from the embedded source and
> > +		 * setup_arch() already prepended the rendered "kernel" subtree
> > +		 * to boot_command_line, rendering again here would duplicate
> > +		 * the keys in saved_command_line and make accumulating handlers
> > +		 * (console=, earlycon=, ...) re-register the same value. Skip
> > +		 * only when the prepend really happened.
> 
> Also, this should mention ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG=n case.

Ack, I will update

Thanks for the review,
--breno

