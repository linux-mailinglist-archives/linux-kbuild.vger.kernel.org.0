Return-Path: <linux-kbuild+bounces-10138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB397CC81D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 15:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A639130AB6E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 14:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57AD38256F;
	Wed, 17 Dec 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="VUKDhmLS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61533C19E;
	Wed, 17 Dec 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979575; cv=none; b=lGQuNzFQI+wLVVxJm8r3zZaNlqQX7EkifgDkgaYI4WNYijRVGR+IG+eKyDWQ6fRwj7VjLFhAt5b9LKzGUW7V26QnEQr2heCtwgnNEpVVkdFloBk3VDifvbG0+0aBbg6RM/8XjRzollBSHByjh/q9Zr17sBuCMegIn9P1YTqKJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979575; c=relaxed/simple;
	bh=mXaxx7BY8tyy/Pfu7PpBSQH3ipOqdYP0Qa/DGtQQeFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvUm4WBwiR8mA7hIrli1v7TFK+zYsSJzQJKfyBsrUqRFxbRxWmIN9Kx52knemFHc8RbtOyzXRzFoH6bheCwmielaQjHw0bqFIAgnminLUsJtf0NvJC7NrwDsJnUrkQs2q/j0wD+Djrs7hHy5pR91BPO6VO3m9D7ny719Va4oGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=VUKDhmLS; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 3A92B580FC2;
	Wed, 17 Dec 2025 13:51:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1817442F6;
	Wed, 17 Dec 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765979474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCzvOIL/ojXa/Uw5qaXYYXvUMXlM06Y/DgNBZpse1hw=;
	b=VUKDhmLSU6gzZJFFvA10VZ65gKeazozxSiIZZQKP9Hzxf+ZERRL5hll4zJ3s5+zhi4LKsb
	gg1Sb4kJ0r9/d9jKCvQGFsG9c/osw4I0lPPpHTHfb0K+GfLqm2GluPd+v6cyv39ixXFSZ7
	59GqwfTNbrV33HGFm4n5+Uuoxgo4HNETDazbDRnJPMoFwU4quD6qCpZF78+pZcDUJmWjTW
	0tcjXYWjX/NclSDOxbrOP0NKEYKmMw5FpyOaaZ8RUtaSbeAZ42eX+PpA0rJqnhAT8iyAr7
	ucjYEdMULju6PeH8E3Wyk4zdojUMO8fa5sMTBusatYOPdrBkl9PexVeldQvcSA==
Message-ID: <1bed549b-8586-4108-a1fe-55a41916ac0c@gtucker.io>
Date: Wed, 17 Dec 2025 14:51:11 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] [PATCH v1 1/2] scripts: add tool to run
 containerized builds
To: David Gow <davidgow@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
 <CABVgOS=LD_7gTk+qivoLJpAk0susehrCVdazApQAM=9311M4+w@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CABVgOS=LD_7gTk+qivoLJpAk0susehrCVdazApQAM=9311M4+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegvdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepleevgffhuedtheffjeeluedvffegvefgheetvdegtddvlefhkeevieeiuefffffhnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeektddrvdduhedruddtfedrudelvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeektddrvdduhedruddtfedrudelvddphhgvlhhopegludelvddrudeikedrudefuddrieegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepffdukedujeeggedvhfeipdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhug
 idqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: -100

Hello David,

On 17/12/2025 10:56 am, David Gow wrote:
> On Wed, 10 Dec 2025 at 21:58, Guillaume Tucker via
> lists.yoctoproject.org <gtucker=gtucker.io@lists.yoctoproject.org>
> wrote:
>>
>> Add a 'scripts/container' tool written in Python to run any command in
>> the source tree from within a container.  This can typically be used
>> to call 'make' with a compiler toolchain image to run reproducible
>> builds but any arbitrary command can be run too.  Only Docker and
>> Podman are supported for this initial version.
>>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
>> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
>> ---
> 
> I gave this a go, and am liking it so far. My only real complaints are
> that the defaults don't totally match my prejudices. :-)
> 
> Having a good default container, and perhaps falling back
> automatically to podman if docker isn't running (or just defaulting to
> podman) would make this very convenient for one-line
> tests/reproducers.

Many thanks for your feedback, I'm glad that worked for you.

Yes, the default 'gcc' image doesn't actually work in practice.  I've
proposed something else in another email to drop the default for now
but aim to provide "first-party" container images using kernel.org
toolchains which may give us some useful default later on.

Then good point about the default container runtime, I'll update the
logic to automatically look for Docker and Podman - basically iterate
through the supported runtimes - in the v2.

Cheers,
Guillaume



