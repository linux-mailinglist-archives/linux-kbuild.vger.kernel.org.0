Return-Path: <linux-kbuild+bounces-5809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA9A38F36
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 23:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139633AD87A
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 22:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9034D1AA1FA;
	Mon, 17 Feb 2025 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Fflo9QK7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1D189B8D
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2025 22:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739832598; cv=none; b=KosQa8vBaEEV1BCl6j+41/+V+X3ywGW6oaZovV2eDMIyzrdT6ghkeGOUHJl8zuBVBR5MD6dAchQq3l+GnYEKIucoOEm3lZrvMwqY+gnk4KJEX7Fra+bckl/+LITPpY+XnJbZ2T1NQkC+wBEPsYvFRF6FaPPgAyx1kRWXoo78CDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739832598; c=relaxed/simple;
	bh=UQFqrnjwwEQrn7+9uZEXrxJvHu9Ovq1ztyrLAcjSCxs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=onF+VjZ1BECxP30FY95cTo4/Pz+z4xIKxPDwyEfB6CpHdgSZqS3rkd0dVbj+WUT9xF4k6AU53M6w7FN0GC9WlN8zmIv162nSOCRRRk1jhQfdxH4gloN3fCsau2/X6FHAUIu3ahwnrSKJExRFMGv5q9kyffAJFYXAtQtwL5WIrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Fflo9QK7; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739832588; x=1740091788;
	bh=UQFqrnjwwEQrn7+9uZEXrxJvHu9Ovq1ztyrLAcjSCxs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Fflo9QK7937qcX0C92R3OU38ZpSx/hrkuq4rnMm/Q7VEjUhq+IYYBoS4y1sFOjFr3
	 HF6W53CAH0Gpred2S7Ev5UyCmPlih97wgs5lcSWpY1YSp2hCLoqy8IXnMZ8uUN1RjN
	 wd/FAH39ZtF/LNE17ErNNr/vA2zhxAjnizjNs+X+r+83UuZVQzxLRJaZNQ/sRfeyLx
	 fSKV+RWwVBcB0C4GunAcBcFjosnBmLRzw+2N+i/eRQ1jVzj/yZ4SP2gMdU06x9XKzO
	 /6bzjzUs+pZ94czjEEbSS7f8FAvW47RHLt8hbV5zILt4eLsJGcLhbeZAtyODNI0l3n
	 EStGe0gMZoQlg==
Date: Mon, 17 Feb 2025 22:49:45 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: enable `too-long-first-doc-paragraph` clippy lint
Message-ID: <6b914549-ed4f-4b8b-b6c7-9013e5c4c29e@proton.me>
In-Reply-To: <CANiq72kwME8D2P5C2mbwmTpxekR8u_kdW6GDVz8WERi_NvRZYw@mail.gmail.com>
References: <20250216213827.3752586-1-benno.lossin@proton.me> <20250216213827.3752586-2-benno.lossin@proton.me> <CANiq72kwME8D2P5C2mbwmTpxekR8u_kdW6GDVz8WERi_NvRZYw@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d0461f8aaf5f2e9623df850323039ba8cd6fffd4
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.02.25 19:07, Miguel Ojeda wrote:
> On Sun, Feb 16, 2025 at 10:38=E2=80=AFPM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>>
>> Introduced in Rust 1.82.0 [1], this lint ensures that the first line of
>=20
> We will need to ignore unknown lints so that it does not warn on older
> compilers.
>=20
> We should probably do it conditionally instead -- it requires some
> rework to do it for everything, but we can easily do it for kernel code.

Ah yeah forgot about that. That's a good point.

> I can tweak it and put this patch into my warning rework series -- I
> had to send the v2 of that anyway. Sounds good?

Sure!

---
Cheers,
Benno


