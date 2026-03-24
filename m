Return-Path: <linux-kbuild+bounces-12221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NzMOBd5wmnqdAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12221-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 12:44:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A03077EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 12:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B2AD3049588
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 11:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5470E3F0A91;
	Tue, 24 Mar 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olXoGqqK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643A3EF0B6;
	Tue, 24 Mar 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352381; cv=none; b=bWB8xXRFWQL0gInkQNXNRYrojvIHiX9wwKn+TZtTlgMGF1nQ6VISKF6YgfSM+63YIqsv6lUSFPhMjWhCLHcrMFVEzmoksCAW2Kn3WcLg8rQuBpUUOQ0Py956tEcQFQXBNV06/JJ97RIkiqZ7WgkoTzyvEbv3JFfVAGqCA7t6PU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352381; c=relaxed/simple;
	bh=UknkrSuNDYtTn/8MeNcb6hXJiGQu0qdkPOIQvTQmQ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY72cCSg/ES/VQQ98/cWlEbzZXAE3sQ0WAKV6G56P9h+fd7Y9pviS4TMD0yGTZm1JBIFAYSJeNJN2hv+xA3aU4mNXgzvx5LU7UAGrFgbcNZt+4X1v7sFMKKZjuhaOEV1In6xL4+ayzOVIn3pATBh2bV6KBjLny3869wtQMMCI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olXoGqqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDDDC2BCB2;
	Tue, 24 Mar 2026 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774352381;
	bh=UknkrSuNDYtTn/8MeNcb6hXJiGQu0qdkPOIQvTQmQ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olXoGqqKINrHT9MBi6UPkYfU0ZKw58C6sHbsrU3gtf4636xlcN++qk0VzQMXWxDWR
	 RjmJ6XKhs+g0WIzxddkigtIvUu+JTdZJmWQpVScLIGjGk0mgOeCa+oLzslnceDcKaG
	 XXMNYxhQZ4u0C2UbNsSUt6nVjTWuayrXcjW28BiZtmw09XeLaoHQPh8+CSoYBV3J1F
	 ceqOX7ceZiuusH8+vqKDrtdVJRVMM5uTfwyA3Yrf1xnC7RPx00LjSDTHzcok7q9KoA
	 aKiz3rbo7ie/MbZ/8nW8jnV0gjc+LVYjGUP16XWI8MdzgJtY6FED24yR2nsYTR6sCz
	 8YBc+94F/v0Rw==
Date: Tue, 24 Mar 2026 07:39:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
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
	Petr Pavlu <petr.pavlu@suse.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/2] kallsyms: show typed function parameters in
 oops/WARN dumps
Message-ID: <acJ3-2o0yxsFWwGJ@laps>
References: <20260323164858.1939248-1-sashal@kernel.org>
 <acJR51EAjn-7EOPm@krava>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <acJR51EAjn-7EOPm@krava>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12221-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,hansenpartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA1A03077EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 09:57:11AM +0100, Jiri Olsa wrote:
>On Mon, Mar 23, 2026 at 12:48:55PM -0400, Sasha Levin wrote:
>> Building on the lineinfo series, this adds typed function parameter
>
>hi,
>could you please specify the exact tree/commit and point to the
>series this patchset is based on?

Yup, sorry, I should have noted that. This series is based on Andrew Morton's
mm-nonmm-unstable branch (git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
mm-nonmm-unstable) since he took the base lineinfo patches and these build on
code adjacent to it.

There's no direct dependency between the two, but they touch the same parts of
the code.

-- 
Thanks,
Sasha

