Return-Path: <linux-kbuild+bounces-1922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C667F8CC0BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 14:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F219F1C2178F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551D513D61B;
	Wed, 22 May 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHwfFnIt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0F757FD;
	Wed, 22 May 2024 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379189; cv=none; b=o5qt9NCl51Zk4UrvN6dQxA3U5e3GjlE6mSho8YpDmhCOPJICa5pNyvr2GEBBjVDOGeMMyZ1BDo7HgJO9t+2hXkXymq6vsp1IueBHq2nM4INUDSrvrQdMxm35trbJmdkkO2kFs4A2j9DL6nKL9KEf1d2Gz4E6rtkBrk7k6pQ0BcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379189; c=relaxed/simple;
	bh=cuGc8Pu9YBooy2bz94a0RDTpxwgjGmzp7A3RCV71uBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urRu4HFSjjiGFy+qSpPouxgCSPI2C4S7p79Z3zK4+ttRJzF8m0lA9v2Drw/8yl09W1dM5jtXMU+PynyQZTjSswfeSqpqNkcH8Z+ESVZLems4a0JYc5LM+uMhOdf+YzL1QX26QYjwzwRr/HonjZfotkDDGLoDL5Fh1Uz+x9p+2K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHwfFnIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF304C4AF0C;
	Wed, 22 May 2024 11:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716379188;
	bh=cuGc8Pu9YBooy2bz94a0RDTpxwgjGmzp7A3RCV71uBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RHwfFnItv8LD2taa6jaAHrvWT+XxrJHlQkuHnzdBaZEWjmpHvJ7bsc48naAGRt75Z
	 H6T46K610TUzNEtMko04OEKPCrT5OJgSFokQqAzbx0RvDZjMGGmpPglKwHDJOyYsuz
	 5jJF93jH4oR0Z7eolRY+r0QNejd54D18pG06NILDfFyYY58DEX2dpDL0BDwVdwTMei
	 Po1rPAPfhhfd9/tPn4i9dn0d7kLtIdBypuxlEzJqvPG8dmQ9dbWnbOySsAjNB711VC
	 h2ZrAJ+B0vY2GqK2Za9tUd/FSwV4lopxx0kXM6Uv81DDG9kcOCCTyxOcIzx+mB540R
	 c4Kbhshiz7TAQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572e48f91e9so11183232a12.0;
        Wed, 22 May 2024 04:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlnMrn7obYEDIcDBR/NQa62ReR+e679myHHJQAICzoQUbHeJTuUX3CbBVcYOWWub6rdMSQYxBxCKbdXbagp7ADruS9FCc8CPEem0IWh2VifXKKCY7fWte+MZVBfipbGl5RhvAiZRsfojac3vBkAPTAzDVxvsqkHxUWTfo2FDoKeqjzgOE8yqFYshs=
X-Gm-Message-State: AOJu0Ywfd5Hdmz6PvQmeRBk9qYg3waznPoGaVDB4z6YESQkVPcF5qf6w
	nvFxK0jiNZNJ8QGPPCT0o0OM6BLrdA+wJt48OP+FlhxymSM/YooTNtzdJUY88Zy8+hYyaGGNiU/
	D/HbdUuZZHHx1vviGPqCxJcx83zI=
X-Google-Smtp-Source: AGHT+IHk+CMXXdznhyC6NiX8Q4L+PrjPhLJ1J+2v+YFGNPc4PubPHIgL3xICBwAhXA6j3E+g1zBDCYvwUlS7NAzH8MA=
X-Received: by 2002:a50:a6de:0:b0:575:899:d6a0 with SMTP id
 4fb4d7f45d1cf-57832abb39dmr1207229a12.23.1716379187716; Wed, 22 May 2024
 04:59:47 -0700 (PDT)
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

