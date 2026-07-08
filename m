Return-Path: <linux-kbuild+bounces-13948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SykAH7HQTWr7+QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13948-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 06:23:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E006072191C
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 06:23:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=PO12xnFv;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13948-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13948-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0AB3301CD81
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 04:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1037D399019;
	Wed,  8 Jul 2026 04:23:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A493546D6;
	Wed,  8 Jul 2026 04:23:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484588; cv=none; b=M4TBitwTSqu8DTFdnN/318RbfI+EOf87uCft4D++MdmXDsfDHjOM/reRUUBDRQbocEMSpayViEzU5M5oG7P778S7NMMJDlTPQ8FJq4IIQOQVUMxQS2EeeRs8H+mLULpMSJxBAUwCkHRy0rh4cFYQj81+knODU2wkxMB7xlcMGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484588; c=relaxed/simple;
	bh=RunsYtFesMkjxl+CoTYoFjBJrXMWVZ9jF+NZNV9AmzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB/EEViJmNck8bv8N0DUjvzJidhjRRFUdaF21HuwJ5RmRGlXRrVkZ8WiftOkxS+Yqm4oQeLUAZCsYJaSP3oRdbBPKAVpui3St/waQNHNK9c3WJfJyQ0ZpTpGK2AETqzbpv5lpuQ2RRUUsULz5lGzkvkpVo683VJl+Y7Lox85J8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PO12xnFv; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/yYwtDZAFFAxkqxJIxp8Km+s7dCvLib2EDNEgsmy/Hk=; b=PO12xnFvTlr0ACZFTQCBanUTgW
	sG3QkVrAyhrrYcrlxEpNAw+x20cUaiyNQVZMoqIXR24XU70rBh/9NVsoB0/cMSuItH628YlGSya+a
	KeDGQsLh5aopEjhR9obaVClqcMVOAyS4QEUhgp4njDLZLzqI3scHDWIXgmUbwuz930a2Ow+gJxXiJ
	ZJC0Be4CIWJCVnznHc2d8kvn+syMuKVi0PjrPk2HXhyR0t/XrUw5fc6w/dZHwQfY1aSxxkEggavCU
	ST5JdCmbrzXK6C7R/PcI1tffM+BHYVxBYxTfrn/vCCPCMS8eph6LqWOpRd7BWFeXrnf9/KW2E/Su4
	YByBTuNg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJoN-0000000GJYv-3tba;
	Wed, 08 Jul 2026 04:23:04 +0000
Message-ID: <b888d106-a9ad-43be-b642-562e379fa962@infradead.org>
Date: Tue, 7 Jul 2026 21:23:03 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] scripts: fix spelling mistakes
To: Martin Weiss <martin.githubacc@gmail.com>, linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexey Gladkov <legion@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kbuild@vger.kernel.org
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13948-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:martin.githubacc@gmail.com,m:linux-kernel@vger.kernel.org,m:Martin.weiss2410@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:ardb@kernel.org,m:legion@kernel.org,m:jpoimboe@kernel.org,m:rostedt@goodmis.org,m:linux-kbuild@vger.kernel.org,m:martingithubacc@gmail.com,m:Martinweiss2410@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.dev,goodmis.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E006072191C



On 6/29/26 1:28 AM, Martin Weiss wrote:
> Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  scripts/config          | 2 +-
>  scripts/link-vmlinux.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/config b/scripts/config
> index ea475c07de28..dfa78cfcba67 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -38,7 +38,7 @@ commands:
>  
>  options:
>  	--file config-file   .config file to change (default .config)
> -	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
> +	--keep-case|-k       Keep next symbols' case (don't upper-case it)
>  
>  $myname doesn't check the validity of the .config file. This is done at next
>  make time.
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f99e196abeea..c8f27e4175f9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -38,7 +38,7 @@ is_enabled() {
>  }
>  
>  # Nice output in kbuild format
> -# Will be supressed by "make -s"
> +# Will be suppressed by "make -s"
>  info()
>  {
>  	printf "  %-7s %s\n" "${1}" "${2}"

-- 
~Randy

