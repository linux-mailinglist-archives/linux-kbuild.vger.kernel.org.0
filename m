Return-Path: <linux-kbuild+bounces-1656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FB8AD613
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 22:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212C4283A97
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Apr 2024 20:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7001B949;
	Mon, 22 Apr 2024 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="csyt1Y3B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yeuvgs9i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636D1C6A7;
	Mon, 22 Apr 2024 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713818810; cv=none; b=onJTUPDMM+MxVTHwep+DqrWcVgJkyXr3jjRRmtCcH/q5/BFR4x7R3afNuMBS5cfWqRM4vXP59NGdfBDjB2ai0BU8x6urbkkCPP75Ctfqfp9IfUPXE6dbQG18BgQDXO+ss1tkC3DsA8T6uL7b9ADfEzd6Y7mArKJ0b/ehlEPh9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713818810; c=relaxed/simple;
	bh=nkOA470g8MOvhFynayVW33/+iu18NcWOAHy2yZU96P0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=m/t+oEMQFuzd+a4EBO1UqVHNadwQZpcRx5IpTD7TS+PTVGIGWgJTfivc8Nt11hV1AV6ZP/0XAQCk9EgNODlaQ1I81TIFAIEPqzuac4iGA6Myrn/MquWB40oiRrsYA1cRKtft5EjNJUEnXtkSvaGmpdwRZO2zVDLiZy2MI8stCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=csyt1Y3B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yeuvgs9i; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 91483180012E;
	Mon, 22 Apr 2024 16:46:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 22 Apr 2024 16:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713818806;
	 x=1713905206; bh=M5/4G/3YjMdoV6AiZdENhe4Crh6dH0L6UampO9ZDWGw=; b=
	csyt1Y3BSnzjWB1/yEXg+00PF+OEDdS1ivEYY5vwQ4JPPLpMrva7VPlGdXJ6+5ID
	BcgdluPhhzPzLPIhSj9jH8ejwtn/z9jNaZ4f983Tt7vKbEG9b2QY6it2miS5e9Q5
	al6ApsVXDxhMl26+60mhlUP+LvsvBYuGp7R4cNlnDteXRfFDnXvTBhL8VQaJTWJ1
	DbPPOIqkyZBNp07M5pJo/cHNoRyOzEz4s+r1JoexgK3biO8hCjUFU0v6+pQWJSjx
	Zo+lAn1hB0gckGW0gSKVPnI+HPoDT4EtdbOrzdhwyAm/9yQxjTvtLGtqCmweJ7FE
	a2tODBFhyhisKFtyZe37+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713818806; x=
	1713905206; bh=M5/4G/3YjMdoV6AiZdENhe4Crh6dH0L6UampO9ZDWGw=; b=Y
	euvgs9iuLkarVvN6zkM/k0f9rCEyUyJsvX44YDN+d1gkxZJIeAY2LnyczNc4hLRR
	xigd5F7Rl/URH9mM3gyrokmq27y8BKf17J9WauxLUOIe20yKTVZhTfmRLcuBdPP2
	2uiE6zevqI10uegUHOCI2cUG+lHPN5qftgzrg6KFpwSU1zVizKv/PdiHLHcNghSk
	A3BbU00jRjMIUTEiUlUwYXhI0xOXdpZgMXbxm66kDp7lMUUIaxLsBJpdxlK0yYS1
	+W/RwNx1ZtjporC2mixEjSivIN/8fD3+ZGIHMRbJJkKzpCbISMlPZNMG+lm8rIv6
	HzZjp8dtQXayHcf4jS1FA==
