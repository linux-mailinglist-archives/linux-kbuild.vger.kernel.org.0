Return-Path: <linux-kbuild+bounces-7848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FDAF5D60
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 17:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E7316D7FF
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC723196BC;
	Wed,  2 Jul 2025 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYRVJMTW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A23196B9;
	Wed,  2 Jul 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470812; cv=none; b=cpE3HCzTcv+yk6ZjgNWneeGasROFfqVBb0nspZYsGBjubAlFyeV7ioWURVTmGtHpdZGkkNNL9W6VyJzpQEG+7HVasZXlCaz856s9/atpgizNvbMyrd3+tfXL07IXMfy3ha7k9DhmwdE18Wz4eR4lX+nWqN4nJ6Cg+S3YZPO7FwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470812; c=relaxed/simple;
	bh=Nl1aiQlqLwfjxOlqHygtp0TPczUO9+yJInOmHaoNVqs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TQLWjIxbwko5jSDQ5UgPJinjl5CUWtAmo23+Xl1re2R7JH+KZqROwHcny+8VCrkI61HE/rOmByWtbB1To5td+aLsKg/4mJmsU0ZTWk136gNZiUUEXjDrk4Qr9sdx+vfea0GT3F6LxfMbMGggq4iH6R91ukXJQvpxQ5DvaNIb8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYRVJMTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CB5C4CEE7;
	Wed,  2 Jul 2025 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470811;
	bh=Nl1aiQlqLwfjxOlqHygtp0TPczUO9+yJInOmHaoNVqs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bYRVJMTW6KqJ4prbGWr+/MLk3v69Kf43T2YYrJquE/xIK+MZJLz/d9MxhKLXVbllv
	 bTH2Bi1KC45sBKqxy0Zza5/YxJ1j+ZGSB/sIBDVHzdhVfDlFGLdCqN2Is60MVCLpcS
	 ZhQdHqA68/YTVzP8Nw8331Yy+UdkhMMj8rw/Z0fnhu0WGwPODLsPDrwJuf/ITFgWLh
	 O3F9h7+YiQY9ha9wgrbxv7WdjlxAyds/yU+Q/GhFg2JXOS4rilHZRISYqbK7azaysq
	 LASiSfOsPLArnA2RC9gzTYMA/u3a4GLg6/xkwD6v35r8BeZE8Tib5wWWjw0VCIY9Go
	 wXx9+AQXACFnA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 17:40:05 +0200
Message-Id: <DB1OL0D3DA8K.2MTH0QKQGRQUQ@kernel.org>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
 <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
 <CAH5fLgiOK-zA0qT1dis-BsrEAk96R+E8e_F_361w7kCq_uxn7g@mail.gmail.com>
In-Reply-To: <CAH5fLgiOK-zA0qT1dis-BsrEAk96R+E8e_F_361w7kCq_uxn7g@mail.gmail.com>

On Wed Jul 2, 2025 at 5:27 PM CEST, Alice Ryhl wrote:
> On Wed, Jul 2, 2025 at 5:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>> > +impl<T: Copy> OnceLock<T> {
>> > +    /// Get a copy of the contained object.
>> > +    ///
>> > +    /// Returns [`None`] if the [`OnceLock`] is empty.
>> > +    pub fn copy(&self) -> Option<T> {
>> > +        if self.init.load(Acquire) =3D=3D 2 {
>> > +            // SAFETY: As determined by the load above, the object is=
 ready for shared access.
>> > +            Some(unsafe { *self.value.get() })
>> > +        } else {
>> > +            None
>> > +        }
>>
>> The impl can just be:
>>
>>     self.as_ref().copied()
>>
>> Would it make sense for this function to take `self` instead & we make
>> the `OnceLock` also `Copy` if `T: Copy`? Maybe not...
>
> Atomics are not Copy.

Ah right... Yeah it probably also isn't useful.

---
Cheers,
Benno

