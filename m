Return-Path: <linux-kbuild+bounces-9402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B6C32C47
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 20:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17AC9189FFD8
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 19:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E832D47F1;
	Tue,  4 Nov 2025 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YulHaBjQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8132D2387
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762284330; cv=none; b=dfoPnu2E07VvnTIgP/3GeH4N2EZLnmBAzlShTDLXS09UId6y65YaV2wwM3Zr46urJu7DdQJnNIbnT3fbOoFQb1ZNp5ct2lHKKE2Z2PryJF8N2lQhgYatriDVtsT3FPzIxSpN6lp5eaylj+RPDj5XWj/+OPdrHfPGpYG0PvDnRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762284330; c=relaxed/simple;
	bh=K4Iyxi52gh1Iw5mMl2HUNeLP4ewV8sTogXEjAzGJ4AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXtK9looDdLCODmO+O1jNQXpDgit5fzr7BSZ1Go7DEgTOrTp4A58Di520mHlc5KuisBnAygr57+/iNrK08BF0gs+O/nIvn1e6uJllef3Dgvn+qABT0fZ+e1r48Rwhc0x98easzzXrvkFMeP7ZFuDoRO592YPqWpLsON8aBQrZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YulHaBjQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ba4ddb3f54aso30033a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284328; x=1762889128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=YulHaBjQLep+BxaF4go+ruxEoS+ZiTtfZh4ABv90s+iVii+093rI5CCgJfusCW1O47
         9Tj8VNSfJMJfLFLduKczLAvy7ar2TG8zjel95yMd4DsgQf8/I+BWqJ2kzNvHLN2y1/1w
         Vvw/1yH/uF4U0JmyUSrTdwlEQibdF0+YhD4nFT2WBsSd+tTTNeYVNQMzhO7NUILHpFYV
         9NlLEPK4NUu4dr3hZiD/AN6J4NO2O6AGR450IJ2j2+B0gJN9DqA0Ozy0gJCNI6sE5U6q
         cSPYtRPzT2Pkw8UcFH5sxHykLnvCXrBei2HmlCrQCrkWQhrFI3HfS1U+OL6fUHEP4z+/
         Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284328; x=1762889128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=w6lKGJcgQdLurmm1B6fnx5RPHMStMlMsZTxCCDh2p1H9tz6ICJqkW8eohQuDwoiJvL
         +/AD8FOLjasiDKR5RpUqF1aD4e4GS/gTN5nEdf11cWJB77c2M5fMbZjFF9SwphEVxTCE
         CkrDyhsAxzImv3SmlKMjr/e+BdMnQ2K1GTPY3dsGIRKwAdB3wXOFWBtWic3O9hozc1tU
         Vxv3R6mdYcMSGtjtOyxYYdPmN6N1iRceV6Sot/weuQaQ/+6X/BsqpQmb5NNXvXS3NY1U
         tpd275XVKino8OHaMZRhlQA7/P+DRPKSQ8JJCW+FJRBXtJ2mvkOuEzBo55goOVVzdgUi
         aRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpEvJPOrs7S41VRJ9vDZGvIDiH0UGc6X355MiCzahwagmr9CQpAtTh96RUuswfAr/AuIO31AVWbjWBnhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7XxUwWO5FphgHa8/mffDbZZUvn3G+VOzSDmltuY95khzKxZ+
	4xrimbguh/AwDKWsJV9YWEe+YskCaYcssdsjf0obSQ5xzgM9Lsfjy6rMVxbt06nfFSOMcBOhGZS
	fAeYcK4Wt1ukuz9gaeyaL73y5HfZkSe8=
X-Gm-Gg: ASbGncuqPTgk2HH2/vZisPGtGkZ2toL6LSZTrxo8A+JNcikixv2RiFcN2co0lUVBhjl
	H+61/DA0EncyT384fKk4tXUEXqQvsHLH1MheKjWGc1rREjXA2sJtypFZM2o/oGsU1cdW8bpyYZ/
	H3NRqhJq/jqXE3n5PDgmz+lpiUbnTGROmlxK2qhHOgGyf06L+XD1+9lVY1srZdPNVc9CXtep896
	sAPGPrlD2CdtQDLUhwyf6CU9JV701J4lJ4FHJwhvyuO7BTkR8LsNv2/M0FvzLlmz6yrirGZEqiO
	CUNh7gbBcbtczAAlaS5NkgvQpNMigO5nsnD4gOdMAxCgLSSzAJAb/+6uCUZ3ZfdSN2Xil0YTceI
	K3XA=
X-Google-Smtp-Source: AGHT+IFWzYsYUL37lFrxSC7sVl0Ij5MeA0lOHpSQOZvdZ7ftbuS95sPOKOarVGGOk6+VoduotS4rq+ThkHUUIHnXHbM=
X-Received: by 2002:a05:6a20:258b:b0:34e:8e9a:c610 with SMTP id
 adf61e73a8af0-34f8630155bmr221747637.6.1762284328313; Tue, 04 Nov 2025
 11:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org>
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:25:15 +0100
X-Gm-Features: AWmQ_bny94bBmKIB7QhLmeowyrAuyscE1LVW-SgNclTZu6rQpXUrhoj1poxn8j0
Message-ID: <CANiq72kWcptN+hu+gMwN2n8WkXrOku4kCHkSRsMzJmQeiCAJOQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 10:40=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
> [1][2] as `-Cjump-tables=3Dn` [3].
>
> Without this change, one would eventually see:
>
>       RUSTC L rust/core.o
>     error: unknown unstable option: `no-jump-tables`
>
> Thus support the upcoming version.
>
> Link: https://github.com/rust-lang/rust/issues/116592 [1]
> Link: https://github.com/rust-lang/rust/pull/105812 [2]
> Link: https://github.com/rust-lang/rust/pull/145974 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

It got stabilized and merged upstream.

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

