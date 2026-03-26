Return-Path: <linux-kbuild+bounces-12266-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLBPLC2exGki1gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12266-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 03:47:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCAA32E79B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 03:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7CAF303A13F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 02:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6018438F643;
	Thu, 26 Mar 2026 02:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8zGn/i+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C759322A00;
	Thu, 26 Mar 2026 02:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492955; cv=none; b=JVZzNnCJh1X5P5+BPaEoepCHsv1WZ191b8ry6zteCDWvapuz2Q0zkQU6QVjUx0gaSVQIAA3nq85rI5uNuOJF1QUNHMLQWz7S7V0mD7RsbA5y4H0qSgFLshIdWPCdyNkWjvpzmMFjicTDRGvJ3yzIi2RQVqYxoEmYV+gWY5BmRwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492955; c=relaxed/simple;
	bh=zQaAoby1LL5qtX0PbqpV15cjdPtMgN1fWIPjYj6cHHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4V1yX3TKnJcSrfA2ZQ/oJ/M1inSBlFmHIl8JVHwnwmL6pzFFuZD6rYsZaYzOi88Di2s0mueZoGXoET9T0JSBMwP1pLd1LW2GcGsiKv0jSTHyFglVg61eJYIkGkcscacMNt/ps+4g3a70BUrjlgzbZMj/hKlaVbKMD3aeoV1sUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8zGn/i+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB208C4CEF7;
	Thu, 26 Mar 2026 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774492954;
	bh=zQaAoby1LL5qtX0PbqpV15cjdPtMgN1fWIPjYj6cHHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8zGn/i+Spyx9XA47CpCu/vQAg2jkahFRQzQumLqtrDpCNSJTCj03aAkEznFHIBqF
	 BHqQtK9yH0jlsDRFhpqINdr/8qKOFZZ33DoLjiHS1rBQN8A7rN6+cd4XspEv86q4aw
	 fX5sdIVSmixq08mIaV+WQ20CFRO/xOqtaVcHBACJLjdgVgNEAW/1eD2ppZ4E8Sqo34
	 KMBXF5A5vLLXjt9vVzfBdhnIBFejLTjFksFyWA19+Dk1JNuNC3tUVbCRh3Eo+Ed2YP
	 iTNr+GVTtwyhLeEY70H14v74c5VO6yI6pMXy8ExXxlKbsKAbxCmXLa/pnbG4dlN+CH
	 y4s8jAUhtp60A==
Date: Wed, 25 Mar 2026 19:42:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	David Gow <david@davidgow.net>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>, aliceryhl@google.com,
	linux-um@lists.infradead.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	a.hindborg@kernel.org, acourbot@nvidia.com,
	akpm@linux-foundation.org, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lossin@kernel.org,
	mark.rutland@arm.com, mmaurer@google.com, nicolas.schier@linux.dev,
	peterz@infradead.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <20260326024226.GB2302780@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12266-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,davidgow.net,armlinux.org.uk,nod.at,cambridgegreys.com,sipsolutions.net,lists.infradead.org,lists.linux.dev,vger.kernel.org,nvidia.com,linux-foundation.org,protonmail.com,garyguo.net,kvack.org,arm.com,linux.dev,infradead.org,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BCAA32E79B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 08:21:59PM +0100, Miguel Ojeda wrote:
>   - Clang passes `-Werror=unused-command-line-argument`, which means
>     under arm (i.e. 32-bit) we get:
> 
>       clang: error: argument unused during compilation: '-U arm' [-Werror,-Wunused-command-line-argument]
> 
>     And under UML I see:
> 
>       clang: error: argument unused during compilation: '-I ./arch/um/include/shared' [-Werror,-Wunused-command-line-argument]
>       clang: error: argument unused during compilation: '-I ./arch/x86/um/shared' [-Werror,-Wunused-command-line-argument]
>       clang: error: argument unused during compilation: '-I ./arch/um/include/shared/skas' [-Werror,-Wunused-command-line-argument]
> 
>     So we would need e.g. `-Wno-unused-command-line-argument` there
>     close to the `-Wno-override-module` one, unless Kbuild or
>     ClangBuiltLinux thinks it is important to keep it for this case.

No, I don't think it is worth trying to make -Wunused-command-line-argument
work for this command. Just disable it. This mirrors what is being done
for cmd_cc_o_bc in the distributed ThinLTO:

  https://lore.kernel.org/20260316212930.120438-3-xur@google.com/

>     On the other hand, regardless of whether we fix this (and another
>     issue in a separate email found thanks to the UML build), we could
>     instead add `depends on` listing explicitly the architectures where
>     this is going to be actually tested. That way maintainers can decide
>     whether they want to support it when they are ready. Thoughts?
> 
>     Cc'ing Nathan, Nicolas, Nick, Bill, Justin, David, UML, ARM.

I do agree with some of the concerns that adding an architecure
dimension to this is a little complicated. I would rather try to flush
out those build problems with patches and keep it enabled for all
architectures. At the same time though, I understand that enabling it
for the "tier 1" architectures is a low barrier of entry for getting the
feature upstream, validated, and distributed to the majority of people
that would actually use and depend on it, so I ultimately leave that
call up to you.

>   - If we use the `.bc` extension, we need to add a `.gitignore` for
>     `.bc` files, and an exception for `kernel/time/timeconst.bc`.
> 
>     I guess we will not have too many `bc` scripts in the future for
>     that to be a problem. On the other hand, we have the chance to use
>     another extension (either for LLVM bitcode or for `bc` scripts).
> 
>     But please let me know on e.g. the Kbuild side if someone has
>     concerns...

No real concern on that front but .gitignore has a command to run when
modifying it, which will require a !timeconst.bc in a
kernel/time/.gitignore file.

Cheers,
Nathan

