Return-Path: <linux-kbuild+bounces-11074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E8vMFe3h2k6cQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11074-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 23:06:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C092107486
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 23:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E698302E929
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Feb 2026 22:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DC0357723;
	Sat,  7 Feb 2026 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj2akYlY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CB3570B4;
	Sat,  7 Feb 2026 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501949; cv=none; b=riiZQIwgsz78lBKGFLOXflP3ToImgBipJsMVQci4slyw7gScB6iM+oh/IwqIAEkvasvSKZGJGqgV3DXQZ9cD6I6I3qUh4UNcsUYJLncf9q60oZdn7c6fYME3trwiTCMhVIUPKnv/M2Q2SD5g9cmNRexBV3Mwap+odvax1XXk9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501949; c=relaxed/simple;
	bh=R86LvprLjddaxZhYGkJDKE4frGx+rchAzht0iORIT9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw+tU6KEkjT69rQJyrw3vCHV7hRW+QpTJpS6F9jNgi9C5NpljAgOlSnYg6GvCqMUUcrRt94nSMIx9MkMyp/4QaherP2ASlD0YPYsYYJG4Fk8ep+r6+0oPtIe0Z1cx0xW6uekCs0FjrvWCKVMzi8B24oP3swp9gOtbUqyD9kVYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj2akYlY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C089C116D0;
	Sat,  7 Feb 2026 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770501949;
	bh=R86LvprLjddaxZhYGkJDKE4frGx+rchAzht0iORIT9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nj2akYlYP5DSJ20kAaUO6MAea9pI2RYL9oArbK1KkiNtjtsq7TdkWU6nunmqnpNtG
	 2qV38mtYstvrWlscTv4eP/u8OAxzChKhZCQP8gBi+SDTYe8DvHMDmZ7ge9A/U9G1eE
	 yi8t21jCqTeeNwN2D2X/kbYVSiG713WDIqIkk5SWwFiAf3lilNmZcNl6zdMTnW2cjf
	 mxQyC1i8RtXiwfMydAo1Th4WLL/TBJ7ACcWib49UlA0d8kAGOSTGsaMgt/AFndQGfJ
	 Ag09LGHZUxA22wAAOUIR4JhIPde6R8BoHIh7PecaEjTypjrF6lU+uN3r9ODhBnxBOt
	 LU/P+6U6HTrEQ==
Date: Sat, 7 Feb 2026 16:05:43 -0600
From: Nathan Chancellor <nathan@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
Message-ID: <20260207220543.GA1670883@ax162>
References: <20260207144356.3063613-1-gary@kernel.org>
 <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
 <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-11074-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,protonmail.com,google.com,umich.edu,jannau.net,asahilina.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,llvm.org:url]
X-Rspamd-Queue-Id: 2C092107486
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 04:43:11PM +0000, Gary Guo wrote:
> On Sat Feb 7, 2026 at 3:22 PM GMT, Miguel Ojeda wrote:
> > On Sat, Feb 7, 2026 at 3:44 PM Gary Guo <gary@kernel.org> wrote:
> >>
> >> So, fix this by remap all absolute paths to srctree to relative path
> >> instead.
> >
> > In case it matters to Kbuild, we had a relatively recent revert
> > related to this flag:
> >
> >   dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths relative")
> >   8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
> > paths relative"")
> >
> >   https://lore.kernel.org/rust-for-linux/20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net/
> 
> Ah, that explains why I recall we had this flag in Kbuild but can only find the
> filter-out directives now. I missed the revert email.
> 
> I am not convinced that the ability to launch debugger outside source
> directory overweights the benefit of not leaking absolute paths and making
> builds reproducible.
> 
> The reverting cover letter says "As there is no simple or uniform way to
> specify the source directory explicitly" which is clearly not the case as you
> can just invoke the debugger in a different working directory... GDB also
> provides a way to provide source directory search path:
> https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html.
> Similarly, LLDB provides `settings set target.source-map`:
> https://lldb.llvm.org/use/map.html#remap-source-file-pathnames-for-the-debug-session
> 
> I think we should revert the revert, then.

For what it's worth, the C side revert also mentions that it broke
'objdump -S' [1] and working with GCOV data [2], so it seems like it is
not just debuggers that have a hard time with that loss of information.
Maybe those do not matter for Rust code or developers though.

[1] https://lore.kernel.org/aBEttQH4kimHFScx@intel.com/
[2] https://lore.kernel.org/edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org/

Cheers,
Nathan

