Return-Path: <linux-kbuild+bounces-13921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3hl2NWQeRmoVKQsAu9opvQ
	(envelope-from <linux-kbuild+bounces-13921-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Jul 2026 10:16:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97E6F4AC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Jul 2026 10:16:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.alibaba.com header.s=default header.b="I2/muGzC";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13921-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13921-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.alibaba.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F053B3037454
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jul 2026 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7608440E8FD;
	Thu,  2 Jul 2026 08:09:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063540B6D4;
	Thu,  2 Jul 2026 08:09:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979762; cv=none; b=IPLMtVyZWvI3xLMOjAlke7ho0lVAnJ6trg8dgZCOzX0Nsibbq6avq61lH4pDRDCuF/G1zSN1lVfJkIv8xQuumR1rosm6ea9wlaFfv5yYDcexIMJIz113hh1tVq7uZDMEiPoi8qhHDwdtASBxse1mK5rD6XmqxLENXQeQ9rYiT20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979762; c=relaxed/simple;
	bh=9T7gA4muJccQ4K4ae0eZRd7SuZ58LOq1/A0SRcA8Uh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEUsLLBbZTLihpIwHND+X7t8eluZT9zhDJ65zK0JnNp/+wLiiiolUIGRY/VpgBFghQsGKAkm0GO9qCkuppVr/hBiFBnv+B7NrJ+M44elLnJ9aDdKSdINbZOgLrsN4EKk0lYzm/f0EkiTnLORRvGEpwiBayhqG+U5n5k3xkdUJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=I2/muGzC; arc=none smtp.client-ip=115.124.30.124
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782979756; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/J7MfHrQKnYa9EwxkBIvK2Sjd7rLZop5blBuGuYOdos=;
	b=I2/muGzCYZ7lHb0E7e8/ABsVzPkmvKOcspI3UUWJiGY2FLtMtUQT2LMXOPnDpKjTkLttsIcr4HrFoLRE/Zdz+GH2oYVkgB5n6PuaWY8XbA+Zd64k8X3qcYFXf+5aXtNG1plGweP2/CZx0W9WTUcX/hSunlYi/3BO7QnskEDZRko=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=zelin.deng@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6DcFaW_1782979755;
Received: from 30.74.129.76(mailfrom:zelin.deng@linux.alibaba.com fp:SMTPD_---0X6DcFaW_1782979755 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 02 Jul 2026 16:09:15 +0800
Message-ID: <b808a990-2bf7-4c6c-91c2-e8120fff03f5@linux.alibaba.com>
Date: Thu, 2 Jul 2026 16:09:14 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: livepatch: unset sub_make_done in case top
 level Makefile be overwritten
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 live-patching@vger.kernel.org, mpdesouza@suse.com,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org
References: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
 <alpine.LSU.2.21.2606191638540.26638@pobox.suse.cz>
 <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
 <akPTcJjrIAI1ZNyH@pathway.suse.cz>
 <20260630181125-a7a41726-4270-4bb7-92fe-17ec28cbe176@linutronix.de>
 <akUu0DEYrhd9cLCL@pathway.suse.cz>
 <20260701171713-7dd2f65f-abe2-4ae6-bcd4-e0bcdada6bed@linutronix.de>
 <ec834cd5-27ba-4bae-8c19-f6b97f098139@linux.alibaba.com>
 <20260702090852-9fe31739-3a7c-4604-9afa-805a6dcd8755@linutronix.de>
From: Zelin Deng <zelin.deng@linux.alibaba.com>
In-Reply-To: <20260702090852-9fe31739-3a7c-4604-9afa-805a6dcd8755@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.16 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[alibaba.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:pmladek@suse.com,m:mbenes@suse.cz,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:live-patching@vger.kernel.org,m:mpdesouza@suse.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13921-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.alibaba.com:dkim,linux.alibaba.com:mid,linux.alibaba.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E97E6F4AC4


On 2026/7/2 15:11, Thomas Weißschuh wrote:
> On Thu, Jul 02, 2026 at 10:40:21AM +0800, Zelin Deng wrote:
>> 在 2026/7/1 23:19, Thomas Weißschuh 写道:
> (...)
:) Now client language has changed.
>> I had verify your proposal, it worked well - liveupatch kmod was built
>> successfully and top-level Makefile wasn't overwritten any more.
> Thanks for testing!
>
>> Petr thank you for your Ack, I think Thomas's proposal is better than mine,
>> we don't have to do the quirk everytime when new selftest kmod is added.
>>
>> Thomas, so do I have to send a updated patch or you will do it by youself?
> Your choice. You did most of the work, so should be credited as author.
> If you don't want I can do it, too.
Never mind, it will be good if you can do the change, so please do it 
thank you. I'm just glad to report the issue and get some positive 
feedbacks.
>
> Thomas

