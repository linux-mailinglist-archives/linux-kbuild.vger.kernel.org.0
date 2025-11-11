Return-Path: <linux-kbuild+bounces-9568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A5C4E42D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35371899D2C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1847C35B152;
	Tue, 11 Nov 2025 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM6fBr1Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C335B14F
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869292; cv=none; b=mjS6uddOeCpPcNHXLplGRGGWkHIK37gjxpahtvFee+vPRpN++j9580l8GTPR5dKWqq1Ooc+a8Y91vggvwKw9K14cmOFOV72qh0hSJJ9qHat9yErNeknS3l+EYV+b20E2D6+Ee/qPdlvbL03QawQG8MPEoRGOlUZ47nZ27CTSj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869292; c=relaxed/simple;
	bh=A2TkjakrfDdkYRGuTxjcRqTay/V7iT1zDDZWS1m5mUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8xfg8F4TMuskuz6wJfH1VnqbMdfxsNJjf4Ind7ikV5MvrkevjG0qhBTAodGddR/PQNpFcJZZKAdHX5+SKYcrruZNttLqxa6gXQ1gzn3XUl39kNifaGUUZ4dQUD0/VIWOY06VG84wUM8BXsYoigBy51TIN5r58G9U9dAlZmpOmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM6fBr1Y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295351ad2f5so4648465ad.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762869289; x=1763474089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZoLj4f0GVdI3DGKFlEJ4QWVzpBGFdDaaHgYw2dfwqU=;
        b=VM6fBr1YGmxYu0TgqLDBmuYZthtRhP2l1NGNo+6VXxP63RHkYR6cUAEkj/dIxOGUDY
         oNeBF75BrIsmhCH442DLOVHmuDmCsnEl07eWREbkDA9cPqBd3p2KFNJhMdz5pcwbE521
         Uv1XYgqMlp06hHuWENh50Z2/aORP8v+Uc6ccSwTdklMewwZ5TgE7Zz6CH0K+qfQ9ZAkF
         nqzieJYyDxQ6ixKS9ex2CgxZLk0cZrYMJrvIq+lWi6e4d5+nzro2LqyuaPGMjGdh1/Gs
         6HaKBVvNAu7EXRjl3GQZRcdOkpSHq16Nhy5lEsaoRcfzicfeYvXeY+bOkLsY+uQVSBXN
         t74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869289; x=1763474089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZoLj4f0GVdI3DGKFlEJ4QWVzpBGFdDaaHgYw2dfwqU=;
        b=Ah8wu5wipyyXOz/9Yv8v6GcCKUgRdFHKREBzTlv+XgtI1HgwCLMEM1Qb2ywntKzWfz
         6qHR2uRlnBlX+/7/CDGehx+la4lihDAeLz1OJa7PWRJxfyKF1sU8wE0hUsnn9iuNgvwT
         inqegDjJqv8sfJNkcOxztobyTEBvqKaNTd8REc8uJHmS89iMRavYKcgH15QwmByAhMFL
         dUkXrM6+gXieKDQlu6SBehvvP2NVT22+4ph6Tb/A8BH0mC6Oxm5/JkTWNdpLUWq2lSXO
         mLXPGf5CzpWo4ttshOKNo1CRDKtd9DCf3WOBUf9Cth585iKdGYsiQd4tYJS+inE3Svlc
         xc0A==
X-Forwarded-Encrypted: i=1; AJvYcCUsS0U+X3v/bmkS2+8Eu/YDaOBehL3dxGWzZclUI0p+/5giuwtF+u2Zt64B+oP3sryncpYJqo9OBDREjHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYraFsPsRm3jhtfCc/uEKDWQS9NR9+GWjKtjHaWrYfA8Kpxzla
	jaiCCYN6n88VYc6j8lGHPRgwcQmaQRNMPxXleZuQTdg6M467xhmLGDuE7Ie2446pdeDK6/BQbjb
	RnkY8bEtjqaYlkOU0w2eX3knMGkuC+F8=
X-Gm-Gg: ASbGncsgQe7igwKiuy7HA7NgG7/blOsJ79p8FrnlsyxcIg2D9YPKzq//P53J2bnjxrf
	aLSCnRrvuK9VVoHlGBH61u6gLM9ZmIMn87/XUvcxajQSyEC6MDERQoR9R5c/TCV8mrrgITABzRi
	B6B045elArNEQg+YTOBs67IO/PcuIYbhCXlnnOBtbnvjqDnjyUrnnlW2p8MYfIcuQ4yDTy5EN5r
	og0X1VG4JwdPDtfhsnSwlLqy94lwYaeNPS++dt1Y5FS2kWL4ADfuhxJIHfB8rTOlykqsEt7imLH
	iLQX9jCSpELaFtuMeIOExGOTwb6MPjOgBWmpuT43XQva1UJecef5byPqsv16bpA09NIbQV+9m56
	Hg1K2Xe+DUdwhWQ==
X-Google-Smtp-Source: AGHT+IF0Z68cGNnWIYfhE+GmNXty3zSKglcsJIW8DTGnNaR5oz+N94f18Ae9bgXwDGF1o3kKuYh1bmeQkQ96c2H5z8Y=
X-Received: by 2002:a17:902:ea09:b0:295:511d:534 with SMTP id
 d9443c01a7336-297e5731561mr84933915ad.10.1762869289453; Tue, 11 Nov 2025
 05:54:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org>
In-Reply-To: <20251110131913.1789896-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 14:54:36 +0100
X-Gm-Features: AWmQ_blj1Y6aEDrIDY1SHsBj9ipAJhqLELG9lX2PJ-XtkIigMIPK_72YnkrkjN8
Message-ID: <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:19=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Starting with Rust 1.91.0 (released 2025-10-30), in upstream commit
> ab91a63d403b ("Ignore intrinsic calls in cross-crate-inlining cost model"=
)
> [1][2], `bindings.o` stops containing DWARF debug information because the
> `Default` implementations contained `write_bytes()` calls which are now
> ignored in that cost model (note that `CLIPPY=3D1` does not reproduce it)=
.
>
> This means `gendwarfksyms` complains:
>
>       RUSTC L rust/bindings.o
>     error: gendwarfksyms: process_module: dwarf_get_units failed: no debu=
gging information?
>
> There are several alternatives that would work here: conditionally
> skipping in the cases needed (but that is subtle and brittle), forcing
> DWARF generation with e.g. a dummy `static` (ugly and we may need to
> do it in several crates), skipping the call to the tool in the Kbuild
> command when there are no exports (fine) or teaching the tool to do so
> itself (simple and clean).
>
> Thus do the last one: don't attempt to process files if we have no symbol
> versions to calculate.
>
>   [ I used the commit log of my patch linked below since it explained the
>     root issue and expanded it a bit more to summarize the alternatives.
>
>       - Miguel ]
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Reported-by: Haiyue Wang <haiyuewa@163.com>
> Closes: https://lore.kernel.org/rust-for-linux/b8c1c73d-bf8b-4bf2-beb1-84=
ffdcd60547@163.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nKC5r24VHAp9oUPR1HVPq=
T+=3D0ab9N0w6GqTF-kJOeiSw@mail.gmail.com/
> Link: https://github.com/rust-lang/rust/commit/ab91a63d403b0105cacd72809c=
d292a72984ed99 [1]
> Link: https://github.com/rust-lang/rust/pull/145910 [2]
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I will send a couple other fixes to Linus this week, so if nobody
shouts, I will be picking this one.

Thanks!

Cheers,
Miguel

