Return-Path: <linux-kbuild+bounces-13113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF6tCli7AWocjAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13113-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 13:19:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F750C9D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 13:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E26B53026CAE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE1F370D54;
	Mon, 11 May 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1WH+oj1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B872936F420;
	Mon, 11 May 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498381; cv=none; b=LnEB7VJeZ9QEu9zlx8FXbAkx9SHU1wV5/g0zXV7zvcyqUWaTkW1igdmZx8bvEbPszJm00okb6mBr+I7W2zWL8qgP+zvFnkEY9gIUOrgz4ITQfDVaoFqS2rGNtZqtfkZdp7HpOUmfhJLH/tlWbfn5n2CDd7UMt7EhtBAMrmTerrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498381; c=relaxed/simple;
	bh=GsUPCYi4SORcFaQFEndkeNQ2nUKT1wDYw+f9Cu06Mjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYQlFGpvdz/CxQTB3NyTftk84BsAivOFsLSn6L5wLeZ7tmq455iswC34NKMI+VAW0G4srofF0ho/uQ9kLxXo9lWZb/eR1R5Ww+ELJKDF2UTUvIc6N9aV0fU8/6yFsRkFqd76BbdXDJzPk2s9m1mMOTVNwphO9tGTO6xHbnM55pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1WH+oj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE80C2BCB0;
	Mon, 11 May 2026 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778498381;
	bh=GsUPCYi4SORcFaQFEndkeNQ2nUKT1wDYw+f9Cu06Mjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1WH+oj1G1Dp7jQBiCCCAwer7NTCZ62gqjvMrR69NepDEfypGn0iEo0PUAYgMnM7o
	 3xJpU748e9DHFcS6vWgjHJQQyAbfMkuoPg+MQFPuIpH+Cv9e7HfYn8Dn2ADJtHVYe0
	 CKGJ+0Qet7m44T6GQAz+tJ61ixA+TuixBch65KTtY6AHDAW1h0J+4jndeYJNhoSw6M
	 Ln9aaeB1dmzfT4dRwPUhj3W28Fk+bMIJSC2clOB/oSmnMM6x5YJSHDi/Khdrr0tbe4
	 MuHCEiJ9Yeq9cW5u/iWzn/yMUmAbwavUWJTlJb9X/Sq3Zqde7Do9/Niy6Rq7YCAQLq
	 9Y3G9XV2+U8WQ==
Date: Mon, 11 May 2026 13:18:41 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mohamad Alsadhan <mo@sdhn.cc>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <agG7EaA102fA0sQL@derry.ads.avm.de>
References: <20260509101939.27108-1-mo@sdhn.cc>
 <20260511065915.GA325559@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511065915.GA325559@ax162>
X-Rspamd-Queue-Id: 8E2F750C9D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13113-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sdhn.cc,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,o.map:url,smile.fr:email,derry.ads.avm.de:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 03:59:15PM +0900, Nathan Chancellor wrote:
> Hi Mohamad,
> 
> On Sat, May 09, 2026 at 01:19:38PM +0300, Mohamad Alsadhan wrote:
> > rustc's -C linker= option expects a single executable path. When
> > HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> > `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> > multiple words, and rustc interprets the additional word as an
> > input filename:
> > 
> >   error: multiple input filenames provided ...
> > 
> > Generate a small wrapper script and pass it to -Clinker e.g.
> > 
> >   ```
> >   #!/bin/sh
> >   ccache gcc "$@"
> >   ```
> > 
> > Note that the wrapper intentionally avoids a leading `exec` to
> > naturally support leading environment assignments such as:
> > `VAR=VAL ccache gcc`.
> > 
> > This fix should be general enough to address most if not all cases
> > (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> > like just defaulting to gcc.
> > 
> > This avoids passing the user command as an environment variable as
> > that would be more challenging to trace and debug shell expansions.
> > 
> > Link: https://github.com/Rust-for-Linux/linux/issues/1224
> > Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> > Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> 
> Thanks, this seems reasonable from a Kbuild perspective (although
> Nicolas may have other comments) and it appears to work for me. I expect
> this to go via the Rust tree.
> 
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> > diff --git a/Makefile b/Makefile
> > index 1a219bf1c..5ebeef67f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1651,7 +1651,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
> >  	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
> >  	       compile_commands.json rust/test \
> >  	       rust-project.json .vmlinux.objs .vmlinux.export.c \
> > -               .builtin-dtbs-list .builtin-dtb.S
> > +               .builtin-dtbs-list .builtin-dtb.S \

(If it'd go through kbuild, I'd fix the spaces-only here during patch
application.)

Thanks, no further objections.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

