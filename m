Return-Path: <linux-kbuild+bounces-3974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53321995711
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DF51F27B01
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F04F26ADD;
	Tue,  8 Oct 2024 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pqnf+Fva"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501442139A2;
	Tue,  8 Oct 2024 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728413130; cv=none; b=Q7TkXUw3Z56GOpQd8fme7V4V3T3ZzjPV0eFbRG/a918+RgWtkLC9mPeWLgNNSC+n5VQupoCiN9N8ShjgMY76qJI9BD2++myfJW5QinKBsN2gtzW5jDHzJhDpekaaLUuJcr0iEQyjKuX0yLE5ZGzTzmcOf6vTAwKVT19wh49YuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728413130; c=relaxed/simple;
	bh=Uw+H3rtfnr1XetDEM6zm7eLsL+/Ugjx4aZEFn/e9080=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHXXJ1L7mMD/Gj/6x+Ob+CQYOTdjTgfAP/mzh7pZxTTevUcwMT2Uo+iwTdcxDRAMFIaNEr0lQbf0EExEE73VMHlWJQWGroTKvQzha0xdufziFqOHBCAebaoQuIF3OWvjkBRhJl6Chi5DrzIUDrISObNpMzTpSohUbp3YvaBXqJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pqnf+Fva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E01C4CEC7;
	Tue,  8 Oct 2024 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728413129;
	bh=Uw+H3rtfnr1XetDEM6zm7eLsL+/Ugjx4aZEFn/e9080=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pqnf+FvaQ+MHmHLzpA4S73UKtMMzJ+qBSxiSjLxpuwKwJTnBa6XGAWW2TNpQl3Omm
	 lHPw230+QihjGyj9spnh6rSkWhLhNC59jm3qJJqd7Vm1zaGPQQ25pzVp00BCowaaqw
	 lQPegNQN73ZEYgaef1WpXRbv3S5BOcJPqO3AMHeTp5RSA4NgSu5cR7FRgjMkF8k3UD
	 deKuq+ODknk1abUvwCJ5lHXZagbgthIHOimDU8Sc8U7X/Zx8sxgPzwxmvyeEC5hLFn
	 FdtQQa21N7wcXsF7PtJjk8rFVTCb2Uss8UAp1YSu3Db1rETS3R3ZHl6scs1rD85EKq
	 /Z+9ZTDRoRwjw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so8223358e87.0;
        Tue, 08 Oct 2024 11:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBiuDz6Kp2kXl28UtEfqfTXEHWqqtBSIEBBOSMrbRo3nsS5pWwJtdtxUVsTME+9TYMJ3ULKm8fKiOPFIgNzmQ=@vger.kernel.org, AJvYcCVofaMzJTkQGBonCde4EeFdMPes0SQIRjk4PnRRmes/lPtDZrWS7LhNK4iPlcNOAxke+p/67l8viRLE3Jc=@vger.kernel.org, AJvYcCX8LDG0e/eyiCPcqrYI+sDQMRKFiRIjAQIQo9T8OGq3RywXdawhrrDykhvc+yex0JUDkxIDQesmyj6ZbqLz@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOxVEE0AfpAFK5WzKPD7izcVY81w+44i+9dTr6jNg4FB0f1lE
	mVGy+rnJxgbKjj+3S+klRgxlVq+9ezjnUV8oVPBjiaMrsCa2QQnE8CDOLKhmJgobUuxzW+ouZA3
	1MDkYsPxJmp9oa4BGFA5wp8sWGiY=
X-Google-Smtp-Source: AGHT+IElksjIUxpWj179FXzMVEf8NY5zIjNvvqXxO0NK8/xQcOZTCN7/az/cQO/lHvD6Cv520+TSEyyX5GnsKwIKxWg=
X-Received: by 2002:a05:6512:12c3:b0:530:ab86:3 with SMTP id
 2adb3069b0e04-539ab84a49bmr7622086e87.1.1728413128611; Tue, 08 Oct 2024
 11:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com> <CANiq72k-Z88A+Bk6q4M5dnVW74L7u85Bqdo0ptSdvVaD6BR3_A@mail.gmail.com>
In-Reply-To: <CANiq72k-Z88A+Bk6q4M5dnVW74L7u85Bqdo0ptSdvVaD6BR3_A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 03:44:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQU8m=QrEXS2h_0Q8UNqqTmkud18zc8RM6LVPsKYM5z3w@mail.gmail.com>
Message-ID: <CAK7LNAQU8m=QrEXS2h_0Q8UNqqTmkud18zc8RM6LVPsKYM5z3w@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: add RUSTC_BOOTSTRAP to rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 11:25=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 8, 2024 at 3:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > When using unstable features with the Rust compiler, you must either us=
e
> > a nightly compiler release or set the RUSTC_BOOTSTRAP environment
> > variable. Otherwise, the compiler will emit a compiler error. This
> > environment variable is missing when rustc-option is executed, so add
> > the environment variable.
>
> Yeah, `$(shell ...` does not pass the environment, so we need it.


Really?

$(shell ...) inherits env variables in my understanding.





> > This change is necessary to avoid two kinds of problems:
> >
> > 1. When using rustc-option to test whether a -Z flag is available, the
> >    check will always fail, even if the flag is available.
> > 2. If KBUILD_RUSTFLAGS happens to contain any -Z flags from the
> >    environment, even if unrelated to the flag being tested, then all
> >    invocations of rustc-option everywhere will fail.
> >
> > I was not actually able to trigger the second kind of problem with the
> > makefiles that exist today, but it seems like it could easily start
> > being a problem due to complicated interactions between changes. It is
> > better to fix this now so it doesn't surprise us later.
> >
> > I added the flag under try-run as this seemed like the easiest way to
> > make sure that the fix applies to all variations of rustc-option,
> > including new ones added in the future.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> I think we need an `export` there.
>
> I am also rechecking this, and I didn't get a reply from:
>
>     https://lore.kernel.org/rust-for-linux/CANiq72mv5E0PvZRW5eAEvqvqj74PH=
01hcRhLWTouB4z32jTeSA@mail.gmail.com/
>
> And I forgot about it, which is my mistake too -- I still think we
> need it (and we should not use `-o` either together with it, I think).
>
> I can take a look...


No.

You need to understand who expands it.

TMPOUT=3D$(TMPOUT);

was needed because you used

-out-dir=3D"$$TMPOUT"

It should be -out-dir=3D$(TMPOUT)


Such pointless code is unneeded.




--
Best Regards
Masahiro Yamada

