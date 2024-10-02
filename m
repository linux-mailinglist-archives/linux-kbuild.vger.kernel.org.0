Return-Path: <linux-kbuild+bounces-3876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED098E3D7
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2024 22:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDEB41C21D6A
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2024 20:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB76212F0F;
	Wed,  2 Oct 2024 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yQX3n/GI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C7215F7A
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Oct 2024 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899366; cv=none; b=SnEvkBQyScYcmLPrkxrmA9+cZ4P2KURMde8ttFaWLIFS71gfw9dqKMoaqH9dGmns+MPSG8K1Pcd0IS8stfFRNGC0B/oyAfVp9SmqPPraLSw9nDuJFVlFc+6j5hqeq88rUNqRABNioRYUdAMusqHnqREFKl/A8U9m+BUKBZJu7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899366; c=relaxed/simple;
	bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPIK7E9zjgSUl6dheIqdWR/ClnF2Oj3GAYUocv4rpU7Ub07Nij66WznDEvoNtzbPAu046FopZDDSgKqkiLfSH59q4+U/q929t/FHVhWgP2OP0muYzZkqpBuqwP8JTV0rGQXpi+XCZnWFdTKCtTopIoNNhoCQwncN3A/HowyzGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yQX3n/GI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ce14ab7eeso163721f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2024 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727899363; x=1728504163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
        b=yQX3n/GIwXicZ6pkA13gZgbJ0Ql0sWbk/mzZYtNeolGBCpyGZ+Z2CpNtwSlvJjMJhZ
         TKehQV0Z7Az8iii3YsY6y3xWjGCGd6zAn9xLgdkp3LzNOX3IKGptdfKBIMsAYgAMlDrs
         lOuAPDJagX5gOSRpo/kXyRteVyxwNXmFRGtXLFZwZZxEmvd1cHjNo6pS31n9qA9OHTmt
         2qoy5EMJC2J9+W0wZgMhb97EXoz8L6FjYD+mNy/jL8JkH9tqzc0WfRbrWIOSKCcvEnMa
         qoH7g0lPcIQUDWNw6qjTHSVHudZqNWiRTLq2gW7DCtWQGqZ7PLU1dqCgTXy4yj2vjzMU
         mYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899363; x=1728504163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxE6XFKme+xoxU1Rszza7HxCxfUttwEhnIGpZd9XnTo=;
        b=OuHXHehLqZ1NExuq1gXCs1FSwoqc3G4l0/PB/sL4ZPM1qnoQcaXHNzf/I64wp9YMKN
         H+2aUOfPmN4fgLKPj5o85dikqm2SQzhMgFlKMOczbRvnMBioxjZs1/pki5J7UDb+VXan
         PAGowuFTKiAzRla5uLFvd6duFgr4B/mkI/Uo8vSEXMq4cSujc7QqajuJj3KAsQ0sus7f
         +Tm4Xp5sqEYtt8PWki77mzE94OSxayQ1YdvEaqoI6baKX1a5zTg4/3BSCNQlc0YmCH4L
         WUN8UdDNLvAVxg3lc1IiVZIEyhWZzTSzWoNPviyWrj7HEDS/0MiC5eYK5gGK1EjGyKmb
         sySA==
X-Forwarded-Encrypted: i=1; AJvYcCX9OWv/0DqO6Fk/meZxZYqL2St/PYQ2/T438q2AJbLrqwJ2cvz5Bvhrcu5lGsB5ASuNEt5x8xNtfZtoj28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYZsuNmO//I0qm6L5LP7o7lmVgSWAfKRP/iklMASZa6Kd5uUl
	9VW6Fb9FTeO+5TSMGy/P2jRsX88iFKU7e2H6oHUhb0iObRM5JHoXgdGonG/llpcvzVUeQ3sHXbv
	ykza18WDc5F4oUf5SdIUPWoZM7MX1Zym7hLrS
X-Google-Smtp-Source: AGHT+IFdAQHigHgRwqbBluWiPNLhOqlEtdJgsEEyQLh5TI1zvrczhPyhqF49gn7+lx+aW6IN0h4DED7pVuEkReeGskU=
X-Received: by 2002:a5d:5d81:0:b0:37c:fbf8:fc4 with SMTP id
 ffacd0b85a97d-37cfbf8110amr3030581f8f.59.1727899362994; Wed, 02 Oct 2024
 13:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915132734.1653004-1-gary@garyguo.net>
In-Reply-To: <20240915132734.1653004-1-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Oct 2024 22:02:30 +0200
Message-ID: <CAH5fLgihaSVg+=D_BfMxnt8VBO-r5LB4akus7EMvAfOyNv45FQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: enable arbitrary_self_types and remove `Receiver`
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

