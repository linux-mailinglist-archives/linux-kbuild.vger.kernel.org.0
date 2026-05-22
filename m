Return-Path: <linux-kbuild+bounces-13305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM+TEzE0EGqqUwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13305-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 12:47:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 558405B26CB
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 12:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 649893055B74
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 10:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878DA3CAA54;
	Fri, 22 May 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwVHpPrD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56F3BAD96;
	Fri, 22 May 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445714; cv=none; b=SseUzruwg4B79XXlAUYnh7zobNnQ4fDI2sTxTzEFtmBR4gACxtXnc2BRUxFrae1dKDmPyxM3eZMA7fwNKsDLgajAzmeC3MTvuA3f2ZPDRZaVz3kdiXMdUIaWe1Md7AQhsnFRqojCt+9c8wZ0tIfm4PI6zAQQGvGuNnO0zW7gNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445714; c=relaxed/simple;
	bh=T2cijLb1chkxsy4bkW4+tTSZGQ3X0YMW2/fsOV3B+bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtRUoS30mv5wUettvmTNDnIiE8SPny8n4xQ2qp907SFtCA28NuMEX5vX29/YaCISXHkZUsPpvaIoJrxa4cz67p3YDI52N/IKfyTvjClJHo/Qx6+4EULszLAJKZH/r9YReTy2A9MVQErDjlIA8YF7u84BIDcoObR03urKU+6t214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwVHpPrD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC2A1F000E9;
	Fri, 22 May 2026 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445712;
	bh=VF1GBnDH1TfMHCcLbg1KElBuyNuwHBmP/SstlDxzydw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QwVHpPrD/oEBvQMdU9brmnzYZbSsDOGAkDrk2jb8JZv62X7ESOn0Hfg794hQ/lgRq
	 /HrpWT4d4wRypU8zcgWlRgct6FBay9owLOTL4Vk39+bj2gpUkJD2aEnbOL6qbm0kIN
	 hgjlkD4Y/qT7M7ofxwpgPpCNmej22cCZdjXfhjJD3Nmc3urRr0hIyOiWHM3Od3X1me
	 hKuEZeSzg7Cc/ymL9IugmOxDpXNb4aROr0WkTdGsMYY8OjqoVxUTq1ubNR4kZYgGXH
	 HhNFddlLRiKKm9Co0UCidSBVgx9gxWNBm4zVAowAIIy/yl47noWHWKk00/x4ZrHAtv
	 Wc9N1Ft0418gA==
Message-ID: <227b6ea2-0cae-4f6d-a614-3b0891b5f8a5@kernel.org>
Date: Fri, 22 May 2026 12:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] char/nvram: Remove redundant nvram_mutex
To: Venkat <venkat88@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Tellakula Yeswanth Krishna <yeswanth@linux.ibm.com>
References: <20260428061540.73668-1-venkat88@linux.ibm.com>
 <FC8BDC39-4627-4532-B6FB-C4B88F4DF80E@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <FC8BDC39-4627-4532-B6FB-C4B88F4DF80E@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,arndb.de,kernel.org,gmail.com,linux.ibm.com];
	TAGGED_FROM(0.00)[bounces-13305-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ozlabs.org:url]
X-Rspamd-Queue-Id: 558405B26CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 14/05/2026 à 05:57, Venkat a écrit :
> 
> Hi,
> 
> Gentle ping on this patch.
> 
> This removes the unused global nvram_mutex and relies on the
> existing per-architecture synchronization, as suggested earlier.
> 
> I’ve re-tested the change, and everything continues to work as expected.
> No issues observed in validation.
> 
> Please let me know if any further changes are needed.
> 
> Thanks,
> Venkat
> 
> 
>> On 28 Apr 2026, at 11:45 AM, Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>>
>> The global nvram_mutex in drivers/char/nvram.c is redundant and unused,

Redundant with what ?

It is _used_, at least in nvram_misc_ioctl()


>> and this triggers compiler warnings on some configurations.
>>
>> All platform-specific nvram operations already provide their own internal
>> synchronization, meaning the wrapper-level mutex does not provide any
>> additional safety.

Indeed, this is what it is redundant with, I would say that first thing 
in the message.

I think it would also be worth providing the history from Arnd from 
here: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260323072422.25730-1-venkat88@linux.ibm.com/#3667538


>>
>> Remove the nvram_mutex definition along with all remaining lock/unlock
>> users across PPC32, x86, and m68k code paths, and rely entirely on the
>> per-architecture nvram implementations for locking.
>>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Tested-by: Tellakula Yeswanth Krishna <yeswanth@linux.ibm.com>
>> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

With the above changes, Reviewed-by: Christophe Leroy (CS GROUP) 
<chleroy@kernel.org>

>> ---
>> Changes since v4:
>> - No code changes
>> - Resent after v7.1-rc1 as suggested by Arnd Bergmann
>>
>> drivers/char/nvram.c | 16 +++-------------
>> 1 file changed, 3 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
>> index 9eff426a9286..e89cc1f1c89e 100644
>> --- a/drivers/char/nvram.c
>> +++ b/drivers/char/nvram.c
>> @@ -53,7 +53,6 @@
>> #include <asm/nvram.h>
>> #endif
>>
>> -static DEFINE_MUTEX(nvram_mutex);
>> static DEFINE_SPINLOCK(nvram_state_lock);
>> static int nvram_open_cnt; /* #times opened */
>> static int nvram_open_mode; /* special open modes */
>> @@ -310,11 +309,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
>> break;
>> #ifdef CONFIG_PPC32
>> case IOC_NVRAM_SYNC:
>> - if (ppc_md.nvram_sync != NULL) {
>> - mutex_lock(&nvram_mutex);
>> + if (ppc_md.nvram_sync)
>> ppc_md.nvram_sync();
>> - mutex_unlock(&nvram_mutex);
>> - }
>> ret = 0;
>> break;
>> #endif
>> @@ -324,11 +320,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
>> if (!capable(CAP_SYS_ADMIN))
>> return -EACCES;
>>
>> - if (arch_nvram_ops.initialize != NULL) {
>> - mutex_lock(&nvram_mutex);
>> + if (arch_nvram_ops.initialize)
>> ret = arch_nvram_ops.initialize();
>> - mutex_unlock(&nvram_mutex);
>> - }
>> break;
>> case NVRAM_SETCKS:
>> /* just set checksum, contents unchanged (maybe useful after
>> @@ -336,11 +329,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
>> if (!capable(CAP_SYS_ADMIN))
>> return -EACCES;
>>
>> - if (arch_nvram_ops.set_checksum != NULL) {
>> - mutex_lock(&nvram_mutex);
>> + if (arch_nvram_ops.set_checksum)
>> ret = arch_nvram_ops.set_checksum();
>> - mutex_unlock(&nvram_mutex);
>> - }
>> break;
>> #endif /* CONFIG_X86 || CONFIG_M68K */
>> }
>> -- 
>> 2.45.2
>>
> 


