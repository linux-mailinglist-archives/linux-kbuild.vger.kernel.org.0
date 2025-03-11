Return-Path: <linux-kbuild+bounces-6046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03695A5BE73
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B5F7A7CC1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FA42528EB;
	Tue, 11 Mar 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLsqsEHY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B21250BF8;
	Tue, 11 Mar 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691063; cv=none; b=V5qyAEzTn8NjTaF82mTUvs56mvoHxLZxVSmLAkvqpsmyupPiuMbxeXvJ8PpTbqYX4dnhBOCtqxUSISyNTnpRpVBx6I95dAhQC/PYga6v0w/i3tGG0uFbRy42zdHx6gQYljjSwhT1uamFwvOQxbDSAZgRtz2T5dsKr1rWctO5fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691063; c=relaxed/simple;
	bh=6o03UY2lisvmvbsVebE3RRWS0905oo5xhgPj6TZWwds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb6detq2Zk1EcJJ3ZhpQYA2Tg/DzO6o1ZLmBU8zh5nK+c8MGB8d9iYSkg9arj2XXDhDsbnZqK8b744fvsnrbelQapQpbtphJ0se6Qxwu8Ilw1Ixt4py5LwIdBGaZC+qMMQsJwSdQhSzFxc6yl9LSREONVn61RELcjKsnv1y1P8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLsqsEHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37163C4CEF5;
	Tue, 11 Mar 2025 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741691063;
	bh=6o03UY2lisvmvbsVebE3RRWS0905oo5xhgPj6TZWwds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tLsqsEHYGhVZY6sXIc0GzTeWYjltpGF3e6sGmsIlNp3+ZlS33oHQuFYUPPAg7LQ7U
	 HstlWC0Ue/UcsVjRJMKaGDS+c3Hl2ehoRfKbRcDMZi7vhuwL/LdLiFwMdhMsXor8m8
	 AG8LoPbD0X59zmMjvmUnV4lv/zjuvVX/CZhGUXL0lDmKXCMjS4z1HG47ROdI1lt/sh
	 UMbmJbB1joMG9XRnP+w2ncqGhv0t0PSU+APKB3cLPqL3kjWJ6FC/3ViaIVqSmSpWhD
	 srT2MZy7QLRdib9nTEZeH4t2rUs3vdzfBudvEU5gRqd0CgSe9YVcsRgv6X0OHyyUAz
	 a6YpCwsrkkGWw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549963b5551so4016480e87.2;
        Tue, 11 Mar 2025 04:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8t5uBac7DkAkjvx8V62jr4N7mvVHsq/P/WVu+39CZWOCDAQN2yrLNHnROlTkn56U0Hht6UXq0IzvFqIo=@vger.kernel.org, AJvYcCWa62f8Ngqkt5R/STv0EifS3+ABKKXf0YWBLU5zryDkhObPxToa13hStZKLk9dW8baxkK/HNPmJDzQIbNPV@vger.kernel.org, AJvYcCXJ7DMhJ7wtcyzx1p4XGV2OjHa/eLsU32jKYJZj7fMq0ynz8DuJr1dyYiMpR9jeriFS3eQjs+KWoKWesvgFTdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1KUxm7Iyv6OZMNHlHkkhvhQ/vZjHiBWrOXeUAqVYJ3AxVOGt
	E9HNX2MsgWP8hToqRDyW6yRXRQKSYRpDNv1F2clqXDG0ZK5mWlz6qiRvmAS8TvsiTnOYQb9t9zl
	WeY+veToYFAbX8aH1QhDG53U8H0o=
X-Google-Smtp-Source: AGHT+IER4ywfVA/skzrd5Sr+VwZpyStl81oqlaO35YAYLK024eTjoF0dpfuwBpL8A8xiB28H67prlsPO66tzqN9Y/Kk=
X-Received: by 2002:a05:6512:31d2:b0:549:5822:c334 with SMTP id
 2adb3069b0e04-549abaed778mr1108996e87.52.1741691061665; Tue, 11 Mar 2025
 04:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net> <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
In-Reply-To: <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 20:03:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
X-Gm-Features: AQ5f1JpuD3Zjc-2ACZ74uGc7WTZYgBI-CZqrB84wwE-uHK8_c2IqFkOv6W6UPOM
Message-ID: <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Ben Hutchings <ben@decadent.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 10:23=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Feb 10, 2025 at 6:11=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weis=
sschuh.net> wrote:
> >
> > Remap source path prefixes in all output, including compiler
> > diagnostics, debug information, macro expansions, etc.
>
> Hmm... We don't do all the cases in the C side -- the docs ask to use
> `KCFLAGS` when one wants to remove them in the debug info:
>
>     https://docs.kernel.org/kbuild/reproducible-builds.html#absolute-file=
names
>
> I am not sure if there is a reason not to cover all cases in C (Cc'ing Be=
n).


GCC manual mentions the below about the -fdebug-prefix-map=3Dold=3Dnew


"It can also be used to change an absolute path to
a relative path by using . for new.
This can give more reproducible builds, which are location
independent, but may require an extra command to tell GDB
where to find the source files."


I guess "the extra command" might be a bit annoying.






--=20
Best Regards
Masahiro Yamada

