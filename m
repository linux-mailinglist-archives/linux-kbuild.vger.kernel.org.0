Return-Path: <linux-kbuild+bounces-4054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E95999D4D
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 08:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638DA285581
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 06:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A6F19CD19;
	Fri, 11 Oct 2024 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHjPgaD8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90F635;
	Fri, 11 Oct 2024 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629952; cv=none; b=MdsAc0zetmdNn/Q7y9qPb1NaVohGevMz/Zo44+vmmmWFLrue2Lf+IyylkWCW47IPzTgH10zkhVg3A1eXIW/9zqjJYiEwZ+LhRAU7UUweZOcxPcxJ5X9/5nmrn2eXTT0OczOJL824gFaJq9ISnSg7Cbi2aF6KR+VgdLt2u/84+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629952; c=relaxed/simple;
	bh=AnM7XamNLc2M6oVcml7mvgQSLuc6IQzUUi2epLGB8ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7WpuQXVzjWDXeDchODyreBqHpIixL5/IF6+FxM6i2AkI1lOK3gxiZVMJWJfI9d7DrsPP7WcKpMvTwz/pE3lTSOM3H4LJ6h9XThH8KNEAk/OMzor0WRcgqs7mGXhFKQOpLzdFBeNXWAOoqMlAeBhZ8jc/A6eKe1TNaQhKurY+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHjPgaD8; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71927b62fa1so158689b3a.2;
        Thu, 10 Oct 2024 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728629950; x=1729234750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNprZDujeJLDJHdRYQpNiQJhs787CFLT9EgNyD54pMo=;
        b=JHjPgaD8+pk1ralETKao5Cp2uRBWiwOTuBcC7TgZQ8jdL8W4BoU25Cvicqo/U/OW6p
         oYJuvMPl8JitT2GxOyeJNVTqH6iFz7ojFeupnqVPhMRZys8/3YCzNDmhvEpQsbukwZh5
         4aE4AEdu7ApTzkJeRofOmJYfpNkVAN12Z33gaE/KBf+8iFjEzfbMAdw9WFQZAGyJ2JY4
         zwPeaj0fxF4/sQaBFrp70ieKz7NT6rdMSJrjvTvv8N5QZMD7PGCtsabz8jgiJIpZ96al
         IxtSnvPT0mv0ynb/SE7bapUrkdCdi8y+B9SpSLP8f3rJmzYd1iEqAsgBd123Jad6XlDy
         6k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728629950; x=1729234750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNprZDujeJLDJHdRYQpNiQJhs787CFLT9EgNyD54pMo=;
        b=QOXcQ75Bs4Hs5FZN6Va8D8Oc+y2kjt27IP/KMUp8HmyyQe5ykERCJoSnLLXiwzcc/H
         3/VGXGCjLBx+TjY9rttfAAwSLDZaysJdRrXk8Nc0Jvqx9dzhB6/P50xnDG8yEf/1iGJu
         r0x+LtQhuyarMorzQYZkvnen8e3FCC73+ykUDoQwYC2vMoUn4jOXU+i4id3V4IsWteAJ
         SJapz9ZvnbRYx76dBImxzsAjaGnZmMhaIZIKMS0paSMkXJM38JsIQKxHj2bfnhkm0n+e
         QCCmaxktNS4iKmtjPUy1wZnW97Ki0Pl+gNCkcukfd7hXDklUADkQfIfLyHTMzqulL8vN
         LbkA==
X-Forwarded-Encrypted: i=1; AJvYcCUPuVhT2la75JJRXSpmzdHkyfhOql5WwZGuPYUccy9kZv/dgXFZu5mfJ/86uX3usJHShoimI+eH7uAPAhs=@vger.kernel.org, AJvYcCV1wbZS+rErf+raiV+z2uRqFeBHmd2SjGnKBD2xAhCjh51dtgNryluWkiu9Olkp+WsQ8HaK8wfQ1xFf+BJt6T0=@vger.kernel.org, AJvYcCWtTbi5yZA71A8JnBLlLmnRPs/bvu/RhxpRD9bm6kCco5+5HdLtpQNvpxrC2/uLkn3fLo4U0eWFFoTg6Ume@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBKO847L24JsBPStBEQWmCakuM2rwZZQGU7Wo9X/EWo5xcpEU
	mDmQGu7E3pO5IURvpQMuAmn7boVqpLlnv5SNoYq0eFsP8WFmrdDDe8pZQBTDRaDwvVASzxlv5X9
	kZiZABnEF1DWPDBNlwrz2EAydFFY=
X-Google-Smtp-Source: AGHT+IHfgp+RekBe+a33lrGFkLogwB1v4IcRvG8U0x5B9hHpF2h7NSFqzr4UUZhb7LVoGtsHegM+6k0gaj2E+Gka+m4=
X-Received: by 2002:a05:6a21:32a0:b0:1d8:a203:95a4 with SMTP id
 adf61e73a8af0-1d8bcf12481mr1225502637.5.1728629950384; Thu, 10 Oct 2024
 23:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
In-Reply-To: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 08:58:57 +0200
Message-ID: <CANiq72km-hEBvt-T9CEp6kLJMvemcW99g1hd-E62Xi3H+NX2RA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 4:04=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Please notice there is no reason to process
> rustc_version and rustc_llvm_version in the same script
> because they are completely independent.
> It even invokes "rustc --version" twice.
>
> If you implement it this way, you do not need to
> touch scripts/rustc-version.sh at all.
>
> If both rustc_version and rustc_llvm_version were
> retrieved from the single invocation of "rustc --version",
> I would agree "OK, it makes sense to implement it in the
> same script". But, it isn't.

Yeah, I think we can do that: one is `--verbose`, the other isn't, but
the verbose one should (hopefully) always contain the non-verbose as
the first line. Since it is in the first line, we can directly do the
`set` without having to "extract" that line -- something like [1]
below?

Independent scripts would be simpler, so that sounds good too.

By the way, this is a prerequisite for an actual fix we need, so I
would like to send it as part of a `rust-fixes` PR -- your Ack would
be great!

Cheers,
Miguel

[1]

if ! output=3D$("$@" --version --verbose 2>/dev/null); then
    echo 0 0
    exit 1
fi

set -- $output
rustc_version=3D$(get_rustc_canonical_version $2)

if ! output=3D$(echo "$output" | grep ^LLVM); then
    echo $rustc_version 0
    exit 1
fi

set -- $output
echo $rustc_version $(get_llvm_canonical_version $3)

