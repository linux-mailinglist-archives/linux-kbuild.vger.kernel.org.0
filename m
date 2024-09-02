Return-Path: <linux-kbuild+bounces-3329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972C968CE6
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 19:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BFC92850CD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 17:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93211C62A4;
	Mon,  2 Sep 2024 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYMMXsH6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86F1A263D;
	Mon,  2 Sep 2024 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725298831; cv=none; b=jAaTvjIwkznVfDiYhrJdutSEfwBWx2o7AJ+tRQKDR/uE9s6u9n06MuK/n8phZFmAWTqX8gqLhb9ELnomd5WtwPuMORRdK/ca9pn0LzZSRAiuGUpY4oGdR7gZDj0gT22KNXlRhnK++bM1PV2kvmTnmZoBIydSYyMB/6urLqtYGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725298831; c=relaxed/simple;
	bh=qP1BNYF9CvG8P4XyqvF82TLJHMnRmeyjZtDrqbypFNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gL/0ivHw9M/HtZpblT6EigFYpJg0b2De/wpPff8M/a6Ra/823pNIL+ADh0FwEecAOc5626NgYIIW3Eb1YFgcqxGQ3fBfv9cZHA5bzq395EeO1XsFuEllnbQSqM/+QcQ6OOE5q3mBkFT5VCNs6HEasy2LJaxokj6qDBKhXWMsVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYMMXsH6; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7c3d8105646so244247a12.2;
        Mon, 02 Sep 2024 10:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725298830; x=1725903630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP1BNYF9CvG8P4XyqvF82TLJHMnRmeyjZtDrqbypFNI=;
        b=gYMMXsH6mc9yGXaVF/G3yTqWsosoHwVvD6u2LK53/fJG1cYO6DgzcNpGw1NFZuuHpi
         VPRwvIOJpq+3dBzN+xvgdJ7tFyFpaxC/p1XUeM2bt3WbI6KRJmL2vKTXFjRwkIdXr17x
         /T4S+hNn1GPv9cXOb8JAbzBpP22/gBjtclPrWbWbQNB/UGLgWpxAyZ3bO3jlUZrXnXiR
         RcuqGaUcjMcPdTxBLpvAoUumxYuMCeLJp6NUWF3+CwHllBTFBw/MWY0oFgMfYXzbuZ8t
         PVwAuDiHhVjLMB8tfdnvpx3AU7eyvp/rpTVzaDJNgkOxMFTtP99IKEty3VqV9yqMrfCI
         SW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725298830; x=1725903630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP1BNYF9CvG8P4XyqvF82TLJHMnRmeyjZtDrqbypFNI=;
        b=TRQc9MPNb2auVTj0R5653EnWvuy33qG98k3reKLNdTdLfqvZlZpt3UmvibtcOcxSTZ
         duQj9YSpjxIekwwJQ6np3c3TUszPHWToYxx5llFD6DtA1dpjDm/8IffS0Yu58hEoG6NO
         W9QYyn3EgmPcCbwRZS2njioW3ViDEeZ8Xk1iKqf72vdJsEWrHPIcuYQxIjBrPqzYMN1C
         pNN9dqrB8wawCE28Zub2GKn/rTWjhngzWS/AUK0YJG6eusptVk4jQiMdE5oaoY0i3/ep
         sm/6z5M6sh6nDLnwdj5vLPNwhvgyhEO/n7eimAoPDXYp/dowgxK3NSksFVc0pstt2uok
         zxIg==
X-Forwarded-Encrypted: i=1; AJvYcCUsau0s29XGTJqk+gKmJROp6v3D3mSwHWW9FuyflEV+wDavM7bggDTzr+ItSINPTs4MBylj3eBzQKcl22o=@vger.kernel.org, AJvYcCX++yUlpfo5tKYmZ7Jl3uz+XBciShT7qdb5WBEX+D11ivlHiwHIl+daQxPA9WdY7yZ44XmHPkSkrWBNbglVvYY=@vger.kernel.org, AJvYcCXjb2prDkZHlaH3dv3t9vdbPbMkgarNYB5xuKTBeY+x/tSyE/rpDHtVQLdrebrxM0TKeP0U99OAPhzFWJ38@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfdH/2kjf+MswMZD2ihboRvNeyYTIDySyF/PUtcTPeoi3XQQ1
	czVDXqSUBNbJIzOOyyel/BlsHmNH8Qs8Hq5GHRFdXVtuG3xyewmpqkYPakrVCaNFek4CKL9O+4i
	q+QMYTFvjx80bTY8RT4SF41fxDVs=
X-Google-Smtp-Source: AGHT+IEHmqyO7GwRfTbpbFxNAgQ9K9y6/sEieLEBCsDTgql9k346ENF2eMrSw94HNq1V76QYQC+WBYGkoNzAHSYD8YE=
X-Received: by 2002:a17:90b:33c6:b0:2d3:cab7:f1dd with SMTP id
 98e67ed59e1d1-2d86b741b9bmr6540512a91.1.1725298829667; Mon, 02 Sep 2024
 10:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
In-Reply-To: <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Sep 2024 19:40:16 +0200
Message-ID: <CANiq72kUBPnua1Pob++-6SJ8MeGxQMfrePY9SQVd0DZp5VU-2A@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and
 reconfig/rebuild support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 9:29=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I tested this together with Rust Binder. I also ran this patchset
> through Android's CI setup to verify that it works in builds with
> CONFIG_RUST disabled. It passes both with and without a Rust compiler
> available to the build system.
>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
>
> I'm happy to rerun these tests for new versions.

Thanks a lot Alice, that is very useful.

I sent v2, in case you have time to give it another go.

Cheers,
Miguel

