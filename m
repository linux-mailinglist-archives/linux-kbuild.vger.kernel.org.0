Return-Path: <linux-kbuild+bounces-1652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259418AD3D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 20:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494751C20EDA
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 18:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA3F15444F;
	Mon, 22 Apr 2024 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IioDOQLK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nt9T+mKn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDE154440;
	Mon, 22 Apr 2024 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713810253; cv=none; b=SLOaAkqFaqufXcXcQL/pgFzU0mwEFvYKx8eZh0bslYwD8du8RWh2mpLyaayUcpL/xT3nZmNsAYbjPPmJTst3pTt2PFom6eYQfpQyrgVnYzRnBK+gJVFSlTidcgGrcv8z7W3Ue60HxKrv6vDyyDLoWdq5adk02CeiCYfMBUYx3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713810253; c=relaxed/simple;
	bh=AJWsQs0WIutfkiraqmBrcIERbnp+KFBgyvXOHw6/ZGw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TxRJxFXtKDbQN+UVtCInzRXBl5BGp+9DyWhBDu7kFHyQNOPv3KY2UM7vKMO31xp0uw4p16IREH11LHYMo2TuO3yjqJxpkP9995aR7maBN6Q9N9/y/9b9+UR1aWa1UVWPfW8pXybrz/ugeFz1/7vlAamUq/7llttEwd/349ALHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IioDOQLK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nt9T+mKn; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 3CC091C00124;
	Mon, 22 Apr 2024 14:24:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 22 Apr 2024 14:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713810248;
	 x=1713896648; bh=4tISaTjKm7Keny+zSA/5yJF7vEg/YCHm8XeIP3SBn8Q=; b=
	IioDOQLKUlfXtmHQgZWRGTP20woHG+m0RuSsHmypLIgi0wu2qGwYXrKfClD7dD+G
	MyRfnW6awXbuF2kd5QEHka5zK2iTeYmq/YNk9IrOUe+lwRwUAqsTDVMhZOoj1qi0
	8vBH17xHZug/Qyg6xKoy1t+tIiyOijdsUFIyk3wG/gPnp7KV1+8ul3oN8Xaiwha+
	GADkVyLMV7q0cSlE94l1nT1+SotvDiPWq/xA8Zey5JUL4ZuMA4I7c14S+DfIG7f6
	f8WSO+LPIXU4yok5R5NVO2XpcDGHtOAKkUHwe93Xq4X62MpMNWHticDasluhGzd4
	srSuIQKaxkAWn3w49X66Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713810248; x=
	1713896648; bh=4tISaTjKm7Keny+zSA/5yJF7vEg/YCHm8XeIP3SBn8Q=; b=N
	t9T+mKnsgBURMXg+OWFQJTJmdcY0Qocet1v+0rphAG6YV/di6D9rVirWDYvk8sWm
	bSfrNu+4a/0lHPHJ/y21xo4I+LFBST97FFEHJwBEkWUWMVSG2H5rOgtuRbrTXJtL
	6AVA66B+FAdd0zs3SNs+4uCxs7QDnwpkfyLKIolOwuCXEzvXQQ1BfgSD8JiC6isv
	Vtjb81vqCPrXgwQzAeT+ujZ+O9B60x+yTHM8isBvnZ+5gEd0n6YzRt6/swHgUy+n
	qh8EBuNSStkPA1enrxeTDCz9PieKKUNtQVcxA9IGjs95rC8sdhfHKh5MYNcq7Krn
	WyeaZmVzBNcfNhBlj2UFQ==
X-ME-Sender: <xms:R6smZrTxU7woavcUjP4z6wapKWPXc8dPlgFoAZtdZwetVi3uZ0kyOg>
    <xme:R6smZsy9y8w3xvrhXR8HSDDPEUzNR3z0Mm3KBApIqyoBznUugeaKaVqyPttyO6DA4
    rWeIEntw8WOEnd0R4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:R6smZg1wtRbHYMelWVpTbUAvwMzDjKBG901AwkExDomwAUz8zX2yCA>
    <xmx:R6smZrDPy4QA0ruj09hSOn7d3kplIjX52OTpTRuOP9ZYBALw6ilbsw>
    <xmx:R6smZkhS4_l9Qzy41YOMCsZkHpmqtB9381ghYNbfZzNNe3Z9oOhsAw>
    <xmx:R6smZvpU_WypBYLJGMocq9XBOjWeFyydTL_6gYIHxG0jE4G-Z8E8OQ>
    <xmx:SKsmZlZK5lOFTFB_neSxwAvXStKO7uOEWTJbUrlsmmWQe4pB5VLUK62e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8187FB6008D; Mon, 22 Apr 2024 14:24:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d3f406ed-1b93-4fcf-850a-743d27f20dc2@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
 <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
Date: Mon, 22 Apr 2024 20:23:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024, at 18:58, Geert Uytterhoeven wrote:
> On Mon, Apr 22, 2024 at 3:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Mon, Apr 22, 2024, at 15:28, Jani Nikula wrote:
>> Whereas this one is broken:
>>
>> config FEATURE_A
>>        tristate "user visible if I2C is enabled"
>>        depends on I2C
>>
>> config HELPER_B
>>        tristate # hidden
>>        select FEATURE_A
>>
>> config DRIVER
>>        tristate "This driver is broken if I2C is disabled"
>>        select HELPER_B
>
> So the DRIVER section should gain a "depends on I2C" statement.

That is of course the common workaround, but my point was
that nothing should ever 'select I2C' or any of the other
subsystems that are user visible.

> Yamada-san: would it be difficult to modify Kconfig to ignore symbols
> like DRIVER that select other symbols with unmet dependencies?
> Currently it already warns about that.
>
> Handling this implicitly (instead of the current explict "depends
> on") would have the disadvantage though: a user who is not aware of
> the implicit dependency may wonder why DRIVER is invisible in his
> config interface.

I think hiding this would make it much harder to get anything
right. The symbols in question are almost all ones that should
be enabled in normal configs, and the 'make menuconfig' help
doesn't make it too hard to figure things out normally, we just
have to find a way to avoid regressions when converting things
to 'depends on' that used an incorrect 'select'.

     Arnd

