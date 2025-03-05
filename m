Return-Path: <linux-kbuild+bounces-5969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793FA4FF4F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 14:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C741691FC
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A37248193;
	Wed,  5 Mar 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LkYlpps4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E6F246326;
	Wed,  5 Mar 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179653; cv=none; b=SjyKixYfaq7dIT9wTc091AtR27Q53aQF/Ld/7EiPnygWS3d0uSesFcpQtkjyJVvD84Tn5MUsxjEUFLYyeRucwzGY2rZptyJKvRsaas9Lax3fPPPmd5zEqTRlZQkkOkRJ9KJs2SBL1ndwvD9B+QS3r8wEmpZvT12uYUw16PxdAKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179653; c=relaxed/simple;
	bh=buAfl18cwutAaGqn56IrPYceRXH1ohbCKggs9h9M5+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwdzKghTBPVkAhxdbLFpJh3Hw+gDp9siBpL/3qrucfkE8Zm/EP0c2ZSDs9TI193F8IgM5v74IMD08pPpy72DypEsudZv03j4SbhtbiGWPHdXa8gTA0UOVH/tzPBhXAfI5ot3xmYCp3WCKG1IcYUf1Ak4eXUtQ6uJcwMIM55tEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LkYlpps4; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741179648; x=1741438848;
	bh=buAfl18cwutAaGqn56IrPYceRXH1ohbCKggs9h9M5+o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LkYlpps4VjVxc5S/PujdbAY6Bntkgf7I5CoWCkmouLfhTRzmFu7epNKAcAJqSAINN
	 maRdWM2/yAFT5RigX+z5UjZzNO04fW0DrpTT32rjBFjClrs18omkvQWqgXd3m6qmZ8
	 I0VuO7ghb2JtWrMNNeI3gi/816UAbtUC0HHCgxG93rwUrZJhMARHO71XqhuI/lgejh
	 EuiPtyLOFp73OjhrYX2Pj30tN/OrZRGscQBPr2lTa9JiF6+AReUhHBkIDi6rdVa473
	 rn/AL0svldPk1Ipb8buyK2EK/1F265/sNsvcop5HZmvzNjfSjC+/6wcaPgsEjeGnK6
	 FRs/Y/kB5m9mw==
Date: Wed, 05 Mar 2025 13:00:41 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
Message-ID: <D88CO20HCT55.1C84SLGUXA0XH@proton.me>
In-Reply-To: <CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com>
References: <20250304225245.2033120-1-benno.lossin@proton.me> <jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid> <20250304225245.2033120-15-benno.lossin@proton.me> <87h647d6xg.fsf@kernel.org> <cdfBMmuIl8Wl-KpI-koNDQJOCGBr9z9dOi5fxQvFbgNWQHHw6JtMizaMMbMniNlE841-9b7TdLuZ9Xh_hFsf7w==@protonmail.internalid> <D88BLHENDH8Y.HQUKEXN1XB7C@proton.me> <87ldtjbqw2.fsf@kernel.org> <CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ec7890daa8d5c024fb19c204703c35dbb21cafbe
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 1:50 PM CET, Miguel Ojeda wrote:
> On Wed, Mar 5, 2025 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> I _really_ think that the ability to run the tests should be present in
>> the kernel repository. But I also do not want to block this series on it=
,
>> if it is something that will be easier to achieve with the build system
>> overhaul that is in the pipeline.
>
> No, that is not the plan. Even with the new build system, this is
> supposed to be developed upstream as far as I understand, so you will
> need to run them there anyway.

Yes, the plan is that development will happen on GitHub. I will of
course continue to take patches via the list, but I would prefer if
people make changes via GitHub PRs, since those run the CI (which also
includes a lot more tests that I haven't vendored here).

---
Cheers,
Benno


