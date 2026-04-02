Return-Path: <linux-kbuild+bounces-12603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP0xCYdyzmnxngYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12603-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:43:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D32389EF4
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73ABD311D838
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 13:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6230C629;
	Thu,  2 Apr 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuJMJHcR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC68306D26
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136835; cv=none; b=sEhyqb4hADw+bYn5JmYZbR4EDel9fQjAnyf4LSMEeAuDvfzCraEMlXa/KdbClQWzJPXmz2oRRout+Uqz6ZR71olRKCZyK9u/kfXwX93Olo+4o7OBdcdWWem9m+B9jH2GHueeCLw/oOdheJGBtuVUGWmGV1wXp7rLDy2etjcBfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136835; c=relaxed/simple;
	bh=BEuCODLD7L2Gr9nSTgbr2vWZbdp1MrbMysFDem9efWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=olosJ1pYzrvfiicRwzH4HdeKqD8lmcQiY6mHkkC4oJFztEQWsgxOfVO0efU/NmNO204Guc+8JTH6eCmLFH2HXxJkfcHWcpRK6sW4WUk1DkagHh8EPsow2nrJXKYLQL0NMy3f3KxP71xfWQIipgaKboKW/RqmDT0HpH7iLhqjAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuJMJHcR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so8142375e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775136832; x=1775741632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/ghRRxP3FMGglHabI5ZvihnJdFMETatS4X2cm71uB4=;
        b=YuJMJHcRECs2ufSktd3U9SvHcGRhuTmqsiq/I1Bh6PmeTue3Ja4D34IZEblbZlEO1b
         AqPV7edCNWgBVYfl7dFj6STtVHzCaOlbteRy7bJx54jBWsSqlT+dD0KCncxRqwPYIlan
         LaS3CBg3c+o1YySCIGR/vQcuH6g+JMTIV/OM8m4RaBYRUbqmvftbMmkbsX9gJiczB3Eg
         hVw/7VIqxDRT+XLSQZ9xT4NwZH0omqBlutNVJtqnsGNlE90ogCan6Jz5Vcl160eEVf2r
         3/roeRtB436cM/4UuztxRzt+51t9BHPjOy5M+lZ2QwKSehVxVsVFRC5n3qn2KYPhZijL
         4tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136832; x=1775741632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/ghRRxP3FMGglHabI5ZvihnJdFMETatS4X2cm71uB4=;
        b=OGcBDvb9UypnyQ2YohT0vSQcCHysHkVh8mjkDC+JFdu6UG+upjAl5Hj6k118eJGtdD
         Y7rc0pisaeVvc7O8ZpxKXJVoZblsMsuykSF63j5tve1hjHgbZzEaQLRr5djgZkttdxvu
         1KI6KVKV6afShB5/b0HWHIfDXCnhv9BiuO3hnW5WARKBkHquKR9YXtAi0UKqaEeKC8cE
         mcWCAJeZpHGTTT0BwGk4uSAyr37ADuZ+P9NIFWIBsyLkiMssDdilP1UPcaXxCbAg7dts
         8USNJ6cJL8YWbwuNmSPH+3kQ01S0St2Wvz47z9AVZ8JdX2J+K4W6zdSoqqxSBctlWbLQ
         hXiA==
X-Forwarded-Encrypted: i=1; AJvYcCWo/fujRWogNtBHva3GqTiVCHW9rxnXOJxIPo/tA1JTWxI+l0sVClKc/vlabRfloOJPHLVLb5CZD2QEJ18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8Rupr4usL+XdnjA5r0jInBlzorqyjQojPUbwH5NWslWPf20o
	4sc+7xYvMNMgackwKhixfvTO5KCnBifOVD/vnsrxQgWCTFZb9rYpC9Xe
X-Gm-Gg: ATEYQzx8g/6bjIeVYjA3guSDiaZ2L9gYkpjTHdLpsAseSDkPvgL4gAJQLIcM5L57XFT
	e1Vk1K4BNmCWLa1AQNfbX+DsnjmQmwLu/8gLTdvDg0jp5Sh9VWpqPLTX25dtHlaMkOZX1P8Y1+p
	y88KOzsEP2BMJHbpacMCDlDKi9tsLpSmrTcNE8uNNNod3cdZhMByoFDGm1ORejXMoaeiDQKG7UO
	BU+D1DOsAcW/3b48YuXlQ/ZzuDwybV2CoWvqKg2dk82TO3qP4pn1sk2kOs47G8FAu6vYiETXfQQ
	ZXPZZffIiHUvTyA30mjol2FliDg+G0mDyS0a8IYUf4xXEy6kSLLMLf4RzGXQXak4rS42NklYo8K
	wZiA7R+deqXl90iqedVUqtjh1UGzAXRAg0zRUXSX/qvP6JVaD2Nj08AphHaG1bu2m42Wah5wfHy
	5tS7whLBRCVPB0euyAJcs=
