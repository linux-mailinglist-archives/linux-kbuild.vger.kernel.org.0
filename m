Return-Path: <linux-kbuild+bounces-10961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xXaSI05nfmmAYQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10961-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 21:34:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E71C3E6A
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 21:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D71443019808
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 20:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAEB3783B6;
	Sat, 31 Jan 2026 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="FyP9WMRg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8D3612D8
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Jan 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769891657; cv=none; b=YwPiA9R86BJT0+EtG4M87cEQSURfoh4UbWmwx/xWMAXcRXtjuLt87lJDWPe1Wjw7X1lYkVGWIjn5QDAj9kCTltRPPdjtS2AsLXK7XnLQwT56S70GWeq/bTbXn9sHOPnaoSkdWRjfgVtF5lnMaMy/0KD11Hbd2sG/GVLlhIGuA/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769891657; c=relaxed/simple;
	bh=trW///4DZC+Gf3eWgnl0dDN5Cp3CVH1pn14LAtTFeVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct6PRjAV8EIz+4t5CUzKQxPZkHqnE7I8tv6/wvFfDNpExCuwP+5Pf/YAuhTfNEPf7Fc6qZqPhwaI9JnjWD6tHj4amHgy8d4eqJlMfabmofeJbZ8Lm2eKsVqHgIk6vrk1K1/vQzp1qa0R5evjZD19Vbv3F4UDlRtIxKv0g03hC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=FyP9WMRg; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id mHf7vNnJqSkcfmHfVv9VkT; Sat, 31 Jan 2026 20:34:09 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id mHfUviZ0BjAxumHfVvaDb0; Sat, 31 Jan 2026 20:34:09 +0000
X-Authority-Analysis: v=2.4 cv=EoDSrTcA c=1 sm=1 tr=0 ts=697e6741
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=boSZjC74iCM+AjoU0vq/6A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=7T7KSl7uo7wA:10 a=ag1SF4gXAAAA:8
 a=VwQbUJbxAAAA:8 a=sMBj6sIwAAAA:8 a=TFj8SqQbAAAA:8 a=_Wotqz80AAAA:8
 a=c-n4J4-pAAAA:8 a=Z4Rwk6OoAAAA:8 a=NZ-89VFvAAAA:8 a=cm27Pg_UAAAA:8
 a=WBVUFX3z8u_b3z711c8A:9 a=QEXdDO2ut3YA:10 a=d2ev92nbPIAA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=pTDFpEv3elsvYK9BQVU7:22 a=buJP51TR1BpY-zbLSsyS:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=pm31WBKQz9GEXVZSZ1ft:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/IhkU1fxPPQsCPfhnyelknzkyfaLv2rdmRCMUd9KYGA=; b=FyP9WMRgnMM5wc1spZgAnDpAhX
	jshI/uqabsR9VIxzCSRP9oxs9nR1fRFBREO3WFlcYOq5/HQy+go3jLFyupBzUYv6ozPVvz97jTNsz
	dFuCMcLva3+b/2RltuCsnye+H9oHSkPCha7XhUX4eVn94YDACy+mZMO8dyy0oSJe8is7qKb4OAuWj
	1C3ynH6YhqJ9jcuXXC+uw2B4SMstNs492dWUJog3nynM8IczPau7/M6jqt00ctNTR9wE4BGS8iYfC
	FJz+SktczScZ8f13+yPx0d84OXK3JuTEbznFTvAeZFbXdD4ZQDj75Y5vZDzEaf3mKkbSyhdEttvv/
	IH80ivZw==;
Received: from [177.238.18.27] (port=45796 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vmHfU-00000001W4v-26vi;
	Sat, 31 Jan 2026 14:34:08 -0600
Message-ID: <068adaf8-9f41-4918-b1dc-1104aad98abf@embeddedor.com>
Date: Sat, 31 Jan 2026 14:33:27 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: david@stennet.com, Shuah Khan <skhan@linuxfoundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
References: <20260131054051.6938-1-david@stennet.com>
 <20260131054051.6938-2-david@stennet.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260131054051.6938-2-david@stennet.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.18.27
X-Source-L: No
X-Exim-ID: 1vmHfU-00000001W4v-26vi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.18.27]:45796
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAySSZ5rOZdgU91a40FKkpPCJmiRpwW9DaY8u3D1F03y5b8M8nIBWjcxADR5woQRVHFQj1aVIerDOSJxa8O6EeVfq7NtNf3h/gxOfNdjdLy+Kce3AGFI
 d3gIelKC5T7o4tj/L07WVfum9K4/C4kPx54YH4h060AAZ8DwGRVVH4zIcR5x9QQxK4j+uDwCjV1R6/5DIv80o0cku7y1tkqXExxFaVkGkynFqPQhTgZWWcRC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10961-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[embeddedor.com];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stennet.com:email,markovi.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-foundation.org:email,linuxfoundation.org:url]
X-Rspamd-Queue-Id: 86E71C3E6A
X-Rspamd-Action: no action

Shuah,

People taking this[1] LF training have been wrongly submitting this
patch since 2022 [2].

Why?

-Gustavo

[1] https://training.linuxfoundation.org/training/a-beginners-guide-to-linux-kernel-development-lfd103/
[2] https://lore.kernel.org/all/20220517195912.GA10952@embeddedor/

On 1/31/26 14:40, david@stennet.com wrote:
> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> 
> Now that all the fall-through warnings have been addressed in the
> kernel, enable the fall-through warning globally.
> 
> Also, update the deprecated.rst file to include implicit fall-through
> as 'deprecated' so people can be pointed to a single location for
> justification.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>   Documentation/process/deprecated.rst | 14 ++++++++++++++
>   Makefile                             |  3 +++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 49e0f64a3427..053b24a6dd38 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
>   lead to a crash, possible overwriting sensitive contents at the end of the
>   stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
>   memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
> +
> +Implicit switch case fall-through
> +---------------------------------
> +The C language allows switch cases to "fall through" when
> +a "break" statement is missing at the end of a case. This,
> +however, introduces ambiguity in the code, as it's not always
> +clear if the missing break is intentional or a bug. As there
> +have been a long list of flaws `due to missing "break" statements
> +<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
> +"implicit fall-through". In order to identify an intentional fall-through
> +case, we have adopted the marking used by static analyzers: a comment
> +saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
> +is more widely handled by C compilers, static analyzers, and IDEs, we can
> +switch to using that instead.
> diff --git a/Makefile b/Makefile
> index 9be5834073f8..bdf8eac51b07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>   # warn about C99 declaration after statement
>   KBUILD_CFLAGS += -Wdeclaration-after-statement
>   
> +# Warn about unmarked fall-throughs in switch statement.
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
> +
>   # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>   KBUILD_CFLAGS += -Wvla
>   


