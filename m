Return-Path: <linux-kbuild+bounces-12280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAc0CtkLxWma5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12280-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 11:35:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329E33373F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 11:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B877326DB21
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F222A3914F9;
	Thu, 26 Mar 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gtxwl7/R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DF836DA06
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519814; cv=none; b=OLFtPuO1yTOI0+nsbmhdMR/uDXOhH7aSrZIZHQCXeEbK6GYoGOrQg0JEsMZ67hFBy2xogUAhuWt4UuqRrzXmiB2pImaOmJKsrKAXBSe4nqT/3gszmjJrhZ+0Gx+ubzqoLY/tXJlcikYgSk3Jk0GrL7LODMTzgk68vUFzlBqEbuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519814; c=relaxed/simple;
	bh=uTL56eo9X2lUBgWDNCn1Tquwax2vc9PBJBXL6+0eRfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oZKUKXjTA+JbYoaez+SNfmD7ejEDGalR85DnSFWUqdkKgVTOmxd/VII33dOhJQsWFIc+WcpOlXK9y2iwptXbXtemJ3BfyVGIi/tkEgjrIucZBxbAqfdjxo7P4DxyofQUzGhtqEctWS4QgvZ8IZSbHrSNfJNNYJa4iXzsBCotMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gtxwl7/R; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439bcec86dfso893144f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774519812; x=1775124612; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBGicU27laianFvyzY656GHLSJPIgkYXNKTwZ0wPpek=;
        b=Gtxwl7/RO9OKVWl14OP7PbEfqvIiZCsYGYPHYoynzBc8T7xnL21pKakUBZYRwPGhVJ
         OGCKjQKOPK6RFHRdnp4kagvoPS4jC+WKZgixIaxiOohpnobHr0NbHQ3VnVBM8B7kRnBE
         RFQq0vXbpSYYIyHqGvwf0q23RkJ25iyoUkTy+SgNLBorzeur1m4xujZHHVq7yA6ycbVJ
         8pXRd4Ic8LXab36dJ1Z+SF9WxLSh33aGbiQFpqDh3kNAJFJpvuBtHoJMI04RAgNaeAsS
         BISdBA/54hEa652ORLSDI6xVVh5/nftXvRH0IFM5w76Gm4V9ZZc0fTgXWlLCJrc7x4hh
         8Shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519812; x=1775124612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lBGicU27laianFvyzY656GHLSJPIgkYXNKTwZ0wPpek=;
        b=s3pJnasAOnz/jt/aQBLuNNiePTUzVjJyVK2jbGQx3VrWQwCcmKAvDzpQK9nqaOxWDY
         WvbwaV+jSB3ttNBF0WU8b3ml8MI+CT+4lzQzUF3gDP8nnjeA4j6ePI5wZbgPKrK6EE5V
         aVNNz88pT7HmUjqw6lU7fS6zBcWcibG/cHOEfGqbko1aIhKTm0CtSahMXZf3whCHwgZj
         KqpEKOREXU1vwrhr/kLcRbXTKBCcO4S21DyZAolSYu0sPwI05itRu27YP4RjbyQRH8Of
         eVycnGv9V4oJqCEJ0ZpytJ1JO7PS3asQJcH5Bq46kFrPScqfxp3B+xAskV1Kkq3Gudv1
         MJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCVPsH/coZHVGh+rVWwDA1U6UZTZ1m8gtRtee1Z0RPjBcDc2KntOyBmxdgPveNxCidkHsbhmdBCmvx6r08Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM9jpnjL6Wco6c6QiLSA9sVeVbNbwCNYlhSGkPmF2Eo3gnggeT
	7AwWN4Jc9RtU7SLWjASsPadUHsoSNy7qqrEpYEPp9DhElaqn8FMeshfRt6gBZqZPRcm0i62IaHZ
	s6v3fWWn8WotKuF4iVA==
X-Received: from wmoo2.prod.google.com ([2002:a05:600d:102:b0:47d:5bef:a379])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:890b:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-48715fd50abmr80350625e9.8.1774519811752;
 Thu, 26 Mar 2026 03:10:11 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:10:10 +0000
In-Reply-To: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
Message-ID: <acUGAsjYvNvTEO92@google.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
From: Alice Ryhl <aliceryhl@google.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net, 
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12280-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[33];
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
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uaccess.rs:url]
X-Rspamd-Queue-Id: 7329E33373F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:03:26AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 01:03:27AM +0100, Miguel Ojeda wrote:
> > On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
> > >
> > >     On the other hand, regardless of whether we fix this (and another
> > >     issue in a separate email found thanks to the UML build), we could
> > >     instead add `depends on` listing explicitly the architectures where
> > >     this is going to be actually tested. That way maintainers can decide
> > >     whether they want to support it when they are ready. Thoughts?
> > 
> > Another one for arm 32-bit:
> > 
> >       LD      .tmp_vmlinux1
> >     ld.lld: error: undefined symbol: __aeabi_read_tp
> >     >>> referenced by uaccess.rs:349 (rust/kernel/uaccess.rs:349)
> >     >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
> >     >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
> >     >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
> >     >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
> >     >>>               drivers/android/binder/rust_binder_main.o:(rust_binder_main::rust_binder_ioctl) in archive vmlinux.a
> >     >>> referenced 36 more times
> 
> Why is Rust generating code for userspace thread accessors for kernel
> space, where userspace threads are meaningless. This is totally wrong.
> The kernel must not reference __aeabi_read_tp().
> 
> Note: I know nothing about Rust, but I know enough to say the above is
> pointing to a fundamental issue in Rust for 32-bit ARM.

I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
target. It should probably not be -linux target to avoid this? Probably
it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
CPU_32v7, so we should not need to consider the other variants.

Alice

