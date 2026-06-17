Return-Path: <linux-kbuild+bounces-13786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SRHEIfx9MmoZ0wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13786-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 12:59:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801B698BE8
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 12:59:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XaNq4ASb;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13786-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13786-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 068CB309F721
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 10:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77353BBFCD;
	Wed, 17 Jun 2026 10:50:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C73BD224
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 10:50:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693437; cv=none; b=CG3VgBrChyIUbnBap30AuiqPi7CRb4nGmb/DUrKrB7bP3rLYaKD618MUj8mYKDtpPTlTPraxZIESe1SZviKsqloUmCTbBK8sMj9DsRM/rIzWbwk1gqvsRsuEzRcMYQ/up+vifEMLmYHd5EEn4+3W5VWJdUQNmFBE1v72YchTql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693437; c=relaxed/simple;
	bh=t4Q0WQfz6y3C0uZuMQcyNH+6bWNFCt1+FN6StBNytPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNtETh0ZQi5i6lORsAFZ0LDNrT26Q3SFwrT9OpL9OnhXeeAnG0UvUFqWfveFaBvPbrm3rgKr2z6HLjSETAtFEeeAq8AL9h7RVhm9+8+HNnj/RVNsfbHpNOo0OWt7w0cgUCVE1cZoX0or9Etwi69PCp8XcWgBOJJ2RlruygylrRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XaNq4ASb; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49222fb062bso46325795e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781693434; x=1782298234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ofCbIxEGNbpACkwDaqN/ZJOhBt0Wqyfh2b5AswgGuBo=;
        b=XaNq4ASbQOa4gK+YeWi6kUU45gG5qKae7G+r5r0FEipn41E0a9S8Hx71YC9kHDEY5r
         NpCwHdk0U+/ZIsCTHuN0t/Yw6t6qlyx+EngmGvqIYx81Zy7FGOAH7UqDKm85wPcH5DFQ
         rxqiDfVrSHj4LrAqrhwCzIHSE+ofZ4E8o8C7xt0Hfw1pz+/RSAmuErRCk2duIEEmOaYS
         T1Uj0eD0YZQYfcz0wZx684GjYt88b5HX/0lb+OkWI2xGts4TK11qN8RP+8NNdncNAfsD
         gGUQJd8b4jU7yofijMgJ49Sp/5OagH7iRZlnSIxEUvevLOqnxQ0eb03tpssTXyL5HJ17
         dadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693434; x=1782298234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofCbIxEGNbpACkwDaqN/ZJOhBt0Wqyfh2b5AswgGuBo=;
        b=dd3LPwlzhO3z6HWj+OUGlVJg4E03tUvZ89ax3cDfgoCIZe7lAAJmMhtmezbma1ceni
         s4sVqtmvkVQYabyWQ4+B/9pItxf6HuLVqiHR9P4Of1u+144LA8X4D5QckzVoD8N6bcw2
         qiILw1bAQA4q/84UTN5pdoUefKWZXoBcVZRyjZS6H3cANT3sxgaaZUP7mmIUtJe3v9Ik
         IP0hXp+GezGHXIaUbnAfBMQEYkyecHlA9OmH88/6IJLWMADrhwvG2UItFnRuIOFFF7nK
         ckZfFzMuSx74T0Jp/2N4abOReKJvET2lQhVA8Ef18OX7i4cED1BQqO4qnfF+dKNaAU7y
         Gz+g==
X-Forwarded-Encrypted: i=1; AFNElJ8SyaSlysAAEAhthlKsXS8w0BBWJ9OP+/eX0xgTDcVKOa4GcuqKUvHtzoQIF0HK3nCgmAliPmmkdXbGy84=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbem656QNvHKEfe0ySzxWqpqlCNhNYvFG+HNvTwMf+K1n+vvh
	Q1rhjfo+bDn/TUfNiHY2hFIN/f9GYzMa/fltfao8mf7jOXoIBU4/TFpOtF08k6igKnw=
