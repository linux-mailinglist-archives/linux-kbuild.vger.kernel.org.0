Return-Path: <linux-kbuild+bounces-11438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIsGAK5xn2llcAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11438-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:03:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21519E1B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A7FB303F57D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15716314B96;
	Wed, 25 Feb 2026 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eCycWBx8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5072C21F1;
	Wed, 25 Feb 2026 22:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772056969; cv=none; b=FtdvwW567CxGA/fzbEe8F3vNQsyq/OT9E+PlxFwIvpfAvWIVJQ1JrWt1PCG+KNhjmfhEelG0tKH9TiikdSoaPrXq7tMUFvzhfW/IoBV8zhAcGal0wQqauMmJszEo9M113diu72hCG6puDveLvwQUlf/68HYaORoQZxXnGzatpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772056969; c=relaxed/simple;
	bh=N60Qgsmro2w25LeHbBoOz9IFE3WWjHa6IYgBhHR5mOw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OfZVHml7KA8xhVA8HZrwjyA0ij2L9zxxXMTuuXdOGc6u5jfHBW9KHbT+/DQckzw3Dqq3Ui07QA8+oMcOXtOBkkRWd7uwCsLkKFMTYnO6wpl7AkVUFItPpf4vW9BOZSq/CR9mvo/JJUezSXMtRNr6DDUBCFMoOtzxIo+u4ygR6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eCycWBx8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=s1SThvp/408MKeGzVz8QSNH0KbHxoyFbwQ23VimrATY=; b=eCycWBx8n2z2YbDfIHK0wsY3ER
	Y0yfRdEN5sOgtcb2/zWaRwFrz9V3NGGuAO+21VnsG+5yGk3PkOE8JI4xPJ7q+zDlyyIwJdKqtAVhI
	Bc6gJctZsSCPZXYMm7wiq9GM7r1qXU98X3QLubJwWACQ/+d0/IgNwmaJyFaBiIEaHM3xeKybkFR4U
	h5VQRtc3mH1FVugL/Pjo2SgrGLGOPlE09VAIhoAFeip7sYtOlt+zCPyx8K1A2SU+3dMurgQ9m+UbC
	UQp0C00ZIB7MWQ0zz6hNfgpgyQiO+TcGreUS8GF7E+VGjnXjw/0jIvzmrqAoFVqJDROj8h5yfjAp7
	GuVPZDUQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvMxw-00000004y2d-4ATA;
	Wed, 25 Feb 2026 22:02:45 +0000
Message-ID: <c7fda6fb-5095-4fd5-ad1a-22319bdf0d4b@infradead.org>
Date: Wed, 25 Feb 2026 14:02:44 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
From: Randy Dunlap <rdunlap@infradead.org>
To: Denis Nuja <dnuja@enakta.com>, linux-cifs@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, stfrench@microsoft.com,
 Ned Pyle <ned.pyle@tuxera.com>
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <2cb12a60-32f1-4656-8a9f-305bd0be069e@infradead.org>
Content-Language: en-US
In-Reply-To: <2cb12a60-32f1-4656-8a9f-305bd0be069e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11438-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D21519E1B1
X-Rspamd-Action: no action



On 2/25/26 1:53 PM, Randy Dunlap wrote:
> Hi,
> 
> On 2/25/26 8:08 AM, Denis Nuja wrote:
>> Hi everyone
>>
>> CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=m and
>> CONFIG_INFINIBAND=m, despite all declared dependencies being
>> satisfied. The option is silently dropped by olddefconfig and
>> menuconfig refuses to save it, even though menuconfig displays it as
>> [*] (enabled).
>>
>> Kernel version: 6.4.0
>>
>> File: fs/smb/client/Kconfig
>>
>> Current dependency:
>>
>> if CIFS
>> config CIFS_SMB_DIRECT
>>     bool "SMB Direct support"
>>     depends on CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=y
>> && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
>>
>> Root cause:
>>
>> CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=m
>> and INFINIBAND=m, the left side of the || expression evaluates to:
>>
>> CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS
>> = m && m && y = m
> 
> Where do you get the last "y = m" part?
> 
> xconfig says: (This is 7.0-rc1. Guess I'll check 6.4.0 also.)
> 
> Prompt: SMB Direct support
> Depends on: NETWORK_FILESYSTEMS [=y] && CIFS [=m] && (CIFS [=m]=m [=m] && INFINIBAND [=m] && INFINIBAND_ADDR_TRANS [=y] || CIFS [=m]=y [=y] && INFINIBAND [=m]=y [=y] && INFINIBAND_ADDR_TRANS [=y])
> 
> so my .config has:
> CONFIG_CIFS=m
> CONFIG_CIFS_STATS2=y
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=y
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SWN_UPCALL is not set
> CONFIG_CIFS_SMB_DIRECT=y
> # CONFIG_CIFS_COMPRESSION is not set
> 
> Working in 7.0-rc1.
> What am I missing?
> 
> 
>> The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
>> Kconfig engine coerces m to n and silently drops the option. The right
>> side of the || requires CIFS=y && INFINIBAND=y which forces both to be
>> built-in — an unnecessarily restrictive requirement.
>>
>> Additionally, the CIFS=m/y conditions inside the depends on are
>> redundant since the option is already inside an if CIFS block, which
>> handles that guard.
>>
>> Observed behaviour:
>>
>> menuconfig shows [*] SMB Direct support (appears enabled)
>> Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=y to .config
>> olddefconfig emits warning: override: reassigning to symbol
>> CIFS_SMB_DIRECT and drops it
>> scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
>>
>> Proposed fix:
>>
>> Since the option is inside if CIFS, the CIFS=m/y conditions are
>> redundant. The dependency should simply be:
>>
>> - depends on CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=y
>> && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
>> + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
>>
>> This correctly expresses the intent (RDMA stack must be present)
>> without the tristate/bool coercion problem, and is consistent with how
>> the surrounding if CIFS block already guards the option.
>>
>> The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
>> identical pattern:
>>
>> depends on CIFS=m && FSCACHE || CIFS=y && FSCACHE=y
>>
>> which should also be simplified to:
>>
>> depends on FSCACHE
>>
>> To reproduce:
>>
>> # Start with a config where CONFIG_CIFS=m, CONFIG_INFINIBAND=m
>> scripts/config --enable CONFIG_CIFS_SMB_DIRECT
>> make olddefconfig
>> grep SMBDIRECT .config   # empty — option was dropped

I also have no problem enabling CIFS_SMB_DIRECT on kernel version
6.4.0 using menuconfig or nconfig.
Or using scripts/config.

-- 
~Randy


