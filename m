Return-Path: <linux-kbuild+bounces-12079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBXwDXsFvGmurAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12079-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:17:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831F2CC928
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E06103047585
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 14:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AE9314B6B;
	Thu, 19 Mar 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvmMUncT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D4308F36
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929583; cv=none; b=WROyP3TEpj4xiI7W8KxsVF6lzlK5IRiv2RSxJhYIwYXnmn6+KyGiP/2GFx1TyVC47cfEOkVZZzAiGA+FhuohvzqtgvHS6ABiI5QY0520SnpnDth78C64YgEnOz9dDsiyvHF7/BYVwAjZZQA0rWQAQOVszQc8XYHW5xbg7RSGt44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929583; c=relaxed/simple;
	bh=6oDozfjWuU2JdTVQdIAUYptmEQxfVQtWT3t+6SmU4sI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PovdYbeBtpY4jICFVPajtFicD+3nMWgRkDsluVQeX4eRqhUyX3MPfhUUz/u5E8N4ULB2hMMpY8YVGXJqhH3czIGSYsIPFncPVIW0bScIY8cHQlEwkC26F+wIcR8x7sUiMKyXreUw0zGXw+9NExM7ddIMGI3Xr0MG8oZNuBGalLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvmMUncT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-485350666bfso6372885e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773929576; x=1774534376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBm9v0O34/XbskwEKjnyG6Sux+grgN+yYKoW6CPKPzw=;
        b=XvmMUncTeV3+sgzb/9H80QjW0rVgvU//YBDgFZtGe3hEB7/zOSrokKMu6TfGrVDLgp
         APYE/1OXSbV7L8lyeCFyHyEy+dGV7HonRz6uWfY8CUb4jBLVlG2UFtvQcSUMdQlU0Ufh
         hEDaViC+YosfI/w7IClkgPviR24DnRwdX8efqi44Ob56bU/dfbtndY3Qj+BR9f2SzYQ6
         e32WYuqqgmIBVABnksM2R6s2+/NpJcojrB2Fy8T2DiAWniSnzc3zmkk5Wd6PtiLR68Rx
         vjPRaj7i1jhhFHk6b7dxbCutf1gQPMqL1ZHFo5p2l5dVnzZ/fiY3KaymdjRr1ywrfSRX
         gdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929576; x=1774534376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBm9v0O34/XbskwEKjnyG6Sux+grgN+yYKoW6CPKPzw=;
        b=O8G+zXEJODCxOqOEHjAnoVtYhUaIZitpdUf7TX8SYjxQjQFtscRwe6/ungcDnEf7bx
         uRYAzFOlDHFHDIJhV0UWx0+lxV4azy0k+Rqec4UBXcpMFBlm991O50r7ZKwDl1WdBLkC
         c2d5pMBEtc0z+UBxdP4LF59bN2Ylwrf+NVhTbLc0TXUREWOvpbz3qOlkLOOt0aFaLJTl
         U4LHG/GCRkbV+YJ9FNPJn+2VH/WknIKhTOBp63BEIfQwq/asi9Cnqz4iekikKYI3+URR
         kbPRq1jJFnrwrxwlcNzdGFOBhBBb8mZ6YTHzkqoK+/CTgrJQwpyM/x/rfSnndLoIVnbq
         UQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUaqd6z6FTDbaANey7U1HPjyTUSsSt8mxKLBMbOmwVsaX8lzuSk9SqNjgveHUh0MEO64f5LyGKYoiVIfwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWY7b6GCcUgdjnqCsbNrGavAhIzJ6ZUgfKhEWFqo7JkZ6ojYq
	53muA1aNYatWsJbV9fNNDBTQBenyCnhbCImf1dMT9MgQbTpAmHczE4SMc8RgFvr+k9MWMeSaBqR
	X5Ta9hdxXSFIbe7Fe5w==
X-Received: from wmqn21.prod.google.com ([2002:a05:600c:4f95:b0:480:4be7:3f3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4703:b0:485:ae14:8187 with SMTP id 5b1f17b1804b1-486f441fc66mr125201975e9.2.1773929575614;
 Thu, 19 Mar 2026 07:12:55 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:12:53 +0000
In-Reply-To: <20260319121653.2975748-3-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-3-gary@kernel.org>
Message-ID: <abwEZaOSqnuwQCux@google.com>
Subject: Re: [PATCH v3 2/4] rust: add `const_assert!` macro
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12079-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.047];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3831F2CC928
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:16:46PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the feature
> for old compiler versions that does not have it stably.
> 
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
> 
> Two users that would route via the Rust tree are converted.
> 
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

It may be worth to mention in docs that const_assert! may only be
checked if the function it appears in has a caller. Whereas
static_assert! is always checked no matter what.

Alice

