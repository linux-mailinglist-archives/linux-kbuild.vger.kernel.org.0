Return-Path: <linux-kbuild+bounces-13856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c8lhIUfPOWo7xwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13856-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 02:11:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E06B2EE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 02:11:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S2FK96HX;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13856-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13856-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F52A303264C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 00:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5172C187;
	Tue, 23 Jun 2026 00:11:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AC2030A;
	Tue, 23 Jun 2026 00:11:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782173508; cv=none; b=NC3/RMynl8BbkJLBzRkxr7HbkcUx1MhcusmHKlRT7T9YC2D8Jumqi59iUhXnCoTYtsZWWrFPQ2/DS1Vbt6PQNWwNAMEI7C6/2OxvOtWD65b1J+aiqfHCxW9b7jj8xDYIbJuI+92cJQxLqOGsfL+g6ak6npg3hUKEoscrN8RzqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782173508; c=relaxed/simple;
	bh=J+4qy6yUt2qsjFzgWyqN9qlFurVR2nEFmDDhPoK6F0Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pcd0+X4MphOHHXdM89mbsVOCQPYW/tomVBCRzvijqSCrJlbwDkfjp3gYLg6LFkdF65i2cGwOwJBbXFrrtjSNNPKDDTk3idaJwTL2p3l7t0xxDnwLzU/ICMIavL7ViwYaiSSiBwVEGRBXpmMkBL0rkHiRU4wHO5Y8MHnMDFeYWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2FK96HX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1DF1F000E9;
	Tue, 23 Jun 2026 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782173507;
	bh=u3G2k+vNcbri1rsk1r3PRgx76PxVv/AgsF6Bes4pFjM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S2FK96HXBIX3IPeJ+oZ+SNyzCBmlrHdG6N2svUdBYGhnEYbgAgySvVd89aSUQ9fnC
	 93MwaMEK5/axFm+LBDZo+MQfBMBOKRC5Ff4UcRsKEfGBls2A/E8HU7YZwM/6jRHxlB
	 j5quk/9D7CLDIBvB2NRf42cn6YBkstPBqgMZi2KdY/7Radc37xHX9hLpsSH0stVxBm
	 SfTVcLEHJi3nfl5V0fO/OhEmkt6RVY+m9pYTgr3aqY+mgGK6SZVJn2YX2pa11TGM/h
	 c45+UZjfog9s3Pg96f/p+3AM7kD0/kRk0WEkASFv7pvcA4Sy2YNBLV5DLJTZDbrZx8
	 ffTyN0RLDkp7w==
Date: Tue, 23 Jun 2026 09:11:41 +0900
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
Message-Id: <20260623091141.384913aa7eb0cb3c5db01e9d@kernel.org>
In-Reply-To: <ajkfTQwmmVo0DvFx@gmail.com>
References: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
	<20260609-bootconfig_using_tools-v4-6-73c463f03a97@debian.org>
	<20260610233720.82fe59cf42aa57659c2e5697@kernel.org>
	<ail6rQnRYKsXPxyF@gmail.com>
	<ajJu2KlfVyuUH-VA@gmail.com>
	<20260618094719.17bf5448351adc2e56c267fb@kernel.org>
	<ajkfTQwmmVo0DvFx@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13856-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D06E06B2EE4

Hi Breno,

On Mon, 22 Jun 2026 05:30:53 -0700
Breno Leitao <leitao@debian.org> wrote:

