Return-Path: <linux-kbuild+bounces-2253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE2917B2D
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 10:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F68287580
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 08:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC9C1662F2;
	Wed, 26 Jun 2024 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuANMXAP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23C1662E8;
	Wed, 26 Jun 2024 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391358; cv=none; b=LsuEyPFIjwrRpzG46cMyUMZG6iHaM1hDss9W7Lzy74HuPy+WLz+yrrlArLu5RTZUi3w0MNJWyobw6vCJgqX0DruOJwwOlW1uWV4X0RNFhlIUMEzLXFyOeXM7hg696xT08BS0raMLlMkjbaA2p/gyOWeKpaoPDIW2CyfgnhflgH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391358; c=relaxed/simple;
	bh=NIJDJMmeeX4kQrmpyk63xP+IDzdCUnO9xCVu0XWuAFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAkhIMWJIzps/sLVfhRpOD9DRfBV48YTz69lYMo+b7qoU6BCgYxYckQvpaOk00IRQE6+x90wJi/v7wRsgctAinGuFNV/diKSaqJIUcI1qljC3gdqnMo+QHAeatOkYUPJXJx6FP12VcTzvJMM6OLV5Lmj+/xbOHdz91u7f7Yka4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuANMXAP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c8911c84daso2060942a91.3;
        Wed, 26 Jun 2024 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719391356; x=1719996156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1oK8NcMDzD3lUAFEI9IAJSbWCdUq0p3gSwC8g+BGLE=;
        b=kuANMXAPbUl5meWGzEtCJNxmbIpAgOrM9hmOHd9zuA2I52jC0wvXIlv3fdcHaV9Gks
         VySzI/HaURIKVcBKKi5ddSn6ZNnEfXCqxQkVF6QwKov4rBEoNfnmHN+dmdSs68RpjDm+
         lSnWE4TldJAf6zsvz/EgpIIhQ418J8e6V+ik8AFcBH8Y0pH0fuF7wtDgzu+YeaME5dhT
         yCSl3NMtW1FNpdIhX2QezR4peisSytvHtzkWR68qDv/CPn+J8O7if0EKRihkr8Z9PK5Z
         kJTYj5WVndiPFpCM/HRJLigcft6jdOqXwDlo04ochp1U+hPr34mItAQYnzOWPkaePhI6
         PnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391356; x=1719996156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1oK8NcMDzD3lUAFEI9IAJSbWCdUq0p3gSwC8g+BGLE=;
        b=pQER0bAiLRF9P7IOnoHFXpBfwRspQh2OA8QqgY5X0aHnuNQ7JacmUYHRNLw+N7slaW
         h8nliZTFf1hup7RVOruXIXjLY3genGzZmG9LWwXu2uDxNlbrPvOguvfqCjfGv7xlBU+F
         DoDgDOEOhFyBIQFZ6louaEcYZBvA0/VjDLB6kZhU6mgYRB+Zg6xz1HmpZHcoTwQOGyH0
         QVeAGUtPc9gO3XOvMJAS0E07fCyR49XpDZI2icaDlyAiv8ScMyHxcfvGk+VMVOBJKncZ
         BqMDq98G1+IhsHd+FC9ey/RoK1jvsIEW11Ztsnsq4xJs7+OpKiPpricdP/QQPt50UOY+
         VfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrMiK22Y3JMkq/FPgRrA9lIX0s2Q1cG9UWn5sh7kxLS5PnSPmb44t4OvIJO6T8DJqkkW6DgOz4hZPH3J+dDHkXGWlgb5S2LNButUpmVT5xZ4poeloGdEjgWYWYJhxWmAeu5ITXIGQ4Ot76djWJ/xrtuvaKsHTP8NHkGYk0EPfIZhEHiVqIzPTK0j0=
X-Gm-Message-State: AOJu0YwZjHApKLvMcVjP/5hhidBE+InYwk0pKP/4NNnnlwyWu5zHciSw
	BhmDxhAikGjeFLlikjktgtaVwoj9KquaRxvcP8WLbjKvw3P8WozB9UIzPDj0dQ/Zt7VscvytcKZ
	eKrAIjXycSN9D0BLs5H2smH6L+O0=
X-Google-Smtp-Source: AGHT+IFfx5cks4hwYgRaWfw56XsTFZxH625ucUiDN42lL9a2aKReANnBK8EmxF35px00U/PDXov4/azle99Pc/L0zgE=
X-Received: by 2002:a17:90a:b014:b0:2c2:c61f:e09 with SMTP id
 98e67ed59e1d1-2c8613d204dmr9193625a91.20.1719391355929; Wed, 26 Jun 2024
 01:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620205453.81799-1-jhubbard@nvidia.com> <20240620205453.81799-3-jhubbard@nvidia.com>
 <CAH5fLgizj3RDCXMe0zJ4jjJrtui-R9x65NtHZh=r+vPQaPqN+A@mail.gmail.com>
In-Reply-To: <CAH5fLgizj3RDCXMe0zJ4jjJrtui-R9x65NtHZh=r+vPQaPqN+A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Jun 2024 10:42:23 +0200
Message-ID: <CANiq72n5b+64z4rVs9f+1miR8R0xnSJXLz4KKcKj+pxkOy_fVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
To: Alice Ryhl <aliceryhl@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Is "symbol browsing database" the right word here? It's not actually a
> list of symbols, but instructions for how to compile the code.

Yeah, I think the sentence mixes a bit what the file is with what
(some of) the users of the file do with it.

What about something like (getting inspiration from the official documentat=
ion):

    # Generate `rust-project.json` (a file that describes the
structure of non-Cargo Rust projects) for `rust-analyzer` (an
implementation of the Language Server Protocol).

I would avoid mentioning `compile_commands.json`, since they are
slightly different the Rust one does not really contain the compile
commands.

As for "IDE", I am happy either way (i.e. removing it or not). Another
alternative that may clarify by giving context could be "Editor / IDE"
(since one may use LSP with "simple editors" and not "full IDEs"
anyway).

With that changed, if Masahiro wants to pick these two up:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise I am happy to take them too.

Cheers,
Miguel