X-ME-Sender: <xms:tcwmZgnjv2zo2HivUxlF90hlyGPAGNZ2VRTDK4H0-z8uSTIxyPTlCQ>
    <xme:tcwmZv3c7xW-A8eBxeZm8taF1phv-gUwW5kkXzr4YxEJONNOIvg425UXK9IbuRslq
    FpzdQKVsXL5EVkVUwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekledgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tcwmZuq9SO58zQqjdc_agS-veuJI-2PwhPJd-uBw2YfPX3sHtnatYw>
    <xmx:tcwmZsmENBSN2vpIQV-a3TZVf9Oj3Od_3VLYjpz7bYaiGIcSUK8fsg>
    <xmx:tcwmZu3jOL31MwFT_AhHSeP2nSlgmiLbYcnU_dJE-iLCtMAYsLZH1Q>
    <xmx:tcwmZjuWYtPQJOIR7wOj8VIcaeG5iVV9Vwe2JN2Xgynd45vcXgdq5w>
    <xmx:tswmZkN-nK4y7EXvNAAAEXVQ0PB1kEBNdSKfAMWuDhMurgG2oPzAknoy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6A684B6008D; Mon, 22 Apr 2024 16:46:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <b9d6f182-cec2-44d2-9fcf-4fc6589fffac@app.fastmail.com>
In-Reply-To: 
 <CAK7LNARNb0kB=cytOmJn+K59vQ8ekESqY-=1SFDOQox-B3GJrQ@mail.gmail.com>
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
 <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
 <d3f406ed-1b93-4fcf-850a-743d27f20dc2@app.fastmail.com>
 <CAK7LNARNb0kB=cytOmJn+K59vQ8ekESqY-=1SFDOQox-B3GJrQ@mail.gmail.com>
Date: Mon, 22 Apr 2024 22:46:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024, at 21:42, Masahiro Yamada wrote:
> On Tue, Apr 23, 2024 at 3:24=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Mon, Apr 22, 2024, at 18:58, Geert Uytterhoeven wrote:
>> > On Mon, Apr 22, 2024 at 3:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.d=
e> wrote:
>> >> On Mon, Apr 22, 2024, at 15:28, Jani Nikula wrote:
>>
>> I think hiding this would make it much harder to get anything
>> right. The symbols in question are almost all ones that should
>> be enabled in normal configs, and the 'make menuconfig' help
>> doesn't make it too hard to figure things out normally, we just
>> have to find a way to avoid regressions when converting things
>> to 'depends on' that used an incorrect 'select'.
>
> I am confused because you repeatedly discussed
> the missing I2C dependency.
>
>
> Are you talking about DRM drivers,
> or is it just "an example" in general?
>
>
>
> DRM selects I2C.

It's a prominent example because I2C ends up showing
up in most circular dependencies. I forgot that CONFIG_DRM
itself selects this one, but this is clearly part of the
overall problem:

$ git grep -w 'select I2C' | wc -l
35
$ git grep -w 'depends on I2C' | wc -l
1068

Attempting to clean up some of the incorrect 'select'
statements, such as changing DRM_NOUVEAU to 'depends on
ACPI_VIDEO' instead of 'select' tends to run into
another 'select I2C' such as this one:

drivers/i2c/Kconfig:8:	symbol I2C is selected by DRM_NOUVEAU
drivers/gpu/drm/nouveau/Kconfig:2:	symbol DRM_NOUVEAU depends on ACPI_VI=
DEO
drivers/acpi/Kconfig:214:	symbol ACPI_VIDEO depends on BACKLIGHT_CLASS_D=
EVICE
drivers/video/backlight/Kconfig:136:	symbol BACKLIGHT_CLASS_DEVICE is se=
lected by FB_BACKLIGHT
drivers/video/fbdev/core/Kconfig:184:	symbol FB_BACKLIGHT is selected by=
 HT16K33
drivers/auxdisplay/Kconfig:490:	symbol HT16K33 depends on I2C

Again, I2C was probably not the best example for an urgent problem
as it ends up being selected unconditionally anyway, but
I think ACPI_VIDEO and BACKLIGHT_CLASS_DEVICE are the ones that
we should stop selecting.

> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 5a0c476361c3..6984b3fea271 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -29,6 +29,8 @@ menuconfig DRM
>           details.  You should also select and configure AGP
>           (/dev/agpgart) support if it is available for your platform.
>=20
> +if DRM
> +
>  config DRM_MIPI_DBI
>         tristate
>         depends on DRM
> @@ -414,3 +416,5 @@ config DRM_LIB_RANDOM
>  config DRM_PRIVACY_SCREEN
>         bool
>        default n
> +
> +endif

This is a probably good idea (aside from DRM_PANEL_ORIENTATION_QUIRKS,
which needs to be moved out of the section), but seems completely
unrelated to the issue of selecting too many symbols.

     Arnd