> On Thu, Jun 18, 2026 at 09:47:19AM +0900, Masami Hiramatsu wrote:
> > On Wed, 17 Jun 2026 02:56:23 -0700
> > Breno Leitao <leitao@debian.org> wrote:
> > 
> > > On Wed, Jun 10, 2026 at 07:58:10AM -0700, Breno Leitao wrote:
> > > > On Wed, Jun 10, 2026 at 11:37:20PM +0900, Masami Hiramatsu wrote:
> > > > > To avoid confusion, when this option is used, shouldn't we treat it
> > > > > the same way as if embedded command lines were enabled, and either
> > > > > not display it in /proc/bootconfig (or always display it, by merging
> > > > > the rendered string)?
> > > > 
> > > > You're right that EMBED_CMDLINE breaks it: the embedded kernel.* keys
> > > > are already in boot_command_line before setup_boot_config() ever sees
> > > > the initrd bconf, so a user reading /proc/bootconfig would see only
> > > > the initrd keys while parse_early_param() acted on the embedded ones.
> > > > That's exactly the split-state Sashiko was circling around.
> > > > 
> > > > Both options you suggest work for me, but they pull in opposite
> > > > directions and I'd rather not guess wrong on the user-facing
> > > > contract.  Which do you prefer for v5?
> > > > 
> > > >   (a) Don't display embedded in /proc/bootconfig -- keep the current
> > > >       "file shows the active bootconfig source" behavior and document
> > > >       that with EMBED_CMDLINE=y, the kernel.* subtree may have been
> > > >       applied separately via the cmdline.
> > > > 
> > > >   (b) Always display embedded by merging the rendered string into
> > > >       /proc/bootconfig when EMBED_CMDLINE=y, so the file reflects
> > > >       what was actually applied.
> > > > 
> > > > Happy to go either way
> > > 
> > > Following up on my own mail rather than leaving it fully open: after
> > > looking at the code more, I'd like to recommend (a).
> > 
> > Agreed. Sorry for replying late.
> 
> No problem, thanks. Quick heads-up: v5 already went out and crossed with
> this mail. It takes (a) and extends bootconfig.rst to walk through the
> four sources (bootloader cmdline, embedded cmdline, initrd bootconfig,
> embedded bootconfig), so that part is already in flight:
> 
>   https://lore.kernel.org/r/20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org
> 
> The naming/mutual-exclusion rework below I'll fold into v6.

Yeah, thanks for updating!

> 
> > Indeed. So I think this EMBED_CMDLINE is more like CMDLINE set by
> > bootconfig file, instead of embedded string. That is useful for reusing
> > the boot options. We need to change the explanation and clarify it.
> 
> Agreed, that's a much clearer model. v6 will reframe the Kconfig help and
> bootconfig.rst around "this is CONFIG_CMDLINE, sourced from a bootconfig
> file at build time" rather than "an embedded bootconfig that also feeds
> the cmdline".

Nice!

> 
> It also matches what the code already does precedence-wise: the rendered
> "kernel" string is prepended to boot_command_line in setup_arch(), so it
> sits in front of the bootloader args and parse_args() last-wins lets the
> bootloader override it -- i.e. exactly CONFIG_CMDLINE without _OVERRIDE.
> So this is mostly a rename + dependency + docs change, not a behavioral
> one. (A _FORCE/_EXTEND-style variant could come later if there's demand;
> the current behavior is the plain "overridable default" one.)

OK. Yeah, for the first step, I think current behavior is enough.

> 
> > Thus we should those configs mutual exclusive. If user already sets the
> > CONFIG_CMDLINE, EMBED_CMDLINE should not be enabled.
> 
> Makes sense -- two built-in cmdline sources at once is confusing. I'll
> make them mutually exclusive in v6. I'm thinking:
> 
>   depends on CMDLINE = ""
> 
> on the new symbol. On x86 CONFIG_CMDLINE is a string that depends on
> CMDLINE_BOOL and defaults to "", so this reads as "only offer the
> bootconfig-rendered cmdline when no static CONFIG_CMDLINE is configured",
> and it works the same on other arches that define CMDLINE as a string.
> Does that match what you had in mind, or would you rather gate it the
> other way (CMDLINE depends on !the-new-symbol)?

No, this looks good and enough clear to me.