X-Received: by 2002:a05:600c:8708:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888b6d4fdemr60136085e9.3.1775136831571;
        Thu, 02 Apr 2026 06:33:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm67605425e9.5.2026.04.02.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:33:51 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:33:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Marco Elver <elver@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
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
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <202604020400.jEq32K95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331111240.153913-1-elver@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12603-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[intel.com,lists.linux.dev,kvack.org,kernel.org,linux-foundation.org,oracle.com,linux.dev,google.com,suse.com,gmail.com,vger.kernel.org,googlegroups.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:mid,git-scm.com:url]
X-Rspamd-Queue-Id: A0D32389EF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marco,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
config: um-randconfig-r072-20260401
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/

New smatch warnings:
drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)

vim +118 drivers/misc/lkdtm/heap.c

73f62e60d80c2d drivers/misc/lkdtm/heap.c Kees Cook    2022-03-03   92  static void lkdtm_READ_AFTER_FREE(void)
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   93  {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   94  	int *base, *val, saw;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   95  	size_t len = 1024;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   96  	/*
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   97  	 * The slub allocator will use the either the first word or
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   98  	 * the middle of the allocation to store the free pointer,
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   99  	 * depending on configurations. Store in the second word to
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  100  	 * avoid running into the freelist.
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  101  	 */
e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  102  	size_t offset = sizeof(*base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  103  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  104  	base = kmalloc(len, GFP_KERNEL);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  105  	if (!base) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  106  		pr_info("Unable to allocate base memory.\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  107  		return;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  108  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  109  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  110  	val = kmalloc(len, GFP_KERNEL);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  111  	if (!val) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  112  		pr_info("Unable to allocate val memory.\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  113  		kfree(base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  114  		return;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  115  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  116  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  117  	*val = 0x12345678;
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26 @118  	base[offset] = *val;

This doesn't really matter, but the comment says we are writing to the
second word.  The base[] array holds 256 integers, so:

	base[sizeof(int)] = *val;

would be the third word, right?  A word is unsigned long, right?  All
of a sudden I am unsure.  :P

ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  119  	pr_info("Value in memory before free: %x\n", base[offset]);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  120  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  121  	kfree(base);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  122  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  123  	pr_info("Attempting bad read from freed memory\n");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  124  	saw = base[offset];
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  125  	if (saw != *val) {
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  126  		/* Good! Poisoning happened, so declare a win. */
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  127  		pr_info("Memory correctly poisoned (%x)\n", saw);
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  128  	} else {
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  129  		pr_err("FAIL: Memory was not poisoned!\n");
5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  130  		pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  131  	}
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  132  
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  133  	kfree(val);
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  134  }
ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  135  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  136  static void lkdtm_KFENCE_READ_AFTER_FREE(void)
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  137  {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  138  	int *base, val, saw;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  139  	unsigned long timeout, resched_after;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  140  	size_t len = 1024;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  141  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  142  	 * The slub allocator will use the either the first word or
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  143  	 * the middle of the allocation to store the free pointer,
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  144  	 * depending on configurations. Store in the second word to
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  145  	 * avoid running into the freelist.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  146  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  147  	size_t offset = sizeof(*base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  148  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  149  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  150  	 * 100x the sample interval should be more than enough to ensure we get
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  151  	 * a KFENCE allocation eventually.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  152  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  153  	timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  154  	/*
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  155  	 * Especially for non-preemption kernels, ensure the allocation-gate
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  156  	 * timer can catch up: after @resched_after, every failed allocation
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  157  	 * attempt yields, to ensure the allocation-gate timer is scheduled.
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  158  	 */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  159  	resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  160  	do {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  161  		base = kmalloc(len, GFP_KERNEL);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  162  		if (!base) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  163  			pr_err("FAIL: Unable to allocate kfence memory!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  164  			return;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  165  		}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  166  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  167  		if (is_kfence_address(base)) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  168  			val = 0x12345678;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29 @169  			base[offset] = val;
                                                                                        ^^^^^^^^^^^^^^^^^^
Same here.

aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  170  			pr_info("Value in memory before free: %x\n", base[offset]);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  171  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  172  			kfree(base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  173  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  174  			pr_info("Attempting bad read from freed memory\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  175  			saw = base[offset];
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  176  			if (saw != val) {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  177  				/* Good! Poisoning happened, so declare a win. */
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  178  				pr_info("Memory correctly poisoned (%x)\n", saw);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  179  			} else {
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  180  				pr_err("FAIL: Memory was not poisoned!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  181  				pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  182  			}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  183  			return;
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  184  		}
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  185  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  186  		kfree(base);
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  187  		if (time_after(jiffies, resched_after))
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  188  			cond_resched();
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  189  	} while (time_before(jiffies, timeout));
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  190  
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  191  	pr_err("FAIL: kfence memory never allocated!\n");
aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  192  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


