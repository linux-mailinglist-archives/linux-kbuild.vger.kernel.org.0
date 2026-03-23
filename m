Return-Path: <linux-kbuild+bounces-12206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGKKIPl8wWknTgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12206-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:48:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E902A2FA6F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF0F63045E19
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502A3C7DE0;
	Mon, 23 Mar 2026 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="d0w2WMuA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T39gwOEy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA59A3C73CA;
	Mon, 23 Mar 2026 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286614; cv=none; b=Z0/ddQ3qr4EjY976BgpBfF0s/pQnuSsVIsubjf+r0yvEEu04+g/v06vLldOoi19mftr998MvQ1tpAdb/jIpXfBYooNewJOTsodSSXMk1KdsFybrFOVKOWVLTrlbal4wc+bfhMKL4h4/Fmv+AS7R6GXqlBg73+IwY/sozNtzR5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286614; c=relaxed/simple;
	bh=8F5DHzbZOkiE60z+INX/R3wfwDAeDzgLhwAv/Br77fM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=slFg596lTpC1nIF2BSH/RRGoQFVDwioNpCm1owGA8nvqo8bJEpKJe5/Furdz7JwcPox1nWt+0wz/PiXjWUeX7Ur4b9F1F1qwqhZGqNTmfnQmms3pdjXJz/6WiOlBnaTxd/aPAYV4lyy+JIxskmX5plDVLW0DMyFZfmyQaUohkGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=d0w2WMuA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T39gwOEy; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id AEAE71300250;
	Mon, 23 Mar 2026 13:23:29 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 23 Mar 2026 13:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774286609;
	 x=1774293809; bh=8F5DHzbZOkiE60z+INX/R3wfwDAeDzgLhwAv/Br77fM=; b=
	d0w2WMuASvhIHc8a3ZfS0bSovZpUguTxsV12SkJzLl/HgFTO96E8OsN6d6PFrRYr
	XHyKTm84Vlu7Tme/FZTaw0VGpuJ8bd9SIFnBq7bZWD1TgSXMwEt+Ap2P5Cr5y5rb
	kh48eiYnLAe4C36R9y9XZ5Zg6lxDvpLGPh8KJGh1qX4WXsw8iq3GoopxXo0wdcIy
	SKgjzMBKuf2OLoWajsbw2F4ld+LPm1ydhX7IWHymLKSmvFTHk5G5DuniFfqplcMy
	65xiZdyuVFv3n4Cp6M4NViPWZR5xC134H6qqy1/2RPbWvmUWLHoufcPqtdKvun5t
	+UoyEGPxVxwM8podnx9RfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774286609; x=
	1774293809; bh=8F5DHzbZOkiE60z+INX/R3wfwDAeDzgLhwAv/Br77fM=; b=T
	39gwOEyRtCyYoMOGxdB1aekPredjoXFLaW3m6i6BbkmcD3TENUY+rGnLBscpaGLD
	pl/gY6Wad3V5npcJa+8/w3KHGhFEusITcXXc49+4OiqXWkkWqj7GgJH8XTM5yjo+
	jKGeMvnm+u6AMx2msR1uFbO17rxuPrmWriiZvC9roJIKLpAsGlrFIxypDrEAkvQE
	F6iQHUCna5dGO3+Oq4eQOTcYpv/U7VYXNNXsjILB4Q+VfMN88xaCKhgGUbalORTP
	SesNWUyY8BIA+Br7/XSafGCp3A8lFxKcYM8/VZdx2BHUUeCTZCFBxS+/3nO3hbbr
	+ysYeMBoP68cYbvX3Krdg==
X-ME-Sender: <xms:EHfBaaVOuDeremT5Xu0AuWObJubLqQ2Wnl5vZlfNhouYJf7BwlCLnQ>
    <xme:EHfBaRaOzMH4ETuoxDhEO01_PK1EegNYbN5kOqpTOp4DbfEiYa3UCxuGHG8QuabyD
    S4ouWK2fowUUjV5WyYISt_lOKBh6aIkxJ0nstyLSSjysmnUY8SnNDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudelfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopedvledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrgh
    hlsegsghguvghvrdhplhdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepmhgrrhgtvghlsehhohhlthhmrghnnhdrohhrghdprhgtphhtthho
    pegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EHfBaSqJKl4O8U5DXXnUHJ4ARuuLtgpyod5Zu0bYenGxtsS85upgIQ>
    <xmx:EHfBaS_HCcsciKk7yEWlaATTUB0CHoip4D6Rvf83VxqBWMmapLm_VQ>
    <xmx:EHfBaV5mRbon4XVx5UyVqJ7B0Up2zUVFC-vVEljM-RiIxKDNHEp84g>
    <xmx:EHfBae0fWgVJV-sLFsw6aUUf4UNq6Juf-hZdi3M7ZrPWNpzYulPmdw>
    <xmx:EXfBaaZiou-wWxJxEAUqaRa4s0NByc4B1hm1naWmg3Gc55SFVLDUw_Ug>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 94F912CE0078; Mon, 23 Mar 2026 13:23:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJPKs3BxgghB
