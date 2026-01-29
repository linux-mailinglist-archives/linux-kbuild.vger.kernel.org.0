Return-Path: <linux-kbuild+bounces-10934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFHRNH/se2n+JQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10934-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 00:25:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C107B5A96
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 00:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516033010153
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 23:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DABB376477;
	Thu, 29 Jan 2026 23:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgXJgQCd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AB36CDF1;
	Thu, 29 Jan 2026 23:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769729143; cv=none; b=C5G2eWXmfUXhIoSojHZFUB6fZrj7pum4g4unAbycXs1cpEkw7v9Nd7gMSDkeG2ox24XnugXzjUE6NUjewNzRKX61yy8RVhqlCBvHWFi7NxpmO068YvcZKFj9UGRTAaUgO0KIMcxH45oiFUctN+9+AU3EW/7H9y9xYNzFLdi61Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769729143; c=relaxed/simple;
	bh=3+xik+/x6pFcQMFxG5QqN5mR1gL6yX1jrYgnP2VQ1dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQyLzx/gc8apUh2qyvqScKVE0ECkEwUOfVwn87Ktm8hyebJ/gsx8yIapm+heI8+IOxIDfwRcAPdKk7YOvnjxscRltjIOJJ/+Y+epvt3il8hDjL/KHN/KZXgK3UO+ApgLnaN+Es/mDlZJ7WtRQ8r4iLtQqoIoexrzGpHbdia/XN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgXJgQCd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C9AC4CEF7;
	Thu, 29 Jan 2026 23:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769729143;
	bh=3+xik+/x6pFcQMFxG5QqN5mR1gL6yX1jrYgnP2VQ1dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgXJgQCduBviX6Pf5XMfcb9aW6ykHIkhl0Z6Zjlkw96jyKTrpGQwQA8tuDCuq6bmL
	 rZ9RavnLNAyBE2rnhO1yAIoE7K0XaC3jPEBLk6gqw2A9HkBV1oZ7x/hijwzaR5urQE
	 qVwBpVXIp00grEZzG0WdscxJ+dtgADy1weesMNqVq2q07mYMrMScyQzvoBYt1FbVQK
	 tb/MuuVq58SjwOeMt+nsTJRB+V/oAeYWkZpxwgM4xegcVT4tQIftjzWCtRqC/0Aj7b
	 Eqn2khyMx/cJdgbqR3TWoXRiRKLOywiAQETfK/IPsskVw3VSiw9tz2rE2cSS9vyR9n
	 6QCROt0qaTMfQ==
Date: Thu, 29 Jan 2026 16:25:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
Message-ID: <20260129232535.GD844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
 <87v7gk8r5x.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7gk8r5x.fsf@posteo.net>
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
	TAGGED_FROM(0.00)[bounces-10934-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[isrc.iscas.ac.cn,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
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
X-Rspamd-Queue-Id: 2C107B5A96
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:49:56PM +0000, Charalampos Mitrodimas wrote:
> I'm under the impression that the `!RUST ||` guard here doesn't
> actually prevent the `$(bindgen-backend-option,...)` call from being
> executed. `$(...)` shell expansions should happen during the textual
> substitution phase, before symbol dependency evaluation occurs, check
> documentation at kconfig-macro-language.rst lines 228-229.
> 
> I did this test:
>   $ cat /tmp/fake_bindgen
>     #!/bin/bash
>     echo "[BINDGEN INVOKED] $(date '+%H:%M:%S') args: $@" >> /tmp/bindgen_calls.log
>     # Call real bindgen
>     exec /home/charmitro/.cargo/bin/bindgen "$@"
> 
>   $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- BINDGEN=/tmp/fake_bindgen defconfig
>     HOSTCC  scripts/basic/fixdep
>     ...
>   *** Default configuration is based on 'defconfig'
>   #
>   # configuration written to .config
>   #
> 
>   $ linux git:(master) rg CONFIG_RUST .config
>   ...
>   283:# CONFIG_RUST is not set
>   ...
> 
>   $ cat /tmp/bindgen_calls.log
>   [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
>   [BINDGEN INVOKED] 15:44:44 args: ./scripts/rust_is_available_bindgen_libclang.h
>   [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64imv
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32imv
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zabha
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zabha
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zacas
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zacas
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbb
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbb
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zba
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zba
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbc
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbc
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbkb
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbkb
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zicsr_zifencei
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zicsr_zifencei
> 
> So, CONFIG_RUST not set, yet bindgen was invoked. Not sure if that is
> intentional though.

While I have only recently adopted Kconfig, the section you pointed to
in kconfig-macro-language.rst makes it seem like this is expected. I
read that to mean all shell commands are going to be evaluated and
effectively turned into "y" and "n" before dependencies are evaluated.
You can test this with something like:

if RUST

config RUST_FOOBAR
    def_bool $(bindgen-backend-option,-obviously-not-supported)

endif

added in init/Kconfig and running your fake bindgen.

While this is obviously a little wasteful, I suspect this drastically
simplifies the shell commands part of Kconfig for no change in runtime
behavior.  The way that the dependency is currently written ensures that
either the result of bindgen-backend-option matters for the sake of
saying an extension is fully supported by the toolchain (when Rust is
enabled) or it does not matter (because Rust is not enabled).

Cheers,
Nathan

