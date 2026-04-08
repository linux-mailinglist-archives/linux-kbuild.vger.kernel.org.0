Return-Path: <linux-kbuild+bounces-12722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0/mJEoRb1mmNEggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12722-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Apr 2026 15:43:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B00083BD170
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Apr 2026 15:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ED403012CE0
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2026 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2107A3CF041;
	Wed,  8 Apr 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PDGxzH+O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28F638D681
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Apr 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655808; cv=none; b=Wjl71WDs18wdVSnkpHoKyGhbTiMeAO5tVzcRKtprgHQtf3/YW70CVgBzLF1BOsax/2WtoQ3et091Go/AjAjJsQ3JyH8A0ucDReFgeLfql5Qh17I7gkK9C2gJl+GblxA+yFbNMAki4gBr6sIwATKZSnIYcYzZSV6HQBPbwQPh5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655808; c=relaxed/simple;
	bh=aGBBqF82BfQwkwgHxlkI1N/8GUQz8/+5w8flepFuzok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ahr/0vKXgCpC/78fiDRyz9GAtzInCmlC+5gcoW+I0MlWjk5dQ1EHb2dqAiaBYI7qkCaP38KNgRnF6J8eWuuPkvERH+BnOYdVvEDnSX73w4zKfpCZWo8NguGVTZR29oSfMeIXAaKFj8Ko6mhcnMwXq2AoRTggFN8hhKty+GPNNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PDGxzH+O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso48976195e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Apr 2026 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775655805; x=1776260605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7oNmpe4d3hv2RrDET86MTy+CkexOZOZ7u5ulEsKdlgw=;
        b=PDGxzH+O+Rmd9SO+r3SuZTpt5hD7GCO6IVZQCDmw8NCkr61pFnu7hgQrGG4i/4zc5m
         ZdYfRDHcoymcWNdVx0kfhUlzspdm1as5UA76jorvvwrR6TNEJ+luZAlSDsU7CA+DpX24
         Zps0ouQ6vfjDYMf9GytYaUIwO6clNWYQa6lyEts63sCt53hwfx5j5sy20jdfEoKhnXw1
         sV1+xx+2qDOiHBJ1v9MMjjAufu+tmDDWy9uhG4/iHjuL42imyzQsQC7YUeqsuiV4f+Wr
         GFaaJbrDymY7WkXxc0SWeHIqFZgfJCZWw4PFwNbczyeSj8/opCfpUG/ETo8JbPRQOx5Q
         EwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775655805; x=1776260605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oNmpe4d3hv2RrDET86MTy+CkexOZOZ7u5ulEsKdlgw=;
        b=BkFE6XAKE5Ce/8SfxBMp1jnGpZz+q42rT0TukjKKBHOGSCmAG9IZDHMwXqtxJBAmYN
         By4x+1aYbtQ84HRWOX7jouRTCg7yBEOcXNLlroHFJFeA4K6pZyzAdn/lan9sB1QlyS7w
         SXenpq0Md56jPs4G77+a6KLa1+X0Qy41meeWqJa4BGIviK6F3ZvnSirLoEw1R+He3e95
         5PbDFyjQ6Nt+N2e+584zSIGSBBjlxLKVTkqL9a5z4jFG87YbsxL2jFeh2IPms8XGm106
         y0iHmNM6WiNMLsR7TO2qLXXyPISi8dY64fMMUH5ZKVFSoHZmsRT7pxDmjNSUY7crZjZz
         KU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYpemry+gSMcBnk6HXCJmZ5GZyC5H7FXa9SamcKJ2usYOgP4iJBZHYnB63NQ/raoceRaS3M7jZwuDz+II=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cBq3agZR2ftAnTbcpeXFJDJ8NPyvhrRMGwMUUn2WceKTfzw+
	DhC0UF0p+5LCFwC+v6VyMCOOYWP1NQfXTbLroqHOFNw0Mmk98w5bCV5nbOe/95CmkK4=
