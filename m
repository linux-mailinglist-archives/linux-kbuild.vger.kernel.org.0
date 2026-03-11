Return-Path: <linux-kbuild+bounces-11811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLctCSi+sGm4mgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11811-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 01:58:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4E25A2F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 01:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 154E23029C1D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 00:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6610834751E;
	Wed, 11 Mar 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKZpg2jF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40482188CC9;
	Wed, 11 Mar 2026 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773190691; cv=none; b=DKp57TMens0e6sZ9aSnrmFNF+frkZ+XWJ4fxIZU1BpQfrYTfYthBHHZOgQgnEWLt2qN+hOD01pIgQ/Jp5zm6p2Id4owhjFrmqcOChq6RTeE7Web3iubKcUf+zIm6wac0xd5oX9mCDVjChYbpI7vncx96SPg46aEhHi935gibO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773190691; c=relaxed/simple;
	bh=XqFk9qkcPPiYEyDJvWt0iPKkONDKvNRAhfxukuGWXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnOb4fmFcJNReSDEQbR/HvrIlV7On+uxTiZiTpG8JdmeSjZlTeYoz/sKOLHEADDrDjsGV6uQPPSo54DCZhCJ7xdbB4Bcjkfta8cTZSX6TVCqT5k3pewKCcIdHNT+YSi3+IQ8hFInLSo4YhxU80dArfDw2sV4NQPsWvUI76U2xTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKZpg2jF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC2DC19423;
	Wed, 11 Mar 2026 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773190690;
	bh=XqFk9qkcPPiYEyDJvWt0iPKkONDKvNRAhfxukuGWXX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKZpg2jFjwxQuj9u7WlXD13xzBXFYDl3NJbqubx4iUfl5nDR4Tqc2XU6LYCCZng8F
	 oJc3Z7R+KFyk0JrtGfgdUZnAsEFgexXoC7tcByQjLuX/6RwOmWKFfM76/TBHdgiV16
	 7QnhOWo/nkPnOv4zwXfU0MT4TrBhrdjBF5Y1tBQE51cmgRudoCZtQNzP1bK1M6zDJX
	 JNIkHqRaQ1zhbJv15S+MsnAAVNWFx2f1AxEi+5/2Ftbp2EQoZR0O1ZN4eeWpYkHlD5
	 HZiq+c7rD1UeCeN8pvz3onTlcyXdKR0Y97+9hFDK0DSrJmV3MGPxBxGf/q8UfzYa1o
	 3Uq5n620QUk+A==
Date: Tue, 10 Mar 2026 20:58:08 -0400
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
Message-ID: <abC-IKBSrV2tAwuq@laps>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <aasClESfxETxliLB@pathway.suse.cz>
 <aasLhbZmvcQ8sA9P@laps>
 <abA2wOsJtK-g2NxY@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <abA2wOsJtK-g2NxY@pathway.suse.cz>
X-Rspamd-Queue-Id: 92C4E25A2F9
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-11811-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:20:32PM +0100, Petr Mladek wrote:
>On Fri 2026-03-06 12:14:45, Sasha Levin wrote:
>> On Fri, Mar 06, 2026 at 05:36:36PM +0100, Petr Mladek wrote:
>> > On Tue 2026-03-03 13:21:01, Sasha Levin wrote:
>> > > Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>> > > lookup table in the kernel image so stack traces directly print source
>> > > file and line number information:
>> > >
>> > > --- a/include/linux/kallsyms.h
>> > > +++ b/include/linux/kallsyms.h
>> > > @@ -16,10 +16,19 @@
>> > >  #include <asm/sections.h>
>> > >
>> > >  #define KSYM_NAME_LEN 512
>> > > +
>> > > +#ifdef CONFIG_KALLSYMS_LINEINFO
>> > > +/* Extra space for " (path/to/file.c:12345)" suffix */
>> > > +#define KSYM_LINEINFO_LEN 128
>> > > +#else
>> > > +#define KSYM_LINEINFO_LEN 0
>> > > +#endif
>> > > +
>> > >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
>> >
>> > I guess that this is used also in ftrace where there formatting
>> > is delayed. We might want:
>> >
>> >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s] (%s:%u)") + \
>>
>> KSYM_LINEINFO_LEN already covers the full expansion of the path and line
>> number, not just the literal format characters. ftrace stores raw addresses and
>> formats via %pS at print time into a KSYM_SYMBOL_LEN-sized buffer, so there
>> shouldn't be an issue here.
>
>I was curious why the sizeof("%s+%#lx/%#lx [%s %s]") was there.
>It did not make much sense to count some "random" part of the
>format string.
>
>I expected that it was related to the ftrace delayed formatting.
>But they are written to the tracing buffer, see trace_vbprintk().
>
>But I believe that it does not need to be counted. It seems to be some
>cargo-cult programming. The size has been counted first by the commit
>d069cf94ca296b7fb ("kallsyms for new modules") back in v2.6.12-rc2,
>see
>https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=d069cf94ca296b7fb4c7e362e8f27e2c8aca70f1
>And it seems that it was not needed there.
>
>That said, we could not simply remove it witout revisiting the rest of
>the computation. Especilly, we need to make sure that it counts all
>extra characters, like spaces, brackets, and the trailing '\0'.
>
>Ideally, we should replace the unsafe sprintf() with snprintf() in
>all users. (>> TODO ;-)

Yeah, good catch. The sizeof() counts the format specifiers too  which never
end up in the output since their expansions are already covered by the other
terms.

I'd rather not poke that bear as part of this series, we can try it in a follow
up and see if anything explodes?

-- 
Thanks,
Sasha

