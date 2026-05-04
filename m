Return-Path: <linux-kbuild+bounces-12989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGBXKBu2+Gn1zAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12989-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 17:07:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 111CF4C06B1
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 17:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCF58305B2F6
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 15:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D443DFC84;
	Mon,  4 May 2026 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGIU6qDv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0593DF000
	for <linux-kbuild@vger.kernel.org>; Mon,  4 May 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906860; cv=none; b=UQTZ0kIHKJNZ6Fis6P01wD65fNXHvNhccj9Y3nCPmh1CF52MiK6bLmJWeEE+GI3SSjvPF8x0mc9iqA//DfgMSapF288jDAtUbfzyucuixb7cioM8fevPapL6pCpELVLBn763Fg5SCck8kngLylzpzcPKlyZL4bUBJAvhM2E29ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906860; c=relaxed/simple;
	bh=L21YpP6bz13lgE+YYR4NaDUk+1y+U1PIYuL7V14KBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnZv0i94x/pktv2pCoXgzuH6Ib6dNPt5QO3O4ZziuALV231bxtkLvBFyEU+nDTBCL+KGyeqNI//WvPkq65n2nkwqzSiJe7VCAYzYpCHxqD7e2SzDB5/thRkhosyUDJ8c32rRHDS6rbe5O2InULer42NaPcotFsikC53bz7UuuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGIU6qDv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d102471a4so8346355e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 04 May 2026 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777906856; x=1778511656; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vihrjy6JWRaFYaKwFFp+zwam3K505oAzvsgkAqow4uE=;
        b=bGIU6qDv0/SP7wwIb+UXB/k08aIkzVnS3YK6RDJkLGjzuhZjOFVcNVFSUjgdTdBWC2
         mnTUXgUWrQmz92hRo4U9brBBLGpR0hOj67XPdoNWBBYF4irV2Ta5cn1rb0GPFnrKcqFd
         6A2s482ATMrz75epXDv2l6fzzaRD55gpmAY0SKJDWdVChgtMmuNMbFutb5AotfxEJrIV
         +2eo5u7cyZ5ErmCiaPvktaJUr9hbYUSGkUjj4zGH0KxFv+v38jGOc5Me82Wd7LPAfGkZ
         4Ymfu8k1KcsKowMxMT7QXVelytdjTyp+pzkD5siNqVVR022g8ggvBaPpSmR0ppncB/mY
         3OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906856; x=1778511656;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vihrjy6JWRaFYaKwFFp+zwam3K505oAzvsgkAqow4uE=;
        b=PaMPt1eLL0msLOUnTIQWVvlZcFaUMvUNu76FHrrJn3FBqDXl1yzg0PfAxGvrzg6wlp
         pMYc+lKo6yWemfthoMClU3HyxQ8LDJNCftIWFKyUnsuBEvNCAeD2P8DSEyURYuDgTB5j
         5HnlMpNFJNg+f2n6ghM1qJaoFbxUWWCuVJj4zApXOsytNI7v/vedHtNY4/WUfD1jPX4G
         vQy7SK2Hh5h/WHW0hiPWNVP9UeAXqQG6uShAOhwEp3Idreqwi0et4bvyDIHDRGjYpniU
         wHUjG1dmAmTxhAp/JaaH8pRx7gaaL6VYbyAyMucUw344+oQvxtZdus65NJvAXYBKvfom
         9ybA==
X-Forwarded-Encrypted: i=1; AFNElJ89Ut+Kqd7Z6Qgk/qImBRkgbgnwgZzl6fXWdlYJprs5fsCo848c4NaqcvIx9nFAIKBZtvWm6EVRKS/4r2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/CZWZFnpJYbESacH4gz+C1/I/yPOs0JkHnxTKlVI2v2pwaEC
	uQvb7+ijck6MFckZZGVB4AzPjSI1G7P05kOsww5ee7eTQhCuZn8yQ5hU8wi2xjGTPg==
