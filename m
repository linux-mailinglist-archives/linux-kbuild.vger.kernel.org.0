Return-Path: <linux-kbuild+bounces-12617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JjEDRWjzmlZpAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12617-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 19:10:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC138C65F
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 19:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B765030CA93B
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 17:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBA93DC4BE;
	Thu,  2 Apr 2026 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjLk+B+S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2D3D904B
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149544; cv=none; b=m4FwcI82MHazqFYoxweX9C8ZD+Z8DKn9Dx71+u0Ii67sJCy2h5cQFnhZ2JNaMM+615nGwivnGHmPb1k7DXVcyjyiCIufC3koNyXrDsD9mOkJRWNPRcPyE5DC3oMinSLqcKrA+uPihWyDG5+2YoIjffXSSEjKHDJk/VBUwL9tDbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149544; c=relaxed/simple;
	bh=Zo8OAngOh0P8c1OR78bqc8BgST7jOqfQbaCLKvgsal8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGy8kNffJl4PfBXRoarvXvrHPwNjpgDp/mlmqNBwiQTpq5vM9RoKIHLgmfTwFIsmB3WFUtAUHC6LvnPSq2L4ObCwX9ZYHpfpKrD/tE0X4UwkU50OTWreAqQsnKW2bIpQKk4g2DG4c8k5w6p5ZeLwlIx6ia7vZAL9MaAFEam9KJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjLk+B+S; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so8439415e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149534; x=1775754334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=WjLk+B+SlJ46EL88K6CreuBSgDMyUHEBeWLKd2Bi+PUN/iHaMS6QtCdarA0ZfH+Zrq
         Srrl1ifH5TtI7OMW3xrj0qN6E4VndG5nokYMSN1eYIZcJ8jkvuPJNdNKGhB3z5O/TrR8
         ii9DG3rPWF0mIBkR4PqjXOw5HwYEBlF3zfafHabMyjCSYh3eAasYrx/8+u6SR60lJZPY
         WKWC5aNcthE83iUpuHi6baRXcT6iBxFfaXSyIayqtSBZlDKLWowZwYcirMS1p/MrgBN4
         TlavIYBFG/nTd2AtAp2bHVTvVAFcDB9Yq9AiD/4XLqRpRCp7TqBtHGCVo7QqHxvdZXs7
         IgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149534; x=1775754334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJ96XmrvwmNmdc1Ry2/PJXAWh8krLD6ljIYp6nVbJmg=;
        b=Pehss84VkqV25EKjEoAw+KBOsKI9POvCGBZOMyTbgBiKkpQPmjFFp5906WU6ALhN8t
         mRgDKPDS13BUa1Os7DQmudhf5hT/sBruL+vwCwZfraaksy4n/4Rt0azuzs+fEwoWCRu9
         TT95gPYa/iENBFhCM7I7nkpwf3dBhmfYpcu9CAQ+i7jUj63vAAx0786Dok6CCY/+Wy4D
         UYt9UeXOYGghcueWGLQdzXcCy/kjvAGWxcCB63f0RnAnoSoy7pqor9FRml07OFDBVubM
         lw0wXo607kUnrQlK1jh06HYXJ5Uo2K+zPUdfR0Lu3Rt8hmDe3bBhXgBrqeMV73MDCd5z
         hqUw==
X-Forwarded-Encrypted: i=1; AJvYcCX8r/s20x05OflNdiY/d+Mm/Nb8LCg1IuV7s3cq8lQx+N/VndxjapndrbguLucUECZ31Aae7ykMlNV/G6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iXJuiaZY711VlKVjlPFzVQPkO1sKwc6CVjwgV7m56pcC6xWT
	4Mr6TPqQx8XwhLRKyKHKTA5DUVttSZZS79Jejbi1ozAzxfHX+V3INToC
X-Gm-Gg: ATEYQzwjp8PHwG7Y55gyR5RyikgitBKu666FGQflDZ1WoQsQh0yyzfMY09OdjwnoG4h
	Zt8HIOtXzNSt/M/1e93NIwp9CYxwNn+gSwdHZQRkgAdewt6eBmuV3Ma9thprnUCOZzsMCqaJ/VK
	nFlas7Sh1do4UWEsJoBrIDUjR+pykMLsqwYRRYdKtMbHG3JLXz+w/f6zW/k6CIDTPZXKU24jFTx
	nOyQtW6Cg52dgLtUB6TQj3CiyigdaPODcNB8ZIgMe7WV9KXS926GMttr95ypm45kdz3NFaqE1TB
	eqLB0lN2IIyA7yOrX+vKUISYhESiUkVpA3IQc4YmOW6Rnfbck1d0XRTWuc8HliVXAl9Xs6LDCay
	odb9y2Jocp6GETKb3lpBqSS5yZnmcXwcTC71+R9bUU18qI62dTi5fZNPFR2+duqL5Di8jAA/X2Q
	lhic67JwJ0sKjt9SoLUgE=
X-Received: by 2002:a05:600c:3b0a:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-4888e09ba82mr46503895e9.10.1775149534150;
        Thu, 02 Apr 2026 10:05:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm265992305e9.3.2026.04.02.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:05:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 20:05:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
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
Message-ID: <ac6h2jF-KJ5pm1WM@stanley.mountain>
References: <20260331111240.153913-1-elver@google.com>
 <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12617-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux-foundation.org,intel.com,kvack.org,oracle.com,linux.dev,google.com,suse.com,gmail.com,vger.kernel.org,googlegroups.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-scm.com:url,intel.com:email]
X-Rspamd-Queue-Id: 3CBC138C65F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> >
> > Hi Marco,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > config: um-randconfig-r072-20260401
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > smatch: v0.5.0-9004-gb810ac53
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> >
> > New smatch warnings:
> > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> 
> How is this related to the patch I sent? Did the <linux/slab.h> change
> force rechecking of all these files and it found latent issues?
> 

Oh, crud.  It turns out that for this check Smatch allows
integer_array[sizeof()]so long as we know that the index is within
bounds.  What happened is that your patch renamed the kmalloc()
function so Smatch stopped knowing the size of the buffer.

For these zero day bot warnings, the emails are automatically generated
so I don't have any context outside what's in the email.  I saw that
Kees wrote the code, but I figured maybe you forwarded it or something.
Sorry about that.

regards,
dan carpenter


