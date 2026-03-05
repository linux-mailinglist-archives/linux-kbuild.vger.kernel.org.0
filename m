Return-Path: <linux-kbuild+bounces-11575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHEGDUNbqWkL6AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11575-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 11:30:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D820FB98
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 11:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2563231325F6
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 10:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E3E37F01C;
	Thu,  5 Mar 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxKcrp1N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7B37D13C;
	Thu,  5 Mar 2026 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706369; cv=none; b=lcixBhUU0DIOqSYNQWBpo5wjH0clDXB02cWhnwyuNw7e+qrQinVEKXc6WUv5S+7ze9n2M4lRKz0eZDklvvEBU4r/sD1uvzjD+89JY36qbsL0YhPrlbfDuNtNE1iBA5MDE6UqzKXPyUtSo44cak3yNmCFhg1wm95xKVgvDC8MTtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706369; c=relaxed/simple;
	bh=mopNjxyGlc1UwRsEKNs25RNJFEbs0dSzzcVn/5Lrcpc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iAEDjZAenhPp7EQzpL+KE5yj2nJpN4PvU5e3pS4HIBgIhEPxOnl8uwSzjPAU70r5MM4KXwGcWRLvN+VrN7AutuQ6wRwFmeV6z7JBB0IGZqxo31IyVvxnmXTBTWHWot9suIC9nRfPPgleN5fD+1V61Ap8+SPv4WE1I1OkG6nrHPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxKcrp1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D2BC116C6;
	Thu,  5 Mar 2026 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772706368;
	bh=mopNjxyGlc1UwRsEKNs25RNJFEbs0dSzzcVn/5Lrcpc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=GxKcrp1NjpcJWIlYGOBMnLhrtZ6KW4d3Q0AsVsyUvzolHHPP6pu6s51wSMSIwgRS8
	 yRiD27V16apOqOOtv2fOISUXuKvkHACUrrPlr6xBqZFHu5ciJuhbc9UhQ9orhkEWDf
	 II0Y3z566YoYLMtSeEE9GRld5OIGUZcnuIdMzeiLhGWiIXEfNzNmYiMrI0B0EAL1Xk
	 iINr1gmDzlK2m7I7Eiqkt2q86r0lyXIrXhW6Vrmbz/UKLfzkURGwvNibTBARbSaz8d
	 /j1S3OI9ZMKfFUyrzCZbD+54Rz097Q/i7rTizm7UWSUaKwbdTfdVatnF8a2lHxsm+T
	 DqI3xJSMJJdfQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] kbuild: rust: add
 `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Nicolas Schier <nsc@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 Matthew Maurer <mmaurer@google.com>
In-Reply-To: <20260203-inline-helpers-v2-1-beb8547a03c9@google.com>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com>
Date: Thu, 05 Mar 2026 11:12:59 +0100
Message-Id: <177270557911.104478.12699746103670684667@derry.ads.avm.de>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=mopNjxyGlc1UwRsEKNs25RNJFEbs0dSzzcVn/5Lrcpc=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpqVctnTqdxXgENccjqWqtvxCvG/SQspXXSTbSz
 a0dBSGX4x+JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaalXLQAKCRAHUgpwFiYS
 aSYjEAC16lSRDiDLSgS1R1i3F1HH9EHYStgMq9R4oaJFqofyb5aAQRP8jrKAFe1mp6cWxOA0IeB
 mh5i++AsAHMpukhZv3VRXZLkHM0d2mDOuk+pbPy7aw0LoDEiyOlgbVVFsyj0kuKTBkuBIVKJTZK
 fGE5bfqFJBo+MVbilCgJly6KhHcNxCAZXSSeI1It6+/NGO6HNGXferB8ZrS+DAAeTenWZSaGVYU
 F3e905Fv3wZtrGgwiGOxvGrJcWVr0hLfCuKGbIcdDpcsN4OmSOdQwQHdE1b5PJgv2t9Q18rcpv+
 XMZi6XKwTbymtUtRPAERCs/Pd6gBQAcXkjidQJ4wq2fAAr7gei5qkkU+XwWI1Z/RjSzFx0NrTdo
 7eFqBttsygDVM5ztwdUQZ/4bely1jDEISSokiyW+dNxfZnmtnxZhSWeObmg0/51QnFa5Kw7/gT2
 VKiZcDFuH+jJ/OHm2glGJYJzfybNdorAtzoxBxDkG6jchRm92ljqGoAlfVXq9PHE89oTkQKnhdh
 wOZDoD2nuxE+DkzXvIhyqA6FnrO40hUs2si+NP0diQ9AHyl9I7GuajKEqXyGv2JO7e7NDuBIuJ7
 f4AlvYDcrwpdvCyr+bk3qp+MH+w9ChuQ/AycvODpM7aWG+KMFujj2LOmi97wm0m523zi825m5LX
 jenBOCuvsxI9Oag==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Queue-Id: 582D820FB98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11575-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 03 Feb 2026 11:34:08 +0000, Alice Ryhl <aliceryhl@google.com> wrote:
> This config detects if Rust and Clang have matching LLVM major version.
> All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> matching, otherwise it may generate errors, or worse, miscompile
> silently due to change of IR semantics.
> 
> It's usually suggested to use the exact same LLVM version, but this can
> be difficult to guarantee. Rust's suggestion [1] is also major-version
> only, so I think this check is sufficient for the kernel.
> 
> Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> ---
>  init/Kconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..06f6b23c9fde 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +config RUSTC_LLVM_MAJOR_VERSION
> +	int
> +	default $(shell,expr $(rustc-llvm-version) / 10000)
> +
> +config RUSTC_CLANG_LLVM_COMPATIBLE
> +	bool
> +	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
> +	help
> +	  This indicates whether Rust and Clang use LLVM of the same major
> +	  version.
> +
> +	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
> +	  LTO) requires the same LLVM major version to work properly. For best
> +	  compatibility it is recommended that the exact same LLVM is used.
> +
>  config ARCH_HAS_CC_CAN_LINK
>  	bool
>

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