X-Gm-Gg: AeBDiet+7ZlrPzdMaMtrRHwwD1/CZVKMYuflOiQ9Gf7UpSDj7euqpY7A72KMINbHfqX
	xjzRaHLM8FWc0X46Mq5oq5e7qIbbppZ+tolf2qMFYCEeZvAcy7VdzJeGmhX+qWAkLh84xGwrhip
	vcCPtnFyU1xIIN4abrK/rnMx5dAZ6Cn4e+gaVAFS0sKPRHxA/ZkGTtiE0pNaRQwaJ1Il+QSnNYJ
	/wGkXhEimLjEBebp5/keMIsHa1Q8xHSYjsz5S4l3H2akVFJqczFjSXCgDd4n0fjeOlmACdvvx9k
	YMb+R5P9cbDyLlffmXMd9mqnv7jcSXpc5KNngOwF/RphYxPm37tpbuaOFA3OvOFZaWvEwRr4dNs
	VC3CrcVvzb5T/v7OJj2t/MOcJ7uFSiDwmrhJq/cw+kMPAYDMHWpuL5PBt7rfAuQHR0xbxMt6Xlt
	gDe/1daOKDMlTnmUDpSwPOOEbYVGmd2FxCUCojBFUfvpghkIjeotoyWXsWXZL6wEhra7w3LMNUJ
	GMubPK9yA==
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr162572375e9.29.1777906853078;
        Mon, 04 May 2026 08:00:53 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:fba5:1281:871d:3fd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe3cae3sm116897425e9.0.2026.05.04.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:00:52 -0700 (PDT)
