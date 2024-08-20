Return-Path: <linux-kbuild+bounces-3106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDF957B96
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 04:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 717DCB214E3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 02:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE003381A4;
	Tue, 20 Aug 2024 02:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="E2yfneeX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6811C6B4;
	Tue, 20 Aug 2024 02:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724121990; cv=none; b=PoPESEdJt+LiwTQlGpDKdqnWIO2/SV2evdrKxcQiI7TFX3qzT7qidTBWdEcdQ4VcaEKtjJFK/uldiUJWe23LUYT94GrDn2Y8o7Ao+WCzLMOKCzfk5a7mGXk3QppXvClbGi1lNRzoA7TDbh/ERkAuD5HP7JqzPaE3zi5QPEUeqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724121990; c=relaxed/simple;
	bh=8TS0uracIC8varmqf+MaZ6AfHrQ8Ib61Fw/7CChwcgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r5P9XRx30iF3c/be/9aHbmO4qYzclUcMKvdHtozDzWWtsDqpn3W1514DZSaqKzI/AZdtemwIPTGKqHGwCd5D1nb6hxayh6sn/OiVruMhEQTdv4/Hexh5AtYQcRpvL1qDN3b0dmwnHcN9iOWaq2ExprqLJaERSPakY/65WkHAdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=E2yfneeX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724121987;
	bh=8TS0uracIC8varmqf+MaZ6AfHrQ8Ib61Fw/7CChwcgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E2yfneeXxrvfHg8GYHkTYxBdI76bEnuGlExoEN4PVHAvgR6CMMkbvD7QCW8Po51Ab
	 W2y5WB7Hqk1J6y93pfiVYUUB16NzeGSbyX0B2lNaDJftTWeX1H0uBgqoJCQpuivsQ2
	 1EMGYI3kVXsYz2ZoFL0SxPdjAzSrSrUgwT6B/zsBbVOQspL0vsMdZieYZhX9xkssfI
	 tzlZ0aFoDfJMfxtLp0ef9W1B6iWrZHv/6N7PxpLzbqSERKQ0swCeAwcdszFVWSXSOi
	 HNSvpapaGOjuGLer4braR93wtId1Y0g4ZRs4E9E/aX9q63XS2iNDYLk2xyzPCdq4lt
	 BbAGROjV/nmwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wnv410TKjz4w2F;
	Tue, 20 Aug 2024 12:46:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
 gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
 j@jannau.net, asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
In-Reply-To: <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
References: <20240806212106.617164-1-mmaurer@google.com>
 <20240806212106.617164-15-mmaurer@google.com> <87le0w2hop.fsf@mail.lhotse>
 <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
Date: Tue, 20 Aug 2024 12:46:24 +1000
Message-ID: <878qwrud1b.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matthew Maurer <mmaurer@google.com> writes:
> On Fri, Aug 16, 2024 at 4:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> Matthew Maurer <mmaurer@google.com> writes:
>> > Adds a new format for MODVERSIONS which stores each field in a separate
>> > ELF section. This initially adds support for variable length names, but
>> > could later be used to add additional fields to MODVERSIONS in a
>> > backwards compatible way if needed. Any new fields will be ignored by
>> > old user tooling, unlike the current format where user tooling cannot
>> > tolerate adjustments to the format (for example making the name field
>> > longer).
>> >
>> > Since PPC munges its version records to strip leading dots, we reprodu=
ce
>> > the munging for the new format.
>>
>> AFAICS the existing code only strips a single leading dot, not all
>> leading dots?
>
> You appear to be correct, I'll update that in the next version, but
> want to wait for more feedback on the rest of the patchset before
> sending up another full series.

Yep, no worries.

cheers

