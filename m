Return-Path: <linux-kbuild+bounces-10797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aENQBA3ucWlKZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10797-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:29:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E99648DD
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CC6A3AA9BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 09:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A980133A71D;
	Thu, 22 Jan 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLvzb7w2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7134F478
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073706; cv=none; b=LgLH12FYVIi83YOiD79LJMVMH4S+u2J8smb71d5jXXBv1V9Zyu491G9lItJH2nevsYuXJ+CmVPvPo6BR5ZT2lNkhSg4gYDD0XScyqjrn/qHldMVQleunIJ8QCLIL8leU8NSr1rVGNqZS1U11sBWm4fEe7WmaDcMyaI1mCCW4ACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073706; c=relaxed/simple;
	bh=kTfc0dzSxCdmzJCbSFDovj2HiD8lFb9rtRC+/PJ7rko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iCgwWP0LopVOVYPVDYcOTeth7OX+eADZfj7R7Mg2UdeGcCEzNEHHrwj/1TYCFmk7UIho2mSe+Z1X8LWvtP1Ks69Y8YDGhotis2Uv0ZWBlDoX0CsOnQ5wuYUfUkI1Sak9nFHd7Fa6FMXhV0ffk66ZK9bX6gjpXpJvkn+o+gWhFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLvzb7w2; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65811a93da0so726033a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769073703; x=1769678503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=skZ5jIzpUZHmbipMVluykW0K+SUgynFko9eEPO98xw4=;
        b=kLvzb7w2QU7XGN/9dV8S7HupEA+bmyWiCT01srkJklj5UsAloTDHSqZmDPwBn0TBun
         BYK57siTS4EMEsbrDoLFtkQk7tzvac9vskPINRQhlRt5rPU35XO6Jjt2K/SaZw9+z/Jn
         2sbkmL3HLnnJtU/S8A9AU11Bs+SOH4LkKqQiDPa4IUPrTF7g//z2IKRpCfz9LnA8Wpry
         xdiQxYG7k0DPNZCtF3nIrki98mWra+3y6lLABx1CMCEo9EyQLR+Pyl9y0WV11jNWvqxE
         BZ3vP9UYqvx5Jz/LTWHIhXunc+FE+sTcjk6+MWXR559KtgerfbMW0dKC+N2zsxsMnnLA
         PPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073703; x=1769678503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skZ5jIzpUZHmbipMVluykW0K+SUgynFko9eEPO98xw4=;
        b=IKXadeNV/gF+mvJBRjUaEQYF3VMjf5pof5FvPxd5dlXyLzjNwxyA5vuqBcZGLRofUG
         sFmzhJQUOzuJHyiDoor5Tb+KiotP1XS0ZL+xaIzrfSZXldnjmIctlZx04YYes+uSQssa
         XrfDUNDxgavXcCsyfOcEc7eDvBuW4qQD4mVMr2xprDzhUQdrDPLAknhLbmcJDDigxOkd
         4Tcw0E3x40LU5rs1OPxAwLIHtenel/yKWlwxsAhrN1PhUVMHlOeIpIt5f1haNhZOl3z2
         20kUCGVKmUvdAXNOngpCvABqduuUt7yo/PjdZYcB5so4+cDvVIEFZ7jzj/bpr3t+Y4dn
         LiWg==
X-Forwarded-Encrypted: i=1; AJvYcCXnvWUNToVvG57ziaApPQGfQ8nfum1n4FlEHAQBN7ZRIxBGbdvlV4D66o29hNVv7ECxC/S9gG3nOWOx5Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzer5bxabIyY778+pVLcq6h/UUImVwYPOOxxH61KqehFpPkWCYT
	Qwi7WbYFOU7xiqGPeb6LO/Z+zeF5Gkk28gHBHmOP0bLwgQDkcskOXBJXzMrLqGUawWmZBMpMwAK
	Ubu7r/VfnwiZBcS76Nw==
X-Received: from edor5.prod.google.com ([2002:aa7:d145:0:b0:64b:5bb8:842d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2548:b0:649:c56f:5847 with SMTP id 4fb4d7f45d1cf-657ff4af29cmr5881311a12.10.1769073702997;
 Thu, 22 Jan 2026 01:21:42 -0800 (PST)
Date: Thu, 22 Jan 2026 09:21:41 +0000
In-Reply-To: <20260122054135.138445-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org>
Message-ID: <aXHsJUUFLwlbOI-9@google.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-10797-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: D4E99648DD
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:41:35AM +0100, Miguel Ojeda wrote:
> The Rust compiler cannot use dependencies built by other versions, e.g.:
> 
>     error[E0514]: found crate `proc_macro2` compiled by an incompatible version of rustc
>      --> rust/quote/ext.rs:5:5
>       |
>     5 | use proc_macro2::{TokenStream, TokenTree};
>       |     ^^^^^^^^^^^
>       |
>       = note: the following crate versions were found:
>               crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 2025-12-08): ./rust/libproc_macro2.rlib
>       = help: please recompile that crate using this compiler (rustc 1.93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)
> 
> Thus trigger a rebuild if the version text changes like we do in other
> top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
> proc macros dependency on `core.o` with the version text")).
> 
> The build errors for now are hard to trigger, since we do not yet use
> the new crates we just introduced (the use cases are coming in the next
> merge window), but they can still be seen if e.g. one manually removes
> one of the targets, so fix it already.
> 
> Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

