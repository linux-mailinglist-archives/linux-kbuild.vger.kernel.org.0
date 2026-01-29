Return-Path: <linux-kbuild+bounces-10931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGgJAsDge2lyJAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10931-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 23:35:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC7B5680
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 23:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1CA23004074
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 22:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671BF366DCD;
	Thu, 29 Jan 2026 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k09VX/to"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416E0352C51;
	Thu, 29 Jan 2026 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769726139; cv=none; b=OxhfAjQJAd4zyRUYiehnu2Z86cwP/NCjMOTCoHbDTV6jYSBlW2HfrzG/jdvVjzQb+DV1CYSyve43XwQWqUzWN5UW1Q3rqjDjo/LAVSwgDUydZfv/kmpIufJb2eGNZc3AYq7t8Jk6MnL+oDqGMk52dOO90nN3v25vLa0/OQdRpbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769726139; c=relaxed/simple;
	bh=UkNX32KZtTbiUWsoCAvLwtloIiF3hbhWHYIeoQpDme8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nyvlf2d7fzgkYYcn88d/NiV+zWDJ9EH3SLgns6NkdlG/gSzAWgaTFO4QLtkGQs1HgRxVo1FDyuZJG98V2vMV/s9nzW6B5OcWhbVUWjyowGJn4AP9fvlQUI6JLPdCQE2KP/bPBIP+s/wSaTIDLtJibvHyvpzUs5K4+gWodEzHmFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k09VX/to; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76475C4CEF7;
	Thu, 29 Jan 2026 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726138;
	bh=UkNX32KZtTbiUWsoCAvLwtloIiF3hbhWHYIeoQpDme8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k09VX/toJdFybVhpIQRAo1f8y9CbBEYErGzzsMQjRzVbSqvNBcSEBAVY8oPUivtXX
	 eopkMR1CT43PMYuUpbsjZMN3YVmv7zqh5JkSq4BOVI80zjWQORYC7tLqj0m79kS8IS
	 SzNVpo0JtqO2mLkbucoyiQUqAf+oKRagkGxOsaQM/EmF/5r19t1wc8ZiEjoDFO4MDr
	 Et19cFV2FQoGPxFYsm/v7jsdJtr92j3dJuhva40AFYk1ksrIj3yDj+tChSZWx97B9R
	 gv9yqQfF/lEwYGy4KjUPSoLy5uY1HLwj9WqcCv9Bo+HiegXEmV+6ZRPHA2WrjnlZU/
	 X2X+fxmCsMGAg==
Date: Thu, 29 Jan 2026 15:35:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v6 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Message-ID: <20260129223528.GA844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-1-2ac86ba728c8@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-gcc-rust-v5-v6-1-2ac86ba728c8@isrc.iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10931-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EAC7B5680
X-Rspamd-Action: no action

On Tue, Dec 30, 2025 at 05:47:54PM +0100, Asuna Yang wrote:
> A subsequent commit will add a new function `bindgen-option` to
> `scripts/Kconfig.include`. The bindgen backend requires the `--target`
> option for cross compiling, but variable `BINDGEN_TARGET` in
> `rust/Makefile` cannot be exported to `scripts/Kconfig.include`.
> 
> Therefore, move this variable to a separate new `Makefile.rust` file and
> include it from `scripts/Makefile` to make the exported variable
> available for use in Kconfig. Place the include in the `need-compiler`
> branch to avoid including it in irrelevant make targets.
> 
> Since the new file name is `Makefile.rust`, it matches an existing
> MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
> file is needed.
> 
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile              | 3 ++-
>  rust/Makefile         | 8 --------
>  scripts/Makefile.rust | 9 +++++++++
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 27ce077520fe..9754d7add947 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  include $(srctree)/scripts/Makefile.clang
>  endif
>  
> +ifdef need-compiler
> +include $(srctree)/scripts/Makefile.rust
>  # Include this also for config targets because some architectures need
>  # cc-cross-prefix to determine CROSS_COMPILE.
> -ifdef need-compiler
>  include $(srctree)/scripts/Makefile.compiler

Not that it is a big deal but it would make the diff simpler if the Rust
makefile was added after the compiler one, both for alphabetical reasons
and it would not necessitate moving the comment (even if it mostly
applies just to the compiler include).

>  endif
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..2603b34f9833 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
>  	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>  
> -# Derived from `scripts/Makefile.clang`.
> -BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> -BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
> -BINDGEN_TARGET_arm	:= arm-linux-gnueabi
> -BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> -BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
> -BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> -
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
> diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
> new file mode 100644
> index 000000000000..5c12b4b8c8b6
> --- /dev/null
> +++ b/scripts/Makefile.rust
> @@ -0,0 +1,9 @@
> +# Derived from `scripts/Makefile.clang`.
> +BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> +BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
> +BINDGEN_TARGET_arm	:= arm-linux-gnueabi
> +BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
> +BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> +
> +export BINDGEN_TARGET
> 
> -- 
> 2.51.1
> 