> 
> > So you can see CONFIG_BOOT_CONFIG_EMBED_CMDLINE is a bit special.
> > I think it maybe natual that we call it CONFIG_CMDLINE_BOOT_CONFIG.
> > In this case, we render the cmdline string from bootconfig build-time
> > and set CONFIG_CMDLINE with the rendered cmdline string.
> > So you can see CONFIG_BOOT_CONFIG_EMBED_CMDLINE is a bit special.
> > I think it maybe natual that we call it CONFIG_CMDLINE_BOOT_CONFIG.
> > In this case, we render the cmdline string from bootconfig build-time
> > and set CONFIG_CMDLINE with the rendered cmdline string.
> 
> I'll rename it for v6. One nit: the arch opt-in symbol is already
> ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, so CONFIG_CMDLINE_FROM_BOOTCONFIG would
> pair with it verbatim. I'll use CONFIG_CMDLINE_FROM_BOOTCONFIG I'll rename it
> for v6.

Yeah, thanks!

> 
> Another nit: the arch opt-in symbol is already
> ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, so CONFIG_CMDLINE_FROM_BOOTCONFIG would
> pair with it verbatim. I'll use CONFIG_CMDLINE_FROM_BOOTCONFIG unless you'd
> rather keep CONFIG_CMDLINE_BOOT_CONFIG -- either is fine by me.

I think it should use the same pattern to avoid confusion.

> 
> One clarification on "set CONFIG_CMDLINE with the rendered string":
> CONFIG_CMDLINE is a Kconfig string fixed when .config is read, while the
> render happens later during the build, so we can't literally store the
> rendered text into CONFIG_CMDLINE. The mechanism stays "render into
> .init.rodata, merge into boot_command_line in setup_arch()"; what changes
> is how we name and document it, plus the mutual exclusion above. Let me

Yes, it is fine to me because it does not change the current behavior.

> 
> > So you can see CONFIG_BOOT_CONFIG_EMBED_CMDLINE is a bit special.
> > I think it maybe natual that we call it CONFIG_CMDLINE_BOOT_CONFIG.
> 
> I'll rename it for v6. One nit: the arch opt-in symbol is already
> ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, so CONFIG_CMDLINE_FROM_BOOTCONFIG
> would pair with it verbatim. I'll use CONFIG_CMDLINE_FROM_BOOTCONFIG

Yes, that's better to be renamed.

> > In this case, we render the cmdline string from bootconfig build-time
> > and set CONFIG_CMDLINE with the rendered cmdline string.
> 
> CONFIG_CMDLINE is a Kconfig string fixed when .config is read, while the
> render happens later during the build, so we can't literally store the
> rendered text into CONFIG_CMDLINE?  let me know if you can envision a way to
> get it done.

Ah, ok. Nevermind, as far as it is shown in /proc/cmdline, I think it is OK.
(BTW, if we use the embedded bootconfig, the file path is shown in
 /proc/config.gz, maybe I need to notice it.)

> > I think we can proceed it without rendering it in /proc/bootconfig
> > at this point. And later we find the way to detect early parameters
> > correctly, we can fix it.
> 
> Sounds good. I'll document the sharp edge (with both an embedded cmdline and an
> initrd bootconfig, early params reflect the embedded values because the initrd
> isn't parsed yet) and leave the early-param-aware override detection as the
> follow-up you describe.

Thanks for the documenting :)

> 
> > (BTW, early parameter problem is a bit complicated. It is not hard
> > to distinguish early parameters, but kernel accepts the same key
> > for early parameter and normal parameter. e.g. "console=")
> 
> Right, console= being both is the awkward case. Agreed that's better as
> its own series once we have a reliable way to detect early params.
> 
> So the v6 plan:
>   - rename CONFIG_BOOT_CONFIG_EMBED_CMDLINE -> CONFIG_CMDLINE_FROM_BOOTCONFIG
>     (or _BOOT_CONFIG, your call)
>   - make it mutually exclusive with CONFIG_CMDLINE (depends on CMDLINE = "")
>   - reframe the Kconfig help + bootconfig.rst as "CONFIG_CMDLINE from a
>     bootconfig file"
>   - keep (a): no rendering in /proc/bootconfig; document the early-param
>     sharp edge
>   - defer early-param-aware override detection to a follow-up
> 
> Thanks for the direction,

Thanks for working on this feature!

Thank you,

> --breno
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

