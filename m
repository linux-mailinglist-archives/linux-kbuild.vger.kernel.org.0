Return-Path: <linux-kbuild+bounces-1710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B698B5C30
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 17:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D93B25B95
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 14:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326F77EEF2;
	Mon, 29 Apr 2024 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frAOm+qO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF96745C5;
	Mon, 29 Apr 2024 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714402640; cv=none; b=kJsZ/lOVGAUNdAaXrl3dIPtzpr2KyIeB7+Y7UW8XS6stExCIRWko1y7wcO+7BLpfP0TbQcIqFiSHGGqbbQRgBJSZkUqIylFKKAbBzPVYeV+JjCkq71HguzgNR/oQMfGgRfK5RnPVsRTLjPuzrvefLJzpzwCGiXBJuVoNQxnTsfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714402640; c=relaxed/simple;
	bh=2qC86aClp0UtN6uJjiF7wrJwhkXnl+N3MLCJdALvAic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fojDJ43nm/a0/OHzABSMZRVhecinImgLRmsAammr09mxgi6lPBuHTQdFG4tI25ELo6HQlvGiOhQusAlWl+ArPCJADJ+ezCR/FtHKjak6mJr5Qv4XgX/qXIWNDwwxTsGQne1pH+iyDSo1qFJfxDnZwVy0oSX0pgR3jtqGELvr4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frAOm+qO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93829C4AF14;
	Mon, 29 Apr 2024 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714402639;
	bh=2qC86aClp0UtN6uJjiF7wrJwhkXnl+N3MLCJdALvAic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=frAOm+qOBdq/+zsIZYbKbeAw+ChK+TWscpEmCKx33CY86ycVN4YqR8RqO6OqSYozQ
	 0PczU9hTDMlBE0hx6LPBuHnnDodXyb7rokpy2OSV6BaWA7S9vxv/WP/aYYNdCu/oZr
	 xQsFSBySIBcKEemmhcVOGjN+FkhRfImihCHuk3DRjPQKSbNaj8r7gzjd3x3VewPM/h
	 /OEqXGcHNzbnm/7Mj1Vm3S/ZpoKsLN8D5CR3Dd/vIJSYDLb748F6NrLsu5OYjdK+10
	 m48mWUwGtaRArgXyNkM+4GS7naHIS9sRN/wPaYR0nstgpdze80xRHJ9YdUDjxJB+m/
	 dSXqUSmYzjcgg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51ac5923ef6so4085816e87.0;
        Mon, 29 Apr 2024 07:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb4khy7b7/Tol056rgcsvx9h3D5ym/eLq0RN1BqAY6Be4jBVj+/mvpaEtY2V9VLIDama9wdV/X38px7XYoZTINKpAvD5Zg51NtNZxeCmlU+NLCbbjy/mvh1TUKBxQR6uYZm/oL7JHoS1beR4o=
X-Gm-Message-State: AOJu0Yzi5Mh0R3b01cx21ij8bZGrXPTqiJyrmdj4S+k4+HM6QC54QNMg
	m3YjJcEQJ0FD+FO68fftLTCXeX3z+gE1mSL7FXSn7qk9Po0rUTrZoeF3sYpXRr8kKbovoBKX+Jh
	yABjPEjJOLEjNFdxMxdHyiUgKOMw=
X-Google-Smtp-Source: AGHT+IFId4C/5vntU+4Nd9/wPykz9KWIxkh1WI+LuPtX4sGwhNqAbERmLkR68d3VsAcM5KF3EjsebX0FdfwHbwWOTg4=
X-Received: by 2002:ac2:42ce:0:b0:518:f4e9:201c with SMTP id
 n14-20020ac242ce000000b00518f4e9201cmr2014891lfl.16.1714402638290; Mon, 29
 Apr 2024 07:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcniXsneeNs+Hfr9PScU2aYPyvn6re=5T0Cu5dgAa4N_b7m4A@mail.gmail.com>
 <CANiq72mzHj+4pB4F5FbuyKVP7o751LxHosNeEu4UhHyWqwOmdg@mail.gmail.com> <CANcniXtiRnNjcFCwfJpUrnnheep1ZC8yPuCsC6WJSWHgtHQa+w@mail.gmail.com>
In-Reply-To: <CANcniXtiRnNjcFCwfJpUrnnheep1ZC8yPuCsC6WJSWHgtHQa+w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Apr 2024 23:56:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATt14bK+Fb0AKtVMZb9KoZsuCYJAnZsZmy4A_8NUvXGvg@mail.gmail.com>
Message-ID: <CAK7LNATt14bK+Fb0AKtVMZb9KoZsuCYJAnZsZmy4A_8NUvXGvg@mail.gmail.com>
Subject: Re: Problem with rust module
To: qwer trump <vivazsj@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2024 at 10:01=E2=80=AFAM qwer trump <vivazsj@gmail.com> wro=
te:
>
> Hi=EF=BC=8CMiguel
> Thanks for your reply. I really have this config enabled.



Then, you were attempting to build the rust module
with CONFIG_RUST disabled.


RUST depends on !MODVERSIONS.




>
> Best Regards
>
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=8826=E6=97=A5=E5=91=A8=E4=BA=94 19:26=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Apr 26, 2024 at 11:46=E2=80=AFAM qwer trump <vivazsj@gmail.com>=
 wrote:
> > >
> > > ERROR: modpost: too long symbol
> > > "_RNvNtNtCschHAZg3Q02y_6kernel5print14format_strings4INFO"
> > > [/linux-rust/samples/rust/rust_minimal.ko]
> > >
> > > But I see there are many long symbols in Module.symvers. So I guess t=
here's
> > > something wrong with modpost.
> >
> > This shows up with `CONFIG_MODVERSIONS=3Dy`, but you should not be able
> > to enable the Rust support if you have that enabled (until it gets
> > resolved, see [1][2]).
> >
> > Do you have `CONFIG_MODVERSIONS` enabled?
> >
> > Thanks!
> >
> > Cheers,
> > Miguel
> >
> > [1] https://lore.kernel.org/rust-for-linux/20230111161155.1349375-1-gar=
y@garyguo.net/
> > [2] https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mma=
urer@google.com/
>


--
Best Regards


Masahiro Yamada

