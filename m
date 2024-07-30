Return-Path: <linux-kbuild+bounces-2754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C09417A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7801F24567
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 16:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C669A18E04E;
	Tue, 30 Jul 2024 16:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGRWXxim"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41F18E036
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355861; cv=none; b=V5nf1FqLooYiv1FZkuf4MqBbb0vwUjyjyEDxeTfKeWWacQoxa3oGAIXIo514N0322i4V3Out2SS2EwBfUUFp4iFPRRk+ds+LsVcF4U4nKlCG1QPa/wbqrjMR3U6kwCr03Vxy3bSROcq5/0d0Gw3fgg4Pkbi3RVsRgYJTcYqiy/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355861; c=relaxed/simple;
	bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRoqFijCoBefaA0TNQ2nx7k4HWllI/90mGJf78spAmMBXlR2cz9P7AIejBYbsFaKffHnFkpvtNiR2dSAlL9YoQ+qyYpM0/R61hVcenz5l8kPjD8h2mKYLzSwKq+y/yHQNI2bz5pZ+GITqGq233x4UERG9FbTXjJ4NHKml9D5Rbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGRWXxim; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so1652356f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722355858; x=1722960658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
        b=dGRWXximrOtl9UJw9//C5rGcFOzoH7GhYNoOiEkbVwRkCN21rqqP/2PNkhsZs8u9oL
         ClnpJwWo4znxOaLGwD40vbT4voSScDmb3Bz2NhOUDuuhLt2IcwJdUWJy3eeCEUUNb2pw
         GHc2jN8MQEYJzsgljRVbzKpf0ybXe7BT0a2QnkRueZRwdCWLsw0VfNfdaeIvHMp4Q0Fl
         wFlLd/PplSlRm6ILLe/CwYpXAGPPbC6o5V/VikpiTTteEOv0ZAZ7pv/W8B9cR2hfm5Ql
         JYKBvWfktjo2gGUN8aNa478tkMtZgJTP/Hl3+Czuk7EGqQvhgckQZjKJFtJfvYhbn1cd
         wcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355858; x=1722960658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N77xPJMWo4kvlJgzR3iBKZ9hbdNs75+A97/bfiZSefU=;
        b=PtzDY6pWcyxdSJZLeuPj4iOZA5pPUki/CPWDvzJ1X9N3XVMXHRbZpZCPDqqob8Urgi
         +ZYL8i8HA41s2WvUaU4+NV4RCS6kO4Mf2HpSSOBbkVy2NEK/vvvPzN6BXoJJUbOL4Dri
         Q6Nn2SxUQwWQ7shEM8p3oJp3NQx62AfjNbLwPGBoyQd38sdISImBjoCFhZvXetR21R0x
         f2iW7KEugOe1XVWW67P9ZfJgWjfhMi8JGZk/G7ISKUuRcyrz+IZof7t0NzPYGu5F6MS6
         xCmYUDfg16no3O3ji0v3uEjh/KpsL0sRYh7LhlxFJIXgcJ0EBmONI4jSp6hZyb2VXpXG
         McMg==
X-Forwarded-Encrypted: i=1; AJvYcCU3IPFoDM6K9RPZhQm/xxXXBO3o8XbKaZmh/uLg8lH3bART2BAPVTNVlLru9TJNZKUCrEuwJsd1Hu2a583XbEaMy3yVYNE5QrI/uaoy
X-Gm-Message-State: AOJu0Yw57whJ/ZxPQwzxks18NCNqkqdwFSllDTgnSDtqp3iI93+ltDZ8
	qjl1VB0IOBe2XE3T/vP/vtdH98SYKbfVNldOqlHrwBnt5tuLJ0WpxKuOpvGjjOVvIwd7dukdTaM
	6CFsvBkkOxo7n+loEJ4A1y8wEnQ0rAkKaJ/dJ
X-Google-Smtp-Source: AGHT+IGEXQ9k57Q6q6L8r4Dbm14onw56YDf9aw0oYCbfbedA5kbLa6rjhEKX71olZ9dxXMrp1GSu7GEb4x9u0KMSBQ4=
X-Received: by 2002:adf:fc4c:0:b0:362:8ec2:53d6 with SMTP id
 ffacd0b85a97d-36b5d0bf207mr7653551f8f.61.1722355858189; Tue, 30 Jul 2024
 09:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
In-Reply-To: <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 18:10:45 +0200
Message-ID: <CAH5fLgi6OPLGNztKeM7pD3v7_NG6SrPrhXi8H0tFn6Rx-eVgcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 1:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Introduce a Kconfig option for enabling the experimental option to
> > normalize integer types. This ensures that integer types of the same
> > size and signedness are considered compatible by the Control Flow
> > Integrity sanitizer.
> >
> > This option exists for compatibility with Rust, as C and Rust do not
> > have the same set of integer types. There are cases where C has two
> > different integer types of the same size and alignment, but Rust only
> > has one integer type of that size and alignment. When Rust calls into
> > C functions using such types in their signature, this results in CFI
> > failures.
> >
> > This patch introduces a dedicated option for this because it is
> > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
>
> Is there any case where we would want CFI_ICALL_NORMALIZE_INTEGERS
> when Rust is not enabled, then? If not, is the idea here to make this
> an explicit extra question in the config before enabling Rust? Or why
> wouldn't it be done automatically?

I'm adding this flag to make the bringup process for RUST easier.

I'm working on enabling RUST in a new branch. We're eventually going
to have both RUST and CFI_ICALL_NORMALIZE_INTEGERS enabled in our
build, but the path to getting there is complex and we would like to
turn on CFI_ICALL_NORMALIZE_INTEGERS first, and then turn on RUST
later. Both options are non-trivial to turn on and I want to
disentangle them.

Alice

