Return-Path: <linux-kbuild+bounces-13392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDejLLKoGGp+lwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13392-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:42:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2775F95D9
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 869B030AF23D
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 20:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0112234B19F;
	Thu, 28 May 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNgrhodh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61F33CE8A;
	Thu, 28 May 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000588; cv=none; b=Q8noxd4XlHsPE/p6cH92LGlxPVQl37n+c93odOcMJLmLSjJXPYlq+0olNyciKeM0zqR5JPAy6axMTfYEQ6k6BV7AevSNRv5LX7ztBOFPN9Twj/M7JQRj1bCeLVAj5kQw1qhyZfzcFJpVhESPoX8pWNL2XGCquY4a5o7arYqZDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000588; c=relaxed/simple;
	bh=BG7PcsOQ1fJd65tikquJGhW6e7ugLFVstmsuATfUSTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5ACeV/1aT/DKiT/MzE1l9Xj+oLZZpwSfo1XiLezwJavYAqZwZs1vBxgo+IQ1IqPAqrMwg7gA2MgyFxmCjD+txRz/5yhG0V1q/nQJkHjkQy0p3akLBM6RwuT2yUx5n7mBtOSB17+G/MOZSR1rH2TcR/z4SmCEMDUwsOSfNBLbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNgrhodh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03541F000E9;
	Thu, 28 May 2026 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000587;
	bh=dH+Kn+7B9a9XzYvNmcr6RDiESxjU0RsDgQxo6qQZFCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YNgrhodhhwC1jJ/or1n6DwQHbA8KvAEkfSpaIJFRIHkArjDa0109XiTf9PBm9gfS4
	 eDT2e7cO8yLW6UzDCe2k0NhPcV9UIhHTT2rJNcBzWwbT/lW1faV2IRE8ykkVzw8Kz1
	 YGs5FJ98dDBJDbgHtRmDzo3liDnydDuqDGCIgWGBplpfsQLxVr6c2oxei1HvPpg7mt
	 Vf33QvjwxVYNdK9Yn6AgwNlxX2K83MuA/kurqDC8tXdRVrEGtX82LzA+/bgIyDxZE4
	 VwB6yoWtXNpRJJYnXsXC4YF5kSTEXtFQGwWwC6ejYQUmWhmjY7IUYGqwC+A/e7oyNa
	 DMXWJ7iNTJyjg==
Date: Thu, 28 May 2026 13:36:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Manos Pitsidianakis <manos@pitsidianak.is>,
	Nicolas Schier <nsc@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
Message-ID: <20260528203622.GA3100532@ax162>
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
 <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13392-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[pitsidianak.is,kernel.org,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5E2775F95D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 01:53:46PM +0200, Miguel Ojeda wrote:
> On Thu, May 21, 2026 at 12:29 PM Manos Pitsidianakis
> <manos@pitsidianak.is> wrote:
> >
> > When rustc prints an error containing a long type that doesn't fit in a
> > line, it will write the whole thing in a .txt file and print messages
> > like:
> >
> >   note: the full type name has been written to
> >   'path/to/subsystem/module_name.long-type-11621316855315349594.txt
> >
> > Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
> > kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
> > during development, so add a gitignore entry.
> >
> > Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>
> 
> Cc'ing Nathan, Nicolas and Kbuild -- I considered whether deleting
> these in e.g. `distclean`. They are only error artifacts, i.e. the
> build system doesn't create these intentionally -- they come from the
> Rust compiler in a minority of error cases (where type names are
> long).
> 
> So end users shouldn't see them anyway, so I am not sure what the policy is.

I view these more like build artifacts since the messages in them are
really only relevant to a specific build instance, so I would probably
clean them up with 'clean' over 'mrproper' / 'distclean'. But if they are in
.gitignore, I don't think it matters too much though, but it does feel
like they should be cleaned up with at least 'distclean'.

-- 
Cheers,
Nathan

