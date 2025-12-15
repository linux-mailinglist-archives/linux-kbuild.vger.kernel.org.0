Return-Path: <linux-kbuild+bounces-10098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF73CBD556
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 11:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D9773014D84
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Dec 2025 10:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF2A314B93;
	Mon, 15 Dec 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="YLW4iXxI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106331AAAD;
	Mon, 15 Dec 2025 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793733; cv=none; b=NglbeubjTAWcb9yNVFTscdeAQeWm7gDby/dwjA2q+g9xInCeS67I87/QTieuHU+fa6tevL5YIfT7l4sQ9xRbq557//D7CnmrHCvXRWaIC4yx2ZtRnlCdDVW1gUp1D8kaB+XliZOrwlvTTxoPt1zCq1QuREVOniTM8tFGajhT6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793733; c=relaxed/simple;
	bh=JPOmklmMLYq6mP2PbfIgSF2coLORCWmQ8LDixgtTFaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1agPMxzupfzscOmwFUC1vmXa/v0KQLWzSzWN9IGd5wzPjg/OLRYJjUO6/6wmtNUcGpD86lbqTjc0T6N1rhdi7vH5ci0fRIprpCNa+bRlX8xlEkNzMjKi6H63d+u/8U4NHGx+NH8mRwpNaR4pMvDTEbZnxrue6xLY7bSWSlA+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=YLW4iXxI; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 213DF1FD00;
	Mon, 15 Dec 2025 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765793722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JE0MkyDh2OFDvU6yHj6+8uC5VbEASap+Thy0bCIdkI=;
	b=YLW4iXxI/yLOfN8JL4Rb2Jyge5Xo7AiRFi6sXITSQSUMznzMLVo6Xxj1LxMgByEjbKr25J
	nTG3D86yb6Qn2z2rBV85ckCeDTA6viRpQTL/OD1zn3fFE6yEzqQtoz0/KsJf0W95RZLcAJ
	xx2RkEieF05eJAOt/yiZGIqbnujhrp502V8OKwXoKJ4M2q89Evh4Tup6gd8trtNzg1BACH
	/T5QR0jGtq7F9MnMml9cyIuXrazDFeXvhJWvqQoX3DmWfXgoCYHLpNaiDn11MjXquNLuFE
	h1CFw72ByaKopa4iAHO07cPViuT11E7AUm6IkhLpOJ7MmIXwVJLHtS3UqeXmdQ==
Message-ID: <31937c2c-23b5-471d-abcb-188721e995d8@gtucker.io>
Date: Mon, 15 Dec 2025 11:15:19 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
 <20251215122407.720d65bf@nimda>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20251215122407.720d65bf@nimda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhephfetteduleegjeehjeegffduvdeuueevhfdvueekueegtedvudevkeevkeefffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepvddufeffhfduhffftddtpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrt
 ghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hi Onur,

On 15/12/2025 10:24 am, Onur Özkan wrote:
> Hi Guillaume,
> 
> Excellent work! Just one note from my side so far:

Thanks for the review!

> On Wed, 10 Dec 2025 14:58:28 +0100
> Guillaume Tucker<gtucker@gtucker.io> wrote:
> 
>> Add a 'scripts/container' tool written in Python to run any command in
>> the source tree from within a container.  This can typically be used
>> to call 'make' with a compiler toolchain image to run reproducible
>> builds but any arbitrary command can be run too.  Only Docker and
>> Podman are supported for this initial version.
>>
>> Cc: Nathan Chancellor<nathan@kernel.org>
>> Cc: Miguel Ojeda<ojeda@kernel.org>
>> Link:
>> https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4- 
>> a7965c19ac4e@gtucker.io/
>> Signed-off-by: Guillaume Tucker<gtucker@gtucker.io> ---
>>   scripts/container | 112
>> ++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 112
>> insertions(+) create mode 100755 scripts/container
>>
>> diff --git a/scripts/container b/scripts/container
>> new file mode 100755
>> index 000000000000..74644ac33685
>> --- /dev/null
>> +++ b/scripts/container
>> @@ -0,0 +1,112 @@
>> +#!/bin/env python3
> By default, this will not work on NixOS because /bin/env is
> not a valid path.
> 
> It will fail like this:
> 
> 	$ cat something
> 	#!/bin/env python3
> 	
> 	$ ./something
> 	zsh: ./something: bad interpreter: /bin/env: no such file or
> 	directory
> 
> Is there a reason for not using /usr/bin/env?

Ah sorry, my bad.  I initially started writing this as a shell script
using /bin/sh and typed it wrong when changing to Python.  So I'll
fix it in v2, thanks for flagging this (pylint didn't...).

Another change I want to make is to drop the default image as 'gcc'
doesn't really help.  If the user hasn't set a custom tag, it will
pull some generic image from docker.io which won't have all the tools
needed to build a kernel.  So making the -i option required or
turning it into a positional argument would be better than some
implicit behaviour.  I'll start a separate thread with Konstantin and
Arnd about hosting kernel.org toolchain container images as having
that should make the tool much more useful and we might set valid
default values e.g. kernel.org/gcc.

Cheers,
Guillaume