X-Gm-Gg: Acq92OFXzKynYFbaspQLR4scdpZks3IqZt93zlVXHf9ljddhFp+9WnUgBIBEbBlIOFa
	MkpjL+dEIVzfnxrJnQa95xp8+Lgjsp4DYT5KX3ruT9u+QaBsVt3lZnJGNX0N6eFmtrSPXM1QEWf
	xrlgRmKSKu8GYFMmrp57rm8JKz2TRIboAJAvYrjyVFsK5SbEZSJMcgyHthF23cH4LFGaTn9CSuO
	iYiwVXxn1xV0o4GBeRSlGT0reuP9YnLpXj1WWhHQnnwHpcIkQq0yaid4phBcJpbLbh9n/yDVVfY
	XYBAR8QyHL1Zer9yrFKE+HI0O39hKBGCjFx57Lx5sKphkfDi8uazY2Z+MadLmkfb9BjW4G/88Wq
	KT8hPnuWoUc0eyYhvqliV84f9IzjLuyEMwUHEmyvMfzO7B6P5Au4blIHTf+1tPHlTOUNxExkpds
	9gMCmlBQ0ZyVEY9WUbwAaR4o3Wn+ElBQ==
X-Received: by 2002:a05:600c:c09a:b0:490:e196:6574 with SMTP id 5b1f17b1804b1-492333bf89bmr48975455e9.13.1781693434339;
        Wed, 17 Jun 2026 03:50:34 -0700 (PDT)
Received: from [10.0.2.3] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa510e7sm179725275e9.7.2026.06.17.03.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:50:33 -0700 (PDT)
Message-ID: <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com>
Date: Wed, 17 Jun 2026 12:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Siddharth Nayyar <sidnayyar@google.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260615222019.4116687-1-xur@google.com>
 <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13786-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xur@google.com,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:jpoimboe@kernel.org,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,exactco.de,vger.kernel.org,lists.linux.dev,intel.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2801B698BE8

On 6/16/26 12:43 AM, Rong Xu wrote:
> A more direct fix for the warnings in
> https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
> looks like the following. But I believe the solution provided in the
> patch is more comprehensive.
> 
> -Rong
> 
> ======
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..1f0a379b43c8 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
> const char *fromsym,
>         /* symbols in data sections that may refer to any init/exit sections */
>         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
>             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
> -           match(fromsym, PATTERNS("*_ops", "*_console")))
> +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
>                 return 0;
> 
>         /* Check for pattern 3 */
> 

This variant makes more sense to me. The initially proposed patch
modifies the match() function, which is a generic function to check
whether a string matches any of the input patterns. The modpost utility
uses it to match both symbol and section names. Adding symbol-specific
knowledge to this function seems odd.

I noticed that LLVM has recently made improvements to reduce the number
of these ThinLTO renames [1], which might be worth checking out.

[1] https://github.com/llvm/llvm-project/commit/975dba28633d2f3746a8a370741b17024b0f5f9b

-- 
Thanks,
Petr

> On Mon, Jun 15, 2026 at 3:20 PM <xur@google.com> wrote:
>>
>> From: Rong Xu <xur@google.com>
>>
>> When building the kernel with Clang ThinLTO enabled, the compiler
>> can mangle static variable names by appending suffixes such as
>> ".llvm.<hash>" to prevent naming collisions across translation units.
>>
>> This name mangling breaks the section mismatch whitelisting in modpost.
>> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
>> safe references between permanent data and initialization code. Because
>> the LTO suffix modifies the end of the symbol name, legitimately
>> whitelisted structures fail the match, resulting in false positive
>> warnings.
>>
>> For example, a static pernet_operations struct triggers the following:
>>
>>   WARNING: modpost: vmlinux: section mismatch in reference: \
>>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>>   ping_v4_proc_init_net (section: .init.text)
>>
>> Fix this by stripping ".llvm." suffixes from the symbol name in match().
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
>> Signed-off-by: Rong Xu <xur@google.com>
>> ---
>>  scripts/mod/modpost.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> index abbcd3fc1394..1f5a64eeb048 100644
>> --- a/scripts/mod/modpost.c
>> +++ b/scripts/mod/modpost.c
>> @@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
>>  static bool match(const char *string, const char *const patterns[])
>>  {
>>         const char *pattern;
>> +       char string_stripped[512];
>> +       const char *ext = strstr(string, ".llvm.");
>> +
>> +       /*
>> +        * Clang LTO can append .llvm.<hash> to a variable. Safely strip
>> +        * the suffix so glob whitelists (like *_ops) work.
>> +        */
>> +       if (ext && (ext - string) < sizeof(string_stripped)) {
>> +               strncpy(string_stripped, string, ext - string);
>> +               string_stripped[ext - string] = '\0';
>> +               string = string_stripped;
>> +       }
>>
>>         while ((pattern = *patterns++)) {
>>                 if (!fnmatch(pattern, string, 0))
>>
>> base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
>> --
>> 2.54.0.1136.gdb2ca164c4-goog
>>

