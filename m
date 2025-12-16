Return-Path: <linux-kbuild+bounces-10109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5ECCC0A45
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 03:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 454D73003104
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 02:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51402DA750;
	Tue, 16 Dec 2025 02:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o12PPZar"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AD1E0083
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 02:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853558; cv=none; b=C6UuJZtFRcLoPPlgWIqQvh5Z0kUQxETvJ68Ka0ItBtD4XPph3FKd65sDWk8eOaKYJAceErwe5A9Ho2eiBCwAYX3mnjilo+foWgmOIK6nqvSihSYUkj9GXsUAL5fL7hVKWc3dssjCBT8UXJmaSnlYGXZxdCdnpFtLoPYXlwsIK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853558; c=relaxed/simple;
	bh=JusJwqvo6Hpfx07keN1Onl2YeO6GIcx0G1fHxTwBW6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnWnMQF6gXG1fGXK5eByHFNuuCWhXLx+/R61u3W0o+HjetVVjVtuzBK2iNkkwgRKbcZWQDe9cKpHEz6CWBjwWN38haxYdcf9qK3XXMagRyUCEyyge6ecsP49V5l9t6VKPLmRKDOHTCI1pnV2YKpp+47fzIFcZpA/QRvbYOTJoag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o12PPZar; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4daf5253-685b-4047-8e2a-06ed2c72c830@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765853553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jZaVdOGuf+PlqL6aX4Gru2mVVfm+TBnHpzVcgJkieA=;
	b=o12PPZarsm1jNNGY6+OtBe634IvvB7T/tymVMdJKvSqUPiCoMzRyQdPh5OSGlkzbnPfJvT
	JISpu0PS11tm0AuolVA47GMnD1qvrhf6Q3Gl8O6/SCmnXz0/T50I3jbHObktrwks06r5Yl
	1ki7vNJKFRYSQaQb/BJbaku/Q/x3pb4=
Date: Mon, 15 Dec 2025 18:52:17 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 3/6] resolve_btfids: Introduce enum
 btf_id_kind
To: Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
 Shuah Khan <shuah@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
 <20251205223046.4155870-4-ihor.solodrai@linux.dev>
 <386068b11e146a9dbb502f770d7e012e3dea950f.camel@gmail.com>
 <c857acb9-977a-49ca-a03f-ef3fd68fabae@linux.dev>
 <b37bbff7486f47404872017faecba43833116d61.camel@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <b37bbff7486f47404872017faecba43833116d61.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/15/25 6:38 PM, Eduard Zingerman wrote:
> On Mon, 2025-12-15 at 18:31 -0800, Ihor Solodrai wrote:
>> On 12/11/25 11:09 PM, Eduard Zingerman wrote:
>>> On Fri, 2025-12-05 at 14:30 -0800, Ihor Solodrai wrote:
>>>> Instead of using multiple flags, make struct btf_id tagged with an
>>>> enum value indicating its kind in the context of resolve_btfids.
>>>>
>>>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>>>> ---
>>>
>>> Acked-by: Eduard Zingerman <eddyz87@gmail.com>
>>>
>>> (But see a question below).
>>>
>>>> @@ -213,14 +218,19 @@ btf_id__add(struct rb_root *root, char *name, bool unique)
>>>>  			p = &(*p)->rb_left;
>>>>  		else if (cmp > 0)
>>>>  			p = &(*p)->rb_right;
>>>> -		else
>>>> -			return unique ? NULL : id;
>>>> +		else if (kind == BTF_ID_KIND_SYM && id->kind == BTF_ID_KIND_SYM)
>>>
>>> Nit: I'd keep the 'unique' parameter alongside 'kind' and resolve this
>>>      condition on the function callsite.
>>
>> I don't like the boolean args, they're always opaque on the callsite.
>>
>> We want to allow duplicates for _KIND_SYM and forbid for other kinds.
>> Since we are passing the kind from outside, I think it makes sense to
>> check for this inside the function. It makes the usage simpler.
> 
> On the contrary, the callsite knows exactly what it wants:
> unique or non-unique entries. Here you need additional logic
> to figure out the intent.
> 
> Arguably the uniqueness is associated not with entry type,
> but with a particular tree the entry is added to.
> And that is a property of the callsite.

You're right that the uniqueness is associated with a tree.
This means we could even check the kind of the root...

I'm thinking maybe it's cleaner to have btf_id__add() and
btf_id__add_unique(). It can even be a wrapper around btf_id__add()
with a boolean.  wdyt?

> 
>>>
>>> [...]
>>>


