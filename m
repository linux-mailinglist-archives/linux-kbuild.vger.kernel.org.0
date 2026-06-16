Return-Path: <linux-kbuild+bounces-13780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TE/lN+bEMWqapwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13780-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:49:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8A69579D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 23:49:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="n0Y/tBoM";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13780-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13780-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 003E8300CEA9
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E0438F947;
	Tue, 16 Jun 2026 21:49:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F68331EA5
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 21:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781646563; cv=none; b=YfQ5jt0JinahRNyJMf2ebhqRzH07CqCCEDPc4zbKPz1oue9ng3KtA2NHxbiimPBVzULfLW2D4IrEshxqEDuqHpA7G85bpeiuQ5SSkk1VKiQNsw+J2jod4gram9X1y6mgWg0zCS85y4hVw/I4Z6Chu9EYhPLbKT9qdFdVJgVfSQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781646563; c=relaxed/simple;
	bh=MOcFjMqsYk7UWh9f9Sgwv5TsKc//MxEiNuUu7bDbkCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AShtSxGqPvuky2+s9WZawHO4q86xtN5pks4xk5/PgFB+numLBzXYhMuzO4kxNJnIUN2stmtd/sZ+SABvinYuuowfot5YiZNG3hOeJYrFWAi6KxlZDblFEkdCbTje7yRLOpDgXyuPpka+qrmK+hSsn3Jsv+4gZei8c85gjeTYu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n0Y/tBoM; arc=none smtp.client-ip=91.218.175.171
Message-ID: <949fdd43-9feb-44a1-9c7f-8807689a68e0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781646560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFiXNMEE3Ha5bwhXk4lM+1jbLSoICDimVXikp/JJQkM=;
	b=n0Y/tBoMAhAeu3x+I5iyWadCwOwp2ESE7De2vUG5Z4xp0KAmMiZIBRps2kF1KO/qnAi2/f
	Yts5krb4nlNG0B5QyN1a/oVvmXIPbjWSPc6643a8cU5ERzq//RBrKmqsNW+jPFSjJhIR8K
	psZU/8gi4uXf8HIoRqdTUf5h0upUT/c=
Date: Tue, 16 Jun 2026 14:49:13 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from
 BTF ID sets
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Emil Tsalapatis <emil@etsalapatis.com>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-7-ihor.solodrai@linux.dev>
 <CAEf4BzaLzX3mXvQzxv+gbmZOh84XvYofLjMSWFYghNjS-ohEZg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAEf4BzaLzX3mXvQzxv+gbmZOh84XvYofLjMSWFYghNjS-ohEZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13780-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrii.nakryiko@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:emil@etsalapatis.com,m:andriinakryiko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org,etsalapatis.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82F8A69579D

On 6/3/26 4:45 PM, Andrii Nakryiko wrote:
> On Mon, Jun 1, 2026 at 3:19 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
>> list of kfuncs. The decl tags are generated by pahole, which makes
>> current implementation implicitly rely on those tags being generated.
>>
>> The authoritative source, used by the the BPF verifier for kfunc
>> registration, of functions being BPF kfuncs are
>> BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
>> hood. Currently resolve_btfids reads kfunc flags from these sets, and
>> populates them with BTF IDs.
>>
>> Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
>> removing the dependency on pahole's emmission of decl tags.
>>
>> Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
>> look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
>> recording the paired flags directly. This makes find_kfunc_flags()
>> helper unnecessary, so it's removed.
>>
>> Kernel functions can appear in more than one set, which is legitimate,
>> since kfunc sets are prog-type dependent in the kernel. So for btf2btf
>> processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
>> and warn on flags mismatch to catch inconsistent declarations.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++------------------
>>  1 file changed, 55 insertions(+), 67 deletions(-)
>>
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index 43512af13148..d35a7b2460e8 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx, struct kfunc *kfunc)
>>         struct kfunc *arr = ctx->kfuncs;
>>         u32 cap = ctx->max_kfuncs;
>>
>> +       /*
>> +        * A kfunc can be listed in multiple BTF ID sets.
>> +        * In this case, dedup by btf_id and accumulate kfunc flags.
>> +        */
>> +       for (u32 i = 0; i < ctx->nr_kfuncs; i++) {
>> +               if (ctx->kfuncs[i].btf_id != kfunc->btf_id)
>> +                       continue;
>> +
> 
> with hundreds of kfuncs, this O(N^2) approach is going to be a bit
> slow, should we use rb tree for lookups?

Yeah, it's O(n^2). I was thinking it's fine, because the number of
kfuncs is ~ a few hundreds. I'll use the rbtree in v2.

> 
>> +               if (ctx->kfuncs[i].flags != kfunc->flags) {
>> +                       pr_err("WARN: resolve_btfids: inconsistent flags for kfunc %s: 0x%x != 0x%x\n",
>> +                              kfunc->name, ctx->kfuncs[i].flags, kfunc->flags);
>> +                       warnings++;
>> +               }
>> +               ctx->kfuncs[i].flags |= kfunc->flags;
>> +               return 0;
>> +       }
>> +
>>         if (ctx->nr_kfuncs + 1 > cap) {
>>                 cap = max(cap + 256, cap * 2);
>>                 arr = realloc(arr, sizeof(struct kfunc) * cap);
> 
> [...]


