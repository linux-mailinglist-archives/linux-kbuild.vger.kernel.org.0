Return-Path: <linux-kbuild+bounces-12081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFsLFs0KvGkArgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12081-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:40:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E92CD010
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B298305D288
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 14:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55B93A5E92;
	Thu, 19 Mar 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZPCClfJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328D3D4109
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930882; cv=none; b=up++fkPdUXrNTTNI0g/eA0dE7T9vhsg3n3eA4KHaCanXS4sVfN54vmAz9PQzqEKgf+BwnUzidr9WuXxy+3KSe6NAktF7f3TH0lE5+NyR2PC63R3ZyNfRug4UeIwF2MIw29D0bid4mD8tlTCt5W4qX4lvIwJMKYC17ZB3oLO8ux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930882; c=relaxed/simple;
	bh=WyMtJOHNgptF+RUudbAi9e6jN+p610GxNdbm0q5d+PU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cGixnn9y3zRZmxWKQATBcoO2d36W00fORNgCLV0ozazqjpWQxIAHuOk1r48/cgm+g2/V/43Yd6/zUWofJjNTA4dBTAmw/+k2B4x4kfq8UH0xZ1EeVhNXQ3JVoA6ptxtwaAejeXNd4gw2niwbiU+GoZ+pL4N9zihnIU3jVpClmRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZPCClfJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439cbfcfc21so673511f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773930879; x=1774535679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPovHfZvdIEmxMLcWggNVk241OlOV9iUo7irlye/sV8=;
        b=NZPCClfJ4MNq50SDaVKf9fLB9I6F6xzcuIqwy2Dp7IlznXJlGImq5q5gfWq4PNXGCX
         nzhmuEAjWgOypaq1cohLrJcw1G2cEq1nDOFCUgEbhtTXySQwRxOJqctmFumZIxDlkMQP
         271zSh7oqP/nUj/R7ZDyi2ae0c7mPbV37c4EvtnkUJk3/WeVAhLsgtqVIihL3KlZ2GI/
         kML3whRLqYuTYVQPTQzxKupu/kgUd57dA1K/hmyA1zNLTPc7nHiBIeQKfH/WDO5C8/P1
         T9Yy6v57keJOs7C2QVLzf8MYsYBnLwsaYywvrsplc7/xb/nc5Wv3OM5MLvugOyZ45YZS
         vNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930879; x=1774535679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPovHfZvdIEmxMLcWggNVk241OlOV9iUo7irlye/sV8=;
        b=VLJS2QKIf/dU/HX0hRSCSAhUop0NYUOZYX0GUpw1EuV57bH6c9Su22u3oPVsIRhZRf
         FEaqrdXKduH3MpPHlDwhJlxEGb8cD+z686Ks3+83Y9JG3Mp8JFpogJbwUkbqwVoi8Y3A
         rAGtD6oYKS40zLai+/BaMmKoMhoiC82KvjzJW1sidSsX6LDni2VgZzDxeqv5QfKvVzAQ
         DnR5eoDaZfcz6UwCpVYRmOVkeaIlseMpXGJ6+OAmH6RvgQWcSpHuyKEjKdpV3n0yXmXD
         vYkf0WXSdrdfpWw5hgHjSVb+aAVyDM7YIIO6HUwpUr0WrSnYMBsQosiVC2/EbiUyH/op
         9JtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmnK4kfWbj6wUyuQGrEJv6xFiagJvh2PMxoj0uSUqShXe5F3skXZkw2uvLmkzpe7QVdFcp/EP/bNAwpGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMTCC44yj0CT1C98yFaZ0OACR8pqBibXX9m670rGakwT/3BaF
	khMUQCLYr4FNdJaBY2NAhr47/TVraZxBUjxm7ieMoL4uOJcyTIOO6blsVcPay0Opi9zHau4czSL
	9VsIh9naoPlEbTzno2Q==
X-Received: from wmbeq13.prod.google.com ([2002:a05:600c:848d:b0:477:a181:1922])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198f:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-486f4472ee8mr129992255e9.23.1773930879123;
 Thu, 19 Mar 2026 07:34:39 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:34:38 +0000
In-Reply-To: <DH6TTZXH3JKU.1URETSC28K6TZ@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-3-gary@kernel.org>
 <abwEZaOSqnuwQCux@google.com> <DH6TTZXH3JKU.1URETSC28K6TZ@garyguo.net>
Message-ID: <abwJfsEHd10hqAOb@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12081-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_SPAM(0.00)[0.113];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email,nvidia.com:email]
X-Rspamd-Queue-Id: C38E92CD010
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:26:06PM +0000, Gary Guo wrote:
> On Thu Mar 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> > On Thu, Mar 19, 2026 at 12:16:46PM +0000, Gary Guo wrote:
> >> From: Gary Guo <gary@garyguo.net>
> >> 
> >> The macro is a more powerful version of `static_assert!` for use inside
> >> function contexts. This is powered by inline consts, so enable the feature
> >> for old compiler versions that does not have it stably.
> >> 
> >> While it is possible already to write `const { assert!(...) }`, this
> >> provides a short hand that is more uniform with other assertions. It also
> >> formats nicer with rustfmt where it will not be formatted into multiple
> >> lines.
> >> 
> >> Two users that would route via the Rust tree are converted.
> >> 
> >> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > It may be worth to mention in docs that const_assert! may only be
> > checked if the function it appears in has a caller. Whereas
> > static_assert! is always checked no matter what.
> >
> > Alice
> 
> I explained this in patch 3 on why `static_assert!` is preferred over
> `const_assert!`. Given that we recommend `const_assert!` only when it refers to
> generics, the check is inherently tied to a specific instance anyway, so I don't
> think it needs to be mentioned in the item doc.

Ok.

