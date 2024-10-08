Return-Path: <linux-kbuild+bounces-3980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D9995843
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1DE288784
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9745B1DF99B;
	Tue,  8 Oct 2024 20:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1W//qBN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91D2905;
	Tue,  8 Oct 2024 20:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418698; cv=none; b=BVfd4sv52rVBywF8l8IcsE9BNfLzfbs73oxtBOkI3BR+026SizbAEc0s6ADln5d++N05W/pu4h4pUZjBwGtDNMVZ1qlm3yJ94P0TBBG0ivPU52nrtf33epeL2sqYsn4GNn+QR6pc8ePn8XS6voGWOMB9Ujrd/vPLKT9C7AK0O/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418698; c=relaxed/simple;
	bh=pORIhZtegzimHlEuxnl0uRW3ZkQC+8hI3a4/aUi1e+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVFT4CFsbyJnjoWI1r+afiMX/0KMCI+1mZsc6hCwrKkrVdD4ycHMYTHnHBIyzL1doY5JdwD5d6EN8lfqh3Y2Yle0szNW2ohc3onseCps0zeS7Fzr74dYkyVrAigAsmAmhyhz/AX2sw4oQk9faK6wluKLkqjBDCR4WiBepCFo0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1W//qBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46ADEC4CED0;
	Tue,  8 Oct 2024 20:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728418698;
	bh=pORIhZtegzimHlEuxnl0uRW3ZkQC+8hI3a4/aUi1e+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F1W//qBNBIrozvKcwamd10uy5xeBE9DihBlvVjIGxTWVx8eTWbJW3oD+2hE89MFxL
	 DeQ9TqzP4HRSkBn55i4GogtWUfN83VvnLJVNG2W5DddnmlR0lMDA61dpvTYuxYjVPv
	 lIbBnST43dhBTYQFUqH+GmToWENEsE8FMiddbb5sx+mzMKjJEnmFQU6R6JDf9pekYy
	 UlspadWmf0qYgcMODsGfWxPlRul+77QWtMcbdRV9etdCJksiBqUSSoL7z143bwA1Q2
	 gK+2FtREQTe3BC4AEf3mxekvVlhS4DwSNxY/S06dtp39CR6FA3oXFKzWNAB5aPWBhq
	 mQtF4FAAO3V1w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2facf40737eso67181681fa.0;
        Tue, 08 Oct 2024 13:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUBMuFQef/HCx5LWsPeUXVGNTO+xWzq22bibNiA84Sfrbb+u1wyc2tcXgrs0JKrgy+E3abWiXZ72yNy5nW@vger.kernel.org, AJvYcCVStrmCDxLFNNybQu8j7ptYeuGmaiZXpQ6ys1CWdYTpFdGDbMFrI/L+wBACGmmt9bZarjFNozixaM0HFT4=@vger.kernel.org, AJvYcCXK34vWHDsnfD5NwwkCdkDEnrjriL4UJ1oWsA63lI6w1PHaWbneru5gSXXATwjHtt4xEM5LsUGoVh0yNv5N0/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWcVQ7WPVbGCqtZnrVc8qQNWjAUh/yKdalYmU6kaIp/0IUESp
	/yXggcJ6+5wZrr+Y6nYZaaTCCiOzguuV4SK5a4PE+N2r6jpQ4wm/T1nF+u8yYrBioufL1TD9i4i
	8yfawIkCvDjc+LsTQhg4d23yO4fs=
X-Google-Smtp-Source: AGHT+IEFzyJtTh4Uv5EdRNZ24nxcmGNTs6sECg8IKzBtxMaY8Mv15BVzVq5hGDvYovu/lPrqA1w9XtBZWRjWK11CQl4=
X-Received: by 2002:a2e:4a19:0:b0:2f3:eeab:7f17 with SMTP id
 38308e7fff4ca-2fb18801681mr1303771fa.41.1728418696915; Tue, 08 Oct 2024
 13:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
 <CANiq72k-Z88A+Bk6q4M5dnVW74L7u85Bqdo0ptSdvVaD6BR3_A@mail.gmail.com>
 <CAK7LNAQU8m=QrEXS2h_0Q8UNqqTmkud18zc8RM6LVPsKYM5z3w@mail.gmail.com> <CANiq72mCuqCE3fA2jgaaA4fyj1kNzYm61C2600vAf0CT5=JP0A@mail.gmail.com>
In-Reply-To: <CANiq72mCuqCE3fA2jgaaA4fyj1kNzYm61C2600vAf0CT5=JP0A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 05:17:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDkS6uAHcdyZatc2SB7A66TWGfKZWNkYOoa7i3jo3QqA@mail.gmail.com>
Message-ID: <CAK7LNARDkS6uAHcdyZatc2SB7A66TWGfKZWNkYOoa7i3jo3QqA@mail.gmail.com>
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

On Wed, Oct 9, 2024 at 5:06=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 8, 2024 at 8:45=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > Really?
> >
> > $(shell ...) inherits env variables in my understanding.
>
> I mean the Make-exported variables (not the external environment),
> i.e. `RUSTC_BOOTSTRAP=3D1` that we export in the main `Makefile`. Those
> are not exported into the `shell` function.
>
> However, it turns out this changes in GNU Make 4.4 in commit
> 98da874c4303 ("[SV 10593] Export variables to $(shell ...) commands"):
>
>     * WARNING: Backward-incompatibility!
>       Previously makefile variables marked as export were not exported
> to commands
>       started by the $(shell ...) function.  Now, all exported variables =
are
>       exported to $(shell ...).  If this leads to recursion during
> expansion, then
>       for backward-compatibility the value from the original
> environment is used.
>       To detect this change search for 'shell-export' in the .FEATURES va=
riable.
>
> And indeed:
>
>     export A :=3D .PHONY: a
>     $(shell echo $$A)
>     a: ; @echo exported
>
> Gives:
>
>     $ make-4.3
>     make: 'a' is up to date.
>
>     $ make-4.4.1
>     exported


OK, I reached the same understanding now.




--
Best Regards
Masahiro Yamada

