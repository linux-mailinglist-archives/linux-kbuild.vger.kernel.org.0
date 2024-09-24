Return-Path: <linux-kbuild+bounces-3703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D7984B7B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9304BB2172B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 19:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFFF3BBEF;
	Tue, 24 Sep 2024 19:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="mT5uwr6l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AA1B85F1;
	Tue, 24 Sep 2024 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727205799; cv=none; b=UrLp/DBT0a1jnHRybpMnOOEghwM7lZuhKC+0TgbyPy7ugnSGjlHkQUTxKZ2VQ87qBjZNDycJE6ZTPFcGnmYTCACzWBKKISIjCa7SIUCuc/M30gqt20uSDgSt3UrApnFNBbGTDp8dQfgk9phc610uYm8bCdzQWv7e8+zg+XS28Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727205799; c=relaxed/simple;
	bh=+FHMJ6hwPtvMrBdLQmrt8NWojAbBrIxp5Zb2NmvI6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRqYt/LCIT4Uh+nK7TSkFgGXvdt/rL7dokJ7kgNVKnGmd6PasvooLNN8J+e9ZhLd6ABBn3lwSrtOHHJex5EeO9z+UE70NzGQXn8viarzpnDKue4d2RUg3udWrgB5ZSeeiE8kNLVkFSHm2FGdgHhO+tIkIkDhTPE7nruMODakPlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=mT5uwr6l; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1727205783; bh=Kff+VYEu37RPJB/1j/mf3tSijU1+C9nLFtyrPFa3P7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mT5uwr6lwqqNZRkcV6aORlqwUs1djKRH5hDIgws/UsCUp9fvUAvKi4CcH46+S5SEE
	 +m3bXkuirs+uvZEten8ky9Nmfc0r4E9CPeI5KHDhUPtY7hHaLxADK6qo78URsKfMTR
	 f9aCIqRC3vB97PHR0S6JLZwBEzIzFbqSMY51nUSU=
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Fiona Behrens <me@kloenk.de>,
 linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Benno Lossin <benno.lossin@proton.me>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
Date: Tue, 24 Sep 2024 21:23:02 +0200
Message-ID: <BAFF7392-6FE9-41C0-869A-AE69A0EA9FEE@kloenk.dev>
In-Reply-To: <CANiq72=ynULSpiBwvpau62ym0cx+WDd99T-4LBh5V_h1YCfeag@mail.gmail.com>
References: <20240913180622.1327656-1-masahiroy@kernel.org>
 <CANiq72=ynULSpiBwvpau62ym0cx+WDd99T-4LBh5V_h1YCfeag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 24 Sep 2024, at 20:42, Miguel Ojeda wrote:

> On Fri, Sep 13, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
>>
>> This code was added by this commit:
>>
>>  https://github.com/Rust-for-Linux/linux/commit/3f46885dc03ed2d750085b=
2237078a1628323964
>>
>> Please me know if I am missing something.
>
> I think it is OK -- unless Fiona recalls something:

As long as the export to rustc and the rust analyzer script works this lo=
oks good.

Acked-by: Fiona Behrens <me@kloenk.dev>

>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks Masahiro for the simplification!
>
> Cheers,
> Miguel

