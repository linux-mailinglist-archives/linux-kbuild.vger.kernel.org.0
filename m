Return-Path: <linux-kbuild+bounces-12720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPm0NlJp1Wm96AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12720-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 22:30:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899F3B4897
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 22:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B58243011145
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 20:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95FA379ED5;
	Tue,  7 Apr 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRtYElU/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB857379EE0;
	Tue,  7 Apr 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593808; cv=none; b=HYBdreDw4UF1GikfweyH2aO9oy4fBKNzZf56fhAOpO3HD/aKy7QgOtgNcFXHCgj/y7sHqUBbJiSzFa1fG0qc981N05mISJdrrPeHLJTWIFmjYkXcMtWEWKfe2GDZ2DRxgfv4nCTg6I+xfzSsX+pIJbrBzEFO1pTGpFy8Z6nz5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593808; c=relaxed/simple;
	bh=6oU+KsmOg3FjvhpOlW6GWV5dIaB2gE3o/TwTmnU4JRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFcGpoXZ0icTY64JNuuBMdYiv/BdMllO22fbXypVf6bK9wAyZPE4IQI563qEvr7sYOkSrTLRyvFVNCk2m8Jq1b4EETE3L/IxLEtWNmWKajDad0wwJLUHl17uXsdEhX+tqHe90qPu8cKKoMV9n9AkmUwXRpSRHVLl8mtXVCXkB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRtYElU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA56C116C6;
	Tue,  7 Apr 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775593808;
	bh=6oU+KsmOg3FjvhpOlW6GWV5dIaB2gE3o/TwTmnU4JRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRtYElU/kXI+NioLUM3KfjiGZMhCOtfdxwGBPdAdW2CKA/uAaoFrzr5U3GvZYdGmT
	 5dKoHzbUVPMlYqstQb7ZrfUzufSXowJXddRXgUFynC3KlTFlmIhICELlR0BxiFqNhK
	 toT396TjEmgXIa8HNXYVh/shfFqPiA8pBvtuwo+4pqnV8T6g0zHf+GYepO0ASqW+cV
	 mQQ3p023zCAUMLicQKQvGI2R0WaTg5vEnCjHgUW2Z8DtGeaeBCh6ViUbGneLQ3IA8V
	 icKnLsvKK8xdr4FWiAl/0Krq2Oe5wTGKCNadFw1pynm+uyMg59/rd6JgoyoYEHuXUl
	 /y/i85vuN7rbw==
Date: Tue, 7 Apr 2026 22:29:55 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <adVpQ_ZvXTPUegig@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260331000802.380-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331000802.380-1-mo@sdhn.cc>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12720-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5899F3B4897
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:08:01AM +0300, Mohamad Alsadhan wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Generate a small wrapper script and pass it to -Clinker e.g.
> 
>   ```
>   #!/bin/sh
>   exec ccache gcc "$@"
>   ```
> 
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
> 
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> ---
> v5 -> v6:
>   - Add fix to `rust/Makefile` as well (Yoann)
>   - Include script to `.gitignore` and make clean (Nicolas)
>   - Add back the outer `exec` to the command

What is the reason for re-adding the 'exec'?


-- 
Nicolas

