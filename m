Return-Path: <linux-kbuild+bounces-9503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA4C465C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD12F3ABF55
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984A63093CD;
	Mon, 10 Nov 2025 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DddieZtr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4EA302743
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775235; cv=none; b=qO5vHabg1+rWtsptBsExaEbBp+apU6Zi4mDGO0WOiMrAvFy6R/qhX2akxKrRKPfmn6CvvZKnbFELn9tmjyTHnw+hTytfSJLOiLTvS9bS/+4DrXeEPQm+n3llsyRIHpM2P+OX5og8SJ/YKNLA+HjB06nJlxs9aqVrTxRNiG6x18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775235; c=relaxed/simple;
	bh=UHsZ8mNOG8p7kZWeRQbdvDX87iavcoicnA0ph7mCQpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U1sChejIWzk5MgqQrZxt7xMKF4aKYuoDvrW8wmVFkl0XoB1MaTbvkeoHmTboX+vE+iTqO7/s8lfsroay7AqnMUiFKJ6SVV3H2zj6R9IRyn7aYkCdRLT0rKlrXda4LsCu2oGgl63R1LuK8sRVgg04DrY/W7Gt4grtCDCXdBNq/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DddieZtr; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64091bef2ecso2878939a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 03:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762775232; x=1763380032; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wUCZuS6iBZ+Cb2EbxYt/LbW22Q1kNekqfCyN5WYEYrk=;
        b=DddieZtr+YcRU6AGymXQ6+qbjn4EqfaO1LTBmOwgNdwd2GljS7zyb1RqN14kryvqia
         N4CCnwoDamx2Y13a+sxDntiCwG14T10uI1J2PP2gs/++M8u8KmFDWeVPTkhGVJkd7MnX
         /oPPoPxWLKuq2A52BHO8bifmzBZtHc3liXMbi/+mGONJAWn7rZvdMPNGtvI33lz2xU6u
         ysPgqzNiiCIF6TMslrx6yVp6I+MC/7t7lzsZtPs0OPXVU7TcmmQeLvkTdztdQx04qOp3
         vFq+6Tapi87i1kL1hJdKBMxmoC7UO9aI5evD46DVTYrG6830K8SRDB/frUImVwp3+4NW
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775232; x=1763380032;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUCZuS6iBZ+Cb2EbxYt/LbW22Q1kNekqfCyN5WYEYrk=;
        b=tfBIUOXs0QZqh9tzS73Fz25X7fPUtavlwGolApTFUPC7YQM81ybCr/s4rylKo4yg6O
         K2ICd1H4lwmbwkWKsaMSwM+eO9SyECDPYcRWMmheyvn/BKKIkZoDvmHwoiFAFutu1kux
         8PxLFl23KmvBf5+XTGSyB/AJcjmH5hjmpBu0y4q6y1i5gIQ1fAH/hGhymLAVKY1CV5yo
         kCpPyMiCHVuHlArPisnp9EK8UR7ck6h8dgKY9pBNJap1ajgQ+uMFwdB3WOL4byJGwNyk
         bvRyKAactNp/T5s9NSJlgNyG9af9o1Caa56zU0+u+kzAZZbnbwMznyji7GbDThkwBmZ0
         HaWg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Nx5QL91XFA6azXZKAxsHMTX89A3mkP7Po7BRAm0ahagrvRgw/hH18frncUs6KKxH8dp5SNbblz7fNF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2u9HuzHTMbydubXLXrc8QjIErqjzugPF57vtVmmKSZlRWdUP
	qvW9NFBzzAO4doUngzwUU/X+Olj6PquK9GpV8y+4ue7lILxD5vLXxJBiyNroUjEYwwzoWjWVXv5
	ARb3wFoR0jJUViE+8XQ==
X-Google-Smtp-Source: AGHT+IHn/ARWRXnaz/QbEvpiXa66T27fjTbhbGtpITormFJQJJtBcOuO5FmSZ0Htawn8t+iKKDuDiXxfGYOF77I=
X-Received: from edbin4.prod.google.com ([2002:a05:6402:2084:b0:641:8e3a:1196])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2106:b0:640:ef03:82c9 with SMTP id 4fb4d7f45d1cf-6415dc11781mr6885792a12.11.1762775232291;
 Mon, 10 Nov 2025 03:47:12 -0800 (PST)
Date: Mon, 10 Nov 2025 11:47:11 +0000
In-Reply-To: <20251110095025.1475896-17-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-17-ojeda@kernel.org>
Message-ID: <aRHQv14husHrYpl_@google.com>
Subject: Re: [PATCH 16/18] rust: syn: remove `unicode-ident` dependency
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:21AM +0100, Miguel Ojeda wrote:
> The `syn` crate depends on the `unicode-ident` crate to determine whether
> characters have the XID_Start or XID_Continue properties according to
> Unicode Standard Annex #31.
> 
> However, we only need ASCII identifiers in the kernel, thus we can
> simplify the check and remove completely that dependency.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

