Return-Path: <linux-kbuild+bounces-10955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDCxCJUGfmmVUwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10955-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 14:41:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF41C209B
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 14:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 756EB3007AF4
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38349352C34;
	Sat, 31 Jan 2026 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="UGyu9OOz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3225F7B9;
	Sat, 31 Jan 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866595; cv=none; b=jpWc0PiUjn2F8NGX36l3atcENYEv+XAkq2K8E1S2scqSgRssesgZ8Z8Y7KZiP2bGmdtJhwWIi3CAbAWzr1ibVB7u+I+/DCT6lp/syi44TLT93LKX36fbAS8I9jKdmyiziE7PPW1K2DAAvKOdyMa9OfUOMXAt/++iOhbQb78CW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866595; c=relaxed/simple;
	bh=ETjIu9X1UzfMeb2/GaBDScxVgeJExTm8Knq3LrxVE5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=mgw3EQLH5+8XhDuc/q44GzvPY3z4xw1rbK0ypjJizotNfZJrDGW2QfcGdSVWSTpeCqSzmu7Fe3xjjmgIy0kfbyDGZV11b1+6bkmUhc/1BQ72WSo3RD2OUiZhwv6/DJpPb8UXp3RSkKk9BdqM4Y9Qcur2uyKWG8AnlFDdGSMSoXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=UGyu9OOz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id F281D438D7;
	Sat, 31 Jan 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769866585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNbBAYy8eEVK14kERy6x2Yy7Zc40mqn4g0KFfR9rgoQ=;
	b=UGyu9OOzk+A1qmhAfyuNIRh0bm9l9ZyGxJ8JOOVOILBjTzsmBZAsT+91/t1XZDApduoIUm
	5cxPpMBzIkTAs7Y5UAYIBNA9UjgDdTBJfQNbu3I6K0iZ1r0TYVPGT1vvSk3lofIjPeY+By
	9rzsAC/0pQiP265d4qe8hNjEH0Wq79v9DcXgX13kgx+8iCzF4NsY0NCfPeCWCxAiPm01Gr
	LyiZbgqvwpV6twwWoaCN/HNKG6oNuWAwsh9TpiQjBHQp4aWx6SyGUPE0vpgZx6c/F2RvCj
	eNC3MqeLOySNxaoa5AqaSKwWjLLocB/x7qw7XFXWgky/nMnkkPFpv1+ZF/VWCg==
Message-ID: <4848da1a-91bf-4c2d-a6df-63963ee9f0a3@gtucker.io>
Date: Sat, 31 Jan 2026 14:36:17 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
 <56209dbc-2dbe-4f52-a703-bcbd9ed3e712@gtucker.io> <aXkceKDeYxUGHLQh@levanger>
Content-Language: en-US
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <aXkceKDeYxUGHLQh@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedvtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfvefhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedvheeiieejhfefkeffhfetjefhudevlefgudelkeffteefgfdtveeuleetleehgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemieejtgemudekuddtmehftdehudemsggtrgeimeguughfleemiegsfeemvggstdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeeijegtmedukedutdemfhdthedumegstggrieemuggufhelmeeisgefmegvsgdtsgdphhgvlhhopeglkffrggeimedvtddtudemieejtgemudekuddtmehftdehudemsggtrgeimeguughfleemiegsfeemvggstdgsngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugephfdvkeduffegfeekffejpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepn
 hgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-State: clean
X-GND-Score: -100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10955-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gtucker.io:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gtucker.io:mid,gtucker.io:dkim]
X-Rspamd-Queue-Id: 3FF41C209B
X-Rspamd-Action: no action

Hi Nicolas,

On 27/01/2026 9:13 pm, Nicolas Schier wrote:
> On Thu, Jan 22, 2026 at 03:12:36PM +0100, Guillaume Tucker wrote:
>> Hi Nicolas,
>>
>> On 20/01/2026 14:54, Nicolas Schier wrote:
>>> Out-of-source builds do not work on my system with podman.  If this is
>>> expected, I think it would be great to mention that somewhere in the
>>> documentation.
>>
>> The v4 now mentions this and also includes a trick using bind-mount:
>>
>>    mkdir -p $HOME/tmp/my-kernel-build
>>    mkdir -p build
>>    sudo mount --bind $HOME/tmp/my-kernel-build build
>>    scripts/container -i kernel.org/gcc -- make mrproper
>>    scripts/container -i kernel.org/gcc -- make O=build defconfig
>>    scripts/container -i kernel.org/gcc -- make O=build -j$(nproc)
>>
>> Would this work for your use-case?  Directory names are entirely
>> arbitrary.  It's not ideal but might be good enough as a workaround
>> until this gets properly supported by the tool in a future version.
> 
> sorry for the long delay.  Yes, thanks for the follow-up!

Great!  Thank you for confirming.  It's now in linux-next.

Cheers,
Guillaume



