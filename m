Return-Path: <linux-kbuild+bounces-10688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF8D3AC3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 15:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5500030D8F27
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E527B38B9A7;
	Mon, 19 Jan 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="D4jK/+xD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B5C38A70C;
	Mon, 19 Jan 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832586; cv=none; b=WwhVFqohNXGeLT3/03X9ZAtmXVDTLc7DeFA9a6I70eJgy6Gaiml5y6Rn91C5nNauzEcqJj/OuwQjLxb+xGTaK6EX+eEIMJnL+w6YNhfXn8/5dglLDVLTJinmmtJnRqfIQ/8UbMfC64z5NtQt67x3DHGGvQo3Jyq1JaGE3O/47VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832586; c=relaxed/simple;
	bh=jqfvgiz03eH0HSVX2YC7sTHHbMl/5/0XfkyUPHHsCkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFXNwhCOGhLB2ztVNEejV3DJPGDGJz38P8MKgx8FyAg6n/gtqJMdf1yw6uGiBb5gujU9bCeswuKvXiIYtlgR2Vj/3YjOQRaFd9Uj2dBLiBVs3FjwQO/VkvKyjW5QeG6JqAT5MMPGP0+fnHpRDUj8VKgIDolxxwMXhOCeEVRPkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=D4jK/+xD; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 855431FD9F;
	Mon, 19 Jan 2026 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768832583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqivHObrIBNkZFXBBXgy4JRVyML//A8Yhzo/aWcrUx8=;
	b=D4jK/+xD531u3W7MmCSbcFJBW9aVIoHQKiO8CUAkVpqh/IqRARH1E60uyirPer3NKoIvDk
	aFjlTQeRdZYMZTWhtQ5hiTy6lyX6eWBl8oC/wcRCoC7KvoshTZVUq4aqOPEetniL/Alkw4
	bhL3wZOSD/oV5pkLXz1n9zS2ZSXAjzxGOHJS94fhIN+qP9RnDpXMOmdwKXi0LixSJwTMHP
	NIreFgY+1tYFeZSocsYkVsMyxkMv1JGUiV22qviV+n4SM+gWvakS3ELSDQMEq+zjOAfQTS
	6Darf25LQ+BpoR1lxiCP0lI3x0FRwSDqJmq+V9cpkqiVuinx5rK3k9PPTE5aNg==
Message-ID: <e59c64e0-68b9-4c3a-aeaf-266edb968634@gtucker.io>
Date: Mon, 19 Jan 2026 15:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <6af4b4cb-cf0a-4647-bdb8-0b2b1cb03b76@gtucker.io>
 <20260116211246.GA1826279@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260116211246.GA1826279@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeejfeekveehkefhfeelueeiffefvdfgtdekjeegleegleegkeeutdfgteekudeggeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedujeeirddukeefrdduudegrdduudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudekfedruddugedruddukedphhgvlhhopegludelvddrudeikedrudelkedrieegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepkeehheegfeduhffflefhpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvp
 dhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hi Nathan,

On 16/01/2026 10:12 pm, Nathan Chancellor wrote:
> Hi Guillaume,
> 
> On Fri, Jan 16, 2026 at 11:28:24AM +0100, Guillaume Tucker wrote:
>> Hello,
>>
>> On 31/12/2025 17:51, Guillaume Tucker wrote:
>>> Changes in v3:
>>> - Refactor common code for Docker and Podman
>>> - Add docs.kernel.org URL in help message
>>> - Use pathlib Python package
>>> - Handle signals in parent process by default
>>> - Add --shell option to use an interactive shell
>>> - Tweak debug messages in verbose mode
>>> - Specify Python 3.10 as minimum version in the docs
>>> - Provide an example env file in the docs
>>> - Update docs regarding interactive shell usage
>>
>> I'm sure you're all busy landing commits ahead of the next merge
>> window.  Could you please take a look at this v3 when you have a
>> moment?  I believe I've addressed everything from previous reviews.
> 
> So sorry for the radio silence. I was going to try and look at this
> today to give feedback before the weekend but I will not be able to look
> at it until Monday. Given that this is self-contained (no pun intended)
> with no regression risks, I would have no qualms with applying this late
> in the development cycle.

Thanks for getting back to me, that's great.  I'll keep working on
some follow-up improvements in the meantime, regardless of the pace
of the review process.

Cheers,
Guillaume


