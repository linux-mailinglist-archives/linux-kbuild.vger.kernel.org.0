Return-Path: <linux-kbuild+bounces-3989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C179966A4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C327F1F217D7
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 10:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCF2194C7A;
	Wed,  9 Oct 2024 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7ovIUWl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3B18FDA9;
	Wed,  9 Oct 2024 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468446; cv=none; b=uJ7ZlFg6PT3AIP2h1TiDRsTTFWXpXCbWlnGhy7tL7WAgBRBEOMxRcSQMPL3J3trO8lA/fRnP0rHXysPLpdhG50dkGd3lQ7OoZ7Wd6x4MdZxEaUuww9tzxHKf0Vcus6e00JWvRnwpLu85qq84v5aUpDIQrPKkmeOIB4sLra2ozpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468446; c=relaxed/simple;
	bh=wBcbiSwplj0QvZlb6nd5yQ4CAcmglFBqJz3ianANXbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCqZxY0cAFTurKmDNAx5i+TVyNVpIe2yWQ2+9DbtmqtN8xlrwDpGPgnYNYJ5CrZffXIR+3SfxI2neXgSk7/THxkThi3lEhFDUuAAtSU8nbWNADBJPmw6rbryEFQy6jmqCB0n6AjKMpAk7381gVLk0NytgXiQMJiDmOqv8dXwboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7ovIUWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E491C4CECC;
	Wed,  9 Oct 2024 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468446;
	bh=wBcbiSwplj0QvZlb6nd5yQ4CAcmglFBqJz3ianANXbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O7ovIUWlSPyNRC1DpqmUINkgdQUCnBfXmtS2A9BO3TjX1hL5u0+VFtuT9uPPsovvd
	 rfCuorrVIGw3SmkOtZO6iI7ZfpMFwXzx8aYN2b7ZMU4Jj9Y10in8dN/R6yJXL4q5Zu
	 xfWsWmPhSfeU2FiZ48nTgOTitNY7SU5oT5VqAu1FSv7KpXEp4G9hYOsFcHWtWGBr7j
	 WAQRVK2TXnUBcHdPpZ5b5XLDYoGp5OMzDyhODez5BeMzz2GED1nvM6IKfWxhWGSble
	 KWx1YLWlqos7uHvW1z1hDo/623U03iQFMXf++Q65Jq6uQLd6AYRabeTfrgNqjw4GvX
	 ah4x7PR7bW2HA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso78531501fa.1;
        Wed, 09 Oct 2024 03:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyHfsqvESAEQubZam7vXF71AHZzy3Ku2OXKOgZY0SenNs/gSw9Qzpn+x4rT4RfQLQiAPgO+VLcVu3Ja3xWePM=@vger.kernel.org, AJvYcCVMRH5M8YqSRlbldGKq2Mf625bEud+LGKy3Px56N8KvAnHMr+2H77CGc5WFrQyWzY5NDaeZdXBIglERHNQ=@vger.kernel.org, AJvYcCWgNFhADy6mp9qdXZtiehwuLbKdrHb4ce+huIZb80kMqn+k5Le3w99x335ekFMR0Pql1PMvhPaRwGlr8QHx@vger.kernel.org
X-Gm-Message-State: AOJu0YwGS23bRf2VC3Qxwf56CTjMPbytEsE4bGMSZ5rRSt2PPb6JMDR4
	P4JWMcHH1cifYuyW7W3BUGmMZchOYExOO2OoVHFgM4EM6CgpOxX7XB/3+h3cK0uagFg7tVhOgiV
	HorbuL1ZspIpA/Pip4a+WMyaklaw=
X-Google-Smtp-Source: AGHT+IH+AXmDUwuVTiTWvWLmVqKf7jpvhpWhpLkD2kL9J2l4JmuZojiq/ZAseoZ1deasg3TdqoDkpREoODAPXDJd0j4=
X-Received: by 2002:a05:6512:110e:b0:539:8a47:6fa with SMTP id
 2adb3069b0e04-539c48d783amr1151959e87.29.1728468444877; Wed, 09 Oct 2024
 03:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
 <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
 <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
 <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com>
 <CAH5fLgjwuGUpKogOVUL4+fUW0-xWM+3ZQ+WmSQ+J00G6+uR9bQ@mail.gmail.com> <CANiq72k4XcxHQitFzogyeJmX83qFbXo2hwcwPvFjWMDUYhCi4g@mail.gmail.com>
In-Reply-To: <CANiq72k4XcxHQitFzogyeJmX83qFbXo2hwcwPvFjWMDUYhCi4g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 9 Oct 2024 19:06:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrqfmMswLAg4DH_yNNgux7AqZDD1sUiP3cL9To9L5nuQ@mail.gmail.com>
Message-ID: <CAK7LNASrqfmMswLAg4DH_yNNgux7AqZDD1sUiP3cL9To9L5nuQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 9, 2024 at 11:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Miguel, can you link this issue? I don't think I saw it.
>
> https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-2218445303
>
> (It was in the Lore message I linked yesterday, sorry, I should have
> been more explicit)
>
> > Masahiro, are you able to clarify how to pass TMPOUT to rustc?
> >
> > __rustc-option =3D $(call try-run2,\
> >        $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs
> > --out-dir=3D$(TMPOUT),$(3),$(4))
> >
> > Should I use $(TMPOUT) or $$TMPOUT for this case? Right now, only TMP
> > is defined inside try-run. I am assuming that there is a reason for
> > having TMP be defined in try-run, rather than just using $(TMP)
> > everywhere. Does the same reason apply to TMPOUT? Should I add a
> > TMPOUT=3D$(TMPOUT) inside try-run?
>
> `TMPOUT` is defined already in that `Makefile`, thus you can directly
> expand it. However, `TMP` is defined inside the `shell` function, and
> thus `$$TMP` is used so that that script (inside the `shell`) expands
> it instead.
>
> This is why Masahiro was saying that the `TMPOUT=3D$(TMPOUT)` was
> unnecessary, i.e. it would work, but we can just expand it directly.


Yes. I like --out-dir=3D$(TMPOUT)




--=20
Best Regards
Masahiro Yamada

