Return-Path: <linux-kbuild+bounces-12806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM6VAY3o4GlInQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12806-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:47:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07140F1F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FE1030AFB10
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 13:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168C53C9ED9;
	Thu, 16 Apr 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UndI+2Uo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046163BED55
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347016; cv=pass; b=mFhBPqwguEQ2MhoLyiCk19oh3yGZz/G8AfPcwOTHK1R9UIDF7hONEiZxcbcD5h70X0vDCi5oZuXd4trjWe1pjvIy7vPwa2i/w2YqhOLHCWPz8tQq10F9vODPH554e48YmtJXV9QPXS+U4Flh3xA8IzawxlOZvrb7uaOXahhHAiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347016; c=relaxed/simple;
	bh=kxOvVjqTd7DGEEZRsCC5oBNM7Qjhq1uj+hNMJ9dzIwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMzMEaObpanHpSGotGkNM2U1DSx7gYap11naeSBULeyvETZAbnQrELoyiBfOJuzt1wt3V7vK0Sq/I/KiPzIpwQKKB7GU8XSUY8h3gvjhITfALcB0np00xSPq0btDHGQ/AvtvOYap2jJ8w7DAHTiIByhrj2PYR/Xb1LU7dW/4MyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UndI+2Uo; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c080efc1eso502730c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 06:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776347013; cv=none;
        d=google.com; s=arc-20240605;
        b=M3yiDV7T7xtUj5X3ynbDCb/jQHBq1e64ncFlCGP6x8d9+XAOTwP2StJJrwhl1oHPlr
         45BxRZVgBcRJ1pXVEMHG4U+7q7lT0O2BN52geVR+KnAusnlmYbyvRmTm3bh3H/+yZ43x
         NfdYxiirdCx4UVSxNFrSS2uEHfUzgubaRpgorgas+zF4sOzBx9XoRjTAlpgCzVBIWwme
         qZ6vh2L0RZg4SZmZFqP9fWOK3sZ0/WK3psjgde5Au3dMrKIRvqL7HUJi+2d2GYyxHFq1
         H+WgliDoUo2CzKdnmC/C0WLKZ3jpllVwzKFfh46X+c1WSR4W6TiLvMZG9JFVDuXXZMkY
         wJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        fh=d88WQlAtLLNwOA4tWAsO5KlN9qD8R2tIjeS7LeZapWs=;
        b=MtWVOdCMinH1gmAkF0yq/enQ62OJE57P+S6V+V49hFCfFLYO4ZCMCpqaehqR7sLdOm
         s3jmOIHYIoY8RsEIdrLct8IhzrUw8nC4g8ilY3z49ZCjOB2QsFljmlsYWjYixSnqBUql
         2laVvmVoIXMnjYH3upK93uy3xKPuXYXCa0PmjzQtX8vcsZBoqYtGsWuwaIwxoHBsitOG
         Ou+KeQcF9A7KFs46J1mwGdHCFbIzK4/IzIcMv/q+oLMy/yC6QXPguqAgIX65S/0U0pQs
         YHJrBjoUpecYXzlEHTmKYCW/qztJxCS9/payWQ24lQv7B+O9FSB5Sj1A1HmWECQwXU8y
         cTTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776347013; x=1776951813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        b=UndI+2UoWQ6NXmS++oMPVLopDmEfWXMNBykpjx4ivtaTqBsL6BBO2ibHwTL7owAnGA
         cXBdm5zfMjLq50BP1frV98bXTLcC5zosCVTPXWuMi2W6V6lWFHpUNZS1wUZmtVM/W0Vl
         L/TJyqufbXM3wV/kTLV08eTGijjS/r5kEO7cZ45ZFp1uS1PqGb6AEAcrg2FnH1DxIvfv
         akKwKfwqI4Wse+Jaz6tWcd+Ee9JiQpInsdeeAWR+T9eK4sfjpG1rYLTd2BxD/yaXrFtl
         OtLIRPjAsiPNEBwe5AhNyxYIMJLRZcbqPrUjx8Pcue+4SP8abd7RYsjxIF6MrzdIHtLr
         pLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347013; x=1776951813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjOGwsDBOUpGKkFXC9SNbDoonfQ12TYXzDLlbb+FREQ=;
        b=LNOdP5N2pwzXUONssbUkIjfDq4gnh0+3ISMjr4kYv5jZOB0Wc8cEXoVg5RdY/EPx6k
         xeMhMAkkpJMkQzaiTkWwWQxDl0TaJZLX0yzQB7QBpclvKE0KHta1IihmVE1uOwQ8+Mff
         ej39hgeLHBWNKd8N8hNWoKHeKsU7zRetObKAGDzbIrCKk8Cce2Af6bSqaLnzS5kIiWQw
         AtcJg/4MJdpn2F08a6FmsFNLm637G0A9+CkgqQyZzwVxWq+zoxBd5kmCnL1H4voyjgM5
         aqEsVt8tWnqZN/sRDS5AiFI9vzp2DaZxURV9zDNYZPsnxz9vkt+F4AlCXe7EfOzYTqLJ
         I5gA==
