Return-Path: <linux-kbuild+bounces-10819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAXMK5RycmlpkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10819-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:55:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C06CC10
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C80B3003702
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E305538735E;
	Thu, 22 Jan 2026 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OhgoSV5L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031E385EFD
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107612; cv=none; b=L0ngxbvGftm6AKxApy5y7u+0WahKxeq642hP5z910zZKR+XaxlYODP6UHHx1Svnd7uvzcliyPDyPd2DfA8DehhFLXW8vp+SWqKo5YoekTyoj5VAgBRvROrZGdy3oKGJya9w1WUFTnQafC0aCurYKwvt0tYaj/L23Twx5IeL948o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107612; c=relaxed/simple;
	bh=R3u5ISHc3taHh6hTFZt7V/H2w3xh8ntyk7A2L0JUc7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eK4uhzUhy1l0glDFA9hNfGSs2aLpYmgs/5fxhHPIA8nAPhPBiIo0QCCExznwvSOvyls+3QyVnJzlrYOj2zUFm5ohtlQsFYVjVhMF2czK5Z7VGPZSp67hmz0Jb0ukF1riDTdlkJfeFSp3am1DlTgpHvdtJbceCr8bdZeJIX5YgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OhgoSV5L; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=G/aY8Q07G15GaxwblnUgO4x3KvGUZViwkTiSqlvMXQA=; b=OhgoSV5LSfJf+xneZiLHdK3+vS
	+VLzddHxmc8HJ6O1U2sB8GrXmJzC2MPP2Zd8aCHC/ymnMTCigsTryP0tGom1CJtdJIiJTWa2u8U/r
	/7Gz5+XpfX9FSt+VcDt/1/gSE+6Y0aFP+t7/SWkH2MSJo4gEo7C0V+fJvlAPNrBy1TXvFsUXAIujN
	VC4LXrPjdlYE3GUB3i3o0RMzI8RznWs/UMAW7/M5ib3a6RaDDDU4bN7fLV5JVA+KOu18sULs0YD0z
	gY4xbAQaYytey1ogDLrrmY/AYVJJz37zURtirsPSdBD05XTKsqc2Ys07LD6K/i0b4ZQkzbvkUULsc
	Iuiz9nQQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizhU-00000007eoV-30Yd;
	Thu, 22 Jan 2026 18:46:36 +0000
Message-ID: <0f9f7ccf-8318-4d46-990f-4917b434ac81@infradead.org>
Date: Thu, 22 Jan 2026 10:46:35 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Simone Rea <hheh47660@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
References: <20260122155401.335643-1-hheh47660@gmail.com>
 <ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
 <20260122104430.257b5d9f86275b37faed4757@linux-foundation.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260122104430.257b5d9f86275b37faed4757@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,embeddedor.com,socionext.com,markovi.net,chromium.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10819-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,socionext.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,markovi.net:email,infradead.org:email,infradead.org:dkim,infradead.org:mid,embeddedor.com:email]
X-Rspamd-Queue-Id: CA8C06CC10
X-Rspamd-Action: no action



On 1/22/26 10:44 AM, Andrew Morton wrote:
> On Thu, 22 Jan 2026 10:19:56 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 1/22/26 7:53 AM, Simone Rea wrote:
>>> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
>>>
>>> Now that all the fall-through warnings have been addressed in the
>>> kernel, enable the fall-through warning globally.
>>>
>>> Also, update the deprecated.rst file to include implicit fall-through
>>> as 'deprecated' so people can be pointed to a single location for
>>> justification.
>>>
>>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Michal Marek <michal.lkml@markovi.net>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>
>> This is missing your Signed-off-by: line. See
>> Documentation/process/submitting-patches.rst for info.
>>
>> Also you should copy the current KBUILD maintainers.
>> See the MAINTAINERS file.
> 
> This went into mainline in 2019 :) I suspect Gustavo had a slight IT
> problem.

I think Simone did.

-- 
~Randy