Date: Mon, 23 Mar 2026 13:23:07 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Manivannan Sadhasivam" <mani@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Rob Herring" <robh@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Message-Id: <3faffec9-dc9d-4eec-a652-a84d30d85c96@app.fastmail.com>
In-Reply-To: 
 <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
 <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
 <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA soldered down
 connector
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[squebb.ca:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12206-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[squebb.ca];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpearson-lenovo@squebb.ca,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[squebb.ca:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	NEURAL_HAM(-0.00)[-0.972];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E902A2FA6F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Mon, Mar 23, 2026, at 12:52 PM, Manivannan Sadhasivam wrote:
> On Mon, Mar 23, 2026 at 06:45:15PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
>> > On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
>> > > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam w=
rote:
>> > > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
>> > > > > On Mon, Mar 23, 2026 at 7:16=E2=80=AFAM Manivannan Sadhasivam=
 <mani@kernel.org> wrote:
>> > > > > >
>> > > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
>> > > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadh=
asivam wrote:
>> > > > > > > > Lenovo Thinkpad T14s is found to have a soldered down v=
ersion of M.2 1620
>> > > > > > > > LGA connector. Though, there is no 1620 LGA form factor=
 defined in the M.2
>> > > > > > > > spec, it looks very similar to the M.2 Key E connector.=
 So add the
>> > > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e=
-connector" fallback
>> > > > > > > > to reuse the Key E binding.
>> > > > > > >
>> > > > > > > What is LGA?
>> > > > > > >
>> > > > > >
>> > > > > > Land Grid Array
>> > > > > >
>> > > > > > > If not in the spec, is it really something generic?
>> > > > > > >
>> > > > > >
>> > > > > > Good question. Yes and No! LGA is not something that Lenovo=
 only uses. Other
>> > > > > > vendors may also use this form factor. PCIe connectors are =
full of innovation as
>> > > > > > the spec gives room for hardware designers to be as innovat=
ive as possible to
>> > > > > > save the BOM cost.
>> > > > >=20
>> > > > > innovation =3D=3D incompatible changes
>> > > > >=20
>> > > >=20
>> > > > Yes, I was trying to sound nice :)
>> > > >=20
>> > > > > > This is why I do not want to make it Lenovo specific. But i=
f you prefer that, I
>> > > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
>> > > > >=20
>> > > > > Depends if you think that s/w needs to know the differences. =
Hard to
>> > > > > say with a sample size of 1.
>> > > > >=20
>> > > >=20
>> > > > Sure. Will add the 'lenovo' prefix then.
>> > >=20
>> > > Is it really Lenovo? Or is it some other module vendor, whose LGA=
s are
>> > > being used by Lenovo?
>> > >=20
>> > > I remember that DB820c also used some kind of a module for the Wi=
Fi card
>> > > (which might be M.2 compatible or might not, I can't find exact d=
ocs at
>> > > this point).
>> > >=20
>> >=20
>> > I don't know. These kind of designs might be reused by several vend=
ors. But
>> > considering that we should not make it generic, I'd go with Lenovo =
as that's
>> > the only vendor we know as of now.
>>=20
>> ... and later we learn that other vendors use the same idea /pinout,
>> then nothing stops us from still telling that it's a
>> "lenovo,pcie-m2-something-lga".=20
>>=20
>
> How do you possibly know whether a single vendor has introduced this f=
orm factor
> or reused by multiple ones? Atleast, I don't have access to such a sou=
rce to
> confirm.
>
I've not really been following this thread/patchset in detail; but want =
me to try and check with the T14s platform team if this device is specif=
ically made for us (Lenovo) or not?
I doubt it is - we just don't do that usually, but I can go and ask the =
question if it will help resolve this (with the caveat that it could hol=
d up the review for a bit and I may not be able to get a straight answer)

My vote (for what little it's worth) would be to make it non-Lenovo spec=
ific. Then when the same part causes issues on another vendors platform =
I won't get asked questions about why Lenovo is breaking <other vendor> =
:)

Mark

