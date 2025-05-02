Return-Path: <linux-kbuild+bounces-6861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB42AA7140
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB609176AC5
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A78C24678B;
	Fri,  2 May 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lL/xHF60"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C63230BD2;
	Fri,  2 May 2025 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187731; cv=none; b=n+l9Qt2i/ZUXNO4BdUUwyBnHQAUxnSXYSWq0oO4Tl+LpexK9NwcYwTR4FsWFuS0TTgi2tkCB9UKP8yNpyy+uSWf9WuruB0TLhZG+NA35D9GIYP0u7IH40y0+udg7kWQj/reBKbqhgN7r7uWbeuf+md0TiSCh33uNUPa58lCVaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187731; c=relaxed/simple;
	bh=RZEn4O/5y4HX5EifU5+rLuX25Zd/HYiXN9myaTASpS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TAUbK1mOea9jVf/+p0qFbSXy1qL5lZOgwzZjRco4WhSFBntWqf1M6nKTSPKFb1Zfj8mizSzMgcRC6Y+PjLmbUi5a5CPXF+1QjnbG500rBzuVhhtjs6ETXgKH7CdpxPLPupJO+jlyKGAH/f24V4MnS9ggBKPICF7aZBa5iYI2yOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lL/xHF60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D218C4CEE4;
	Fri,  2 May 2025 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746187730;
	bh=RZEn4O/5y4HX5EifU5+rLuX25Zd/HYiXN9myaTASpS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lL/xHF60eFNkc5d2C01tO1Br6wP8mGe3IIVJlv5fM0t5m/tj6GUGX+wZwRF0ePBtX
	 4pxb5MVsFTBUfvAeGy+nMLW8MYAGzZzxJwcyo5FcLkta/9t5BIbWzpKRY0sPlFWaOt
	 IlDRn1ttudc7X82IEn/9QfV2G17C/upypXeKTY048EYMW6ddXAmZ1yxS3LMAfSGgOA
	 kaMzJiZQms+kVIsC9x0+VZ4BB8ps/P7wrai+vjhr0tPD+Om72dCwM4E6jGEzCEgXIG
	 PtSSJRsHwqKhPmra3hvWCHBnxzJh29rOx9KC6P2Me0RxX4k+gEt1L2xi3kR92Zh7aS
	 fnUEmsYzAL+AA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Nicolas Schier"
 <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v10 1/3] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <CANiq72=_gheZdZmgwoB2q6HSssoXLk4TRkJVagJKjmFTd+LDcQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 01 May 2025 11:47:19 +0200")
References: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
	<20250501-module-params-v3-v10-1-4da485d343d5@kernel.org>
	<GV-3iFXmYRNq0drIsxo5B7gSpLXpEb4FH6lqd_TVr7tcpFcHLuersTVISYWomKIeV3xSZ0P1HFbRBNzD_ZSXFg==@protonmail.internalid>
	<CANiq72=_gheZdZmgwoB2q6HSssoXLk4TRkJVagJKjmFTd+LDcQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 14:08:38 +0200
Message-ID: <87v7qjxlix.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, May 1, 2025 at 9:55=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> +pub mod parse_int {
>> +
>> +    use crate::prelude::*;
>
> Spurious newline.
>
>> +    use crate::str::BStr;
>> +    use core::ops::Deref;
>
>> +    /// # Examples
>> +    /// ```
>
> Missing newline.
>
>> +                    // integer. We choose u64 as sufficiently large.
>
> `u64`
>
> (These were all in the range-diff :)

Well, range-diffs do not apply, so some manual interaction was required.
And I don't have the same built-in linter in my mind as you have =F0=9F=98=
=85

I will respin now.


Best regards,
Andreas Hindborg



