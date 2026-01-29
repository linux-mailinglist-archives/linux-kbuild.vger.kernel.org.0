Return-Path: <linux-kbuild+bounces-10933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJgSCxrie2lyJAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10933-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 23:41:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DBCB574E
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 23:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EF6B3004DD5
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 22:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788836683F;
	Thu, 29 Jan 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjQySNhE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247435C1B7;
	Thu, 29 Jan 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769726487; cv=none; b=lCHeDkr/x1F4lb1iGOrV6H4B0O2ebknwy03ATghnaXKf8k4Mr+SU4XBmEwTN8LneHGCZbIpT7dUO0HQiKx5jYTJcebx3Jy9tYOev8K3JGCB8oPgBJvbUTPrSCFDqGq1GHIUm99l62t+wRK41XX/Eh76jiEQVoESSseF4450Kra4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769726487; c=relaxed/simple;
	bh=0Cgvwko1h1R9ooOUPVRWvfyKzy4YXcZJFJeK7aS3gGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkvWIUguyFEw8jts+Qimt4G0WXM7S+fVgAr67ffrLVGRIciJgI2TMATkOt4tPB7//Rma06s1T6U2muZrOtHnyDiDaC9cgnCQLcLjy6bd+QB2krXwuV+y28mWktl35VT8pA2vhtmLrImgn5b0+EOhygHQ2IPgqxo5CTr8FCSS4qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjQySNhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E11C4CEF7;
	Thu, 29 Jan 2026 22:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726486;
	bh=0Cgvwko1h1R9ooOUPVRWvfyKzy4YXcZJFJeK7aS3gGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjQySNhEktK8AivnEQwrXUmQquAClQmbacRI5eShSk3gBiLELRT/J9iUCcCVmtmov
	 YB0pVrvh9WDq2fXWvXWnd8hR9HOCGciPGhKTN/VzQ0Zybx2wzUuWdoNm1KocMbzzkD
	 bEUZOkSfqS8eDTPDVAfSp5ezGNY20RrDR/YjnM+R8qKqXxCCV5eFC3perOqeKASXti
	 axhfmyKuQzFZYNMbMVR5r5bwC0VEsX3yZDnn95lOlLy3j7zzTLLjwd3fAakqOi06is
	 GuQpGCbwKdsWKY1BS7Rflr521ZyFgiHpZH/FNOiSl4zvqIbZJtUg/Hk0p8pWIixicY
	 kGEOfRtf2blBg==
Date: Thu, 29 Jan 2026 15:41:18 -0700
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
Subject: Re: [PATCH v6 3/4] rust: add a Kconfig function to test for support
 of bindgen options
Message-ID: <20260129224118.GC844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-3-2ac86ba728c8@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-gcc-rust-v5-v6-3-2ac86ba728c8@isrc.iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10933-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C1DBCB574E
X-Rspamd-Action: no action

On Tue, Dec 30, 2025 at 05:47:56PM +0100, Asuna Yang wrote:
> Add a new `bindgen-backend-option` Kconfig function to test whether the
> bindgen backend supports a given flag.
> 
> A subsequent commit will use this function to test for RISC-V extension
> flags.
> 
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
> ---

Acked-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/Kconfig.include | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index d42042b6c9e2..9954b8093fab 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  # If you are testing for unstable features, consider testing RUSTC_VERSION
>  # instead, as features may have different completeness while available.
>  rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
> +
> +# $(bindgen-backend-option,<flag>)
> +# Return y if bindgen backend supports <flag>, n otherwise
> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
> +bindgen-backend-option = $(success,$(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1))
> 
> -- 
> 2.51.1
> 

