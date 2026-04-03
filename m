Return-Path: <linux-kbuild+bounces-12635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NtLXIQ4H0GnB2gYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12635-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 20:29:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 075433974BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 20:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05C323006102
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 18:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A82361650;
	Fri,  3 Apr 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFfoe+Od"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580B1F151C;
	Fri,  3 Apr 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775240971; cv=none; b=S4pxv01mxf322x+J7PRbs1u5TeE48cDW0UXlSG1xxpO8EoDbNqLxN2N2f8UoAC99IN2g6GjaqktXPLQu/gTmjXiY3ZXvLpT8hmhSGAtWwSEKMkFTQzA8u0snVP6a+HldB6nakPAajNAUkWADU+1NDURqIkcPqMGHNP4d3PdDw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775240971; c=relaxed/simple;
	bh=2LaCesgEqKearbmEy0CIdH1OxXGy3hFRgnwk7wdkISs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeEKAZycWT1fYhdm2ApqiXRlS+qq4RbNrtkGWcwi0+f04oNkUtZOSr/MlrnwPZxiyau+O+GrGVoIj6sB80lgpcBofrkPCH2hFF4yzCYY0NF1sAHduvEcTjNLZrRBQ4n8pDF6LE1fGYELHhhbMUMDzkN+KtjkgW44F0OHuk16PWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFfoe+Od; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7854CC4CEF7;
	Fri,  3 Apr 2026 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775240971;
	bh=2LaCesgEqKearbmEy0CIdH1OxXGy3hFRgnwk7wdkISs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JFfoe+OdYtwOwBNifEpqm7IRcYHNx8GK/H/UXt4zENrJ40+pbi/suVM7tB5nwYUoz
	 43CneCDysSjvSJwT+97osxUozGqQ+k5rrR2f4w2qfF4s2/ynhOqo4sYElxPb4UicWQ
	 Cxamq9EAHCCoyEZydeL5mxRYYT6UjLxLmnLPyHwfsKR1qDviIVBuTYbLnjyXeef3pv
	 eOVagQAWx/m+AoA6Y8ONDtRjXtl8nMq62cTqwkYwaJAFUYDxK/FKCjy+W25DGNIwUH
	 s+We36PVVj6YWendwlyyYb0TQpiVfCOj+MvYwC5WWcCxerl2j/g3bwHB3jnNoFPC/W
	 fYMAxj+aKPE2A==
Message-ID: <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org>
Date: Fri, 3 Apr 2026 20:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Content-Language: en-US
To: "Harry Yoo (Oracle)" <harry@kernel.org>, Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 Andrey Konovalov <andreyknvl@gmail.com>, Florent Revest <revest@google.com>,
 GONG Ruiqi <gongruiqi@huaweicloud.com>, Jann Horn <jannh@google.com>,
 KP Singh <kpsingh@kernel.org>, Matteo Rizzo <matteorizzo@google.com>
References: <20260331111240.153913-1-elver@google.com>
 <ac9d5O5XehnXRc5A@hyeyoo>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <ac9d5O5XehnXRc5A@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12635-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_TWELVE(0.00)[36];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 075433974BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>> index 15a60b501b95..c0bf00ee6025 100644
>> --- a/include/linux/slab.h
>> +++ b/include/linux/slab.h
>> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
>>   * with the exception of kunit tests
>>   */
>>  
>> -void *__kmalloc_noprof(size_t size, gfp_t flags)
>> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
>>  				__assume_kmalloc_alignment __alloc_size(1);
>>  
>> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
>> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
>>  				__assume_kmalloc_alignment __alloc_size(1);
> 
> So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> disabled but still increases the kernel size by a few kilobytes...
> but yeah I'm not sure if we can get avoid it without hurting readability.
> 
> Just saying. (does anybody care?)

Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
using DECL_BUCKET_PARAMS(), so maybe extend that idea?
I think it's not just kernel size, but increased register pressure etc.



