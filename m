Return-Path: <linux-kbuild+bounces-11123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDaJKC5yjGn6oAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11123-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 13:12:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F38211241F3
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 13:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E66E30056FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ED33396E8;
	Wed, 11 Feb 2026 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+waG3NT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF53358B8;
	Wed, 11 Feb 2026 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811920; cv=none; b=PRHTEOzuyYzAvbV9xlmDh38h78uY4ZYl/CLZuBuT/VUTlNRcPqza6KlpeHzsnBa100XQnIndgv1OASRjoN0kfTza8Q1dczbgO08Cx8bGpQepERXkQEMXrTzBRXUCELOwOP+sNflmfG4SiZ3dOLDTpoeUHq5mldyk8JkDl0GP9GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811920; c=relaxed/simple;
	bh=RwLK5y3Skh5p3fRZnWmIlHH1BHA4Od56ZDdBS0vCTgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gilDcQjzGN2TX0mO1t3AdZCzVPf74TKjxRoDuDxuV60yXMzhe2A3ciTgyyJqF9NwWxPCGkhyEb/8QZp+3zZIv/jFmf3S5jRt9qXghZyjFksdiYK4m8pW73o1M5jOVG7rJcTq8ztYjQutfZlCc2hjnX9rR072LCrI7/uKWrEET9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+waG3NT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B15C4CEF7;
	Wed, 11 Feb 2026 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770811919;
	bh=RwLK5y3Skh5p3fRZnWmIlHH1BHA4Od56ZDdBS0vCTgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+waG3NTFD3zNMo4kAnHXWgk0Ry1K4epb4o4XgIU63pqdFbpMV6kWMAqgmMMFj+vF
	 /AIb3HyZNEtGv3sFA7pvqZB3AxtPukqS9JIbIRc0TSt2GD1/+0Q3MXUy6kF13+zUKM
	 Bg08+h7ibn7DHQNvcAo8RAq+qDdvNRczwWEcbflqMeu0AFuskX5fG0O7rXMWCRuvHu
	 ie7VDNwDCtmKCqfPeM6jrMa5Ph250vkt8YJehlkGSE2+EgoQVRKa8mmQWrtBvyJTxL
	 x46ukoypQfsWf97f7XwcwrxTW5GyhynGiiemHYtiGC3QPUEUyaJZJn90al/Q477dLV
	 F782zC/Y9WULQ==
Date: Wed, 11 Feb 2026 09:11:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dmitrii Dolgov <9erthalion6@gmail.com>,
	linux-perf-users@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v1] tools build: Fix feature test for rust compiler
Message-ID: <aYxyCypnmSuXSYYD@x1>
References: <20260211095807.132855-1-9erthalion6@gmail.com>
 <CANiq72mFBaFm9QVotxeDB0TanKxQRko7ZFhuF-RHq-8WCemCTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mFBaFm9QVotxeDB0TanKxQRko7ZFhuF-RHq-8WCemCTQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11123-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acme@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F38211241F3
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:41:06AM +0100, Miguel Ojeda wrote:
> On Wed, Feb 11, 2026 at 10:58 AM Dmitrii Dolgov <9erthalion6@gmail.com> wrote:
> > Currently a dummy rust code is compiled to detect if the rust feature
> > could be enabled. It turns out that in this case rust emits a dependency
> > file without any external references:

> >     /perf/feature/test-rust.d: test-rust.rs

> >     /perf/feature/test-rust.bin: test-rust.rs

> >     test-rust.rs:

> > This can lead to a situation, when rustc was removed after a successful build,
> > but the build process still thinks it's there and the feature is enabled on
> > subsequent runs.

> > Instead simply check the compiler presence to detect the feature, as
> > suggested by Arnaldo Carvalho de Melo. This way no actual test-rust.bin
> > will be created, meaning the feature check will not be cached and always
> > performed. That's exactly what we want, and the overhead of doing this
> > every time is minimal.

> > Tested with multiple rounds of install/remove of the rust package.

> > Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
 
> Not sure if Kbuild covers this given it is `tools/`, but just in case
> given the `MAINTAINERS` file, Cc'ing them, as well as rust-for-linux
> since we try to use it as an index of Rust-related things there within
> the kernel.

Right, this started with Dmitrii wanting to help with data-type
profiling in Rust, as Namhyung mentioned in his LPC talk that there was
work to be done to support other languages.

Since he had tested it and it seemed to work, I suggested he turned his
recent experience into a 'perf test' for data-type profiling on a Rust
workload and this series came out of that.

This has even caught a regression already, namely:

  64ea7a4620008652 ("perf annotate: Fix register usage in data type profiling")

https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/commit/?h=64ea7a4620008652

Now it is the first, AFAIK, experience with rust in tools/, as this
shows:

⬢ [acme@toolbx linux]$ find tools -name "*.rs"
tools/build/feature/test-rust.rs
tools/perf/tests/workloads/code_with_type.rs
⬢ [acme@toolbx linux]$

With the above patch we'll be left with just
tools/perf/tests/workloads/code_with_type.rs, that is linked into perf,
if rust is available, and we need to figure out to reduce the impact in
the size of perf, which is noticeable, but as it is not a strict
requirement, we can have this addressed in later work.

Hopefully this helps pave the way for more Rust tooling to flourish in
tools/.

- Arnaldo

