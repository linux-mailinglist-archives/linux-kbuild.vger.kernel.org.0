Return-Path: <linux-kbuild+bounces-13024-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG7mMFnd+WkwEwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13024-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 14:06:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD14CD342
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9840830053E5
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 12:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41BA40B6C9;
	Tue,  5 May 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGoqc6z8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618133D4F8
	for <linux-kbuild@vger.kernel.org>; Tue,  5 May 2026 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982533; cv=none; b=JN7lhsymebyMHnATMeW3fv7JP4Upmo0/vFv7ZQrduvV2GXaYI5IgJmbFofVSGrSVcd7kSxxi9B5fjj/4Lb4QO4PRIWYf9zuHc1Gw4YafG/b+4LRGiiNEf6oUmiZ0reDuorcH6b7VQKBNDTsmC2Gp3a9F8s6m9MTcSYEEguS0OaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982533; c=relaxed/simple;
	bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H8iFjNDoEotQFOuYkv+lQEoEA/JzmgET42vZFM/nkGmIjoTj5fI5QWn5cUZZmTH7ecld0ATJSrDmZ7CE4k/cOBnJyXsEmauQb7Kmfhl1+iAhaPhprtJbPkR5Xa4f6hs6HF5LfCWNciXgmBEqG2CZuIvd64HTScX4lQSsz6WscaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGoqc6z8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488c2cc0cbaso46234055e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 May 2026 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777982531; x=1778587331; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
        b=HGoqc6z8XMuLbAiD1qw00ryVYRXD3Vry2H9wT95+81a1Jen9dG6UQ5IwWX7WuxvEDe
         E2tr8Ci7uIF8NnMQ7bD7oZDvm1J8hTq+9TJfMjFp2tHx2o1tn2Wj7Vq/mIon/ape0eIw
         Sv36XNdKQaXMnB9u6uW02EXayCNH1OqGrtCYmPUkWHX0JFtbyHfLrmvak0W9HMdg2hpA
         dZNvLwJ3mlSQwisnc9oKJmwVjPLLx2SPL6tXsZ6pqsXKqM54BUD6QxDJsjxRRgktw6ae
         Kux148icuc3BPMSWOkUSnKnM0VIFkiOwIKPpDcMQhpafJ+BqcGo60OTwmuN1RF8tEfJD
         tSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982531; x=1778587331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
        b=SOD/PqF4efxw4IeCsTOAfbFGKtVVtuY/dZffUhMA48zyXI1cDtT0Q9Qjm3isOG+rWJ
         o2JjrIm202WNPXf+7F61vitgBfYSOnOPO3AKH3pTpt/nD2GIShTReddpasT0z3yJOXiv
         OecTH7J6FViB6f7PnEVnpzOGpoWLU2mpcccdm4TxzGvDSHpmjEbqxuZqt0HfPL+DSYR7
         /FmJgyqMKCwc5JBnxK7vtQsw+4IYBaJYGSP+FYkp29USqOYj8LlSl9VrOgzHThIVA95z
         yrckS/fYAHaejbBSmyWDhx6y+ikWfelK0wtNEs6zt1PkUrADf1VYrq1eQ441NCBYI7ZE
         wh5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6TdYKxHZP9rvGAtlYHcXkEtYSE0EgbLW+868mOSvHANZGDjD4B12zxf7ToZzA96q6YtQlWVEf3xGmssA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0LxoKFO64DwgxI15gS3drFbgHNzR4CcZb09Vk/eJk+OoQmKD
	JW90r3l8sDBp0ArSD3JuvKq9tBbSSVzAlVCmk4tJttulhBqKksYKHe+tueb7QYBQKJeDzaG6UZR
	kIIZoRArT0sar3owWOw==
X-Received: from wmkz26.prod.google.com ([2002:a7b:c7da:0:b0:487:37f2:47bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8903:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48a98894fe0mr157507635e9.13.1777982530471;
 Tue, 05 May 2026 05:02:10 -0700 (PDT)
Date: Tue, 5 May 2026 12:02:09 +0000
In-Reply-To: <20260504-rustc-option-cross-v1-1-09f2726b680f@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504-rustc-option-cross-v1-1-09f2726b680f@google.com>
Message-ID: <afncQeU7-W-7T1sZ@google.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix rustc-option when cross-compiling
From: Alice Ryhl <aliceryhl@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 2DDD14CD342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13024-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 12:57:37PM +0000, Alice Ryhl wrote:
> The above scenario actually also fails without -Zfixed-x18 since the
> SW_TAGS sanitizer itself is aarch64-specific. But it's a problem with
> normal KASAN too because of -Zfixed-x18.

Correction: No, this is not actually the case. Despite being
aarch64-specific, the SW_TAGS option does work correctly here.

When rustc-option is invoked by Makefile.kasan, the
-Zsanitizer=kernel-hwaddress flag is present only in RUSTFLAGS_KASAN and
not in KBUILD_RUSTFLAGS, so it does not get included in the RUSTC
invocation. Therefore, even though KASAN_SW_TAGS is aarch64-specific, it
will correctly check the -Cllvm-args flags.

I got this wrong because when checking it because I disabled -Zfixed-x18
but not CONFIG_ARM64_BTI_KERNEL, which adds -Zbranch-protection. This
option causes the same problem.

Alice

