Return-Path: <linux-kbuild+bounces-10317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D8CD542C
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 10:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BAA2300C5FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07C27FB32;
	Mon, 22 Dec 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="GrDhNyBY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E881F1932;
	Mon, 22 Dec 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394714; cv=none; b=qCpDOJhyTMl3OlWqC28yCLMBd5qH56Ypp5sHCWxKHG7aYaGUCZv3s3u5Ru1Ttqz77W1Zt5/+HfXzxqKNgNMwICo8U+3Lm40ihhF/gS+arYu9jRxciT7RIMNJD1qb8u8NJuglkRSbbB+wyNwvXAJAIjoOp6BsbawUfhi3x3XRBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394714; c=relaxed/simple;
	bh=N9aCVMEl/HTjHPLuPPhGpC4Mtohmk3lLmADEJn/Yi7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtcHJvoZM7LP2Dh1BSSRCOtKYVgvl5UF9u9BZ/PVvEhAug4HRpzxgReTTh5VcFkyFQEWwRkYPxlfx6qDdS7A/G0nd4clAgKaBMfaY00Jzf4vhi4/ZknXEyY6BZRfMlVcY100/Ojl6K/UM7c00+9d6vhG+rc7DRlCBe114DZbxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=GrDhNyBY; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C901F68E;
	Mon, 22 Dec 2025 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766394709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKexkeADCmpnATxFKMwqTtjq4nHqFt3WnpfG4v4OE78=;
	b=GrDhNyBYLEabym01b9mEKJPS+uB1RJGCcf6GJCCoO73NrFbbbLNzX2NUDSpRWzV24kjGlg
	cLI+PU/iaoHWukyGPUgWquQ9Dn40SnCRvaRIICEEocgGkZjNj8cHHKqnkDimAEQgt0Zqi0
	wHPCKqzbENWWBbVm7o0o7ajx+Rjy7mpNpfb/EsszGxv4DeL66JxuxTc8BfSgaHxX1SpTqx
	fNbRg102O6bkqYgBZOYQuHT5N39dpBZokPaz6ncnUuO209FabGUDpRtnEmnICI2eprGwog
	dzkM0ndCRUVwFDG55xoQXLOpMJmvikcy+OLl+JC8rLBhUeHBeto98YuVbg8MxA==
Message-ID: <09b3bc78-6c55-4d8c-8d09-9f313454dee3@gtucker.io>
Date: Mon, 22 Dec 2025 10:11:25 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
 <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehieehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfhojggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeduleegveeuteefffffjeffhfejhfejjeevtdelgefhjeeluedttdfggfdvieeuveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemfhhfvghfmeeifhgtudemjeehfhgrmeekvdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemfhhfvghfmeeifhgtudemjeehfhgrmeekvdehkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgegrgedtmeekiedvtdemfhhfvghfmeeifhgtudemjeehfhgrmeekvdehkegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupefhudevledtudfhieekgfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehmihhguhgvlhhojhgvuggrshgrnhguohhnihhss
 ehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg

Hi Miguel,

On 22/12/2025 04:30, Miguel Ojeda wrote:
> On Sun, Dec 21, 2025 at 9:19 PM Guillaume Tucker <gtucker@gtucker.io> wrote:
>>
>> Another piece of feedback from your v1 review was to add a link to
>> the documentation.  As it's not published yet I just mentioned the
>> section name here in the v2 - but I can anticipate what the final URL
>> will be i.e.:
>>
>>      https://www.kernel.org/doc/html/latest/dev-tools/container
> 
> A docs.kernel.org URL instead may look better?

Ah yes, good point.  Except right now it's returning HTTP 403...
Hopefully that's just a temporary technical glitch.

Cheers,
Guillaume