Date: Mon, 4 May 2026 17:00:45 +0200
From: Marco Elver <elver@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
Message-ID: <afi0nQ84k1oz5RyH@elver.google.com>
References: <20260424132427.2703076-1-elver@google.com>
 <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
 <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Queue-Id: 111CF4C06B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12989-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[elver.google.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 03:59PM +0200, Marco Elver wrote:
> On Thu, 30 Apr 2026 at 15:40, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
> >
> > On 4/24/26 15:24, Marco Elver wrote:
> > > The mm-api kernel-doc comments have been broken for a while, as many
> > > documented symbols shifted from being direct function definitions to
> > > macros wrapping _noprof implementations during the introduction of
> > > allocation tagging (starting with commit 7bd230a26648 "mm/slab: enable
> > > slab allocation tagging for kmalloc and friends").
> > >
> > > When the kernel-doc block remains above the internal implementation
> > > function but uses the public API name, the documentation generator fails
> > > to associate the documented symbol and generates warnings and fails to
> > > emit the documentation.
> > >
> > > Fix this by:
> > >
> > > 1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
> > >    them directly above the user-facing macros.
> > >
> > > 2. Converting the variadic macros for the documented APIs to use
> > >    explicit arguments.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Marco Elver <elver@google.com>
> >
> > +Cc Jon
> >
> > I thought it was supposed to work because the kernel-doc scripts were at the
> > time taught by commit 51a7bf0238c2 ("scripts/kernel-doc: drop "_noprof" on
> > function prototypes") to handle _noprof. In the current form git grep finds:
> >
> > tools/lib/python/kdoc/kdoc_parser.py:        suffixes = [ '_noprof' ]
> > tools/lib/python/kdoc/xforms_lists.py:        (KernRe("_noprof"), ""),
> >
> > Doesn't it work for you then?
> 
> Ah, I see. So it doesn't work anymore because we add the '_' prefix, too.
> 
> I guess the question is if we want to proliferate more kdoc parser
> special cases, or just move the docs to the macros. The downside of
> macros is that they lose the types in the displayed function
> signature.
> 
> Preferences?

How about the below, i.e. adding type decls that only the kernel-doc
parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
kernel-doc parser hacks for that looks pretty awful, so this is a lot
cleaner.

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 13:48:21 +0200
Subject: [PATCH] slab: fix kernel-docs for mm-api

The mm-api kernel-docs have been disconnected from their symbols. While
the scripts were previously taught to handle the _noprof suffix added by
allocation tagging (in 51a7bf0238c2 "scripts/kernel-doc: drop "_noprof"
on function prototypes"), this does not handle cases where the internal
implementation function has an additional leading underscore. The added
optional parameters (via DECL_KMALLOC_PARAMS) further complicate parsing
the internal signatures.

When the kernel-doc block remains above the internal implementation
function but uses the public API name, the documentation generator fails
to associate the documented symbol.

Simply moving the docs to the macros in slab.h fixes the association but
causes loss of types in the generated documentation (rendering as e.g.
untyped 'kmalloc(size, flags)' macro).

Fix this by:

1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
   them directly above the user-facing macros.

2. Providing explicit, typed C prototypes for the documented APIs inside
   '#if 0 /* kernel-doc */' blocks.

3. Converting the variadic macros for the documented APIs to use
   explicit arguments to match the documentation.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Provide typed C prototypes in '#if 0' blocks to properly render API.
---
 include/linux/slab.h | 216 +++++++++++++++++++++++++++++++++----------
 mm/slub.c            |  98 --------------------
 2 files changed, 168 insertions(+), 146 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index c232f8a10af6..5e1249e36b0d 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -530,7 +530,49 @@ void * __must_check krealloc_node_align_noprof(const void *objp,
 					       unsigned long align,
 					       gfp_t flags, int nid) __realloc_size(2);
 #define krealloc_noprof(_o, _s, _f)	krealloc_node_align_noprof(_o, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), 1, _f, NUMA_NO_NODE)
-#define krealloc_node_align(_o, _s, _a, _f, _n)	alloc_hooks(krealloc_node_align_noprof(_o, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _a, _f, _n))
+#if 0 /* kernel-doc */
+/**
+ * krealloc_node_align - reallocate memory. The contents will remain unchanged.
+ * @p: object to reallocate memory for.
+ * @new_size: how many bytes of memory are required.
+ * @align: desired alignment.
+ * @flags: the type of memory to allocate.
+ * @nid: NUMA node or NUMA_NO_NODE
+ *
+ * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
+ * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
+ * initial memory allocation, every subsequent call to this API for the same
+ * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
+ * __GFP_ZERO is not fully honored by this API.
+ *
+ * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
+ * size of an allocation (but not the exact size it was allocated with) and
+ * hence implements the following semantics for shrinking and growing buffers
+ * with __GFP_ZERO::
+ *
+ *           new             bucket
+ *   0       size             size
+ *   |--------|----------------|
+ *   |  keep  |      zero      |
+ *
+ * Otherwise, the original allocation size 'orig_size' could be used to
+ * precisely clear the requested size, and the new size will also be stored
+ * as the new 'orig_size'.
+ *
+ * In any case, the contents of the object pointed to are preserved up to the
+ * lesser of the new and old sizes.
+ *
+ * Return: pointer to the allocated memory or %NULL in case of error
+ */
+void *krealloc_node_align(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid);
+#endif
+#define krealloc_node_align(p, new_size, align, flags, nid) \
+	alloc_hooks(krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(new_size, __kmalloc_token(new_size)), align, flags, nid))
 #define krealloc_node(_o, _s, _f, _n)	krealloc_node_align(_o, _s, 1, _f, _n)
 #define krealloc(...)			krealloc_node(__VA_ARGS__, NUMA_NO_NODE)
 
@@ -913,6 +955,23 @@ void *__kmalloc_large_noprof(size_t size, gfp_t flags)
 void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
 				__assume_page_alignment __alloc_size(1);
 
+static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
+{
+	if (__builtin_constant_p(size) && size) {
+		unsigned int index;
+
+		if (size > KMALLOC_MAX_CACHE_SIZE)
+			return __kmalloc_large_noprof(size, flags);
+
+		index = kmalloc_index(size);
+		return __kmalloc_cache_noprof(
+				kmalloc_caches[kmalloc_type(flags, token)][index],
+				flags, size);
+	}
+	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
+}
+#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * kmalloc - allocate kernel memory
  * @size: how many bytes of memory are required.
@@ -968,27 +1027,27 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
  *	Try really hard to succeed the allocation but fail
  *	eventually.
  */
-static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
-{
-	if (__builtin_constant_p(size) && size) {
-		unsigned int index;
-
-		if (size > KMALLOC_MAX_CACHE_SIZE)
-			return __kmalloc_large_noprof(size, flags);
-
-		index = kmalloc_index(size);
-		return __kmalloc_cache_noprof(
-				kmalloc_caches[kmalloc_type(flags, token)][index],
-				flags, size);
-	}
-	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
-}
-#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
+void *kmalloc(size_t size, gfp_t flags);
+#endif
+#define kmalloc(size, flags)			alloc_hooks(kmalloc_noprof(size, flags))
 
 void *_kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_flags, int node);
 #define kmalloc_nolock_noprof(_s, _f, _n)	_kmalloc_nolock_noprof(PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _f, _n)
-#define kmalloc_nolock(...)			alloc_hooks(kmalloc_nolock_noprof(__VA_ARGS__))
+#if 0 /* kernel-doc */
+/**
+ * kmalloc_nolock - Allocate an object of given size from any context.
+ * @size: size to allocate
+ * @gfp_flags: GFP flags. Only __GFP_ACCOUNT, __GFP_ZERO, __GFP_NO_OBJ_EXT
+ * allowed.
+ * @node: node number of the target node.
+ *
+ * Return: pointer to the new object or NULL in case of error.
+ * NULL does not mean EBUSY or EAGAIN. It means ENOMEM.
+ * There is no reason to call it again and expect !NULL.
+ */
+void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
+#endif
+#define kmalloc_nolock(size, gfp_flags, node)	alloc_hooks(kmalloc_nolock_noprof(size, gfp_flags, node))
 
 /**
  * __alloc_objs - Allocate objects of a given type using
@@ -1115,23 +1174,40 @@ static __always_inline __alloc_size(1) void *_kmalloc_node_noprof(size_t size, g
 #define kmalloc_node_noprof(...)		_kmalloc_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc_node(...)			alloc_hooks(kmalloc_node_noprof(__VA_ARGS__))
 
+static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t size, gfp_t flags, kmalloc_token_t token)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+	return _kmalloc_noprof(bytes, flags, token);
+}
+#define kmalloc_array_noprof(...)		_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * kmalloc_array - allocate memory for an array.
  * @n: number of elements.
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
-static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t size, gfp_t flags, kmalloc_token_t token)
+void *kmalloc_array(size_t n, size_t size, gfp_t flags);
+#endif
+#define kmalloc_array(n, size, flags)		alloc_hooks(kmalloc_array_noprof(n, size, flags))
+
+static inline __realloc_size(2, 3) void * __must_check _krealloc_array_noprof(void *p,
+								       size_t new_n,
+								       size_t new_size,
+								       gfp_t flags, kmalloc_token_t token)
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(n, size, &bytes)))
+	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
 		return NULL;
-	return _kmalloc_noprof(bytes, flags, token);
-}
-#define kmalloc_array_noprof(...)		_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kmalloc_array(...)			alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
 
+	return krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(bytes, token), 1, flags, NUMA_NO_NODE);
+}
+#define krealloc_array_noprof(...)		_krealloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * krealloc_array - reallocate memory for an array.
  * @p: pointer to the memory chunk to reallocate
@@ -1149,20 +1225,9 @@ static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t si
  * In any case, the contents of the object pointed to are preserved up to the
  * lesser of the new and old sizes.
  */
-static inline __realloc_size(2, 3) void * __must_check _krealloc_array_noprof(void *p,
-								       size_t new_n,
-								       size_t new_size,
-								       gfp_t flags, kmalloc_token_t token)
-{
-	size_t bytes;
-
-	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
-		return NULL;
-
-	return krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(bytes, token), 1, flags, NUMA_NO_NODE);
-}
-#define krealloc_array_noprof(...)		_krealloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define krealloc_array(...)			alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
+void *krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags);
+#endif
+#define krealloc_array(p, new_n, new_size, flags) alloc_hooks(krealloc_array_noprof(p, new_n, new_size, flags))
 
 /**
  * kcalloc - allocate memory for an array. The memory is set to zero.
@@ -1214,17 +1279,20 @@ static inline __alloc_size(1, 2) void *_kmalloc_array_node_noprof(size_t n, size
  */
 #define kmem_cache_zalloc(_k, _flags)		kmem_cache_alloc(_k, (_flags)|__GFP_ZERO)
 