X-Forwarded-Encrypted: i=1; AFNElJ/dphXvZEijXX56ajLb0KkvZXuWvKjLeRQ3kHrMHxvn79UFjTB8FH7/cXtrMpJj9KuNjSdaUVWH3+RhKqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4bmLw4+Heludx/mP2aILTFiUMmxBOjfO5CGTrruJaeDLMEEm
	AvQMUJmDP8Vdd/wcXRuFbJjrev7VHXR3ouwy/dDgw5iks/bL/1D/MKcWU7C3KfDo397TCMNENbW
	5A+fndE3tL0CUkjE5e+1FRBXBLlZESTqSHwSvkjfZ2SQ0HGIXYAd4nxEB66Q=
X-Gm-Gg: AeBDietHM3EKwCb2Mvyoe1DITAc5Oku6ZNK93rNazKoKn1vQUuER+EYGkKOxY/4FIMI
	+o0oXi97fl/PY25FnuN33sTg/aibXiDahR7J8lQtiPkQ60l6xf5X/gIvvZzYTKOGs051t2/6E2n
	IYTzmXwAqpsUYTD/7xYo8X/UfRcB978l9nPgh9S1SV1rXCs/s7ybwCRZwSvHu36Bq+OHpqx66Zk
	mdZMFN/MarM26zBtwk8oo8oeG43o5SzGvdAPhp52tVcRXcpGiDE1YKyatuuy7jYhULBYEshKdOQ
	cIt/ItyGTMp6SyuO3thThP+A9kHqfvcRznQntNI/C6zcR2B6ackH1QU+mA==
X-Received: by 2002:a05:7022:ef0e:b0:12c:43:3ffc with SMTP id
 a92af1059eb24-12c62f5a7fcmr1810164c88.0.1776347012365; Thu, 16 Apr 2026
 06:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415143735.2974230-1-elver@google.com>
