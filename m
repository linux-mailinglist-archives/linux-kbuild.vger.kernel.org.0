Return-Path: <linux-kbuild+bounces-12943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIV9Ehyq8mm8tQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12943-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 03:02:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4149BE44
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 03:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 330E73004902
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6A521ABC9;
	Thu, 30 Apr 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSGlainc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EAF12CDA5;
	Thu, 30 Apr 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777510890; cv=none; b=GggCwyv+R5fyyKXlFYSJqUUk/5r39IScV25qhWRvy4oI1hRED63y0L4uv5uQMZ3Vjkf0XhVG5m511gx3t/i11Ar7t7uEstzDwTUJCeggmxwlni4/1DDLnATWzfbxFD+cKtsoo0R2lxc2APgRp6455nhOsYfHSBqy2I62HQxpaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777510890; c=relaxed/simple;
	bh=T4OHgsELEXa2CK7NDgcqvrDUgmG5EvKC0N5i88wbnHs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LYmhNG/NK7MEpsrRl2TzCg1qcbtAFqMcm6WRQcS7X4b44Fi/1xV74yGfot9ic5DTH8cLa7OfBYlIu3alP36ONKm7lbouhVT1bYUj1Aohj0mN7BbSD6vOLXSGQ6rZuD95Qdi5HhWiClrVoTc7DL/APMCPUTnpSIeqTQ4HllhGMsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSGlainc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50308C19425;
	Thu, 30 Apr 2026 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510890;
	bh=T4OHgsELEXa2CK7NDgcqvrDUgmG5EvKC0N5i88wbnHs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=cSGlaincDbaNNb5OwOwqFkmhwQ6/6LL+nr6Pp2+dixi0n5NhdIZ9lpyxQEryopCrP
	 GcLvfCHhV7ibidYkkoabbZV7nJ+obAPNhAUwhLB6htnlMeJlgdvgxEmhFah7UHsDxr
	 98XP1G1Nr/uD503mEhLQaSHvvwGUzbqjh6qyFg/9vDYGM+S/Sp6tJIoyvmoxPtXHsy
	 KHAasf++ieiPZjePhHljGp8I7ve/+cN03yhKqU0f7UjV9TBzBCH7ite/xvPLE/muCU
	 kZVtWB5+Ixpe7UDgrT0/8D4wmNisPb/j39FNROIyGTIXLiPak+IMjhad/7V88h0Tku
	 zuOvNb1DZeCLg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7] kbuild: host: use single executable for rustc -C
 linker
From: Nathan Chancellor <nathan@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20260416211525.13847-1-mo@sdhn.cc>
References: <20260416211525.13847-1-mo@sdhn.cc>
Date: Wed, 29 Apr 2026 18:01:16 -0700
Message-Id: <177751087668.2042162.14581501251680231924.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=nathan@kernel.org;
 h=from:subject:message-id; bh=T4OHgsELEXa2CK7NDgcqvrDUgmG5EvKC0N5i88wbnHs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfVj5r517lP6PmtbXq+j0nLrGUPV23Up7B6MSjXK4Dn
 hl6VjuOd5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJxL5jZHh90FkzQXPtithG
 nQdHBZp8ZmvN0z8u2bfx9VzPKm99Dm+G/07bnHKnPb7+c/77ymmbGyqrV6mufBR7c0XYrTkRc3P
 +PGcAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 02C4149BE44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12943-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, 17 Apr 2026 00:15:23 +0300, Mohamad Alsadhan <mo@sdhn.cc> wrote:
> diff --git a/rust/Makefile b/rust/Makefile
> index 5eca6a817966..6bc761a31936 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -565,7 +565,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
>  quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro = \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> -		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
> +		-Clinker-flavor=gcc -Clinker=scripts/rustc-wrapper \

I think this should use an explicit $(objtree)/ prefix to make it an
absolute path.

>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646a39..84fd87a5301d 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,30 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
> [ ... skip 22 lines ... ]
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
>  # modules case.
>  hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
> -		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
> +		 -Clinker-flavor=gcc -Clinker=$(obj)/rustc-wrapper \

I have not been following this series too closely but it feels weird
that multiple rustc-wrapper files would be generated when their contents
should be the exact same. Would other host programs have to copy the
changes you made to .gitignore and Makefile under samples/rust/hostprogs?
What was the issue with attempting to unify these?

-- 
Cheers,
Nathan


