Return-Path: <linux-kbuild+bounces-5124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E5B9F0CCC
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04B2163A1C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08BA1DF741;
	Fri, 13 Dec 2024 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBOPtkVH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13391DEFEC;
	Fri, 13 Dec 2024 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094692; cv=none; b=AeJJzKIlnmcJ91y61Bmr/kvs02zXYmlWrgmZNmbaxk2eIJfKR2l4YJrPhiyCDnq4jDNOQX1Kinu/k6Fo3dx1cwrBqd0yrtBWwXrPWMMP0OpXy8a+A92bksb7X57yoftYd75hRK3GbGkzEp0YqiEcF+vpToSxZYb/12ceU+GQ4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094692; c=relaxed/simple;
	bh=cYZBsQkXYtWALdvflQ0WF4vpHES/E8MUDzKL8MUiS2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KPswKrIvdSkFsrwJst6ZvXK3C97oES1rFnTqNrSFEnVEOndIeu8ZNxHotYc1Bn/hxpTpG6gE8FMUIHyXvzi7cJ1GjjKJ8z1gAYJa6YbCosC2hib5+szosiMk+6xJPbKPN0kY6gZn1peQU3qc8dHDdQ68ErAU/Oy2cXPIK5k/LK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBOPtkVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF558C4CED0;
	Fri, 13 Dec 2024 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734094691;
	bh=cYZBsQkXYtWALdvflQ0WF4vpHES/E8MUDzKL8MUiS2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JBOPtkVHtRB5b9gUiO6eTy+1nag7+lFyYAI5MW6pX7EWD0yibarDA2Ln046ZZaYc4
	 nVskc5sS7xGtztsbm5dPiEeEeZMjaDKJS22eKvp+G1IbXDFGcx5/l4nYEazvP6cDl8
	 QKeGYfmEkFcIKBlXalQ7dl53O85bn39sf8SZ/E9GDkbC1Yrbk0qvOLHXokhr298qyn
	 sruxsuGcvFIdzklxVSXtySP8hJ8G2WrFd5Y8IZxIlTJVu61S2mTZOymRF2i042jZvF
	 dwo3KvmJpA+aZ1tarEWo5MOvY7i8j124R1tGzpbD3awEnGp03BLgMa4M/RhbV3/WF1
	 LPk1/+z125pfw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Masahiro Yamada
 <masahiroy@kernel.org>,  Nathan Chancellor <nathan@kernel.org>,  Nicolas
 Schier <nicolas@fjasle.eu>,  Trevor Gross <tmgross@umich.edu>,  Adam
 Bratschi-Kaye <ark.email@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <CAH5fLgh+iOefU3vG=e8aAFhcKh0W=6M0odUt3s_wfDKW+rGNOg@mail.gmail.com>
 (Alice
	Ryhl's message of "Fri, 13 Dec 2024 13:48:25 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
	<CAH5fLgh+iOefU3vG=e8aAFhcKh0W=6M0odUt3s_wfDKW+rGNOg@mail.gmail.com>
Date: Fri, 13 Dec 2024 13:57:59 +0100
Message-ID: <8734ireo4o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alice Ryhl <aliceryhl@google.com> writes:

> On Fri, Dec 13, 2024 at 1:24=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Greg KH" <gregkh@linuxfoundation.org> writes:
>>
>> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
>> >> This series extends the `module!` macro with support module parameter=
s.
>> >
>> > Eeek, why?
>> >
>> > Module parameters are from the 1990's, back when we had no idea what we
>> > were doing and thought that a simple "one variable for a driver that
>> > controls multiple devices" was somehow a valid solution :)
>> >
>> > Please only really add module parameters if you can prove that you
>> > actually need a module parameter.
>>
>> I really need module parameters to make rust null block feature
>> compatible with C null block.
>
> Instead of providing module parameters to Rust code, you could
> implement that part of Rust nullblk in C. That way, you discourage
> future Rust drivers from using module parameters without making it
> impossible to have them in Rust nullblk.

If the opinion of the community is really to phase out module parameters
for all new drivers (is it?), I can maybe move the code in question into
the Rust null_blk driver.

I was kind of looking forward to having zero unsafe code in the driver
though.

On the other hand, rust null block might not be the only "rewrite in rust a=
nd keep
compatibility" project to ever see the light of day.


Best regards,
Andreas Hindborg




