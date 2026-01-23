Return-Path: <linux-kbuild+bounces-10833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBkVND/UcmnKpgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10833-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 02:51:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B16F5DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 02:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED8E930022F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 01:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B22354ADB;
	Fri, 23 Jan 2026 01:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="X54yplUW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71358354AC8
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 01:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769133112; cv=none; b=KSBC631QBYbv9Zuju0yokXwLty0PucgHYE7nbKDmyKHta1xzJxayYpUuU1TFT+KmPVp55OH9bJ2bVqgkmayJg9cn5c2Yq50zZU6p0IH9+SgLKp2ZRI6K5Rm2EMQPnR8gQPAbjRveoqcQ7HQgZePT6bLhjYvwbQwCYQYY+dEEh98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769133112; c=relaxed/simple;
	bh=IHIRZQBV+MSz5TKSASRY7/rL51uwa24mm1X4kAX3LnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmN3bhigK5YXfK6+mJvVJiE9YusNU0NEb7vOvRH5xarCkQlR3mlNadgcD1fP8O6j2yQc93p+jottO05sNg6T1q/079z7CFzERMEfOsCLoSSn8HBvGO1dcfVtOC43zxHTGQpO2miXzLjSRco5TMc0GS5ipJOmdNWIJeq6SQnKqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=X54yplUW; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id iqYJvNInFKXDJj6KivxeDX; Fri, 23 Jan 2026 01:51:32 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id j6KhvUXh9PL32j6KhvKW4Z; Fri, 23 Jan 2026 01:51:31 +0000
X-Authority-Analysis: v=2.4 cv=MqhS63ae c=1 sm=1 tr=0 ts=6972d423
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=aEbNOhhS7pL/zVeD3/sqyA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=JfrnYn6hAAAA:8
 a=_Wotqz80AAAA:8 a=c-n4J4-pAAAA:8 a=Z4Rwk6OoAAAA:8 a=NZ-89VFvAAAA:8
 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=bvmN90g0j_jcDvpIWCMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=buJP51TR1BpY-zbLSsyS:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=pm31WBKQz9GEXVZSZ1ft:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yb9luBccEYiQGqzgpuHlJ8IynzFPfzDts1Pibsw47oU=; b=X54yplUWPudXWzZQ06Td5F5KQm
	TIYrNHoFizga2EJpHIUET5cdiDoFSo8Cvp1h4qf/VISk6Jy752OMWPfLI9ZIfyPOg/zuVcppIHYIU
	9UmDvBeQVtGjNk/Iv6JPLGP6UsXaXryKyFVaCUKbzSgfQQyeigDAj9biktIYZ1CZ0YVHrYEYFeExS
	AQ4Dq1UxgPek2eyaThS+jlbOLoPR55Fog4K2mU+j9DwRJYfh0mX1KE5NOWGeCc6AYuD2TcxDWmhsX
	pk5Vf7i+0FRTdvRhvpU4O0bhY+xj3nj4yQpbq13PbKLsaijnjtCJz3RajsSyxsctryOo6HE5Ubs8m
	2WtYHWrA==;
Received: from m014013038128.v4.enabler.ne.jp ([14.13.38.128]:37038 helo=[10.79.109.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vj6Kh-00000004Mjq-0Kee;
	Thu, 22 Jan 2026 19:51:31 -0600
Message-ID: <2cad92e2-3d21-46cc-b419-8df3226b3b58@embeddedor.com>
Date: Fri, 23 Jan 2026 10:51:14 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: Simone Rea <hheh47660@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
References: <20260122155401.335643-1-hheh47660@gmail.com>
 <ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
 <20260122104430.257b5d9f86275b37faed4757@linux-foundation.org>
 <0f9f7ccf-8318-4d46-990f-4917b434ac81@infradead.org>
 <CAEfWggNK7DgsRHXTE8BhWCTuDKyt6pMR_9UEHEs1NKPfPPyopw@mail.gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CAEfWggNK7DgsRHXTE8BhWCTuDKyt6pMR_9UEHEs1NKPfPPyopw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 14.13.38.128
X-Source-L: No
X-Exim-ID: 1vj6Kh-00000004Mjq-0Kee
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: m014013038128.v4.enabler.ne.jp ([10.79.109.44]) [14.13.38.128]:37038
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHCBuOXafNwhoZaAvnND0Q9BSLTRxXA76usSFp/EZ7ozAT4A6RALgVNYbaA0WdqdHMXZJYBRljHn8czDSU7QZjeofxRNwshz5LFgMpp39ElxJtMMSJhA
 6grIm2Nn8WNLcH7IdA0eOazE7j7RMadfzLgmGX9KfXyX9v17M/QJODsLDUYyyhbJWv5G87Rl8Eias1BmRZWO9OWUjPuLo9xPnMwVNMLFPZypvkz1TxPWe66K
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10833-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[embeddedor.com];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,infradead.org];
	HAS_X_ANTIABUSE(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.899];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,chromium.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,markovi.net:email,linux-foundation.org:email,socionext.com:email]
X-Rspamd-Queue-Id: 893B16F5DC
X-Rspamd-Action: no action



On 1/23/26 03:48, Simone Rea wrote:
> Guys I’m so sorry 🙏🙏🙏 I don’t know what I did, i’m justinf following a
> tutorial…

This is the second time someone submit this same patch by mistake.

I'm curious about that tutorial. Can you please share with us a link to it?

Who's the author?

Are you paying for it?

Thanks
-Gustavo

> 
> Il giorno gio 22 gen 2026 alle 19:46 Randy Dunlap <rdunlap@infradead.org>
> ha scritto:
> 
>>
>>
>> On 1/22/26 10:44 AM, Andrew Morton wrote:
>>> On Thu, 22 Jan 2026 10:19:56 -0800 Randy Dunlap <rdunlap@infradead.org>
>> wrote:
>>>
>>>> On 1/22/26 7:53 AM, Simone Rea wrote:
>>>>> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
>>>>>
>>>>> Now that all the fall-through warnings have been addressed in the
>>>>> kernel, enable the fall-through warning globally.
>>>>>
>>>>> Also, update the deprecated.rst file to include implicit fall-through
>>>>> as 'deprecated' so people can be pointed to a single location for
>>>>> justification.
>>>>>
>>>>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: Michal Marek <michal.lkml@markovi.net>
>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>> Cc: linux-kbuild@vger.kernel.org
>>>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>>>
>>>> This is missing your Signed-off-by: line. See
>>>> Documentation/process/submitting-patches.rst for info.
>>>>
>>>> Also you should copy the current KBUILD maintainers.
>>>> See the MAINTAINERS file.
>>>
>>> This went into mainline in 2019 :) I suspect Gustavo had a slight IT
>>> problem.
>>
>> I think Simone did.
>>
>> --
>> ~Randy
>>
>>
> 


