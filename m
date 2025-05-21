Return-Path: <linux-kbuild+bounces-7207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67303ABF780
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 16:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 617E61BA468F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180EC194080;
	Wed, 21 May 2025 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UvgZO2tu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PHH2Z+0c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76ED1A3177;
	Wed, 21 May 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836701; cv=none; b=eQaM6kh2sqdcqBIAqZ3VElCpx0gjuD5jYIBt2+LklWJW7Ws/WrSee9y118SUcyVi9hpcBhsxU8uurkSTxlCTOs/mrWrg8bHzSB7jBBrhhgliQRpC5AjH4OdaAdIwDjprJ5dUJcEM1fHn3ILTHd5+rxupfv0iH394RZWaYDCcfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836701; c=relaxed/simple;
	bh=Y9XHxQdDuto4VFvmv60457dHtHcsuL8SXMzckPVOcq8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OH/NzDYhhnMrWa5mXxt3AC+nMhaUQ282l7fIPYf0bhuFOdcQ6hpNbSRoBXw3k72mDI+XslowLZs4PXsOxEjGEALvOzxU7PnVSqK5OSACO+Vpvr53EfgDieHBFVyE8Bl1Z03Y7C9WOaE2s/djc7ovvRnDu/8N0wfIz2sRy16qq1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UvgZO2tu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PHH2Z+0c; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D28781140115;
	Wed, 21 May 2025 10:11:37 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 10:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747836697;
	 x=1747923097; bh=HWI5tsYR82od73rLR1d73ZRHNmjGxzPzzskX0QA3T0s=; b=
	UvgZO2tuvBQw0TC0wLcBMbIaCmRLaSFsHa9/dTz5feuYKCBVr2qs9zTLlOteaAiD
	AnK0QeKl55BD1Cc+2oP3kjHyd0XO0n/gE4GvWixz+NrDkPRg7/oBuupv7RyfFNWM
	z6ufvltMUieFZn6MSUmykUgK63xgRebVTFFiZJF48wnrX52ZGDNxMDfy0ssCmiNa
	wjpc4aDVg8LBW5n4heQX6Aj4jiyhinE3JOwFuW/MOjC6aj4z4yKCazndrFcRAn30
	WI4RpC7pU4u604aaj3vA2lQWcfSWJgJiLn5H8a9e891M9pCoSWrkuD8uysJEL8Tl
	rJr5o8jiVVX5J2PlCvMzKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747836697; x=
	1747923097; bh=HWI5tsYR82od73rLR1d73ZRHNmjGxzPzzskX0QA3T0s=; b=P
	HH2Z+0ctNahlhotZlDeSc1bTLxfrVE4EcA+rEHwZy9z3TSz2EgCo1osS0T0ypwfE
	qJAIakV2j6kf4UC7/gpjXi8cxucb3HodxJIqCeUdnlOBxCQ1sPsGJlOiJLs7lkXZ
	OGCM0KEA3niKf1i3MhrjKTRLroeIsgPX++HWC/eTtFi0mkwbY+lbd70pZOZMUpBQ
	d1m46EH5u/thhMIqmD4ehuC5qge2C2j9xK/dmwy0gIZMjjV7cf+rOQX8HidRlJZg
	XsYFnKKJB00Bqy0isV3JyrsLId2I9j3QMF4wowQHPgJm5dVA3ZdT8Y9o9f19aNKC
	7O/rY3DYjJPuyDrvGBP8g==
X-ME-Sender: <xms:Gd8taNJRtpAdQ1fn-VeX5nac47719thOgFLRag1XBeSrdxlOyv0erg>
    <xme:Gd8taJKesTwfbHvYI8A1xdnyFnZ9agrTWGaukmHKpGYOew9OozAxVXfqWXw9dwwhd
    yGvEscWXCy0BtXYisQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvdelucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveff
    ffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnh
    gurhgvhihknhhvlhesghhmrghilhdrtghomhdprhgtphhtthhopeguvhihuhhkohhvsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehglhhiuggvrhesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgtohhmpdhr
    tghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    grthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhv
    rggtkhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrshgthhhivghrsehlihhnuhigrdgu
    vghv
X-ME-Proxy: <xmx:Gd8taFsIEC4GZHg5Hu8aA7VK2AQdHWupCHisjiHUC3T0zlNw_s2Ngw>
    <xmx:Gd8taOa8HOf2g3NcRGP0_xBQfcS9_TSIBx7K163Y20Yr9_0EAxZp6w>
    <xmx:Gd8taEbWPg1yILveN5vwcjTQY_Ex6Ob0CL8hRXtBlz3DivwI3SnrEA>
    <xmx:Gd8taCC8stVoZjthgL3MSSmcYhqAY8sFJ-iTkMYG3TfDeLI_3diEsg>
    <xmx:Gd8taK__j3JZ5GSiiKeqVDaDJGlTkAZ-3rraLt143UlbS8opPORdVkoQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 32C301060060; Wed, 21 May 2025 10:11:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T2ad347d80e1d0ee9
Date: Wed, 21 May 2025 16:10:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Potapenko" <glider@google.com>,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>,
 "Lukas Bulwahn" <lbulwahn@redhat.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 "Andrey Konovalov" <andreyknvl@gmail.com>, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lukas Bulwahn" <lukas.bulwahn@redhat.com>,
 "Dmitry Vyukov" <dvyukov@google.com>
Message-Id: <61db74cd-2d6c-4880-8e80-12baa338a727@app.fastmail.com>
In-Reply-To: 
 <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com>
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162>
 <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
 <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option unconditionally in
 CFLAGS_KCOV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025, at 12:02, Alexander Potapenko wrote:
> On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
>>
>> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wr=
ote:
>> >
>> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
>> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>> > >
>> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") rem=
oves the
>> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include=
 the
>> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
>> > >
>> > > The commit however misses the important use of this config option=
 in
>> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_K=
COV.
>> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' unco=
nditionally
>> > > to CFLAGS_KCOV, as all compilers provide that option now.
>> > >
>> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
>> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>> >
>> > Good catch.
>> >
>> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>
>> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>>
>> Thanks for fixing this!
>
> @akpm, could you please take this patch at your convenience?

I have applied it on the asm-generic tree now, as this contains
the original broken commit. Sorry for missing it earlier.

      Arnd

