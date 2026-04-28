Return-Path: <linux-kbuild+bounces-12897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM0KBX9b8GlQSAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12897-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 09:02:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83E47E677
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 09:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 936593008D34
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 06:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2E332A3EC;
	Tue, 28 Apr 2026 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kFi3RDb/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B534D91F;
	Tue, 28 Apr 2026 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359517; cv=none; b=iYPlFPsf2JZ7n79VmhjyBEGQlLscGzPliBz5/HZ25M4Ps6nRqFY9BIoDwI8uSst0iBWIB8pugIR1f286AkGcjjQcN20vyfK1bHP4dNp+VY7VHO0md2oi8Grp0GQSRCeJtEQcsikkkuH+EYL3qSKcGWSsa8dRnWEGcV+Iqzeozz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359517; c=relaxed/simple;
	bh=LEbnGzXladYGIydyxZvQ87P+79qkZN3mzdFcWmiwVbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qS0tNwM0l4Z6/OvjrnNtqxGpSwEJmn5VgQDOyZE/LVyMpg2iD8t/UQXM/hWbNJbKyMIJRW6RAdCsucfa6n+I+LBpVZjziD7VQZY/VKpH3ss1EsfMP18IEvdxs6Y3XeISoM9xXy3zOrYZC8r//bvCGNr7rrit3NAgDevzE8iyCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kFi3RDb/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=reIysvNdteBbNK0NWfKGkvFXku9f3ftFx3lS4vxMDlU=; b=kFi3RDb/r7EaZ1yZP3KpFOrSVz
	FfGnZRatxvwLER0B8d8+x9nhjmDFQq7nOgb7YIS2zi/TIHkUWQtXvM7tgI6XqDi/P9b66NbG3ThuR
	fUuSNcZo8OnxEe6weS8yi88WbCfj+OEY3jnDdk9srqjzaUHChyUpW4nlsb9pJn23C+nWfW9h5f3ZZ
	0zk8AqT3km2L+gxcIS/vUiU4IO/gUlsyo9NFa61jsYuHAt0Zw+dFYZAVdqd+8Pz5VnFBqUMyuuTPI
	lBQAfD1X4yKb70LUI6zjj0KFN0FrpL4rZGcQWPZ/+urzPYIzUgg5VVA7fj8hzBgdOFrH4jp7xCke4
	VgWZX6bA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcOt-00000000ewZ-3TwR;
	Tue, 28 Apr 2026 06:58:31 +0000
Message-ID: <64dc18e9-f3db-4e66-a84f-9de784b621fa@infradead.org>
Date: Mon, 27 Apr 2026 23:58:31 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] modpost: prevent stack buffer overflow in
 do_input_entry() and do_dmi_entry()
To: Hasan Basbunar <basbunarhasan@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427204255.22117-1-basbunarhasan@gmail.com>
 <20260428062912.32918-1-basbunarhasan@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260428062912.32918-1-basbunarhasan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AB83E47E677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12897-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



On 4/27/26 11:29 PM, Hasan Basbunar wrote:
> Several functions in scripts/mod/file2alias.c build the module alias
> string by repeatedly appending into a fixed-size on-stack buffer:
> 
> 	char alias[256] = {};
> 	...
> 	sprintf(alias + strlen(alias), "%X,*", i);
> 
> This pattern is unbounded and silently corrupts the stack when the
> formatted output exceeds the destination size. Two functions in this
> file are realistically reachable with input that overflows their
> buffer:
> 
[snip]
> 
> Fixes: 1d8f430c15b3 ("[PATCH] Input: add modalias support")
> Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

where testing means that modules.builtin.modinfo files before & after
are the same.

> ---
> v1: https://lore.kernel.org/lkml/20260427204255.22117-1-basbunarhasan@gmail.com/
> 
> Changes since v1 (per Randy Dunlap's review):
> - Audited the other do_*_entry() handlers; do_dmi_entry() has the same
>   unbounded-sprintf shape with a realistic 80-byte worst-case overflow,
>   and is fixed in v2 alongside do_input_entry(). The remaining
>   do_*_entry() handlers were verified bounded by their input field
>   types and do not need this treatment.
> - Added a Fixes: tag pointing to the original do_input introduction
>   (commit 1d8f430c15b3, 2005).
> - Reworded the alias_append() comment: replaced "cumulative
>   bookkeeping" with "remaining-space check", which is what the helper
>   actually does.
> 
> Randy: I have not carried forward your Reviewed-by/Tested-by from v1
> because v2 expands scope to do_dmi_entry() (new code you have not seen
> yet); please re-affirm if v2 looks good to you.
> 
> ---
>  scripts/mod/file2alias.c | 91 ++++++++++++++++++++++++++++------------
>  1 file changed, 65 insertions(+), 26 deletions(-)
> 

-- 
~Randy

