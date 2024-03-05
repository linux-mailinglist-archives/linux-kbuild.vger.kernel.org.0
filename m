Return-Path: <linux-kbuild+bounces-1180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB38729C1
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 22:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 348F8B23338
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 21:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCFF12CDA8;
	Tue,  5 Mar 2024 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kBCfIsc1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PGmqYldx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08712C809;
	Tue,  5 Mar 2024 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709675598; cv=none; b=dTwOkGu8e+PmvSpBxEmCjzBDEwHgIxFQdVgvaxnd6pQ1Cinl+LkLzA2An76MEMxgHx6wWTy/eXy8lZiuTyvZnCmAUYRn8AQL1LPO6wIKOgQkEferCEsI9NJSCo5BsZ9rDJy0RN1idKmmPA9Rzt7zAuieQTPb/lfoIQZB7uv3bfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709675598; c=relaxed/simple;
	bh=w69YwNhhJUWrKvltEutpZXr1WsKvyjIHwp0BdHZURa4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=nhe/t/OOo8DDuhI2nB1Q6FgvUB0agcol8yXjr9d9GTnGSDrV2TCWjM+qPKhfKRQJS05gbmfbCSOjn361HKYv5thKzZJSMveRyGN7twnXysdlc97x/S0aOZQM+rt3Q+2Vl0+j7i++RafkCvNF0Q/i7ApikWZG/qng6HmahI9JXPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kBCfIsc1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PGmqYldx; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id C3C751C00087;
	Tue,  5 Mar 2024 16:53:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 05 Mar 2024 16:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709675595;
	 x=1709761995; bh=QNEfkKLf+YoFMOvLOLaHBOHhoGsBFLnvQ4LA5YChDe8=; b=
	kBCfIsc13o0inkSJN6s2rCCZXlGtZUy85CUt4VWoUMzRnosFKOqxHm4IaDnxJToM
	+io8+RDJVMkqJLa0KZqiPoOeZ7d6Lm1yz9S777ouuGXBmiUkkVuV6Id+g2/FtdNq
	b0/ro4rgslsftvSoPwLsoEoOt6ijY2ja4ts9Ta3F4XtR1ONVx85xl4Zj9niW5MLd
	Dn6eSAoi3ooaI5X4Fgmj0dWwYUOr6lOgBEohlVGZ8DwK24YaJDpwVH9LZkRJrx8v
	GR4mRa9gnFL32RZGP0GorrSyaJu64TXpa+y517eFq7JmAPI3oEjJKRRnEVMI64cP
	rPxXmjCMQ5pCUDWhoNZ/lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709675595; x=
	1709761995; bh=QNEfkKLf+YoFMOvLOLaHBOHhoGsBFLnvQ4LA5YChDe8=; b=P
	GmqYldxrcCLZebRG8Vo3qC6IDi4t/zGYIEFtqJEMvDNnIC9VBkBGGTEFkyu7dHOL
	vMkiJpIp0iBIEXL5aIU0RHsnepdPMk6RJ8e8kjeNvhhAQ1PcVoJsayCpf9iEKeAj
	8jJYR99p6QF99qL8JqAIfKGI5VCqPGHgJL71i6IDbiWsAkpJSBdYVVyo1fULia/j
	m7Fd4nO+MWVHxptn4/5oB1J0cMoiEiofYfUrb1Tn+XpdGAHt7UwiDp9Q1Cro7pxz
	PjBNZoDWR7O6xemHkW6J2TJF1JexdH8O6jUmmsrFsow6QhvG9ezHeOodq+KWPaoM
	voEVjTvKDwzL4iyYoatTQ==
X-ME-Sender: <xms:SpTnZdv_DZhYWD2X8sI750_zGOOHPFz1jvfwKfL850W6xedWTO2P6w>
    <xme:SpTnZWfOrmFSlUCfVRkJOZNgcVWMC9q5j929x0oAymJkLlGbQEfzL-3EBYB8hqN1O
    2gmJi9QdhwtPU1dZWY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheelgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:SpTnZQzEMjXCFglOKvTUq5O22x49kx-sveEWFm8IKxqCwLmQh8Efhg>
    <xmx:SpTnZUOts6r1M9eM2F0eb_gKBH8ni69laCfZKpSroFnzcADLT8vU2A>
    <xmx:SpTnZd-7MiyVNAK78opOGnMi-ur4reLRre-blpeEBJJ5yPBisljBHw>
    <xmx:S5TnZe0DzO9qODO5JCHeijulFefAapAWDeMSF-u9Z_qhrG9K13bGNXXa1HA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6AD1BB6008F; Tue,  5 Mar 2024 16:53:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-208-g3f1d79aedb-fm-20240301.002-g3f1d79ae
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5b4fa755-571e-4a99-8614-ca0df1db1563@app.fastmail.com>
In-Reply-To: <20240305193015.GA1173426@dev-arch.thelio-3990X>
References: 
 <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
 <57abd8e9-3177-4260-b423-38d5cdcda44e@app.fastmail.com>
 <CAKwvOd=V_Qtd2pK8AKc6bv=zMPnAaCf08=QO74ckqH26A3sefA@mail.gmail.com>
 <20240305193015.GA1173426@dev-arch.thelio-3990X>
Date: Tue, 05 Mar 2024 22:52:54 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Yonghong Song" <yonghong.song@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Disable two Clang specific enumeration warnings
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024, at 20:30, Nathan Chancellor wrote:
> On Tue, Mar 05, 2024 at 10:52:16AM -0800, Nick Desaulniers wrote:
>> On Tue, Mar 5, 2024 at 10:50=E2=80=AFAM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> >
>> > On Tue, Mar 5, 2024, at 18:42, Nathan Chancellor wrote:
>> > >
>> > > As the warnings do not appear to have a high signal to noise rati=
o and
>> > > the source level silencing options are not sustainable, disable t=
he
>> > > warnings unconditionally, as they will be enabled with -Wenum-con=
version
>> > > and are supported in all versions of clang that can build the ker=
nel.
>> >
>> > I took a look at a sample of warnings in an allmodconfig build
>> > and found a number that need attention. I would much prefer to
>> > leave these turned on at the W=3D1 level and only disable them
>> > at the default warning level.
>>=20
>> Sounds like these new diagnostics are very noisy. 0day bot sends
>> people reports at W=3D1. Perhaps W=3D2?

It feels like this is not a great reason for moving it to W=3D2
instead of W=3D1, but W=3D2 is still better than always disabling
it I think.

Specifically, the 0day bot warns for newly added W=3D1 warnings
but not for preexisting ones, and I think there are other warnings
at the W=3D1 level that are similarly noisy to this one.

> A number of subsystems test with W=3D1 as well and while opting into W=
=3D1
> means that you are potentially asking for new warnings across newer
> compiler releases, a warning with this number of instances is going to
> cause a lot of issues (I think of netdev for example).

I only see a handful of warnings in net (devlink, bpf) and
drivers/net (ethernet/{3com,amd8111e,funeth,hns,idpf,jme,mlx4} and
wireless/{iwlwifi,mt76,rtw88,rtw89}).=20

These are also some of the ones that I think need a closer look.

> Fundamentally, I do not really care which avenue we take (either this
> change or off by default, on at W=3D1), I am happy to do whatever.
> Unfortunately, CONFIG_WERROR makes these decisions much more urgent
> because it is either disable it and have other warnings creep in among=
st
> the sprawl of these warnings or leave it on and miss other errors for
> the same reason.

Agreed.

       Arnd

