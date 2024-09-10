Return-Path: <linux-kbuild+bounces-3498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C579973729
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 14:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16DAEB22B8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 12:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F87B190692;
	Tue, 10 Sep 2024 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dS7ly2C6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A0418DF72
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971142; cv=none; b=pVWmpOPY1aZfMMg5Gf8rVyhTFqO5Oh/TZe4pKU6bvthXfPlkENw86v8gNVIeW8xg8LmAuhgfaSLmCtUAw8GFDQgoc/qCpI8pMmbYUd37g+llJK0V6iHkfYpHv1H8IsaYDz/nsLTFc79xvJ3mQAjf/zkg7+MKYjk7ay40G69bi3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971142; c=relaxed/simple;
	bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Imt1VsbMOamTh9O64KbiclbNM8MncI/+OadfKec0U1riyERsp9xE7saBau0uPwHZgGZv/oPEWmSAYa1yyICv04RvqN42C17z49k9BUbVGAexxrh1uBz91WPPyHuisKPtAgNnXBhB9kquEKCorkoktwyETExSz1qexs5X5sdsrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dS7ly2C6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-718e6299191so1637843b3a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725971140; x=1726575940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
        b=dS7ly2C6mW18MR5WDRCx7yZhYZHTRQpb5ukBmzdGqmGg/GRPRPYmVtToRwFihTOmED
         uYgCSXcxn8Ui786eouO6Y0+k5aPODcOw4fbbNTa+pzvYYqcfawbvnx9S7aSde9L5ID9P
         MwREmd5z674KI6Dagj5R5I6REfn7/CoIGmLAhU8hj8xe7cZhD5DI3NVZd12LmJkXskaD
         cI+oUtAQMxVvzSzvu0Rk+Yap2/jcMhB+Qk7Qi5Da8Ef3vEa8tkvZry837SzTFPmg+ojZ
         bpMqa6CNE55sAalo6fgjtODfcYfDKlOQeOjQCX6Qfkae5UQ9TUz4sitfegq3aKFeZcte
         WGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971140; x=1726575940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23lw6QTHAeuSEH0lv039QLg2af/dNYhHa9NZAKrZRhQ=;
        b=mpa1TLs9UgXobMvVkIC1xzEt06n9Rx6JqqLI5t/XyzwepjlOf1QidC82CQGL4ULMWw
         zJqpccKSRwdbKJ8XIQsKr7hVZj5h6l7mm8EjfUECQFSKGMJnm7KvPtSgq+u43VSpbDT9
         U+9eLnhX4j59wdgYplReZQQb6Z2urfpNpLeG6jWZu2emBkbo74DVS+XeOeml4jSQOP4z
         SaIQNeCgEKPv4w3P9md+/JmFYxKSYt7hDl+1ZS8HQELwPp2Qd8SFDdLWm3/6BwePsvRU
         s276z9iSdvMfB5M9yYwnpPwyHLqU0+dqj+tMt7MFm9wQtjtCTkKuNECAVBTtrxqDAbJs
         A9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVpLZ7RUk+MZbWgB23u9lWSCw693yv/ae6/M7md55XtXsFDONeChUfMxl0Pmi8fyOlt4BmA19fyU/wqVGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fyO4M1nNVcnIOdqgbJeRxL3a4XUIYJXoIUoDvGJEExJ6EsZv
	UhaugH6XLeSa+rgiu1/kE04VVHcygumj4KFhFpCSdCxFhLNtbhdJdsJ2ucsyGDk+UWdY9/0BCPp
	0roMcj0lNGWbTR+kt7He8iqcKnUu/SL7/g+Tb
X-Google-Smtp-Source: AGHT+IEckPhplcOK29+1e83SplE/Ewu9iwiWEbZuc4gFX7LKUtgrRhin1IuO3tBqq9kPB5iAdlcQnaK9T7JP3IeQkrU=
X-Received: by 2002:a05:6a00:94a2:b0:714:1e36:3bcb with SMTP id
 d2e1a72fcca58-718d5e0f288mr13790061b3a.9.1725971140013; Tue, 10 Sep 2024
 05:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910120721.107877-1-gary@garyguo.net>
In-Reply-To: <20240910120721.107877-1-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Sep 2024 14:25:26 +0200
Message-ID: <CAH5fLgjwwnqO1p6GaUgKO+XaMiUtae_f_dO=ZX8CetUGxW0caw@mail.gmail.com>
Subject: Re: [PATCH] rust: enable arbitrary_self_types and remove `Receiver`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Danilo Krummrich <dakr@redhat.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Alex Mantel <alexmantel93@mailbox.org>, Adrian Taylor <ade@hohum.me.uk>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 2:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The `arbitrary_self_types` RFC [1] is accepted and the feature is being
> worked on [2]. As part of the RFC, a new `Receiver` trait is to be added,
> and it will be automatically implemented for all types that have `Deref`
> implementation. This is different from the existing `Receiver` trait
> that we use, which is a custom implementation that opts-in a type into
> being used as receiver.
>
> To prepare us for the change, remove the `Receiver` implementation and
> the associated feature. To still allow `Arc` and others to be used as
> method receivers, turn on `arbitrary_self_types` feature instead.
>
> Cc: Adrian Taylor <ade@hohum.me.uk>
> Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
> Link: https://github.com/rust-lang/rust/issues/44874 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Please update the commit message to explain the compatibility
situation with various rustc releases.

Alice

