Return-Path: <linux-kbuild+bounces-13902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0NAZGkWJP2obUQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13902-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2026 10:26:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CB6D1784
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2026 10:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZnE2xfYw;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13902-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13902-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41CF930237CF
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2026 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E55D319617;
	Sat, 27 Jun 2026 08:26:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBF3016F5;
	Sat, 27 Jun 2026 08:26:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782548800; cv=none; b=SCQz+9Pd8g+fx+vl+qk+dvNMVEgjsVJXP3husKPmaM1Rqt5sUnCJd/L8QRLMZjjzMGxV9Kg8U9tjqlHk/E1qaiipZvaRzp08SJWZZtb7O8RqUMv5lEeFavicST0F65sNIE3GmRaD9yGu4wHCPMzN+4F4XnoScOBm/PQznecSFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782548800; c=relaxed/simple;
	bh=JbziN080BgkK8T0CBdCR9Iqa+CYIxkrEEhRRhERLG9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MntTR0PDZhr9s2YXNa0Mgi4zjB78nNVpEb2G3ax/CGy1Op+X+sjtq0yARmUvrM7PKwWk5cgkzM864f0rlMMGbR9J01O+Zv3jJj/PZGtE38xYb6GSI6QRIYnkn54AkO9It6V/6/Dspt2ufpBv4oLu/tzvlelCDUyeie7g/NFLxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnE2xfYw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 090241F000E9;
	Sat, 27 Jun 2026 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782548798;
	bh=iCmoohMgLaCzClRCepuCXxr99vQafz176jQvgGFHRs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZnE2xfYwyU2S4hSZ/R29bmLhFq/zaRQoa++wmsF+12fg7j0rNx8CPZyEyKUNL1VpM
	 nCsoJVKYI8A+3MB3OzidiPdz6aNPcYMOotK1jf33vELuRPEx2D3zhb8eKM+VgdP9LQ
	 zlVP7hbGZBcCot+0l80MrI7NZO4V910oMgvIJQVz+q+3UX4CIq8C0GFTiUGJcEpUIo
	 qFH6uSIYn3hpE6nBapmOiR3Wh/eqMy1LM90ScqqDnK+sJqtVqXJxDEYyN8O7pcwoeq
	 mYeGsppUXBSna9dkCtKZNEtKm983CD/Cxvd18od2ZYOs222nSV4KgNaya2xOGD8lUk
	 Eix5NN+Hqs7oQ==
Date: Sat, 27 Jun 2026 09:55:12 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.52
Message-ID: <aj-B4DLzEptpjeQ_@levanger>
Mail-Followup-To: Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
References: <20260625231919.692444-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625231919.692444-1-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:tamird@kernel.org,m:nathan@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:rust-for-linux@vger.kernel.org,m:y.j3ms.n@gmail.com,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:yj3msn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13902-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE2CB6D1784

