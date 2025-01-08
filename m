Return-Path: <linux-kbuild+bounces-5400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A8A05C7B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 14:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 841D17A040F
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202221F8F0E;
	Wed,  8 Jan 2025 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eHU8RraK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2520B20
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Jan 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342273; cv=none; b=mVBIUouQZWu/vEZ7Is5c0Y5SDWJDtSxQKmil55VdBKjGzdEdKG2lleRLVFMNASL5QZUut+sobs69QmuMxuV2RSz+uOx/pyFwL4OueRHOBBfATFRiYJWnaCtqzL3FpdE2IPBFpMIZN5Fup7TyzqZTrkmYR+CNM9Ntm3IQWWOso7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342273; c=relaxed/simple;
	bh=02BI73ODJ3NSY6D4g3ax8aVdb0LQ8ylGtH5GsT0GjAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQnN9lQPMsUfp1dh1mjPHSB772upMFLzQVVUE6/KUvjTDi7flU98g1sbyuU2mkXE4W8OC2bWY5Fv5cHQgTZ+gvd57/8+kwPQzcGlry0D280OcUefxJWyXKxDeYe/zuT9Nd5MpBF6UMorMpGWjxHRd/wFogwddrMLv6EhFMcEhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eHU8RraK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5463175e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jan 2025 05:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736342269; x=1736947069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02BI73ODJ3NSY6D4g3ax8aVdb0LQ8ylGtH5GsT0GjAc=;
        b=eHU8RraKbYheEvs/iNouYxQbLUUI/MmntjdoRC+44X0sDjynUzjfvATr63gL8J/A41
         yg30EdAkvKzCL0nucts+MHuHYpC8FneTQRaM0bCc8V+OlS7ivdXmRnC0D9uWu0aiOWj0
         Y37kGJ35BLNzXmlD7BYOSfGMWnQw9sPxM0B+TdvF1G3qr2LROBnsDfMnfaLGHQvXvmMm
         Vaf5egGOsf4Re25wDhESfu5mu2LHFeHzYl5sb5GzPY50iL/p1Xxj1EeWxQjdg5YO7TZQ
         xgTpY+G5XTcdCvkFU8GUEeE+nKmfdNWWgXQ7SyROESPWmXal4hQjtze7G3OrpSg0ch63
         4OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342269; x=1736947069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02BI73ODJ3NSY6D4g3ax8aVdb0LQ8ylGtH5GsT0GjAc=;
        b=VLQFOh02bi/1iroUw3XK7uZNl2Bx+zcYzs0bHbejgp13SNODYfj7OI++FbT4FNievL
         eQU6ARgHJzfoyZw1C6zx4JOmAimG/13vc2KreXJKzxLXqqYusiSfiPBA069wQMjDwsos
         YfphMhCJz0G0unGob/MQ805Xo9ei4iTgmzDkB1SlQ+smlnru//EhL967+fzGFA0rYGAF
         nVqt2Kw3CmoP++eGNyMJkIHavKe+8b/AYrwsArJlb4nnn5Z6ZiWwfPeIrNWrhEZUpIOl
         S8faJcPA3fcG66KOYtP7C9JKL4vCqmGS4xlic4tvR9LSQgl2cfCb/Fg15WmvVDe7lSk0
         rBiA==
X-Forwarded-Encrypted: i=1; AJvYcCXYy9l/9MWLPuCKPtcRxLBmX7KxdPITyxpGcXYnwt/zTU96qX1rIA985Me1JghxDVHqzRKxTOQefBhKcG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye5w5JbMw+T6Tf4JkGxplMSdH/EMSSbe912Z8MIl8jESkNSiFr
	sCwmlrgXu/jMGKKaFhYVXvLjcNotM4+V4PKc0q/f+bdvismlTc09VaXuzu7SrIgVslR9htwNT3a
	CCOYDt1S2Kw1naD0bP3IzVYEVztNsoshA+Xlu
X-Gm-Gg: ASbGnctH4i7YUmyZB+h1QsCP58L1xCTnIwqrHAcbvj+QhqFSSro7ug1WrTYXA3UeqDv
	tDcVS9W3I1eWHIUrd2fZWyJLaye7p3QkymYpKbswwoqXwzHd35NqUEtFab+JPSttSlmQ3
X-Google-Smtp-Source: AGHT+IFOtUqt8ZE1fvdPDJY3VXEQ/wCwJWbaycCPngk/uZecNoXYrtfZZhmZgi6SJsNtdyDZHfVUSZnXtn2GLhpP0A8=
X-Received: by 2002:a05:600c:4709:b0:431:15f1:421d with SMTP id
 5b1f17b1804b1-436dc2a2a45mr56793555e9.16.1736342268097; Wed, 08 Jan 2025
 05:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org> <pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
 <CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
 <87y10jd8o0.fsf@kernel.org> <Tq7yfG7Ag6jqd_ns9qvfEn2KFLl_oJxBm6YwKDey8kbCE9-rDnkN84aW29C4_w1T6FkhDhzPsLeH0XYKe2WSSQ==@protonmail.internalid>
 <CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com> <87tta9bhjz.fsf@kernel.org>
In-Reply-To: <87tta9bhjz.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 14:17:36 +0100
X-Gm-Features: AbW1kvae-a57deeGCUnHscxFVkgRcLriyMrex3mZp3VYxQYmXdcRztZgPi4Fu5M
Message-ID: <CAH5fLgjzf_C5KBd_UC4S=FS=SvR+GSO_t7NAkfRoYPAd9vZ2+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 1:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:
>
> > On Fri, Dec 13, 2024 at 2:17=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> scheduled for removal. Interior mutability via `SyncUnsafeCell` provid=
es
> >> the same functionality and it is my understanding that this feature is
> >> on track to be stabilized.
> >
> > I am not sure about the last bit, but even if it is on track, we do
> > not want to start using new language features or APIs that could
> > potentially change.
> >
> > And even if it is a feature that we are sure will not change, we
> > should still let upstream Rust know before using it, since we are
> > actively discussing with them the remaining unstable items that the
> > kernel needs and they are putting the kernel in their roadmap.
> >
> > So I suggest we mention it next week in the Rust/Rust for Linux meeting=
.
>
> I don't think we ever discussed this?
>
> I was going to put this in the commit trailer for v4:
>
> ---
> Version 3 of this patch enabled the unstable feature `sync_unsafe_cell` [=
1] to
> avoid `static mut` variables as suggested by Trevor Tross and Benno Lossi=
n [2].
>
> As we are moving closer to a new edition, it is now clear that `static mu=
t` is
> not being deprecated in the 2024 edition as first anticipated [3].
>
> Still, `SyncUnsafeCell` allows us to use safe code when referring to the
> parameter value:
>
> ```
> {param_name}.as_mut_ptr().cast()
> ```
>
> rather than unsafe code:
>
> ```
> unsafe { addr_of_mut!(__{name}_{param_name}_value) }.cast()
> ```
>
> Thus, this version (4) keeps the feature enabled.
>
> [1] https://github.com/rust-lang/rust/issues/95439
> [2] https://lore.kernel.org/all/CALNs47sqt=3D=3Do+hM5M1b0vTayKH177naybg_K=
urcirXszYAa22A@mail.gmail.com/
> [3] https://github.com/rust-lang/rust/issues/53639#issuecomment-243402311=
5
> ---
>
> What do you think?

It's pretty easy to avoid needing this feature, so I don't think we
should enable it.

Alice

