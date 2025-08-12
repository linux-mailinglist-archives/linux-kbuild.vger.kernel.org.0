Return-Path: <linux-kbuild+bounces-8387-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0FB22308
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 11:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F861177477
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 09:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A6E2E8DE7;
	Tue, 12 Aug 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZW0ayuv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA442E2DFD;
	Tue, 12 Aug 2025 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990498; cv=none; b=doO6NL+WEUr3EEFlXBps/sy50GCLmiYbt1BJRuWcaRTnnxcJMrtotqxV6V8SORQ7rpnHERjKw5o45FDivZ5gb1P8I7dQe+rhblAA2VOwjffpfERKex28IsjSk5O507HjNirRPJer6C1jIXOsP0Ah9tmAQya7mmkgz7M0xENKLOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990498; c=relaxed/simple;
	bh=WQiyorV77zyaTQ7AF1IMpiv7Z306Tvbk0U/iXRpbHnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kel6zdjgAMcvz2EFBfzxT6MW4SE4HOc/9TPq3XjvbPmCygBCBbvruOi16xF6sWiaDISBJ6FckBNwIqefJNF/SGMfOkmVaFPhFP1drZqP6zLprBNZ+uvDxFL3ylIcKMpoD/m/LpDBesn69bBXSXojCaME1tjTtGRrB6OGtPI3F34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZW0ayuv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76624ecc7efso587504b3a.0;
        Tue, 12 Aug 2025 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990496; x=1755595296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYvCo0iEJq+ZxS2rhikncTd5AQY0cs0mvYn/ZYwYUdM=;
        b=JZW0ayuvO8n0KSMxpEzedi0/H9GwnZH7VLnE130JcwKxHWPlhybUsw7vzABJhoN16x
         lDGVeJo1k6kCWmv15zDYnvNkH7B2PEnaYJ9C9/F3ah4GJaX7UbQlf2tLbfXGLyfwJjFw
         23QVSiTV4XC3YIyL55u770CUb5AMPPUFAmat6irz3AIgbGNBoil85Y8yCavn0vnZ9CME
         goG84+TqzTqXnU41r6DTNLT2wgSfJ+bj2ufTmn1uSUd3D4+qcv3aZGKXmdcSxdDUGzTv
         8RuklAp1M2d81e1Ab2do2iMW1Ko5SsDmoMzGw3AKNoB7UL2Ep7ySu38KBPWpEZLRcj37
         asNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990496; x=1755595296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYvCo0iEJq+ZxS2rhikncTd5AQY0cs0mvYn/ZYwYUdM=;
        b=w0h2Gm+m3JaFvxM/kYoJGzGCbneFaEK/5ItGy93ezxC1nkYLs/GBaxoQ5z96CNhNVn
         k0bOCOEsst8RgI8X4Vrk21YIuWixmGwACinI71CSDGSjB6pkNs8ptWNCp10jK3QghCmw
         oT1wylscCwRORTlxzcAmDSSp/atNLOThq2dTEdZZUrCFjs3FchymX70Q+gyCsk2TMDaA
         uJvTvFZvd4/UDjHw/tmNEtWQYazvUUlaquuLnsrbD6IPs/oxCNkp3ldDKCrKr3vxo6N1
         4Hizh0aU1UEIQhpM//afJcFaHSDVRjucEeRJJxZ5XLik+gVPy0hze2YIjASLthD8C4Sh
         kPDA==
X-Forwarded-Encrypted: i=1; AJvYcCWsD0Y7Em/vWV1617DMGt8db5GDA6BXMVh5+X7869Ixcuw+oRIDr7tfwYvOzTp+EdUdPVUzPIx3SJTE2YZvB/A=@vger.kernel.org, AJvYcCXMwS/31Q08WfaVdb7vZx5a8rEvQ9ETXqvj7oARPd9RxPKC311YTJ1SiFNqa8mQ9rQ46n7oQLr7PrrotlJg@vger.kernel.org, AJvYcCXPG07N3oNr+DCZZ/fCMxYUieqe5J/mX4VozWNnr5dC1jgFF36hhCbiY7m7aWIyFnQZPflJg5tdTSjp7yA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo2ZTlI6H/zKHs+XbO+q5IgLgdfNmj9BO2mXi3Z+N+tM0JfZVW
	2uAhj7+MW8Ds3L3+AuCkSLi4dppvEcFRjum7AUE6AxTZp6YS7xFOZTSIQgG3MJ5mGXv2ovPSiP7
	PxGrPoKQR4yZOoIhinUu5sm8l7J1s//o=
X-Gm-Gg: ASbGncvTPv25audxpwuy4hsFK4Kb8pQLf1O0gltSlJcWLE6aVUf4macT7DO9VsWKOc1
	6ht94xQ2zPYW132eqBZvIJsAUQwgzqtWtk6tQTj/LNVu7zgILVsVZEc0Q9ZrYyvVspb6UR22D6h
	8Z4sywMrVBW8yXBWuM21dl+OtEbtryStsCn+4cn4tEktSSXjHKp1fiRokGsQ5gL/1BRLhReBoQJ
	Rb+VPBu0d+V3pKCfOs=
X-Google-Smtp-Source: AGHT+IESYKcihEDu0NOwPQjnLbNGzr/vMkV0bVQOv7S3LdRIIZarF+53jISTF5/kFZPUqcmWXoC+txIkwTl2k1Thny0=
X-Received: by 2002:a17:90b:4acc:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-321c87397f5mr416660a91.1.1754990495995; Tue, 12 Aug 2025
 02:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
In-Reply-To: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 11:21:24 +0200
X-Gm-Features: Ac12FXw0jpURTsZx35iCN2Jrw_NmdxAdgGldjx7cwS7E5VDyFiyvWmS_xdA2Pto
Message-ID: <CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: enable CONFIG_WERROR for more build steps
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 7:31=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> CONFIG_WERROR is useful for all build steps, not only compilation of C an=
d
> Rust sources linked into the kernel.
>
> Also enable it for assembler and linker invocations, userprogs, as well a=
s
> C and Rust hostprogs.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

The Rust part is:

    https://lore.kernel.org/rust-for-linux/20240519211235.589325-1-ojeda@ke=
rnel.org/

However, Masahiro back then mentioned that we shouldn't make the C
host flags depend on `WERROR` since `HOSTCC` builds Kconfig and, for
consistency, not for Rust host progs either:

    https://lore.kernel.org/rust-for-linux/CAK7LNATPx2wTEM=3DKDmGtcH8vVTB4s=
uOhh-CUQKP54F8wtPWDiw@mail.gmail.com/

Perhaps it could make sense to explicitly exclude certain bits, like
Kconfig, from `WERROR`, and apply it for everything else instead.

Cheers,
Miguel

