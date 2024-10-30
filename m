Return-Path: <linux-kbuild+bounces-4387-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B69B5B3C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 06:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272E3B22032
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 05:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0496B1CF2B9;
	Wed, 30 Oct 2024 05:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="iBvnjoKY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4E1CF289;
	Wed, 30 Oct 2024 05:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730266531; cv=none; b=Jrncrvt+8TZkbplwjFLjO/0w6eSdKWd9thdz+23t8ut/olbSiwVQ0rfT+IRA5TbkJJ1tM5dmT2pGfDCFnf0AlkzgkK/FFSuNG+73lBJEC4QFK6mFZqOTFeSAfBXqIk7eHbUkXZqdpfcWzEKxnlZ9EdZZUrDx9Z05WxLWvucNm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730266531; c=relaxed/simple;
	bh=iNv76ZzAMBPTV4l1YgFD0Bej4qjTGYw2zGCKkGf5dtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HxsusLOWFjyLqJSbft2BCLnSQSdxO0Ovj3v/fk5wUzyM5rZiaX3qW16+7yzOOV7c7Pbns1ge3xsK4i8yO+EE8TGOYaIYxIVgO8Li7a1COu6v2hhm4kMe8cIF2lsC+bRZFyr5dpHsTRAjLkyYDm93l/iPZFI1dl7yoyHCZiL2m5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=iBvnjoKY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730266522;
	bh=fTiOGMiECd5augAVpcP0FAu96xmTgJEVxQ1j0YsCjtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iBvnjoKYWd263kXfDZH/Sh3Gw+wTz+mRV6lTEiTnUbqNaziGATw0mFF/3EToCY/PD
	 udF0Al/to8Vm7A/g41rEuux1jQmB83t1Kr6C9ZcQq4Xq/UaQGqAjDuqJV9oYMQ82jV
	 DVKSCXTurLYVR3+ooGcH3Sq/8S1VGrbDhpePRLxQaDxfhTLlnj2C0cZONLKusDrrK8
	 Up/XjvkE6J4cyUVYfviZrBdnHI4CfI/7Nodpb4xfjVNDjDyDZi2/hCfSA9SdvnllD2
	 wZb6ggjadgnszxDjHOe9PnHOTusOlD1OemAGIwvANBqjeV8PiDciNgQEVMkU1dnQnL
	 n0M/8hQTWodXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdbS75X7wz4x8f;
	Wed, 30 Oct 2024 16:35:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
 <874j50juyp.fsf@mail.lhotse>
 <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
Date: Wed, 30 Oct 2024 16:35:10 +1100
Message-ID: <878qu6dugh.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Maurer <mmaurer@google.com> writes:
>> Sorry I realise it's version 7, but although the above looks correct it's
>> kind of dense.
>>
>> I think the below would also work and is (I think) easier to follow, and
>> is more obviously similar to the existing code. I'm sure your version is
>> faster, but I don't think it's that performance critical.
>>
>> static void dedotify_ext_version_names(char *str_seq, unsigned long size)
>> {
>>         char *end = str_seq + size;
>>         char *p = str_seq;
>>
>>         while (p < end) {
>>                 if (*p == '.')
>>                         memmove(p, p + 1, end - p - 1);
>>
>>                 p += strlen(p) + 1;
>>         }
>> }
>>
>> The tail of str_seq will be filled with nulls as long as the last string
>> was null terminated.
>
> As you alluded to, what you're providing is potentially O(n^2) in the
> number of symbols a module depends on - the existing code is O(n).
> If leading dots on names are rare, this is probably fine. If they're
> common, this will potentially make loading modules with a large number
> of imported symbols actually take a measurable amount of additional
> time.

It should only be a single symbol these days, .TOC., for both big and
little endian builds.

But maybe someone out there is still building their kernel ELFv1, in
which case every function will begin with '.'.

I still don't think it will be measurable, but n^2 is asking for
trouble.

So forget it, just use your version, you've already written it anyway.
Sorry for the noise.

cheers