X-Gm-Gg: AeBDieuLyITAsHCLcxdT3gDboLBhM6abF361GSXBwU0eVcind2pysNU59qN4MRdoquJ
	GJZojCk/bWwAi9p8XA3Zpy//Bet7Ge7DyJuPWREmHP83DssuRirEE8senQvqFB/E6cYhipvcazQ
	sJ0E6HcjDdkLck87Dh1EL49gQbbvtaLagXlXPi6kNfCOLHBcuX8bc0NHy5IEKVzjf2g80F56Ke6
	yc4EvQrmaLK6nTF6t076fj8zpaa0jylQV7W0DVFzfosC1HNQg7rti6zkCxfl5YlqOf1LIbFnA8c
	J+veHK7a8QI252L9OUjRo8QN09s3492HQTj3t84zTXpQFg9hhsiKa9dXSUmQh0EifPUlmRtb4A9
	veC1P6v1P/iBrBiKukzWkC8bEpkw1FVXI7PJakVa0z6ksy0xN6AWFGNZuJd7zjwEXIzpG6nzSxB
	aCzzWgZr6Mc5p+mqxkCD43QgLZ+2dAKStnT3ke+/LExL/KT7LM/W+T04M=
X-Received: by 2002:a05:600c:3b1a:b0:486:fc5f:1ab9 with SMTP id 5b1f17b1804b1-48899775d8emr271551155e9.14.1775655805038;
        Wed, 08 Apr 2026 06:43:25 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm645561325e9.13.2026.04.08.06.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:43:24 -0700 (PDT)
Message-ID: <81bee452-f3b9-4a65-a4ee-8a71e8bd265b@suse.com>
Date: Wed, 8 Apr 2026 15:43:23 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild/btf: Avoid relinking modules when only vmlinux
 changes
From: Petr Pavlu <petr.pavlu@suse.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402141911.1577711-1-petr.pavlu@suse.com>
 <dc3db54f-f95d-46aa-ad84-6258abd13fab@suse.com>
Content-Language: en-US
In-Reply-To: <dc3db54f-f95d-46aa-ad84-6258abd13fab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12722-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B00083BD170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 1:30 PM, Petr Pavlu wrote:
> On 4/2/26 4:17 PM, Petr Pavlu wrote:
>> Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
>> and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
>> to enable generation of split BTF for kernel modules. This change required
>> the %.ko Makefile rule to additionally depend on vmlinux, which is used as
>> a base for deduplication. The regular ld_ko_o command executed by the rule
>> was then modified to be skipped if only vmlinux changes. This was done by
>> introducing a new if_changed_except command and updating the original call
>> to '+$(call if_changed_except,ld_ko_o,vmlinux)'.
>>
>> Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
>> in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
>> from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
>> previous logic to skip relinking modules if only vmlinux changes. The issue
>> is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
>> prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
>> retains the raw './vmlinux'. As a result, if_changed_except doesn't
>> correctly filter out vmlinux. Consequently, with
>> CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
>> changes.
>>
>> Additionally, commit 522397d05e7d ("resolve_btfids: Change in-place update
>> with raw binary output") in 2025 reworked the method for patching BTF data
>> into the resulting modules by using 'objcopy --add-section'. This command
>> fails if a section already exists.
>>
>> Fix the unnecessary relinking issue by also excluding the normalized form
>> 'vmlinux' when invoking ld_ko_o. Adjust embed_btf_data() to first use the
>> --remove-section option to remove the patched BTF section if it is already
>> present.
> 
> I noticed that sorting id+flags in BTF_SET8 by resolve_btfids doesn't
> seem to be idempotent, so this requires additional work.

It is possible to make sorting id+flags in BTF_SET8 by resolve_btfids
idempotent. One approach would be to also update the offsets (st_value)
of the __BTF_ID__* symbols so that they reflect the result after
sorting.

However, I don't think this is worth doing. Since this logic would be
relevant in specific cases when vmlinux changes and only the BTF data
needs to be regenerated, it would have limited usage and testing.
Importantly, always relinking the modules adds only about 6% to the
rebuild time of the modules target on my system when vmlinux is touched.
The work required for BTF and Makefile processing dominates this target.
When developing the kernel locally, it's common to use a custom config
with a limited amount of modules. In such a case, avoiding the relinking
of modules saves very little.

I plan to instead send a patch to replace the current condition that
invokes ld_ko_o from if_changed_except to if_changed, and remove the
if_changed_except logic.

-- Petr

