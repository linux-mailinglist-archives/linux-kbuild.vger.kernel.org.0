Return-Path: <linux-kbuild+bounces-3901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417998F933
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 23:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39FF1F219C9
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 21:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF941A0BCC;
	Thu,  3 Oct 2024 21:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN3Mz37u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8BC6F06A;
	Thu,  3 Oct 2024 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992196; cv=none; b=YWNee4g2CCBzFL+WFALedLijCLr/bm0402KP9qlX9rp9Pcqz8hSVlSYibbgSS40uzuCZ6ydZ5KauXLzugdgBV1lKi6IAiZFrh9N8ui6f86pkZm1rOGehARQFUwaPU3dnY8Q3z9IykfUHyftCVaYiQcyMjx4CwBQMudbpA9PvCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992196; c=relaxed/simple;
	bh=YWSWyBMvb2BqcQtPmYtbpV7rQQkcRKcqy5ijg1PX33o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWcB7icUp4iFBktVIInQgy1bpSUqxXg2YOF+VbrgXyjNfmpPN2CvVV+SomxnmzBqQs6vCaVHqs9uLa+ACAjAHg8MKlYz4ivcdG8Olt2VseJ0IATobnhprGuL1k4nIC5YMkqnC9ss/4XnAMdW1X8q88tME6d61mlhz08D59jPoYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN3Mz37u; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e9b2d75d92so205407a12.0;
        Thu, 03 Oct 2024 14:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992195; x=1728596995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWSWyBMvb2BqcQtPmYtbpV7rQQkcRKcqy5ijg1PX33o=;
        b=jN3Mz37u2wOqm7KvXRdlnPkFLF7nsRhcfqTdxCyo5nNbP8m66VGPkRhFhjyz8f/H2S
         dHpqP3j9MbmDdzYTJHPHgYgIg0X3OBcr80Fh4kElnLM0EmEUpnENL6oCAFGgdIdRrpHh
         fvSRHnAtoyifDHyYaTOuCyQyikU90IA5GKG8qiM37mTIoamhPIgxj3RnvI5DHu1+10IS
         7KLkO1wDEi6Gfed/mMtKU9V1jW4I3ng/rR1+vAJerevII2dzUcxRTWCTmjIyXVrEdVCT
         +7OvT574y+d5l2Q5+k86cScw6LLLQVSui9hjKw7sawi1DUvyuDPxoUHcD7pHBQBoirZA
         wXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992195; x=1728596995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWSWyBMvb2BqcQtPmYtbpV7rQQkcRKcqy5ijg1PX33o=;
        b=XPFBxQgMIhLNF+Vnrx08p/7Ctlf/roBfbYjQJxdrWqJExxlYNqlM6CKBgfAbQLKtdN
         GuS7ukCXR6IFxcIGkVPnmkcXrn0eTxJ0gU2ZILZDZY7VjP3Y97ErJNp/m/zObyJf1qUm
         /+9j62B7PBlfhAgO3dBpiwtvGm5owtVNjWcLzFoexFTBiIVgSy0a0pILDLKZtB2mlwYr
         dqr6e0nEgBhAiqFPSw8E9GLWRmQBWh6IO3C1gHcf3cZNAqeoE0tieFsxTfC7Q7/95TQn
         E9B0l8Kg9Vn+AL58EHD9TAgympD7yXjNzDgZl6m1GJUmF2Ej9VPLVSn3cekWJdM56Rf7
         HiIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+hDBOEPjOP8hHWm76rkn/QqJYQ04dP72vBV+g/AmgH6cuA/Z+6qOtJLsfqxLPOnFxq7kyztwa16kZAgtnOxA=@vger.kernel.org, AJvYcCU+t2Gxt4DvG3KMPzkiUG+Oj13noKkKfMLzdguFjKP4QwzC2tNJTQJDVS9uF657yDpluUM44YDv0XmghLrf@vger.kernel.org, AJvYcCVKMzRP5lgM17iKMKIbcyh5MfqOHttQGy+pGg97Ur+psNodG2c+/V7xY1Jkku+rpsElRFuytV5lwZll7E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ5CiSvT+qM3BB9JIARWIXmOEYzeuBJ3TKT+1mryDn68cDYByp
	2ClYLVIuq/BRZuKPAcIeU2UN4wcA8SHOvOkTaW+5yCumHOGoTqi/eyqGhBqzJYVKWd32PPz4O1p
	TQvAOBIVSFcbWRgCeYx6q+zAS9V8=
X-Google-Smtp-Source: AGHT+IGyVrKTLv/6R4p9C4+lzDTKS+g4BKYcB6NEFd08fKt94IaBLorNVuAB40syGlRO/PPbVfEnCv0roeJaI2nbnEc=
X-Received: by 2002:a05:6a00:3a28:b0:71b:64c:813f with SMTP id
 d2e1a72fcca58-71de2479d53mr321221b3a.6.1727992194577; Thu, 03 Oct 2024
 14:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915132734.1653004-1-gary@garyguo.net>
In-Reply-To: <20240915132734.1653004-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Oct 2024 23:49:41 +0200
Message-ID: <CANiq72kkN2T4NeesDwsrVkk=JcDA-8iPHFys2Cg9M7MobzTEoA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: enable arbitrary_self_types and remove `Receiver`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Danilo Krummrich <dakr@redhat.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alex Mantel <alexmantel93@mailbox.org>, 
	Adrian Taylor <ade@hohum.me.uk>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 3:29=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The term "receiver" means that a type can be used as the type of `self`,
> and thus enables method call syntax `foo.bar()` instead of
> `Foo::bar(foo)`. Stable Rust as of today (1.81) enables a limited
> selection of types (primitives and types in std, e.g. `Box` and `Arc`)
> to be used as receivers, while custom types cannot.
>
> We want the kernel `Arc` type to have the same functionality as the Rust
> std `Arc`, so we use the `Receiver` trait (gated behind `receiver_trait`
> unstable feature) to gain the functionality.
>
> The `arbitrary_self_types` RFC [1] (tracking issue [2]) is accepted and
> it will allow all types that implement a new `Receiver` trait (different
> from today's unstable trait) to be used as receivers. This trait will be
> automatically implemented for all `Deref` types, which include our `Arc`
> type, so we no longer have to opt-in to be used as receiver. To prepare
> us for the change, remove the `Receiver` implementation and the
> associated feature. To still allow `Arc` and others to be used as method
> receivers, turn on `arbitrary_self_types` feature instead.
>
> This feature gate is introduced in 1.23.0. It used to enable both
> `Deref` types and raw pointer types to be used as receivers, but the
> latter is now split into a different feature gate in Rust 1.83 nightly.
> We do not need receivers on raw pointers so this change would not affect
> us and usage of `arbitrary_self_types` feature would work for all Rust
> versions that we support (>=3D1.78).
>
> Cc: Adrian Taylor <ade@hohum.me.uk>
> Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
> Link: https://github.com/rust-lang/rust/issues/44874 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel

