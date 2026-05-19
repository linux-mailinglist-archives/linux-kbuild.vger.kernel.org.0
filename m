Return-Path: <linux-kbuild+bounces-13283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOBMFtf5DGpHqwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13283-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 02:01:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B383F58631B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 02:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71001305809F
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 23:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866563AC0E4;
	Tue, 19 May 2026 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+IawRDC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E527369D4D;
	Tue, 19 May 2026 23:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235072; cv=none; b=o4zrK0C7sZizZkL5W/cb21P/4YQ1laVNTSPUddmA+AiMMpGCYlnPCwBpV9f0iISOv6kz+R5pnwRZjJKMYnhN5CRUdpc3QAEcH6EV8AwoE29eiv5lMT9V2+ON/0CdMgX/1lgN0owLnMSJhHiGKH21HyzG3KcYu9N9ipqVCCHb7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235072; c=relaxed/simple;
	bh=7UTzWNyq8e8HIpKZw64gKTF6fVCOvbLqoh4DSh8fbSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYKIrV7rrxYGf59Ax3jPAjqLmLFZSIVQ+m8Zfo+ahunX4Cet/zR+npogF2b4cUNeeFSa4BIdVaH7C8egIBQ6Hl69mqvJuSFVOyAjn9/+Zva0OEsuDHUYvaD4Z2CWhqTbP6yk6dc8UiyNxP0rFSFzfVIk7zN4S8HIotnrTfuTaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+IawRDC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328051F00893;
	Tue, 19 May 2026 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779235071;
	bh=dbsOAfuN8ml++VqHBD2xHu4Tk0pEHTjebmx81mRjNjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j+IawRDC4po5J/sySD3Vspo/j2V6R7CsxVFwZtizeYW8pdH/UsliZI/qQZreqa8ll
	 +9cK0dwngXE+55CkwGhFbim4x6YdUttO7nM04lyrmgGpKcD3RtBQwuzb1y64Trj6fZ
	 VVWfqd7g3nHCG/zZRm/8qqKykiislzCZKL89CzHEyWbFGc0fUOcjHiohFpRNELU0AR
	 ejYF/V59JUUqr7nmzQMRIJBisCdJ9anllfnXNzmrBu2lUTqvJMepXGcCu9AdyWCc36
	 5Bjrs4QZ8Ac5swPr9Ow3Z/mDI5sHraIw+5YwUah4DOCvHh2DIw53nFgb5ThnZo5I5q
	 2RyBf6pHU8qAA==
Message-ID: <d0cea3c8-f1ce-4dfe-a116-8f36d5b4308e@kernel.org>
Date: Wed, 20 May 2026 08:57:42 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
To: Marco Elver <elver@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>,
 David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
 Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>,
 Kees Cook <kees@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org,
 Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 GONG Ruiqi <gongruiqi1@huawei.com>
References: <20260511200136.3201646-1-elver@google.com>
 <agcsMgfKjGTasJ5n@pedro-suse>
 <CANpmjNOYd9RnJARZ7qUDifsftwWOhhakaWSu926PKA6-SepTwQ@mail.gmail.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <CANpmjNOYd9RnJARZ7qUDifsftwWOhhakaWSu926PKA6-SepTwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13283-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B383F58631B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 11:08 PM, Marco Elver wrote:
> On Fri, 15 May 2026 at 16:28, Pedro Falcato <pfalcato@suse.de> wrote:
>>
>> On Mon, May 11, 2026 at 10:00:48PM +0200, Marco Elver wrote:
>>> Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
>>> flexible KMALLOC_PARTITION_CACHES, with the former being a partitioning
>>> mode of the latter.
>>>
>>> Introduce a new mode, KMALLOC_PARTITION_TYPED, which leverages a feature
>>> available in Clang 22 and later, called "allocation tokens" via
>>> __builtin_infer_alloc_token() [1]. Unlike KMALLOC_PARTITION_RANDOM
>>> (formerly RANDOM_KMALLOC_CACHES), this mode deterministically assigns a
>>> slab cache to an allocation of type T, regardless of allocation site.
>>>
>>> The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
>>> the compiler to infer an allocation type from arguments commonly passed
>>> to memory-allocating functions and returns a type-derived token ID. The
>>> implementation passes kmalloc-args to the builtin: the compiler performs
>>> best-effort type inference, and then recognizes common patterns such as
>>> `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
>>> `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
>>> fallback token (default: 0) is chosen.
>>>
>>> Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
>>> expressed, and therefore ensures there's not much drift in which
>>> patterns the compiler needs to recognize. Specifically, kmalloc_obj()
>>> and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
>>> compiler recognizes via the cast to TYPE*.
>>>
>>> Clang's default token ID calculation is described as [1]:
>>>
>>>     typehashpointersplit: This mode assigns a token ID based on the hash
>>>     of the allocated type's name, where the top half ID-space is reserved
>>>     for types that contain pointers and the bottom half for types that do
>>>     not contain pointers.
>>>
>>> Separating pointer-containing objects from pointerless objects and data
>>> allocations can help mitigate certain classes of memory corruption
>>> exploits [2]: attackers who gains a buffer overflow on a primitive
>>> buffer cannot use it to directly corrupt pointers or other critical
>>> metadata in an object residing in a different, isolated heap region.
>>>
>>> It is important to note that heap isolation strategies offer a
>>> best-effort approach, and do not provide a 100% security guarantee,
>>> albeit achievable at relatively low performance cost. Note that this
>>> also does not prevent cross-cache attacks: while waiting for future
>>> features like SLAB_VIRTUAL [3] to provide physical page isolation, this
>>> feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
>>> init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
>>> much as possible today.
>>>
>>> With all that, my kernel (x86 defconfig) shows me a histogram of slab
>>> cache object distribution per /proc/slabinfo (after boot):
>>>
>>>    <slab cache>      <objs> <hist>
>>>    kmalloc-part-15    1465  ++++++++++++++
>>>    kmalloc-part-14    2988  +++++++++++++++++++++++++++++
>>>    kmalloc-part-13    1656  ++++++++++++++++
>>>    kmalloc-part-12    1045  ++++++++++
>>>    kmalloc-part-11    1697  ++++++++++++++++
>>>    kmalloc-part-10    1489  ++++++++++++++
>>>    kmalloc-part-09     965  +++++++++
>>>    kmalloc-part-08     710  +++++++
>>>    kmalloc-part-07     100  +
>>>    kmalloc-part-06     217  ++
>>>    kmalloc-part-05     105  +
>>>    kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
>>>    kmalloc-part-03     183  +
>>>    kmalloc-part-02     283  ++
>>>    kmalloc-part-01     316  +++
>>>    kmalloc            1422  ++++++++++++++
>>
>> Hi,
>>
>> A couple of questions (I apologise if this was asked before, I wasn't involved
>> in this thread):
>>
>> 1) What's the object behind kmalloc-part-04? I imagine it's a single type
>> getting allocated a lot?
> 
> That's from __kmemdup_nul().

__kmemdup_nul() is probably a good fit for SLAB_BUCKETS?

-- 
Cheers,
Harry / Hyeonggon


