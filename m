Return-Path: <linux-kbuild+bounces-10799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NrjOej5cWmvZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10799-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:20:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A90BB65262
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF4D3424BAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD5E3B52EF;
	Thu, 22 Jan 2026 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Zc53HrB4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA737FF5F;
	Thu, 22 Jan 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076827; cv=none; b=ISIlj4pYnk2xAzo3OxNcFUaX5aBQLuFhNZTbZWHCjvHSItpzhgUrtovkvtmRCmBXhADH7zmVgfdYJsd8jvNnAQWyMMdkP+co9lR6tvo5YKspq7njlgByeV3auFVuF/FQ/+iQORwe+536x4Rld2JODJdpHfO23/klOcSxTo9EVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076827; c=relaxed/simple;
	bh=DIdgKvbsE+stQowC8PbWkHC7BKt42IMjS2ZVC6qoNWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=hAIUtxogWti4AzHqTdby6lvE+M7b6J7a6xq7Ozz2pqg8A2P5We/gnQLFtmbh9Yj5zGcQvPY/5dvJbLGA36BIoKYtvvUGhjRAjBmO2WQ+/LGz/w7zZmtMzia7gniv7OiItYIrUPVFha6mZZ3bjxQy+oX2hGglrfGG7JraSo+HUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Zc53HrB4; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27FCE41DDC;
	Thu, 22 Jan 2026 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769076823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQ1ccnpNqTzAnpIZMwC9x+2AHxI7DYmZi4jFycjHTtQ=;
	b=Zc53HrB4ErkhxH6BDTLA7t2jNiAoXcZNexCBEzW08h+0JI8PGlqxiHyaALqIKbhLuApQKP
	8Y1QO3t20/DY+3snt+9b3/vUSvaJq19+96JN3j3qH2LJ7JJh3+5ZQ0kO28zO2dYjSRZDCo
	a//ZC24JGsbeTfQTWm7WKNb9+YdWuELHyM81n/vMoeeTS5XcOKM9vlLsjDlItd1p7Pl6r7
	bRNgpbuinN5T6B/rCFD/ZFLIEH5AvMoMchBzrtS37N/zJhLq+kGbr1L77Y+rLBESvurAub
	PS2Flcg1S+RSrabuBrjg5pTGUlNVQbFjSBqg2LQZ/n0Y469HcRvvPGqXYxnlYQ==
Message-ID: <61379dc4-2031-4f94-9709-dd5608cdb780@gtucker.io>
Date: Thu, 22 Jan 2026 11:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
To: Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeehkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfevjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeelgfehueeugfegudfgveehveegtddvgefggeevvdeutdeghffhfffhtdeklefhieenucffohhmrghinhepughotghkvghrrdhiohenucfkphepudejiedrudeikedrudeguddruddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduieekrddugedurdduvddupdhhvghloheplgduledvrdduieekrdduleekrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupedvjefhvefggeduffffvedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtt
 hhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10799-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gtucker.io:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gtucker.io:mid,gtucker.io:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: A90BB65262
X-Rspamd-Action: no action

Hi Nicolas,

On 20/01/2026 2:53 pm, Nicolas Schier wrote:
>> +User IDs
>> +========
>> +
>> +This is an area where the behaviour will vary slightly depending on the
>> +container runtime.  The goal is to run commands as the user invoking the tool.
>> +With Podman, a namespace is created to map the current user id to a different
>> +one in the container (1000 by default).  With Docker, while this is also
>> +possible with recent versions it requires a special feature to be enabled in
>> +the daemon so it's not used here for simplicity.  Instead, the container is run
>> +with the current user id directly.  In both cases, this will provide the same
>> +file permissions for the kernel source tree mounted as a volume.  The only
>> +difference is that when using Docker without a namespace, the user id may not
>> +be the same as the default one set in the image.
>> +
>> +Say, we're using an image which sets up a default user with id 1000 and the
>> +current user calling the ``container`` tool has id 1234.  The kernel source
>> +tree was checked out by this same user so the files belong to user 1234.  With
>> +Podman, the container will be running as user id 1000 with a mapping to id 1234
>> +so that the files from the mounted volume appear to belong to id 1000 inside
>> +the container.  With Docker and no namespace, the container will be running
>> +with user id 1234 which can access the files in the volume but not in the user
>> +1000 home directory.  This shouldn't be an issue when running commands only in
>> +the kernel tree but it is worth highlighting here as it might matter for
>> +special corner cases.
> I tested a tiny bit with podman as runtime backend.  If I leave out the
> '-r podman' podman's docker emulation is in effect and fails with:
> 
>      $ scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j8 olddefconfig
>      Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
>      mkdir: cannot create directory '.tmp_15': Permission denied
>      mkdir: cannot create directory '.tmp_19': Permission denied
>      mkdir: cannot create directory '.tmp_22': Permission denied
>      mkdir: cannot create directory '.tmp_25': Permission denied
>      mkdir: cannot create directory '.tmp_28': Permission denied
>      mkdir: cannot create directory '.tmp_31': Permission denied
>        HOSTCC  scripts/basic/fixdep
>      error: error opening 'scripts/basic/.fixdep.d': Permission denied
>      1 error generated.
>      make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
>      make[1]: *** [/src/Makefile:655: scripts_basic] Error 2
>      make: *** [Makefile:248: __sub-make] Error 2
>      [exit code 2]
> 
> But with '-r podman' it works like a charm.
> 
> Would it make sense to switch the default runtime to podman to
> prevent non-functional podman-docker emulation?  (Or is this just a
> problem on my machine?)

Yes, I just had a quick look as I'm not familiar with the setup to
run Docker commands on top of the Podman backend.  So I'll swap the
order like Nathan suggested so that Podman takes priority over Docker
and add a note to the docs.  It's on the list of improvements and
I'll work on a proper fix once the initial version of the tool has
landed, assuming this is not a blocking issue.

Thanks for trying it out and reporting this use case.

Cheers,
Guillaume