-/**
- * kzalloc - allocate memory. The memory is set to zero.
- * @size: how many bytes of memory are required.
- * @flags: the type of memory to allocate (see kmalloc).
- */
 static inline __alloc_size(1) void *_kzalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
 {
 	return _kmalloc_noprof(size, flags | __GFP_ZERO, token);
 }
 #define kzalloc_noprof(...)			_kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
+#if 0 /* kernel-doc */
+/**
+ * kzalloc - allocate memory. The memory is set to zero.
+ * @size: how many bytes of memory are required.
+ * @flags: the type of memory to allocate (see kmalloc).
+ */
+void *kzalloc(size_t size, gfp_t flags);
+#endif
+#define kzalloc(size, flags)			alloc_hooks(kzalloc_noprof(size, flags))
 #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
 
 void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
@@ -1233,7 +1301,29 @@ void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long
 	__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, NULL, __kmalloc_token(_size)), _align, _flags, _node)
 #define kvmalloc_node_align(...)		\
 	alloc_hooks(kvmalloc_node_align_noprof(__VA_ARGS__))
-#define kvmalloc_node(_s, _f, _n)		kvmalloc_node_align(_s, 1, _f, _n)
+#if 0 /* kernel-doc */
+/**
+ * kvmalloc_node - attempt to allocate physically contiguous memory, but upon
+ * failure, fall back to non-contiguous (vmalloc) allocation.
+ * @size: size of the request.
+ * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
+ * @node: numa node to allocate from
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * Uses kmalloc to get the memory but if the allocation fails then falls back
+ * to the vmalloc allocator. Use kvfree for freeing the memory.
+ *
+ * GFP_NOWAIT and GFP_ATOMIC are supported, the __GFP_NORETRY modifier is not.
+ * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
+ * preferable to the vmalloc fallback, due to visible performance drawbacks.
+ *
+ * Return: pointer to the allocated memory of %NULL in case of failure
+ */
+void *kvmalloc_node(size_t size, gfp_t flags, int node);
+#endif
+#define kvmalloc_node(size, flags, node)	kvmalloc_node_align(size, 1, flags, node)
 #define kvmalloc_node_noprof(size, flags, node)	\
 	kvmalloc_node_align_noprof(size, 1, flags, node)
 #define kvmalloc(...)				kvmalloc_node(__VA_ARGS__, NUMA_NO_NODE)
