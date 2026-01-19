Return-Path: <linux-kbuild+bounces-10686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865AD3AA6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 14:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5935730A270A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AFF36B05C;
	Mon, 19 Jan 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="FriD18WH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sg-1-38.ptr.blmpb.com (sg-1-38.ptr.blmpb.com [118.26.132.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB736A011
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Jan 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829428; cv=none; b=XF/2LkhJ1EDWvk63dfK6tSqohLaKg2+v8hI1Iqwr/0nl2dnNk+CX39F1TQAlWjwASNyfcrXJ5Cy0m475lmNU3Gx+Rq6m7iKW0rYt9Qzqw/YugseVQDc8abiqmhoA9oX5LefKtRrk5FkhPQekYtlc3FtIf2aSFDH1AchORHnVVyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829428; c=relaxed/simple;
	bh=Hz997vqaGXzSWwkIjoBZvb8RU32SX4iTP59cSS8nTMQ=;
	h=Mime-Version:Content-Type:From:Message-Id:In-Reply-To:Subject:
	 References:To:Cc:Date; b=eXJqdwhLbKLJV87wRnsDZdz9gT7586KRhSp9jYcX1bQHOlb07b0E77jLJsTjQmzFo+Lm0oCmk5vCtL50B3E+YU/8at3oRNN2sT2HL+suH14CiW5+tVWXf46pS4gSFOjOgN8A6jWRyT9/54Be8zwmztrLq4iOjv/SLSHv1aLsnQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=FriD18WH; arc=none smtp.client-ip=118.26.132.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1768829414;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Hz997vqaGXzSWwkIjoBZvb8RU32SX4iTP59cSS8nTMQ=;
 b=FriD18WHn/m2KHt6dU+gdrRI5pre1GihFmb0C/M6tUyn/OkZz1nFNsPKDj4ntVQg+A2yzH
 JDFnRyplzLlL42ujGPB8sBvQmsx/oxlcKSkmvWyGX9/e/n+3ysD7QAfyAf2kqjJv4Ejq59
 /RJOldbh7FRsbb10tRzss3tgFJXOBOMUd504E3ZnDByR7zEgo0nVMReWauwDLeMghtMrG8
 32xTo0x3YLJ480u9RIN86cHvlugGPVPh1F7t7LMURZGqzDvyQF2GESHdKpCtDDuDmg8I+a
 RLY++toC1Ko30ffg2T7sA9hqWoiD28oYLnN0hidJSt07kaJC+x+HmkpCZIvLXw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Original-From: Chen Miao <chenmiao@openatom.club>
X-Lms-Return-Path: <lba+2696e31e4+77bce1+vger.kernel.org+chenmiao@openatom.club>
Received: from [198.18.0.1] ([183.241.191.96]) by smtp.feishu.cn with ESMTPS; Mon, 19 Jan 2026 21:30:11 +0800
User-Agent: Mozilla Thunderbird
From: "Chen Miao" <chenmiao@openatom.club>
Message-Id: <cc80fdf1-eeda-4f21-9d3c-13b4cfd276ca@openatom.club>
In-Reply-To: <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in mrporper
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club> <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, 
	"Benno Lossin" <lossin@kernel.org>, 
	"Nathan Chancellor" <nathan@kernel.org>, 
	"Nicolas Schier" <nsc@kernel.org>, 
	"Tamir Duberstein" <tamird@kernel.org>
Cc: <tamird@gmail.com>, <da.gomez@samsung.com>, 
	<hust-os-kernel-patches@googlegroups.com>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	"Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>, 
	"Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	"Andreas Hindborg" <a.hindborg@kernel.org>, 
	"Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, 
	"Danilo Krummrich" <dakr@kernel.org>
Date: Mon, 19 Jan 2026 21:30:10 +0800

=E5=9C=A8 2026/1/19 06:30, Miguel Ojeda =E5=86=99=E9=81=93:
> On Fri, Oct 31, 2025 at 3:32=E2=80=AFAM chenmiao <chenmiao@openatom.club>=
 wrote:
>> When I enabled Rust compilation, I wanted to clean up its output, so I
>> used make clean and make mrproper. However, I was still able to find tha=
t
>> libpin_init_internal.so in the rust directory was not deleted, while
>> all other corresponding outputs were cleared.
>>
>> Dongliang Mu <dzm91@hust.edu.cn>
> This line seems broken. Was this meant to be a Reviewed-by, like in v1?
Yes, it should be `Reviewed-by`.
>> Signed-off-by: chenmiao <chenmiao@openatom.club>
> I think in another patch/thread you mentioned this should be "Chen Miao",=
 right?
Yes, Please modify this to Chen Miao.
>
> No need for a new patch, I can fix both on apply if you agree.
>
> Adding the relevant people to Cc (pin-init, Kbuild and Rust). And
> Tamir for the `.dylib` side.
>
> Also, I guess we could backport this:
>
> Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
> Cc: stable@vger.kernel.org
>
> Cheers,
> Miguel

If it=E2=80=99s convenient for you, I think your proposal sounds great and =
I agree.

Thanks for the review.

Regards,

Chen Miao

