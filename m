Return-Path: <linux-kbuild+bounces-1921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EA8CC0BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 13:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3F301C2137A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68E97E101;
	Wed, 22 May 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcnbO8mX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488C757FD;
	Wed, 22 May 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379184; cv=none; b=f/52TquhnAuNeFI9XGI9/PRih+qtoiPcjikzmwK0Ry5vsfDMCYsCMbxshQ0E/X1v9s+Agzi8uZCP7MwwyTcri+TVPfxfm7NUSNOGXM0Ye0pS0uKyeZsK/ZHJXporLMIUgYZPIgX1+GBnt1AXXb5HPAjPfMQ5N9ejvbAA421azEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379184; c=relaxed/simple;
	bh=cuGc8Pu9YBooy2bz94a0RDTpxwgjGmzp7A3RCV71uBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8WiGbyaSQBixlFRWV/WMnWU/81VurSjDfzE40kSygx/S0OfSUD9jI0B9iPcO5oHpdFszktQKZM1WIuzWZ+n1lC8506D0gfXXF7TLmyw5l7SqHxRoZGeYW16ZVuvgcCW8vRJzDy1BgaNI8FOKd6zSycQNIa5aF8JwQPxzoq6sUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcnbO8mX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B298C4AF0E;
	Wed, 22 May 2024 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716379184;
	bh=cuGc8Pu9YBooy2bz94a0RDTpxwgjGmzp7A3RCV71uBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hcnbO8mXFpIc91wErXvGslZ3sgAyS68n+Y5nJuYxtxXdpA92NNES6C4Rd2jaQr4Ye
	 XerDk0Wk7MSFONF2RF7Pq/6qN5F4Gk6qI72QMSHhTOOiqyLurtWb6KtAEQpCo5FvW3
	 SQmEGrFlAHZ5ZvVCrjv8l2LEssQWura3MVi+J2W/yc60fhDk12N4LC/M6MSmx73uyl
	 XXbX1O6HEZ32+bBS+kL2DewIh+hJdSORh5Yw2DdMYi3wBu44suBRmMLpU5oxWH63Qx
	 RRC9WChlu4vOeiYIjRAfssZC1fzcVO7Xfn3fXNdnlXpBnS4O8pNuDo0rzLz+/40/oW
	 mn3THbRU1bZ+Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so75567341fa.2;
        Wed, 22 May 2024 04:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeqQQFtj9EcIDpg2KdDFI5/5JA/Fz9dGZIFsBwNymOHLHhElZju/3GiUodwLj5etdumDr/+kZ3EG8u/DwJNVlCAQg+a0ULOcwnJ38Q5ARoeKtlWX2D7TGAFp6dGGaWNR9SdPTptxXTz//VRQ17UL/bopV9AroMDgHTAnJ7A1xa2yRVzBp/9S7JAbc=
X-Gm-Message-State: AOJu0YxJsLh7f6T5NiwU+/rEFKYQTsvfNs5sQdAZRfb3PYJFL2vsOJEO
	9ZVhZOIE0u5zuPhe6lodrPNS9Jk8Jzpd4biPqyRrYN3ryKiG9Pewd1TuKsXLHmKe6dsgC6RxYMe
	qGdzX6dwMC0szPA28obafC7syQKU=
X-Google-Smtp-Source: AGHT+IFPDTl0Xas48io8ucKnx9sinCtylTniInZ1t2wKyn685dcWLc2Vn6GNhQryETbGWnVDTr0biA4YngfFKpJz2nY=
X-Received: by 2002:a2e:8904:0:b0:2e7:1bb6:2e8b with SMTP id
 38308e7fff4ca-2e949540f5dmr11986731fa.35.1716379182789; Wed, 22 May 2024
 04:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
 <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
 <CANiq72mcdtNie=t=HHhZnjQa7gQiDZin+TYP_7Rgi4kL83H2BA@mail.gmail.com>
 <CAK7LNASYYYsiZUaA1StD9kWO0WBC0PBPtfY7u32g94WtOPFZgw@mail.gmail.com> <CANiq72mzTaKYJqNcv1qT3nXEbh_t7CwaAqxCuYNcx9eHOZf7wQ@mail.gmail.com>
In-Reply-To: <CANiq72mzTaKYJqNcv1qT3nXEbh_t7CwaAqxCuYNcx9eHOZf7wQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 May 2024 20:58:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkUik_VW7j-d56Pr4NnExxDnjMfWSwtxvijH4q4Onctg@mail.gmail.com>
Message-ID: <CAK7LNAQkUik_VW7j-d56Pr4NnExxDnjMfWSwtxvijH4q4Onctg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 7:52=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 22, 2024 at 12:14=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > What does "everything else" mean exactly?
>
> Everything but the host programs. Or as many targets as possible, if
> you think there are other cases that we should avoid.


You can do this if rebuilding makes sense
when any CONFIG option is changed.



> > Why is the .config required for generating documentation?
>
> `rustdoc` sees the code in a similar way as the compiler (it uses
> parts of the compiler); in particular, it processes conditional
> compilation like the compiler. So we need a given configuration to
> generate it.

Surprising.

It potentially generates different documentations
depending on the .config file.



--=20
Best Regards
Masahiro Yamada

