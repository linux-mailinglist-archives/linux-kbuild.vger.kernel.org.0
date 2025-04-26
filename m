Return-Path: <linux-kbuild+bounces-6750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1DA9DBF2
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 17:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8301B63FC2
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 15:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C7F25D21D;
	Sat, 26 Apr 2025 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dVzI2SF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD125D218;
	Sat, 26 Apr 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745682349; cv=none; b=uZyaRhUl9qI5ZjCz6xgSsAfp7wnw/JbKsF3Tb6HCzzL86baziHGIZ1v2O7V0qLn8xJP7yMfMGpzGW0Q+Lp/T/p7qp5ViwS+R8VFXPMjDJLz0FSWAwzZbmZv0lxsh+EN31hpnxqdWPV54NWYCAmjl4AoK+S5gGBdgaShh9Hqe9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745682349; c=relaxed/simple;
	bh=NuTXQ+Z79qbIVwzSKvW+fklncgf5eGXXHmqX3oIN8RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6/1Ngr4c7N8o5yb7nYZu6cRoBO0Rnb1aQkwbRtH7fIwg8+a/LoEURQPSlfd2R87Ret2mqvgH9UGEcdhvDAcPk8jNcXhrqm+FNNV7eo3v1YEt95HsIFquVwoyDxWQz3JpDCu+unkvW2EryUERVOr0EqkTj3Ylm1mvyDzLtcwL3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dVzI2SF/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5oegPNExoXeA47tacqRlu+7q1mgaRAk1gz4aWqaSfKA=; b=dVzI2SF/ZIBZrH6551CPobdLn7
	QddZMVsCRXt4zUoaJGiPwd+j8bJrPwptMSEO5ZZE7fHOkA0YBWBgnkoyKwjWNQeIti1SCHNIEknlE
	1ZTq59iAKlInB+jVuBxwb6dwrZc3UW5wC2AqmaXzH06pPhitwTltC4b791SrjBHdBpDwSAR+RURie
	OcXUgFH3NOcWjRYy46IeKoC3G1KXv+2wNTs9BtSKOuri0UMiup+l/DDGh2F4lXsuK0+XAQl6wEezj
	VRWNjFmzuXNSb8TJovSx2hUeKWkVljZHSwrvrAp7lujOKLt7WB2k9Z41/fSGW6IiNrBCPiG76b4aK
	9qRslOHQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8hio-0000000CHh7-0d6l;
	Sat, 26 Apr 2025 15:45:42 +0000
Message-ID: <fb18f076-9bb4-4769-a0ce-e3c03ea0e101@infradead.org>
Date: Sat, 26 Apr 2025 08:45:38 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
To: Stafford Horne <shorne@gmail.com>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20250426030815.1310875-1-rdunlap@infradead.org>
 <aAx2eAa2yyjabL2L@antec>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aAx2eAa2yyjabL2L@antec>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/25/25 11:00 PM, Stafford Horne wrote:
> Hi Randy,
> 
> On Fri, Apr 25, 2025 at 08:08:15PM -0700, Randy Dunlap wrote:
>> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
>> bpf_perf_event.h for arch/openrisc/.
>>
>> Fixes a build error:
>> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
> 
> This looks ok to me, but do you have any pointer of how to reproduce this?
> 

All I did was 'make allmodconfig' or 'make allyesconfig'. Either of them cause
this error.

> -Stafford
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Jonas Bonn <jonas@southpole.se>
>> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>> Cc: Stafford Horne <shorne@gmail.com>
>> Cc: linux-openrisc@vger.kernel.org
>> Cc: linux-kbuild@vger.kernel.org
>> ---
>>  usr/include/Makefile |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> --- linux-next-20250424.orig/usr/include/Makefile
>> +++ linux-next-20250424/usr/include/Makefile
>> @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
>>  no-header-test += linux/bpf_perf_event.h
>>  endif
>>  
>> +ifeq ($(SRCARCH),openrisc)
>> +no-header-test += linux/bpf_perf_event.h
>> +endif
>> +
>>  ifeq ($(SRCARCH),powerpc)
>>  no-header-test += linux/bpf_perf_event.h
>>  endif

-- 
~Randy


