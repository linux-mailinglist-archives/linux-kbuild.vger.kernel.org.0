Return-Path: <linux-kbuild+bounces-5421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD3A0921D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 14:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 258EC7A3BFF
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 13:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DEF20FAA7;
	Fri, 10 Jan 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulVIbC07"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646120E030;
	Fri, 10 Jan 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516000; cv=none; b=p8MVvo3hKBFjf1PdfXx6VEv8wlL8tvmZgIvnPT+yZprZxg3yT7QWC5c+3EpypLlNP1OV3UOBWNoWHWKRPkERMfK3nKmY+yBMON0lYbYnYhP7L5G10SNrQ45FitCHRZypO9ORr7t00gOxD/EQ2dU1ITUa5qE8b6EKhzIKXspnGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516000; c=relaxed/simple;
	bh=X8lP9UXjOeljq6oXBXuy8NDfvQZaTeuGvk76WyCjI7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tCDiFSRkXIG4VWhZ5UG0HMhAeYfZXIkQ7agFn6dYnLhGw3LX0yGxfeWmrUR3ZHVHRXhv30RuB5+kD8Ej9dsz0OSMwSt6OblQWkliBMj1iwTL2ho/NusBWnzYMm4CaVYPKFjLbWvNA9kJpRQ1m2ZmrTRVu12y2YwjS13N4+eDMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulVIbC07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572BAC4CED6;
	Fri, 10 Jan 2025 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516000;
	bh=X8lP9UXjOeljq6oXBXuy8NDfvQZaTeuGvk76WyCjI7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ulVIbC07sslw4lIhw9FViCS3ihsqa99Fy8vHdATtTtPtH2rkFNhdjCFttb38PBBqy
	 xAuf7mt3T5dtcTwfIDfEKT+GeO4EFs3AfkDayTiKELJC8Qz5/NNjHhLEZ6s+AMsM4G
	 6dCqXZUniqyZN23/+gia3yz3/4MtVFH0LzelnsEsxIZxyRXLTc5CIyRZRgVHxyesSa
	 Qep+qQiJV/HavqtDy4/4mKGfGPQPwNWT4sa9ZUgfPZJTzNMXboLffkg6C5dePeDPN4
	 h7jmjexaigPrsTT3R/EQtcpIT2Xuo28i9QHScuBIVC4vspJS6C+Wv2zJ2FAzr2X7Zq
	 wOSDstbOgQ94g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,  Miguel Ojeda
 <ojeda@kernel.org>,  Wedson Almeida Filho <wedsonaf@gmail.com>,  Alex
 Gaynor <alex.gaynor@gmail.com>,  Nathan Chancellor <nathan@kernel.org>,
  Nicolas Schier <nicolas@fjasle.eu>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Andreas Hindborg
 <a.hindborg@samsung.com>,  Alice Ryhl <aliceryhl@google.com>,
  linux-kbuild@vger.kernel.org,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  patches@lists.linux.dev
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust
 targets
In-Reply-To: <CAK7LNAQkUik_VW7j-d56Pr4NnExxDnjMfWSwtxvijH4q4Onctg@mail.gmail.com>
	(Masahiro Yamada's message of "Wed, 22 May 2024 20:58:46 +0900")
References: <20240519211235.589325-1-ojeda@kernel.org>
	<20240519211235.589325-2-ojeda@kernel.org>
	<CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
	<CANiq72mcdtNie=t=HHhZnjQa7gQiDZin+TYP_7Rgi4kL83H2BA@mail.gmail.com>
	<CAK7LNASYYYsiZUaA1StD9kWO0WBC0PBPtfY7u32g94WtOPFZgw@mail.gmail.com>
	<CANiq72mzTaKYJqNcv1qT3nXEbh_t7CwaAqxCuYNcx9eHOZf7wQ@mail.gmail.com>
	<CAK7LNAQkUik_VW7j-d56Pr4NnExxDnjMfWSwtxvijH4q4Onctg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:33:02 +0100
Message-ID: <878qrig5f5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Wed, May 22, 2024 at 7:52=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> On Wed, May 22, 2024 at 12:14=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
>> >
>> > What does "everything else" mean exactly?
>>
>> Everything but the host programs. Or as many targets as possible, if
>> you think there are other cases that we should avoid.
>
>
> You can do this if rebuilding makes sense
> when any CONFIG option is changed.

Not having the ability to make builds fail when clippy or rustdoc is
issuing warnings is a big problem. I would very much like to have the
option to make builds fail when these targets give warnings.

@Miguel: Should I look into exempting host programs, or do you already
have an idea of how to implement?


Regarding host programs, it would be nice to set werror for those. How
does C do this? Is W=3De enough?


Best regards,
Andreas Hindborg



