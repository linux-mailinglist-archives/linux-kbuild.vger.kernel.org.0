Return-Path: <linux-kbuild+bounces-10762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CAbONKkcGlyYgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10762-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:05:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E554E55
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0CE08E291A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E52421891;
	Wed, 21 Jan 2026 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="EQ1DCx84"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9053D3486;
	Wed, 21 Jan 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989362; cv=none; b=WIEm2dwUOKbkMEeoUFpse4y0+dtjE5tnPxKkur3xJZSZHw7gp79FmIrSNHPhqDKRbdZYJBwLroy4swVB+rgqAstfREef/64Sz3iW0SbvAp7E5Cs+++wxjmBXiufHpFyZEJ0kjVr8duFqrPDQ/dDm70giNuhS5fUm0zV2Ijgl9Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989362; c=relaxed/simple;
	bh=vb33am2CXNzJTUFW8xjXCgEdnw5d36/6zQ548a5P7CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tXgUVz50Q4aaj1iRO820VJrW5mpExsFTmELSBzd5UBQGRHOlljPA1Rfop8IaSFDHk+xY+LanCrAXuHTtwtnTAEHNRZWrhgxwtkeVQsRUWPB99Xb/eodEheZxLVKsvuX+PcOeJ/C/4TEShvTuWG3AU13ZHLvlbqwGKf32T+pheIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=EQ1DCx84; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id A38F9430CC;
	Wed, 21 Jan 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1768989356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaqCvMBL8GtzVC6jIdKSwudL/1w67Gf2qPep5NgGXv4=;
	b=EQ1DCx84h6BZdcoubAvXWSPdKNVxCvwdllgqX2gJTFTgVi2brHbRG9kfXR4iby7t6eVMV0
	BizgUDW4ZXuVQymNB4OZoZ7faRLH/Wg5zt5AAT7puLMhUIBNC/VpskQFvnk+cBUwOkstVA
	4SBQDx3Pl0XWJdZnbGTDQcIDj8f7/28ZILt3FEOX4qY+18vjAAWs7FNhftncYvorbRKPHM
	4s3RZ25KbKn+EiQPBgsP2PPumyE3zw93wNGgEDdFnu5mULfsO5PGA1Qz54f7dHeyBr4jrG
	2qioSwCL+IbnsRt1aCwSaDEN73Wd3V5V8O9jYs8Gp8ceYJWW8MMwhpq7/iEmeg==
Message-ID: <e96a6e71-80b3-4556-a4eb-fd242e0f5713@gtucker.io>
Date: Wed, 21 Jan 2026 10:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de> <20260120183550.GD2749368@ax162>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260120183550.GD2749368@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedvleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnheptdejffefieefffegtefgueehgeehgfdviefhjeegleetgefhfeejfeeuuefhgeeinecuffhomhgrihhnpeguohgtkhgvrhdrihhopdhpohgumhgrnhdrihhonecukfhppedujeeirddukeekrddujeegrddugedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudekkedrudejgedrudeguddphhgvlhhopegludelvddrudeikedrudelkedrieegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepteefkefhleegfedtveevpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoi
 ihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-GND-Score: -100
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10762-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[gtucker.io];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gtucker.io:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ghcr.io:url,quay.io:url,podman.io:url,gtucker.io:mid,gtucker.io:dkim,docker.io:url]
X-Rspamd-Queue-Id: 7F8E554E55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 7:35 pm, Nathan Chancellor wrote:
> On Tue, Jan 20, 2026 at 02:53:33PM +0100, Nicolas Schier wrote:
>> I probably have just read it over: I have to prefix the
>> 'tuxmake/korg-clang' by 'docker.io/'.  Is that a problem of my system
>> configuration (Debian forky, no special podman config)?
> 
> Some distributions ship registries.conf [1] to allow unqualified image
> names but I do not think Debian does. Personally, I use the full name
> regardless but it should be easy to create it for commands such as these
> to work. I use:
> 
> unqualified-search-registries = ['docker.io', 'ghcr.io', 'quay.io']
> 
> [1]: https://podman.io/docs/installation#registriesconf

And this is not directly related to the scripts/container tool as it
just passes the image name as-is.  Maybe the example in the docs
should explicitly use docker.io/ though.

>> I tested a tiny bit with podman as runtime backend.  If I leave out the
>> '-r podman' podman's docker emulation is in effect and fails with:
>>
>>      $ scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j8 olddefconfig
>>      Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
>>      mkdir: cannot create directory '.tmp_15': Permission denied
>>      mkdir: cannot create directory '.tmp_19': Permission denied
>>      mkdir: cannot create directory '.tmp_22': Permission denied
>>      mkdir: cannot create directory '.tmp_25': Permission denied
>>      mkdir: cannot create directory '.tmp_28': Permission denied
>>      mkdir: cannot create directory '.tmp_31': Permission denied
>>        HOSTCC  scripts/basic/fixdep
>>      error: error opening 'scripts/basic/.fixdep.d': Permission denied
>>      1 error generated.
>>      make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
>>      make[1]: *** [/src/Makefile:655: scripts_basic] Error 2
>>      make: *** [Makefile:248: __sub-make] Error 2
>>      [exit code 2]
>>
>> But with '-r podman' it works like a charm.
>>
>> Would it make sense to switch the default runtime to podman to
>> prevent non-functional podman-docker emulation?  (Or is this just a
>> problem on my machine?)
> 
> Yeah, I think it would be better to prefer podman over docker if both
> existed on the system. Something like this should do that?
> 
> diff --git a/scripts/container b/scripts/container
> index dbe92630f05b..50c4ae851001 100755
> --- a/scripts/container
> +++ b/scripts/container
> @@ -105,7 +105,7 @@ class PodmanRuntime(CommonRuntime):
>   class Runtimes:
>       """List of all supported runtimes"""
>   
> -    runtimes = [DockerRuntime, PodmanRuntime]
> +    runtimes = [PodmanRuntime, DockerRuntime]
>   
>       @classmethod
>       def get_names(cls):

Yes this should do the trick, although the help message and docs
would need to be updated too.

A better way still would be to make it able to distinguish between
actual Docker and docker-compatible Podman (e.g. if it's just a
symlink) so it's not just down to luck.  This may be added to the
list of potential improvements.

Feel free to make these tweaks now, or we might wait a bit to see if
others have more feedback with further changes and I can send a v4.

Cheers,
Guillaume

