Return-Path: <linux-kbuild+bounces-5432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D23A098B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBEAF7A11C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D98213E7D;
	Fri, 10 Jan 2025 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSfPPwGv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C89212B17;
	Fri, 10 Jan 2025 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530727; cv=none; b=r93UYKLO67DLTZfCdiNqOkBOsjGAcIdi9I+t/ycUOC6uf2JDnJ5PmGz9CkJK1Ebu5DzABUXR/vlnkhJU0yHzdl2BTUtSAvZJORsPkWPTRfhd3lqn5+NHLVkjy6P0pryp9o1BAgDxsskHUsXd0Tsza1Y7gQuEeZdlcpILyQIlMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530727; c=relaxed/simple;
	bh=RD6nZV1XtAPWMC9dEZfIf2cqcyFr6kW2Ap+29KyEOFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0FZAIXnClkmXM897XavHxWtXEJYtmA0Saimkw7PBE832h3jiLiIm1woJgZ4k8MJq+aVkvEN3ipVHcE02tqT6vlHe6iTUdkg4TJP+2dD03MudUlVMkNA064OczeOZQrrZx61QkRPlSBmZnoiTbFHivQ7speR40kLbqkmZd6/l78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSfPPwGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27683C4CEEA;
	Fri, 10 Jan 2025 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530727;
	bh=RD6nZV1XtAPWMC9dEZfIf2cqcyFr6kW2Ap+29KyEOFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YSfPPwGv7C4m3Vg7Q31vn4+yQY5y99PHqI1t9URfjH0psI6NRYtfeWQ76G/Q79wIa
	 Ge/9OL0HHJKGF7aDPuFO75Y9AaYgA17po7HEQpXATAOxyDJ5c7DgIzwGvJJXSWIvzL
	 rh2gSYD8e+82wuKaPFzg6Ln78lcMmnBwYVQxabs/HRelCXuk29u3V7DjPEgDe/+8uY
	 W17vuCJJts5mh0GnGi9LH7y6kaKrFTzeg4dvRANUTzqMjm1WWN0T82KzWwxFP+4Ymd
	 kXYZptgGGtfRu1Q+ckTuffp0qrikqr+14T2pweQ54TFruSrXcibeReOZZDorEioCM9
	 BCp9VHIy1X4Mw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2298124e87.2;
        Fri, 10 Jan 2025 09:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBv9NXpF/X/PxLJ7ul6JxOl7vAIbnvIlw0HfnQmKirKorRQUzkpsxw8VvotrA15RnyP031IBM1aBFAa1LaDQ==@vger.kernel.org, AJvYcCV+TpwfQRgoXeLqdsEyW3Xp/TxgV1DVKHQeqLbzAk3zFaj9DG0/c2ypSSZ0rhIjYy3ZRbnqpGVoOTEeWUeXI9Q=@vger.kernel.org, AJvYcCVkOYKYT2wYjuEaW6WwcAE6RTlCb6dTD8qojXVd1EYwDEnz5HwndiVPOfHcZnEjUyeChtwPYeCGbx1Ppa8K@vger.kernel.org, AJvYcCVqX11JFKLps4UB1Z1etQ0hmCb6XMZ3T8UhhhWsILVOgmNfzycRILXPDhkx0gxgTung7W05p0/825Y=@vger.kernel.org, AJvYcCWOL+7tsj4vpj2UZKAr2hddGrrv4g4hj6yumgGEhMMAsIv6tr0ISC69atqinksN8uzmY+HUfa8geFPFM7AD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQmXxipdc9J/ypbI7FiGQqmIpOt/iVGTqujdt+KkHZTBqnBC2
	RZq0Ic/PmGt/l0rbWx4A/C5pW+T2A737x8g0BgNMkV2Qm97Zf4FgVa6Lu8BALumYhSOTBwTwTGC
	K2Byglt6P9G0ww0ND08M9FcyoJ/k=
X-Google-Smtp-Source: AGHT+IFDj4e7Qdk/CVrOBd4VzNqB9OZxNuR4FJLEDyAVOab6ZdZEbgzo0h2oKJsV4Ny6JXL/f8VoeR70ySCzaDQuN2I=
X-Received: by 2002:a05:6512:a8c:b0:542:29a6:db5a with SMTP id
 2adb3069b0e04-542845b1fdcmr3674248e87.35.1736530725759; Fri, 10 Jan 2025
 09:38:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:38:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATi1cAH5Gmp0Q=e5tdhVcCW1mACnCKSPuHke4A_VnEczg@mail.gmail.com>
X-Gm-Features: AbW1kvZuf7C0InUFz8wtQFKA4D5Ukm8tL8xvzKpSnzBouaaarUSzvSOupLkZC14
Message-ID: <CAK7LNATi1cAH5Gmp0Q=e5tdhVcCW1mACnCKSPuHke4A_VnEczg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Extended MODVERSIONS Support
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
>
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
>
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
>
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
>
> Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
> but it is enabled by default when MODVERSIONS is enabled and must be
> explicitly disabled by the user.
>
> Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
> unable to retrieve CRCs until they are patched to understand the new
> location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
> be unable to read the CRCs for long symbols until they are updated to
> read the new format. This is not expected to interfere with normal
> operation, as the primary use for CRCs embedded in the module is
> load-time verification by the kernel. Recording and monitoring of CRCs
> is typically done through Module.symvers.
>
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
>
> This series depends upon DWARF-based versions [1] and Masahiro's u32
> fixup patch [5].
>
> [1] https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@g=
oogle.com/
> [2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org=
/
> [3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@sus=
e.com/
> [5] https://lore.kernel.org/linux-kbuild/20241228154603.2234284-1-masahir=
oy@kernel.org
>
> Changes in v13:
> - Fixed up missed s32 usage (Thanks Sami).


Applied to linux-kbuild.
Thanks.




--=20
Best Regards
Masahiro Yamada