In-Reply-To: <20260415143735.2974230-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 16 Apr 2026 15:42:55 +0200
X-Gm-Features: AQROBzAfkSpT2OeUn44qCzMc1NnP0-wCVBwGgeL2FJ0Hvp5au7FJaosCLAeJDF0
Message-ID: <CANpmjNPfunKnU=S9Gty-7MaO-3eJ2PUR=LZNd37pmgRwQDruCA@mail.gmail.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
To: elver@google.com, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12806-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,llvm.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:email,sashiko.dev:url]
X-Rspamd-Queue-Id: 5B07140F1F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026 at 16:37, Marco Elver <elver@google.com> wrote:
>
> Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> flexible PARTITION_KMALLOC_CACHES, with the former being a partitioning
> mode of the latter.
>
> Introduce a new mode, TYPED_KMALLOC_CACHES, which leverages a feature
> available in Clang 22 and later, called "allocation tokens" via
> __builtin_infer_alloc_token [1]. Unlike RANDOM_KMALLOC_CACHES, this mode
> deterministically assigns a slab cache to an allocation of type T,
> regardless of allocation site.
>
> The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> the compiler to infer an allocation type from arguments commonly passed
> to memory-allocating functions and returns a type-derived token ID. The
> implementation passes kmalloc-args to the builtin: the compiler performs
> best-effort type inference, and then recognizes common patterns such as
> `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> fallback token (default: 0) is chosen.
>
> Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> expressed, and therefore ensures there's not much drift in which
> patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> compiler recognizes via the cast to TYPE*.
>
> Clang's default token ID calculation is described as [1]:
>
>    typehashpointersplit: This mode assigns a token ID based on the hash
>    of the allocated type's name, where the top half ID-space is reserved
>    for types that contain pointers and the bottom half for types that do
>    not contain pointers.
>
> Separating pointer-containing objects from pointerless objects and data
> allocations can help mitigate certain classes of memory corruption
> exploits [2]: attackers who gains a buffer overflow on a primitive
> buffer cannot use it to directly corrupt pointers or other critical
> metadata in an object residing in a different, isolated heap region.
>
> It is important to note that heap isolation strategies offer a
> best-effort approach, and do not provide a 100% security guarantee,
> albeit achievable at relatively low performance cost. Note that this
> also does not prevent cross-cache attacks: while waiting for future
> features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> much as possible today.
>
> With all that, my kernel (x86 defconfig) shows me a histogram of slab
> cache object distribution per /proc/slabinfo (after boot):
>
>   <slab cache>      <objs> <hist>
>   kmalloc-part-15    1465  ++++++++++++++
>   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
>   kmalloc-part-13    1656  ++++++++++++++++
>   kmalloc-part-12    1045  ++++++++++
>   kmalloc-part-11    1697  ++++++++++++++++
>   kmalloc-part-10    1489  ++++++++++++++
>   kmalloc-part-09     965  +++++++++
>   kmalloc-part-08     710  +++++++
>   kmalloc-part-07     100  +
>   kmalloc-part-06     217  ++
>   kmalloc-part-05     105  +
>   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
>   kmalloc-part-03     183  +
>   kmalloc-part-02     283  ++
>   kmalloc-part-01     316  +++
>   kmalloc            1422  ++++++++++++++
>
> The above /proc/slabinfo snapshot shows me there are 6673 allocated
> objects (slabs 00 - 07) that the compiler claims contain no pointers or
> it was unable to infer the type of, and 12015 objects that contain
> pointers (slabs 08 - 15). On a whole, this looks relatively sane.
>
> Additionally, when I compile my kernel with -Rpass=alloc-token, which
> provides diagnostics where (after dead-code elimination) type inference
> failed, I see 186 allocation sites where the compiler failed to identify
> a type (down from 966 when I sent the RFC [4]). Some initial review
> confirms these are mostly variable sized buffers, but also include
> structs with trailing flexible length arrays.
>
> Link: https://clang.llvm.org/docs/AllocToken.html [1]
> Link: https://blog.dfsec.com/ios/2025/05/30/blasting-past-ios-18/ [2]
> Link: https://lwn.net/Articles/944647/ [3]
> Link: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/ [4]
> Link: https://discourse.llvm.org/t/rfc-a-framework-for-allocator-partitioning-hints/87434
> Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>
> Co-developed-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>

Sashiko found 2 latent issues in the diff context :
https://sashiko.dev/#/patchset/20260415143735.2974230-1-elver%40google.com
The fix is here:
https://lore.kernel.org/all/20260416132837.3787694-1-elver@google.com/

The irony is that TYPED_KMALLOC_CACHES would have helped mitigate this
kind of overflow bug.

