Return-Path: <linux-kbuild+bounces-2672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750493D10E
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 12:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F181F20DD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF49B178370;
	Fri, 26 Jul 2024 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xel7RjZJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47D17920C
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721989396; cv=none; b=GsbPR7Eycour61JR6SR5u8FSRvh+Iz1ROkR3aOUthCcheSeGrcGAFm5kw1csb8GLPaTlWzV6EbIvVvGlfOAghanEV9zulBxyWXcWq0i4+LQ/A+U5X61415+TOYIzrXb54u9hPz4dQCUVdCQ1P9WCRSLQBOJQfjNHbUnEX829i5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721989396; c=relaxed/simple;
	bh=VuMF3KoncyaI8CPrPZlQbATP2kYcE2y/7t+nGV+ZexI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSDH4ID8MXPQCFDlLNbKhyIn7JfBzaF9aGYE30fzCrrckB1Khffz6l+n8UXI8Bctj7T0EGCl9+7dR5sqwqWerYUMbhXURsk5FEFwI8PmijGJMqe1kXNUYJB/ByZC6lizEhFz6T1KYdQYGACcJe3BWnUMbrmQzf1spaJkQP9IAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xel7RjZJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52fc14aa5f5so2690e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721989393; x=1722594193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOFadCdnFUNbKiegYZZRp810q0uwCcDa0ulZ63Y8FbI=;
        b=Xel7RjZJNOa5uNUtKvZVIyMwhF3n335jRizRAvaN7UhzAMO5e9bNq79EKYGtPJ5krW
         VxuIbIgTMXXfOVC0tJod5CkNh6a1fZcnWOgySSHargVnk6U+EIoveL5J5EixL3kvL7XG
         gU2zJ5ppUDulWJoaRh7HfPhg8szGpkvRWKWbYRUptW+vws9oyvL9zedj3h/iV4jG9RGy
         vHNHbtI55qoQC5Y+q1iVDenBky2kmrTn/OLycbCoUNDDxYEsZMdP/x4P8IYgmhUJEXcl
         nTZO2IEx9cONQ1czTgiDtyhkWAk3tQdkhQXeZbqVrPDBKDnziGGdqw+pfOhbPUlolLc5
         ot6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721989393; x=1722594193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOFadCdnFUNbKiegYZZRp810q0uwCcDa0ulZ63Y8FbI=;
        b=cly8UxslFqsFAfoiT984By02Spj788wZwr3rqVmETPK223YUB3hTi8XkzDqAlYn2Yi
         1O8gkDHNuOtpQCrggqrBDItGLPEsZLcaSbI3sfB1z0Fmq4di5t46l/QUXjSH1njL/r8B
         A2L5seHq++yu3eH+xnVuDBWOG9MxP0ZbQMH347VmEtBVDB398rmZ9ezXg9RYPD82zFX0
         fA8w5Z9ClHOOmsAwteAQprCHs9kxKjumRCpt0+ubqS7ScyNVvd7NZ+giM2+kzVDKHFrr
         PPvokJDKzHTBm30eRDtG0GRp5jA66dU5urqfMdN4cQl2KMB3T0SUFCsoZOMGsmVNmz7H
         AN4g==
X-Forwarded-Encrypted: i=1; AJvYcCWxkT2MP6uAeOC2QziMUeNfNScummmBTww4VvfybZb/nMk2TicoO4lLd89qAfz0gr1gyBX4qr6IPbFgeYgIDcDUuc8xeXaZ247I09z8
X-Gm-Message-State: AOJu0Yx1owcUMtJwFZLINPF7M8swXJOQe/D9FGyEPTyww8v1JQ/5A6JC
	LTxWvy5T6RXCGS4GfuK3Yi4YHAG9dNTg2T4aGgBB5qoX54pIb7mUUUFXvZgOtJML7nvkXbBqAG1
	/FCgxWZKrTHPZENlXg9f+N9ALJJH+rvqzO8Qn
X-Google-Smtp-Source: AGHT+IF9PsWLNO3FCxU7aVV4sNWcmYQNVE+PU7vZtXlmu0uxBM72nozjBz9oOKU4fU1os2TPNEsTgE1Tex2EPNoxxSU=
X-Received: by 2002:a05:6512:3e21:b0:52c:cc9b:be20 with SMTP id
 2adb3069b0e04-52fdb52d825mr121406e87.1.1721989392884; Fri, 26 Jul 2024
 03:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com> <20240725232126.1996981-3-mmaurer@google.com>
 <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com>
In-Reply-To: <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 26 Jul 2024 12:23:01 +0200
Message-ID: <CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: Enable KASAN support
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Jul 2024 at 01:57, Andrey Konovalov <andreyknvl@gmail.com> wrote=
:
>
> On Fri, Jul 26, 2024 at 1:21=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> > set properly.

This is great, thanks, Matthew!

Does Rust support KUnit tests?
It would be good to add at least a simple positive test similar to the
existing ones so that the support does not get rotten soon.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/=
kasan/kasan_test.c



> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Hi Matthew,
>
> >  CFLAGS_KASAN_MINIMAL :=3D -fsanitize=3Dkernel-address
> > +RUSTFLAGS_KASAN_MINIMAL :=3D -Zsanitizer=3Dkernel-address -Zsanitizer-=
recover=3Dkernel-address
>
> If I recall correctly, the reason we need CFLAGS_KASAN_MINIMAL is
> because older compilers don't support some of the additional options.
> With Rust, this shouldn't be needed, as it requires a modern compiler
> that does support all needed options. E.g., for CONFIG_KASAN_SW_TAGS,
> we also don't have the MINIMAL thing for the same reason. (Possibly,
> we also already don't need this for GENERIC KASAN, as the GCC version
> requirement was raised a few times since KASAN was introduced.)
>
> >         # Now add all the compiler specific options that are valid stan=
dalone
> >         CFLAGS_KASAN :=3D $(CFLAGS_KASAN_SHADOW) \
> >          $(call cc-param,asan-globals=3D1) \
> >          $(call cc-param,asan-instrumentation-with-call-threshold=3D$(c=
all_threshold)) \
> >          $(call cc-param,asan-instrument-allocas=3D1)
> > +       ifdef CONFIG_RUST
> > +               RUSTFLAGS_KASAN :=3D $(RUSTFLAGS_KASAN_SHADOW) \
> > +                $(call rustc-param,asan-globals=3D1) \
> > +                $(call rustc-param,asan-instrumentation-with-call-thre=
shold=3D$(call_threshold)) \
> > +                $(call rustc-param,asan-instrument-allocas=3D1)
>
> I'm wondering if there's a way to avoid duplicating all options for
> Rust. Perhaps, some kind of macro?
>
> Thanks!