On Fri, Jun 26, 2026 at 01:19:19AM +0200, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52.
> 
> Most SPDX identifiers have been added upstream at our request [1]
> (without parentheses -- supporting them is an issue on the kernel side,
> but it does already reduce our differences). The CSS one for `rustdoc`
> was added too [2], but will be picked up in a later version.
> 
> For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
> request to avoid our local workaround [3]. This means one less difference,
> thus indicate so in our `README.md`.
> 
> For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
> allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
> upstream added for us [4]. We noticed a minor doc render bug [5], which
> will be fixed for a future version too.
> 
> The following script may be used to check for the remaining differences:
> 
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zerocopy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
> 
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
> 
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Link: https://github.com/google/zerocopy/issues/3428 [1]
> Link: https://github.com/google/zerocopy/issues/3457 [2]
> Link: https://github.com/google/zerocopy/issues/3426 [3]
> Link: https://github.com/google/zerocopy/pull/3416 [4]
> Link: https://github.com/google/zerocopy/issues/3466 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile                                 | 16 ++++--
>  rust/zerocopy-derive/README.md                | 14 +++---
>  rust/zerocopy-derive/derive/from_bytes.rs     |  2 +-
>  rust/zerocopy-derive/derive/into_bytes.rs     |  2 +-
>  rust/zerocopy-derive/derive/known_layout.rs   |  3 +-
>  rust/zerocopy-derive/derive/mod.rs            | 20 +++++---
>  rust/zerocopy-derive/derive/try_from_bytes.rs |  6 +--
>  rust/zerocopy-derive/derive/unaligned.rs      |  2 +-
>  rust/zerocopy-derive/lib.rs                   | 36 +++++++++++++-
>  rust/zerocopy-derive/repr.rs                  |  2 +-
>  rust/zerocopy-derive/util.rs                  | 34 ++++++++++---
>  rust/zerocopy/README.md                       | 15 +++---
>  rust/zerocopy/src/byte_slice.rs               |  2 +-
>  rust/zerocopy/src/byteorder.rs                | 49 +++++++++++++++----
>  rust/zerocopy/src/deprecated.rs               |  2 +-
>  rust/zerocopy/src/error.rs                    |  2 +-
>  rust/zerocopy/src/impls.rs                    |  4 +-
>  rust/zerocopy/src/layout.rs                   |  2 +-
>  rust/zerocopy/src/lib.rs                      | 13 +++--
>  rust/zerocopy/src/macros.rs                   |  2 +-
>  rust/zerocopy/src/pointer/inner.rs            |  2 +-
>  rust/zerocopy/src/pointer/invariant.rs        |  2 +-
>  rust/zerocopy/src/pointer/mod.rs              |  2 +-
>  rust/zerocopy/src/pointer/ptr.rs              |  2 +-
>  rust/zerocopy/src/pointer/transmute.rs        |  2 +-
>  rust/zerocopy/src/ref.rs                      |  2 +-
>  rust/zerocopy/src/split_at.rs                 |  2 +-
>  rust/zerocopy/src/util/macro_util.rs          |  2 +-
>  rust/zerocopy/src/util/macros.rs              |  2 +-
>  rust/zerocopy/src/util/mod.rs                 |  2 +-
>  rust/zerocopy/src/wrappers.rs                 |  2 +-
>  31 files changed, 174 insertions(+), 76 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index a870d1616c71..835cf10e1c0b 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -84,11 +84,15 @@ core-flags := \
>      --edition=$(core-edition) \
>      $(call cfgs-to-flags,$(core-cfgs))
>  
> +zerocopy-cfgs := \
> +    no_fp_fmt_parse
> +
>  zerocopy-flags := \
> -    --cap-lints=allow
> +    --cap-lints=allow \
> +    $(call cfgs-to-flags,$(zerocopy-cfgs))
>  
>  zerocopy-envs := \
> -    CARGO_PKG_VERSION=0.8.50
> +    CARGO_PKG_VERSION=0.8.52
>  
>  proc_macro2-cfgs := \
>      feature="proc-macro" \
> @@ -128,11 +132,15 @@ syn-flags := \
>      --extern quote \
>      $(call cfgs-to-flags,$(syn-cfgs))
>  
> +zerocopy_derive-cfgs := \
> +    zerocopy_unstable_linux
> +
>  zerocopy_derive-flags := \
>      --cap-lints=allow \
>      --extern proc_macro2 \
>      --extern quote \
> -    --extern syn
> +    --extern syn \
> +    $(call cfgs-to-flags,$(zerocopy_derive-cfgs))
>  
>  pin_init_internal-cfgs := \
>      kernel USE_RUSTC_FEATURES
> @@ -644,9 +652,11 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
>  rust-analyzer:
>  	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
>  		--cfgs='core=$(core-cfgs)' $(core-edition) \
> +		--cfgs='zerocopy=$(zerocopy-cfgs)' \
>  		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
>  		--cfgs='quote=$(quote-cfgs)' \
>  		--cfgs='syn=$(syn-cfgs)' \
> +		--cfgs='zerocopy_derive=$(zerocopy_derive-cfgs)' \
>  		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
>  		--cfgs='pin_init=$(pin_init-cfgs)' \
>  		--envs='zerocopy=$(zerocopy-envs)' \

Thanks!

Acked-by: Nicolas Schier <n.schier@fritz.com>


