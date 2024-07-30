Return-Path: <linux-kbuild+bounces-2760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B2941F28
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 20:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5831F2493F
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B2817D8BB;
	Tue, 30 Jul 2024 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeiZJ+8S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D431A76C5;
	Tue, 30 Jul 2024 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362525; cv=none; b=QacLl/iW6MJ4DIMc+GkvVghjUENnmZQ+JBRN/lnH6rZ1jOLGigdZDLxgBZOr6f/0b4OyZFZiMGFwvmfv3R187K8/1GH53qVPDaMkDC1bVDhJbIAWUN5VWnLWx6CS/4gQhhDQ+pM9Jnh54nmBD/Qtg1EsuB7ahSM2yeDUpLwtOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362525; c=relaxed/simple;
	bh=ULp7y4GWoskop3RWki2ayWDlyJ5T6BTGYFMwxFFrnWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dr+3/FMHY2912Zl1lC0JjTa2VbY2zaiR5POOODrMOdXlV3QP73D5Vswm6tg/8tzAwcnb+dLcFV4ULoA5dyTnz62dKqv9B4VPLFcZ26qKPf3piOEvC208lvDpAR66bStRun6hd/0P+LQL4iOxhHg5/9VRF7oGZ8FsIkTEUeIIKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeiZJ+8S; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d162eef54so3282832b3a.3;
        Tue, 30 Jul 2024 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722362523; x=1722967323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULp7y4GWoskop3RWki2ayWDlyJ5T6BTGYFMwxFFrnWQ=;
        b=XeiZJ+8SlG1AG/Q5oStYMIfjwu1QJ2YVGJ8OckuvA2GfKBKuDXVPgtnHP/bAQvluRr
         P5RYil/azMg06LGGVr2RfdLeklMD1wBWbRnnhakuOpwSN9c/xWOIuphHEO5IcDBjFTq8
         NcAbGdfV1icWrSvussb38sEiafvJvqg/s2JithsjpAcZ3tYN4Rojqg4k/+a6uVoAu9la
         tIZeWKmhALuveRB3V+WDC2YW4DaYmGNVm9qEbUqe/q7odq/tFC8x3Q8QSepgJZXAM7fj
         RgN/0oc6vMYl9jhk7swgj4aH9gHTrfiNJODjYgYh//TlkMhIVj3iPpfPBjseBNp6gQ6G
         2SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722362523; x=1722967323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULp7y4GWoskop3RWki2ayWDlyJ5T6BTGYFMwxFFrnWQ=;
        b=IOcHnbKL220/xQU0Iw0HLrre0HMk+ymk28vcd8Uludnlo25jYyEmkVKko81eZOhoFa
         Asb2eOvlKGTc6ASObJj7SPbFb8t1uTfxX7C3h5Qa5sZQyhaYrCi2NusEjkm50dp6uchC
         8HNQyyXozB0b6dRgxHwma9ldtp0QwvJOTzC4iy4J8IANCZeZwykdixF9e47g41yS4DWE
         UsySOyis3AW5oC0N2xBr1J1t5uPrWStbLBZhQqrT6cL/DlWAdmir+h18pGq0mTDJ1ro5
         6NPoe7Limaylwg6Re+y/5uiCbVdr+fyJ4TjN2xCs1i1gUABZahwYzF56TFMZuoxq0ohr
         31fw==
X-Forwarded-Encrypted: i=1; AJvYcCVG9SQdyp6VgTrlZEJZITGfnnl1y9UIa0hweyuYeXjHwtarS45fx6yRAs1JfnctEem/1VlLXo/qrm1x9HBtSrbLztWfwxDtj+6BSuFEXqSd0Td5mprvV/XDaemWWT99lgpafk+1Fwe4hNParRfiZzUnfXY+EjAxG+6jJgUJODlNUvjGBAnUdXjTtJ8=
X-Gm-Message-State: AOJu0Ywk60wU4emS5Rnmzf0ZfdtO2BU6wOZa6AkxDSWI548rSlZS/FiM
	sj9ynn/erPKbth+KBmAxgZdOfTz38xXwQae9/ZspBoAoEdXpxC/thVMqhSNH+MDwnKKvPi65/gE
	3Zby+ulr8tu34ZURXsdGx1hI+E7s=
X-Google-Smtp-Source: AGHT+IGDmVQt1Fus+cwmFaBdY9cpZKWwvwP87LzYj5bAA7EM66N/DKsi03ldCaXroC2ZDlnb13RI5XFd+X0BKqVdNv0=
X-Received: by 2002:a05:6a20:734c:b0:1c4:a30a:c819 with SMTP id
 adf61e73a8af0-1c4a30acbdbmr9477886637.21.1722362523262; Tue, 30 Jul 2024
 11:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com> <CAH5fLgi6OPLGNztKeM7pD3v7_NG6SrPrhXi8H0tFn6Rx-eVgcw@mail.gmail.com>
In-Reply-To: <CAH5fLgi6OPLGNztKeM7pD3v7_NG6SrPrhXi8H0tFn6Rx-eVgcw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jul 2024 20:01:51 +0200
Message-ID: <CANiq72mJF5PYU-BCShpgH-jMVetJG2PjDypexPCKnqrxHToKJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Alice Ryhl <aliceryhl@google.com>
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

On Tue, Jul 30, 2024 at 6:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I'm adding this flag to make the bringup process for RUST easier.
>
> I'm working on enabling RUST in a new branch. We're eventually going
> to have both RUST and CFI_ICALL_NORMALIZE_INTEGERS enabled in our
> build, but the path to getting there is complex and we would like to
> turn on CFI_ICALL_NORMALIZE_INTEGERS first, and then turn on RUST
> later. Both options are non-trivial to turn on and I want to
> disentangle them.

Would it be useful for other users/distros to do that two-stage
approach as well?

In other words, if the intended end state is that everybody should
enable this if Rust is enabled, and nobody should enable it if they
don't care about Rust, then we should add this only if you think
others will also need to do this step by step. The option or commit
message could ideally explain more about this need/use case.

Cheers,
Miguel

