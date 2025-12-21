Return-Path: <linux-kbuild+bounces-10313-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAECD4551
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 21:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D05F3003F94
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Dec 2025 20:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E738E319601;
	Sun, 21 Dec 2025 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="novbMs6F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18B2FF664;
	Sun, 21 Dec 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766347770; cv=none; b=a9Vq0azg+Z5y49DX7AX9Wgc0s2e9PUjjhIYjoVQqg0mi8gkOS2+I3zeX3spPhLFZ9KTEl86IC2C7viaQm+eeXT0dZT5IdOaZZzruwgw8VgqhKP0KAX6+YsaONKjlbVyY/C8aZ3A45gJGExba444RcezFkjy7bm4MulSAJYiqW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766347770; c=relaxed/simple;
	bh=zpurecmt0Fvc0TF2qnsMaV2OHtG4VaokYE7+lEuCn7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S07QfVKzMR6+yAYtCstC1efhvOkR6n6Gb3GGZUt7PxGJhl12m4+Qp67QE3tfXVliSN24WGtAg5Q/lG7YNmvjtxploPMctm3zs9wRJ8XBJGN9vVPSt1bX5wl60YKb+7K3YM3Zy7stMU1QhGPZksmvmsBoCjIdm5sQcyfHjtUif6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=novbMs6F; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5414220544;
	Sun, 21 Dec 2025 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766347760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8JSDZo5hoiTcMeFejZt59LOE4c3abK/rfLqZ2t4wH4=;
	b=novbMs6F0YtG9ZHpluPX+yVW/NZ8lpy7k4Y3EUFUs3n5XoUQExTQu4uQm/0udNaWaq98qa
	0DAPuhdUxaboIlJ5L5AhvQLJ0NV6G0i0ygeFFn5OwWJDIl0SL6T3gw9z+gL+fmVGMvQdKx
	jDGV4lwrbWSjMeuj6smHcst+VHUIXGEcpm+2SBX7buflIw51ji4aS4Wm66tn+aba3Hivh0
	YfqdnV/LeDyODd2sEF/3GOGhdJqomlCwUUs3D572fYjrQTRChbyMtlnj1+rMmcoy/2RkgR
	CCj1z7BSqLvnN+IFmshcJlOkZJDkpJ8CLPxqDSGLjWaRYmJFHMLIZGRhK10gpw==
Message-ID: <50ee5ec6-ca9b-486d-ac7e-5a896006a9de@gtucker.io>
Date: Sun, 21 Dec 2025 21:09:17 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <20251219212731.GC1407372@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20251219212731.GC1407372@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehgeelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnheptdejheejheffvedvhffftdefuddvkedvveevleeuieegkeeukedvueefvdejteefnecukfhppedujeeirddugeehrdekuddrvdduudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddugeehrdekuddrvdduuddphhgvlhhopegludelvddrudeikedrudelkedrieegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepheegudegvddvtdehgeegpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

On 19/12/2025 10:27 pm, Nathan Chancellor wrote:
> On Thu, Dec 18, 2025 at 01:49:52PM +0100, Guillaume Tucker wrote:
> ...
>> +    def __init__(self, args, logger):
> Adding something like
> 
>      self._args = [
>          '--rm',
>          '--tty',
>          '--volume', f'{os.getcwd()}:/src',
>          '--workdir', '/src',
>      ]
> 
> here then adding an __init__() in the subclasses to append the runtime
> specific arguments would allow _do_run() to be moved into
> ContainerRuntime(). Otherwise, this looks pretty good and extensible.

Yes, I left these very similar parts as-is on purpose to make it very
clear what the command line arguments are for each container runtime.
It's a good idea to refactor this though as you mention, and I'll add
a debug log message to print the command line instead.

I'm also anticipating that other runtimes will be quite different,
Podman and Docker just so happen to have many options in common.
Things like runc or containerd are very different beasts so I don't
want to over-generalise.  But this is straightforward enough for now.

So I'll rework this a bit in a v3.

Cheers,
Guillaume

