Return-Path: <linux-kbuild+bounces-1896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3778C9A95
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383E9281CB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B492D05D;
	Mon, 20 May 2024 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HuR4+yd4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CE24B29
	for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198230; cv=none; b=kbUXiVNrj0SmAA5Ucx4E896IAmk0xM8rZyE1PLCB+FirvmEabVcLa9mAjKkynb6WFGhkf7DPJZz5mGqotCF8zSjZv+LvKH073SfyOV8fH5Glhe046O5L0TYTXD0pfkDwIprHwCI2ocgSPjdtFGXIaIdgnb5wiuc+acBfFmFwN1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198230; c=relaxed/simple;
	bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU1OcbHuRMPa4S2dUELZWvMHI3lLKy5gs+/93cpSBZZHdlx4VZGQjBszlH4SPYF+5OkB1eK5SfDA6pDNNNkt1XW0/QyrCgk3ph8ELslPqM1aSLT2sCfPOYVTDXQkWj6r4ICS0JR3wVuOULrsI09J23k28Hqm7Fq/BnUgUoGvOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HuR4+yd4; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-47eef876f2aso394136137.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198228; x=1716803028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
        b=HuR4+yd4bBFdmIw7+KiY6lpKaybGYB5sQEPhn67YoQqDttqetTNs2IeZ20Mn7HMdlD
         LuSL9z3vKil3RSvddsXdcP6Nv/8J5XmOwcX5HR7AF0e/uS62k7FXIO1d7lsNOkV8HB9b
         haDtkzZ0ugSJGtObX4MU2q36slY4QzToBu3tg/b8RW6Zl0ax19UMPYicvgeOGtK813Ao
         FDVUZ/RpSwSXEZ4EtQLuTdH0AxZ0QjIxQTRAr1dQv9je0/KpEaxyTSbKgeRNPw6BNF4J
         HulLxBsekHaiXbSq52B0c+5qMQEh9lJErDIVWhv9s3MxZJ65rTGNjGgX/rkoDjXXSaK4
         XqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198228; x=1716803028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
        b=JkglbfvM/AEM+m+BaTQUlEHFFB79qG3UUDFp6sGcfqFgNhInEaWAwqzQYrkHkemdhK
         zP+gD6IeR7rf0yLe0itES6uTdpfkceYl8qqOtdpNYxwEtmlFfglcpjqx++y4OyDEQ/hS
         1ehFghQJV5+R2lgntYm/oX3VDPudUcX2YmN5klCBVqVZ4kD8zP8etozE2YYmrQYp+M+1
         RnKvjyo/c5OL/PiXyAaxctYp3QHDrZGWqpA42nF0NoYs0ZE+CSCnC9JouxQCJOdwPTkT
         cVvVzbBmBYyMMaRiKPzeWykt8EcsdnqMqZ30K60V7YJ8iQ9k/rPSU9FoUXKE3dMKKns6
         GUKg==
X-Forwarded-Encrypted: i=1; AJvYcCUmOc1YAOr5SwOKWomWD7TIbQbnuxcIB9aj+Wz5g+Ez3mS2S4dFJ7IaVAsmdTwWXBnaDXuJFjzxuj52dhWqMHEKVlSXJtsCouGIVvVL
X-Gm-Message-State: AOJu0YzkuwS1XstQLIGX5iR7NLJz/T/2PRJ3RCKTluzYjIGdb9J5SDHU
	xx5/FfyhPVUVOvzkhvqPdyzQDTyu9KJqUzEh9+KRu/CGtLoYUZXtxEfhefiJl4fYdxFZuVxR9zH
	mNbkUCebdvUWrkuedgzstMfHZPYTDFK5xvuRp
X-Google-Smtp-Source: AGHT+IEYsiVQ/f6j1ZyTO7lXzbXIXBXS17hKFjw1cVaQYNkhH1gui4IfXyiE6NxbpusBzsiFYL/Tf3yT2rLfKLe14bM=
X-Received: by 2002:a05:6102:148e:b0:486:11ff:65aa with SMTP id
 ada2fe7eead31-48611ff67bdmr12548622137.2.1716198227732; Mon, 20 May 2024
 02:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:43:36 +0200
Message-ID: <CAH5fLgg=dGmuY43B52gvgJ3S3qphcYYVB3SycuzZHNB6Rcpb-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 11:12=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Make all Rust code (i.e. not just kernel code) respect `CONFIG_WERROR`,
> so that we keep everything warning clean.
>
> In particular, this affects targets in `rust/` (`RUSTDOC H`, `RUSTC TL`,
> `RUSTDOC T`, `RUSTC T` and `RUSTC P`), plus host programs and any others
> we may add later.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

