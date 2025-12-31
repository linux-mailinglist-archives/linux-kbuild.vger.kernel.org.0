Return-Path: <linux-kbuild+bounces-10392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4443ACEC4BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 17:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D1423001022
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 16:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9331228D8ED;
	Wed, 31 Dec 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Y8gNzWFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C2288505;
	Wed, 31 Dec 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200089; cv=none; b=i3NYa+12jc71G9JDBS4HM/XR2I300laitOoMMNdQPpCiZlAHDF5m6+YSrz6cuomoPcK7+GAmksBQGyRfuSTE9Dc4djJgtbrCNBARyowJQAip7PyNcczcrytXhOdAEyVSsBds1q26qd02OOyHhttXVxa3xuwdQNGBVV2Jz2UjLXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200089; c=relaxed/simple;
	bh=OmnlEh+HtRLWey/ktyi9TiblUeObtM8aKi5+OxV0PZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdmjbaNNyEH9RY6I3BHFkDZV2VYHF8+D7EpPDf3MZbJ7z/Jf7/2o+dXr14mqRJaTSeVo9/z2OnboGxP199ygOGlDxu3RSrwBXf9+M2luWlxUgRuS8L2Wb00lrI8Qs/as3tWiyDhdOOaMqCjoQaxTT5IFaQUhW3mFaMZABFRuyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Y8gNzWFf; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id CD48F5802CD;
	Wed, 31 Dec 2025 16:54:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FCE34431D;
	Wed, 31 Dec 2025 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1767200077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOX/y1+f9gL2kvy+BIaCMP08vzDLLBlXT1KOKItWWzA=;
	b=Y8gNzWFf9iwAuJf89mZiGW2WgWsjnb3KtBptxYUIVhEUWr0gctYKHlP0X2IlbbGDlWcwqX
	lFUputxFlCXi16IRAjWGI1B2FjFx8WjTtdFQeqpZ7sGu/kDVqm57CnZUU8W0XVpXa87IBh
	gwyQVV46l6lWV5Ypv/KkPTIWG58xkZs6eHYWjqtLsMX5YHn5KnssL3oPXOrkEevrgukc4R
	A4fa1GquxqcVjPBLLF5GMLdaElXxuKGB+hxgRqUtQlLL9t6b/8/sN0GAoLCc265jOTZpfu
	wEVmyw/BPDYg7sI9+E3cCJ0kinzmq91TfZDbVvEntD0iNfuVKf9pNISftTUzEg==
Message-ID: <b0208635-f583-4146-82b3-335842172b83@gtucker.io>
Date: Wed, 31 Dec 2025 17:54:35 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
 <20251219194748.GA1404325@ax162>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20251219194748.GA1404325@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfhojggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedviefhkefhjedtgfeuveeiffekudfhjefhtedtteduteetjeeiudevveeuueeggfenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeehtggusgemrgguiegsmeejvgektgemgedvheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeehtggusgemrgguiegsmeejvgektgemgedvheefpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeehtggusgemrgguiegsmeejvgektgemgedvheefngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepvdfhvefgfeeggeefudffpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepledprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghuthhomhgrthgvugdqthgvshhtihhngheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg

Hi Nathan,

Thanks for the follow-up reviews, I just sent a v3.  Here's a couple
more things I didn't address in your original email.

> One initial comment (or perhaps feature request) would be handling O= /
> KBUILD_OUTPUT for building out of tree. It may be a little complicated
> for mounting the build directory into the container but it might make it
> easier for folks who build out of tree to use.

Yes, that could be done but I would prefer to add it incrementally
rather than in the initial version.  Handling a build output
directory outside of the source tree means that the "make O=" option
would need to be provided in coordination with the data volume e.g.:

    container --output=$HOME/my/directory:/data/output -- make O=/data/output

We could rely on a convention for /data/output but then I don't
really want to start parsing and patching the "make" arguments yet.
A workaround is to bind-mount your build directory inside the tree
and then just pass "make O=" in the container, but that comes with
some caveats too (root privilege, potential security issues).

On a related note, I did a quick experiment with a "container -C"
option to mount the source tree from elsewhere than the current
working directory as that can be done independently of the command
run inside the container.  It's needed for Docker-in-Docker as you
have to provide the path on the host to mount volumes.  Other than
that I'm not entirely sure how useful this may be so I'm leaving it
aside for now as well.

> Is there a minimum python version required for this? If not, I would
> prefer using pathlib here:
> 
>   from pathlib import Path
> 
> then
> 
>   Path.cwd()
> 

Sure, the pathlib package was added in Python 3.4 so that's ancient
enough.  I reworked this part in the v3 series and added a note in
the docs setting Python 3.10 as a reasonable minimum requirement.

> Is there documentation for how an environment file should be formatter?

I added something about this in the v3 docs, essentially the file is
passed as-is to the container runtime so it's not for the container
script itself to parse it.  The short answer is that it should look
like the output of the env command.

Cheers,
Guillaume