@@ -1266,8 +1356,38 @@ _kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmallo
 
 void *kvrealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(size, token), unsigned long align,
 				  gfp_t flags, int nid) __realloc_size(2);
-#define kvrealloc_node_align(_p, _s, _a, _f, _n)	\
-	alloc_hooks(kvrealloc_node_align_noprof(_p, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _a, _f, _n))
+#if 0 /* kernel-doc */
+/**
+ * kvrealloc_node_align - reallocate memory; contents remain unchanged
+ * @p: object to reallocate memory for
+ * @size: the size to reallocate
+ * @align: desired alignment
+ * @flags: the flags for the page level allocator
+ * @nid: NUMA node id
+ *
+ * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
+ * and @p is not a %NULL pointer, the object pointed to is freed.
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
+ * initial memory allocation, every subsequent call to this API for the same
+ * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
+ * __GFP_ZERO is not fully honored by this API.
+ *
+ * In any case, the contents of the object pointed to are preserved up to the
+ * lesser of the new and old sizes.
+ *
+ * This function must not be called concurrently with itself or kvfree() for the
+ * same memory allocation.
+ *
+ * Return: pointer to the allocated memory or %NULL in case of error
+ */
+void *kvrealloc_node_align(const void *p, size_t size, unsigned long align, gfp_t flags, int nid);
+#endif
+#define kvrealloc_node_align(p, size, align, flags, nid)	\
+	alloc_hooks(kvrealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(size, __kmalloc_token(size)), align, flags, nid))
 #define kvrealloc_node(_p, _s, _f, _n)		kvrealloc_node_align(_p, _s, 1, _f, _n)
 #define kvrealloc(...)				kvrealloc_node(__VA_ARGS__, NUMA_NO_NODE)
 
