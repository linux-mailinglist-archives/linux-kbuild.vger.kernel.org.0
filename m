Return-Path: <linux-kbuild+bounces-10156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C7CCD019
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 18:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BB6E30206D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 17:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEC21FECCD;
	Thu, 18 Dec 2025 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AZh/DD/m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFA3A1E61
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080055; cv=none; b=Hz4vuWSITVMTwLMuZy8PwDcV3p2AoQyTuGNvCsTmMF6aVH2mGpKIX4JXtwgUoltcTTL50dPxzhw42USFaRW7RkhM0EFfs2SWNVOcOMsqb6+/bCyIc2diJKmPwHPq/6L5fyjWEXIN3N5LvgABO7fCpjB4zSiAHqoQwQAZ3Rh/yyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080055; c=relaxed/simple;
	bh=5ViQi7mwghCiXIMF1t1NV68g5oN/hKIMhDraT72mmus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdXVmsor9ekZEoZ73GKwjhpMksWRzZnWJPIl0AripFGo8mw4Ulc17xE3zFBwOdZy+34VfPBZ98cjxsZh2nPkv/7UtaThZhS4FwU5V2tM5X5BUd2cOAcRakKsuApQjmbUl0uCCzw3S31f2QrP9yOcqebrN4+2fBDw4iZWQUwDLws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AZh/DD/m; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d9b9e129-349b-4510-bf33-01b831c2174b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766080051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB++E3E6r46WQuwBh9XXcMAuVJ8INhZP5ZHmjXyJtDc=;
	b=AZh/DD/mU1b3vRHrw8i+4nCb4AOJv7ewUUM3CfnPf5c9gJEXFlkidjX/ITCrgAEK6Hdxsn
	uQ0peoLHngYesrV7FuUIlJAcKYwVx+f67DDM32vU7I32AyLjzfb6m0a2Cz+LsrC6QLvx/w
	H9snbQQLOc+JAn4qkIJlF1SlqKoXOPc=
Date: Thu, 18 Dec 2025 09:46:14 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 3/8] resolve_btfids: Introduce enum
 btf_id_kind
To: bot+bpf-ci@kernel.org, alan.maguire@oracle.com, ast@kernel.org,
 arighi@nvidia.com, akpm@linux-foundation.org, andrii@kernel.org,
 morbo@google.com, changwoo@igalia.com, daniel@iogearbox.net,
 void@manifault.com, dolinux.peng@gmail.com, eddyz87@gmail.com,
 haoluo@google.com, jolsa@kernel.org, john.fastabend@gmail.com,
 corbet@lwn.net, justinstitt@google.com, kpsingh@kernel.org,
 martin.lau@linux.dev, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nsc@kernel.org, shuah@kernel.org, song@kernel.org, sdf@fomichev.me,
 tj@kernel.org, yonghong.song@linux.dev
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev, martin.lau@kernel.org, clm@meta.com
References: <20251218003314.260269-4-ihor.solodrai@linux.dev>
 <106b6e71bce75b8f12a85f2f99e75129e67af7287f6d81fa912589ece14044f9@mail.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <106b6e71bce75b8f12a85f2f99e75129e67af7287f6d81fa912589ece14044f9@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/17/25 4:47 PM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index b4caae1170dd..da8c7d127632 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
> 
> [ ... ]
> 
>> @@ -260,22 +279,36 @@ static char *get_id(const char *prefix_end)
>>  	return id;
>>  }
>>
>> -static struct btf_id *add_set(struct object *obj, char *name, bool is_set8)
>> +static struct btf_id *add_set(struct object *obj, char *name, enum btf_id_kind kind)
>>  {
>> +	int len = strlen(name);
>> +	int prefixlen;
>> +	char *id;
>> +
>>  	/*
>>  	 * __BTF_ID__set__name
>>  	 * name =    ^
>>  	 * id   =         ^
>>  	 */
>> -	char *id = name + (is_set8 ? sizeof(BTF_SET8 "__") : sizeof(BTF_SET "__")) - 1;
>> -	int len = strlen(name);
>> +	switch (kind) {
>> +	case BTF_ID_KIND_SET:
>> +		prefixlen = sizeof(BTF_SET "__") - 1;
>> +		break;
>> +	case BTF_ID_KIND_SET8:
>> +		prefixlen = sizeof(BTF_SET8 "__") - 1;
>> +		break;
>> +	default:
>> +		pr_err("Unexpected kind %d passed to %s() for symbol %s\n", kind, __func__, name);
>> +		return NULL;
>> +	}
>> +
>> +	id = name + prefixlen - 1;
> 
> Is this off by one? The original code computed:
> 
>     id = name + sizeof(BTF_SET "__") - 1
> 
> For BTF_SET ("set"), this gives: name + sizeof("set__") - 1 = name + 6 - 1 = name + 5
> 
> The new code computes:
> 
>     prefixlen = sizeof(BTF_SET "__") - 1 = 6 - 1 = 5
>     id = name + prefixlen - 1 = name + 5 - 1 = name + 4
> 
> The -1 appears to be applied twice now, once in the prefixlen assignment and
> again when computing id. Should this line be:
> 
>     id = name + prefixlen;

Yes, this is an off-by-one bug.

Good catch, Opus 4.5. Sonnet 4.5 missed this in v3.

This was "harmless", since the names stored in the trees don't affect
the output.  The comparison between the names still works, as they all
simply got a "_" prefix.  But this only makes the bug sneaky, which is
very bad.

The suggested fix is meh though, IMO a better one is:

diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
index 3e88dc862d87..ffc15c249ed4 100644
--- a/tools/bpf/resolve_btfids/main.c
+++ b/tools/bpf/resolve_btfids/main.c
@@ -295,10 +295,10 @@ static struct btf_id *add_set(struct object *obj, char *name, enum btf_id_kind k
         */
        switch (kind) {
        case BTF_ID_KIND_SET:
-               prefixlen = sizeof(BTF_SET "__") - 1;
+               prefixlen = sizeof(BTF_SET "__");
                break;
        case BTF_ID_KIND_SET8:
-               prefixlen = sizeof(BTF_SET8 "__") - 1;
+               prefixlen = sizeof(BTF_SET8 "__");
                break;
        default:
                pr_err("Unexpected kind %d passed to %s() for symbol %s\n", kind, __func__, name);

> 
>>  	if (id >= name + len) {
>>  		pr_err("FAILED to parse set name: %s\n", name);
>>  		return NULL;
>>  	}
>>
>> -	return btf_id__add(&obj->sets, id, true);
>> +	return btf_id__add_unique(&obj->sets, id, kind);
>>  }
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20321956014


