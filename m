Return-Path: <linux-kbuild+bounces-10314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90DCD4564
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 21:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 101873003BEF
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 20:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1102631CA50;
	Sun, 21 Dec 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="RpA7xA2s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A67281358;
	Sun, 21 Dec 2025 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766348363; cv=none; b=Rn0Mym8jzU7QQn2bFUcWgkU/LMuS7h8OUVj2c4Qe6xJAzm8pEQ0ivK/9hYRFraCwqfWDWWiiaYX+k3RBP6LhuQ1Xv3u/hG5V8tYmpp7vKdWxVdJpeSdlE/Bd2gHIOyi2rw6+/PnDM6ITp+f86HUAqHUNQQcGmdd6rOTuI5IY3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766348363; c=relaxed/simple;
	bh=JkDQ8oi19gLvNrfGskhhG37O6ygYePIJg88rb3Em+KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsnCMk+r9KTTLn2kGsSbPGOBd2W15+x0mn35XgMBPaQ+BHo15eN1fL+uZWSR/lY0oJSjQUk8+aVPp291XG2EwgT2ePiIijUOqIH15QUs1ZwzQxCb16USrBGpiqD6bxixpzBNa+AVjJs5gyj3gn74LnSlTprtS0hwQ+pTu8CZvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=RpA7xA2s; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 37882580667;
	Sun, 21 Dec 2025 20:13:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04584432A;
	Sun, 21 Dec 2025 20:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766348017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUNDYjywUWF3KfHA0fiXYPHu4KxV5b6JsPwnoft0580=;
	b=RpA7xA2sPSY/+E2vKJQ4pAtVfybNYL0rzGunN2ZUYCkPSffCQizucyRyuMow++HP3n4VBd
	5Y04vXl82LsJ+fi2o6ULT0uk/f2kcRDPmcoFoMrbvE2euF10VswjorKApC/6Qifziag4d/
	ixB4fGi+FgM3GN1D/iK2cJjrwNQCBp/Y6/iaXbeHUX1Tx3IOJQO/cwzMEkWJ1hfssmljMR
	iHsBzggiq/zZMctgxDnywamygfMK/IakSXDQ6twzgyMLao8eXbT4v4yRQZKxfIgyDeT5u7
	jLt85x0D3RctbrnuhiR6fiGPEmp20ZPG/na/Izgk8IxxroJDYfG3YIE8cx+Vbg==
Message-ID: <23c38222-ba4b-4728-8ad6-8bb02c5a2d3a@gtucker.io>
Date: Sun, 21 Dec 2025 21:13:33 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Documentation: dev-tools: add container.rst page
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1766061692.git.gtucker@gtucker.io>
 <ff8da6b9680ef01ee44f6d0cf89e34dd76abb116.1766061692.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <ff8da6b9680ef01ee44f6d0cf89e34dd76abb116.1766061692.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehhedttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnheptdejheejheffvedvhffftdefuddvkedvveevleeuieegkeeukedvueefvdejteefnecukfhppedujeeirddugeehrdekuddrvdduudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddugeehrdekuddrvdduuddphhgvlhhopegludelvddrudeikedrudelkedrieegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepffdtgeehkeeggeefvdetpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hi Nathan,

On 18/12/2025 1:49 pm, Guillaume Tucker wrote:
> +User IDs
> +========
> +
> +This is an area where the behaviour will vary slightly depending on the
> +container runtime.  The goal is to run commands as the user invoking the tool.
> +With Podman, a namespace is created to map the current user id to a different
> +one in the container (1000 by default).  With Docker, while this is also
> +possible with recent versions it requires a special feature to be enabled in
> +the daemon so it's not used here for simplicity.  Instead, the container is run
> +with the current user id directly.  In both cases, this will provide the same
> +file permissions for the kernel source tree mounted as a volume.  The only
> +difference is that when using Docker without a namespace, the user id may not
> +be the same as the default one set in the image.
> +
> +Say, we're using an image which sets up a default user with id 1000 and the
> +current user calling the ``container`` tool has id 1234.  The kernel source
> +tree was checked out by this same user so the files belong to user 1234.  With
> +Podman, the container will be running as user id 1000 with a mapping to id 1234
> +so that the files from the mounted volume appear to belong to id 1000 inside
> +the container.  With Docker and no namespace, the container will be running
> +with user id 1234 which can access the files in the volume but not in the user
> +1000 home directory.  This shouldn't be an issue when running commands only in
> +the kernel tree but it is worth highlighting here as it might matter for
> +special corner cases.

This part of the docs explains why things are a bit different between
Podman and Docker.  In both cases, it should "just work" from a user
point of view - just with some special corner cases.  Let me know if
you thing the documentation needs to be improved.

I may add a runtime check as a follow-up to detect if namespaces are
enabled in Docker and if so use them, but to get started I wanted to
keep things as simple as possible.

Cheers,
Guillaume

