Return-Path: <linux-kbuild+bounces-13154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJV6GXCgBWo1ZAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13154-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 12:14:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC475403B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 12:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABA4F301DF63
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 10:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113EB3A4F3F;
	Thu, 14 May 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNOUZxJy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C35357D1F;
	Thu, 14 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753615; cv=none; b=B6Ak4NmpJWH6PvTiZiNE9rX+NRPiyMfYTMtj7ePjxcxzWFxkDRCVSxgznxkT7DFJ6ZDxwlzYVHhS0NXloYHxS/eba7A97jCFIv9ETybwzva34iqedKlUbbaDh1PtEEM03MDDef4VFqp+QaK9A69ZR3qS1BdCPNpabUSke+qRiXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753615; c=relaxed/simple;
	bh=pyFB4ur/KVLGcKl/yLNGIfGo7BXMPQnbBHd8aTS1kt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcyBow3IBiEXO/NwysvtGv7Gd4RJVM77paNXMvT3L6uIGDDiwCdtbDq8g6yR7RHXiInLEE+RK1jht0ONCth5LXYSVyOHy6Ucp+qH5ClTurpXqqXaVC2ETHMSvUNIWnhj3br8xFsOjUgoeAooo5e3XKPwUW57eICe/ZVO9DWd/N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNOUZxJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0C1C2BCB8;
	Thu, 14 May 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753614;
	bh=pyFB4ur/KVLGcKl/yLNGIfGo7BXMPQnbBHd8aTS1kt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNOUZxJyCkN4NYFp1NdTxIviv6fdawFQatfOjrTjzUFG5RC8e2NCC0DV935mjzNBQ
	 TZei+awNzZKo3nMD8AykyxLwChCts8nwLKZedeUXLi9EWZLSYbqrVDRGEQL//xDNUg
	 M7PAyBJcV26zRYDU2OnWw+KdiSR14zuT1u7e1qLuWWZIRwSqo/1lUYf1xSVMs08VAI
	 qyP+RI/VF8ZJCPwSf/SO5cYTH+LIA1jHr90zhyMz+RG+khuUUCf3nmJ5B2JNQa89jd
	 b3LmwFwsbOnim/OouN+nFUdEVHG5o71G9ay1tAkaE1Kk6pEkGuU3m4oZ1d3YG5fx7F
	 bsazcJySO0Uyg==
Date: Thu, 14 May 2026 19:13:30 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Bill Wendling <morbo@google.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
	linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	GONG Ruiqi <gongruiqi1@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <gmzc5ul56yvsdgha4ly53zckhmhnbylak2rcxwxlerhkt2d5lm@gellfjmlzmr3>
References: <20260511200136.3201646-1-elver@google.com>
 <560a84ed-7daf-4a78-a314-b867c73bce22@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560a84ed-7daf-4a78-a314-b867c73bce22@kernel.org>
X-Rspamd-Queue-Id: 2AC475403B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13154-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,oracle.com,gmail.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com,lwn.net];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:01:26AM +0200, Vlastimil Babka (SUSE) wrote:
> Applied [1] to slab/for-next, thanks. That means including the kernel-doc
> workarounds in patch 3. I know Jon said someone might hate it, but maybe it
> will motivate them for creating a proper fix :) It seems better than leaving
> doc generation broken or not applying this series at all.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=slab/for-7.2/alloc_token
> 
> I did the following fixup to remove passing an unnecessary NULL argument for
> __kmalloc_nolock() with buckets enabled. Made bloat-o-meter happier a bit.

[...]

Looks reasonable to me, thanks!

-- 
Cheers,
Harry / Hyeonggon

