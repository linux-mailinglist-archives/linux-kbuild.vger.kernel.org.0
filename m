Return-Path: <linux-kbuild+bounces-11041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJToKD++hGnG4wMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11041-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 16:58:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45180F4DE4
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 16:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D420130427F9
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Feb 2026 15:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A9D42B740;
	Thu,  5 Feb 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCxCr3m1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B042884B;
	Thu,  5 Feb 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306936; cv=none; b=C+Op1MBFWoIsQeqTA4viRUl9PvFt6NUNPPs/8bSL2jUeh6ltQ2QoxFHm9hbR131x3DZvdWCFTl/Fr7WNNhX5Yho1MX0LOqWJvdvf5eAYjdXK4m8NOC/dXsCa0TIX6iwL+ba6AU2jxpm/6agHKnFM/O8H77pj9PBDBpnFJ0Ixims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306936; c=relaxed/simple;
	bh=nLnqxFooA/49y7Qr2qOH02wcNjwl6i9vyPt+ZJikng8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Okxmk5meAiqFz8d+Gr109/SBt3YeGKOYbTmpoWePttjTCmD2iF+Or+yyCNqWV19cdR9J7vFHvUH58aOPQe2h51bc7da5TjeofU4zzPW8DlDTy/mJNrBMe9WXDQbQRgLXtWWPQLgq4TwzjXKhGIzUN3GlNrIMFTP6WSNDpXTohuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCxCr3m1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84943C4CEF7;
	Thu,  5 Feb 2026 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770306935;
	bh=nLnqxFooA/49y7Qr2qOH02wcNjwl6i9vyPt+ZJikng8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCxCr3m15otPPxE5NJuhZjbQUaeB2FUvBRMuN2+fjC6L7rY9kHbVZE47aVoCk70NE
	 OQlTj4DnMAHIXjaQzCPBv7NHxmhsDHatlGjFt8tHJojOcauwHAfmqImhFmXyo2Beab
	 Px6zqBpWaZJyv+gT0E69C6KDkpR1eMNE0/KdBnqWnRuhqyI0smKb12m0KHz5PDWXzD
	 A0Rc7cBkYSQOCKBoRr/XGjWslvBchIwm99XXnQiQN8gn1kAH9hO6/KfV+H3fC30k75
	 W0rQgcNUL5x+feCkRpf12hFgmvD11uDc9NGIQVIcnIovGhzCDpH/TEf7HViuXXHRK4
	 qPAfHvw+beUTA==
Date: Thu, 5 Feb 2026 16:55:25 +0100
From: Nicolas Schier <nsc@kernel.org>
To: HeeSu Kim <mlksvender@gmail.com>
Cc: nathan@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@google.com, charmitro@posteo.net,
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, lossin@kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v5 1/2] kbuild: add rustc-max-version macro
Message-ID: <aYS9bRugxr1rUvA3@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	HeeSu Kim <mlksvender@gmail.com>, nathan@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@google.com, charmitro@posteo.net,
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, lossin@kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
	tmgross@umich.edu
References: <20260203221224.GA2703490@ax162>
 <20260205131815.2943152-1-mlksvender@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205131815.2943152-1-mlksvender@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11041-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45180F4DE4
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:18:14PM +0900, HeeSu Kim wrote:
> Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
> version upper bound checks, mirroring the existing `rustc-min-version`.
> 
> This will be used to bound workarounds to specific compiler version
> ranges.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
> ---
> Changes in v5:
> - Split rustc-max-version macro into separate patch for easier backporting
>   (was part of the workaround patch in v4)
> 
>  scripts/Makefile.compiler | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index ef91910de265..85268f6f1494 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
>  # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
>  rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
>  
> +# rustc-max-version
> +# Usage: rustc-$(call rustc-max-version, 109000) += -Cfoo
> +rustc-max-version = $(call test-le, $(CONFIG_RUSTC_VERSION), $1)
> +

Acked-by: Nicolas Schier <nsc@kernel.org>



(nit-picking; not crucial for this very patch set)

For readability, a less-than version check might be easier to read; and
that would probably better match the suggested version range check:

    rustc-lt-version = $(if $(call rustc-min-version, $(1)),,y)
    rustc-version-range = $(and $(call rustc-lt-version,$(2)), $(call rustc-min-version,$(1)))

so that the actual version check could become

    # The bug was fixed in Rust 1.90.0, so only apply for 1.88.x to < 1.90.0
    rustdoc_modifiers_workaround := $(if $(call rustc-version-range, 108800, 109000), \
    		-Cunsafe-allow-abi-mismatch=fixed-x18)

or:

    ifeq ($(call rustc-version-range, 108800, 109000),y)
    rustdoc_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
    endif


-- 
Nicolas