diff --git a/mm/slub.c b/mm/slub.c
index ccb208cfbecd..dbc3c947e5be 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5310,17 +5310,6 @@ void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
 }
 EXPORT_SYMBOL(__kmalloc_noprof);
 
-/**
- * kmalloc_nolock - Allocate an object of given size from any context.
- * @size: size to allocate
- * @gfp_flags: GFP flags. Only __GFP_ACCOUNT, __GFP_ZERO, __GFP_NO_OBJ_EXT
- * allowed.
- * @node: node number of the target node.
- *
- * Return: pointer to the new object or NULL in case of error.
- * NULL does not mean EBUSY or EAGAIN. It means ENOMEM.
- * There is no reason to call it again and expect !NULL.
- */
 void *_kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_flags, int node)
 {
 	gfp_t alloc_gfp = __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
@@ -6717,44 +6706,6 @@ __do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags,
 	return ret;
 }
 
-/**
- * krealloc_node_align - reallocate memory. The contents will remain unchanged.
- * @p: object to reallocate memory for.
- * @new_size: how many bytes of memory are required.
- * @align: desired alignment.
- * @flags: the type of memory to allocate.
- * @nid: NUMA node or NUMA_NO_NODE
- *
- * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
- * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
- * initial memory allocation, every subsequent call to this API for the same
- * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
- * __GFP_ZERO is not fully honored by this API.
- *
- * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
- * size of an allocation (but not the exact size it was allocated with) and
- * hence implements the following semantics for shrinking and growing buffers
- * with __GFP_ZERO::
- *
- *           new             bucket
- *   0       size             size
- *   |--------|----------------|
- *   |  keep  |      zero      |
- *
- * Otherwise, the original allocation size 'orig_size' could be used to
- * precisely clear the requested size, and the new size will also be stored
- * as the new 'orig_size'.
- *
- * In any case, the contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.
- *
- * Return: pointer to the allocated memory or %NULL in case of error
- */
 void *krealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(new_size, token), unsigned long align,
 				 gfp_t flags, int nid)
 {
@@ -6797,28 +6748,6 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 	return flags;
 }
 
-/**
- * __kvmalloc_node - attempt to allocate physically contiguous memory, but upon
- * failure, fall back to non-contiguous (vmalloc) allocation.
- * @size: size of the request.
- * @b: which set of kmalloc buckets to allocate from.
- * @token: allocation token.
- * @align: desired alignment.
- * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
- * @node: numa node to allocate from
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * Uses kmalloc to get the memory but if the allocation fails then falls back
- * to the vmalloc allocator. Use kvfree for freeing the memory.
- *
- * GFP_NOWAIT and GFP_ATOMIC are supported, the __GFP_NORETRY modifier is not.
- * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
- * preferable to the vmalloc fallback, due to visible performance drawbacks.
- *
- * Return: pointer to the allocated memory of %NULL in case of failure
- */
 void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
 			     gfp_t flags, int node)
 {
@@ -6900,33 +6829,6 @@ void kvfree_sensitive(const void *addr, size_t len)
 }
 EXPORT_SYMBOL(kvfree_sensitive);
 
-/**
- * kvrealloc_node_align - reallocate memory; contents remain unchanged
- * @p: object to reallocate memory for
- * @size: the size to reallocate
- * @align: desired alignment
- * @flags: the flags for the page level allocator
- * @nid: NUMA node id
- *
- * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
- * and @p is not a %NULL pointer, the object pointed to is freed.
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
- * initial memory allocation, every subsequent call to this API for the same
- * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
- * __GFP_ZERO is not fully honored by this API.
- *
- * In any case, the contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.
- *
- * This function must not be called concurrently with itself or kvfree() for the
- * same memory allocation.
- *
- * Return: pointer to the allocated memory or %NULL in case of error
- */
 void *kvrealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(size, token), unsigned long align,
 				  gfp_t flags, int nid)
 {
-- 
2.54.0.545.g6539524ca2-goog


