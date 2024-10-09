Return-Path: <linux-kbuild+bounces-4002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707B996B33
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A972886B2
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17701A3BDE;
	Wed,  9 Oct 2024 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UGGo9X7m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6F1A2647
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478684; cv=none; b=NuZyoVfrGJx1C5/2dYsu4fjkKy2n11nfj6fm887CmVDSwmK9kd2EYdfAoUYVCFmyiV0L3JLKbwizngAWpkju1K+yS9QUAMGxI7Fs/Vubf7o/nGW4Cl1hgelevKWccIEFyCXsqT19hxuLU1vptEm3JH2oqqLLOjcuctjYahsK1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478684; c=relaxed/simple;
	bh=N9XlgsYgdaDzpCJIL5bdt4HluGbZ1wZs9jKn2AkBuyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9/LdP/ua9b1lIVlOB16uleSkPUxIa0fTqx60u3QdcbFVVKU17flGfLI/I0ckIYXWnxqPCwD89L64fRX6GILO4uWa+AlDw0hCkgvfC/7YRLenT4++JrjohTR3FiDvH8qx9dvRsvI+yGwcxyEe2tn3p5kXOSgP+Lyca9xLcVOEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UGGo9X7m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cc8782869so69431585e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2024 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728478681; x=1729083481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CClgXDoAS0kuBWpgpwfyV/Kg45iERZGCRLiHrGpvF0=;
        b=UGGo9X7mMGzLfaQ897zd0CSkzbxR4uGk/i9NboL0SceesOTanVh0d5hIsqrwr0owkK
         Lq7xqOWwymVl9N3YGjQafSrjCL+GnSZydKBu1ufh4SDhCdxOuptfD7cbOrgx11Zj7nPK
         1+EV1xYcBTgrZbxovC50racO7DL5TTCPAbILVTXbY1VtBTUJAEoJhy4PfDJIS1AEixVh
         TF4PsEIMZmq8kHWFW0Qs/OpKHuIwf7KJ8kXOD+03rPebvIVwPJfHcouCDVGReh2t6zhq
         p8sSG7qrTSGZxcWFF/tcahqpvc2rvA1mPOb0sVgVKxvPqr4cy4qatwd9QN91xJZExTdi
         ickg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478681; x=1729083481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CClgXDoAS0kuBWpgpwfyV/Kg45iERZGCRLiHrGpvF0=;
        b=g2LsUtDWcaEj4BMJN41Ar0uArpsDJW3CWBpjoVJnujfjLdHM1Q7udizhScd/GaxIYn
         cVrGw/4Yw6OL3Opy3wf94SGcdAdSlFococFrkB/DZN0en8qwyq4fF0VmGaJGCl/V9AHT
         ATKJb21siXF8T67wJSJThUE34Aj7V1hob6WNC8QCrjwJc5EMaDK04REta3rhH60PF48v
         Ow2xVdCnF4es2eV75g/OgvsvUeJ5MGhOCY7Hdl3W8TvkVOGJieT/AcxpQoPFfWZAYqy+
         9UDUHczIrPl1zOxhOsLPK5VDZbTLWiKtdutkgV+B8DeNjsQyAMZWBXEoQPXoU5auSFxv
         T+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMFq6Z6JOQnE/pO/cXyJ1OR7UkapLihWR1x1+6GkrOC3UxTsIBk7CUvIcURmDiAiuwpeoR514sy3CNnxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/tAwBgSsdXLOhRBgQe3pEJ1qcqmGUXKTYWn5EAOQ9P9ptvQ3
	6OPsPGqg0W+ulVpjic3GwlOXi2GlyuL0mj14x+mSLEOw7pDRFbpAHvBFuiJPTIW7VJXsnUDC4Tk
	x+2lcHaEo9d8JU1L5d9tIa3Q0IYz4riz+5XGm
X-Google-Smtp-Source: AGHT+IEDvJmw/dCgpQ1UuNIY/g29JR54n5Vm/s4UMUp0ArRz/RyafeAN0QYuBXpnPdPBlpXJ1FFBMzMOr63RHyN+p38=
X-Received: by 2002:a05:600c:5021:b0:42c:b950:680b with SMTP id
 5b1f17b1804b1-430ccf4de4emr16525215e9.20.1728478681133; Wed, 09 Oct 2024
 05:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com> <CANiq72nr_X4JY=LUcj14jZfcPV5=Cn3QTucYGmBTz2QdA5=RdA@mail.gmail.com>
In-Reply-To: <CANiq72nr_X4JY=LUcj14jZfcPV5=Cn3QTucYGmBTz2QdA5=RdA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 14:57:48 +0200
Message-ID: <CAH5fLgiR552+ETb0HVe1n5KqxB1vXo3LCfsuq68FEbcGrk+FBg@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:53=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 9, 2024 at 1:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > Note that RUSTC_BOOTSTRAP is also defined in the top-level Makefile, bu=
t
> > its value is unfortunately *not* inherited from the environment. That
>
> I would perhaps say ", but Make-exported variables are not inherited"
> or similar to be a bit more precise (because the external environment,
> as in the `make` environment, is exported unlike those variables).
>
> > not look for the standard library. It's not possible to instead supply =
a
> > standard library to rustc, as we need `rustc-option` before the Rust
> > standard library is compiled.
>
> The error message mentions `std`, so to clarify I would perhaps add
> ".... standard library (i.e. `core`)" or similar, i.e. one could think
> `no_std` is enough otherwise (which would be better if we could, since
> it is stable unlike `no_core`, but we don't want it here either).
>
> > The -o and --out-dir parameters are altered to fix this warning:
> >
> >         warning: ignoring --out-dir flag due to -o flag
> >
> > The --sysroot flag is provided as we would otherwise require it to be
> > present in KBUILD_RUSTFLAGS. The --emit=3Dobj flag is used to write the
> > resulting rlib to /dev/null instead of writing it to a file in
> > $(TMPOUT).
>
> "the resulting object file" (i.e. the rlib is not written even if we
> wrote to a file).
>
> > I verified that the Kconfig version of rustc-option doesn't have the
> > same issues.
>
> Thanks for checking this. We may want to make it closer to what we do
> her, but that can be done later.
>
> Cheers,
> Miguel

That all sounds good to me. Feel free to make the suggested rewordings
when you apply this. Otherwise I can send a v4 if you prefer.

Alice

