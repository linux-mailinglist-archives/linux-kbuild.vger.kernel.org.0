Return-Path: <linux-kbuild+bounces-13151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIXoLJl1BWrAXQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13151-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 09:11:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95253EC15
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 09:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0E96301CA47
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 07:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3933D75A4;
	Thu, 14 May 2026 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQVK+8Na"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64161ACEDF;
	Thu, 14 May 2026 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742648; cv=none; b=iw4Fye6Wm8z3yFAZRxW3M2R0PLO4A+xXVi2eCzJ3aaI+XB7h0ArfpsKpWeAvNlLQZ6E57KBg7NnD4W0GjsyGLp58GCZ3ri+de82Ao1qip/xD1t0GtHUp3XD5JQzd6CeTcYCYR62Pl1qqyT8yNkXrC96NMCv1juJ0FYp16w4iem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742648; c=relaxed/simple;
	bh=Dovb0ZSp5Q9c9EM9Cxe4xd9/THMwZyNDud2+qF48IrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHaNO73WR9aetFd26V91KnFMeglwjR8aSsWKxJm7f1hyB1DpAQpbnl4d/jg5aqT6psM06qxTb9BeE3iJoDyhOGO19j/PmE6cLxHeFzqeLfo7tXIixBLkEuGxNFLC02XZjquetPRP67Wi1QNC8kBPJAy+lcR0369O3vOHfkY1oXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQVK+8Na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4842C2BCB7;
	Thu, 14 May 2026 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742648;
	bh=Dovb0ZSp5Q9c9EM9Cxe4xd9/THMwZyNDud2+qF48IrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VQVK+8NamiDvmyWVPlvIE8KFbcc/zLvTxDHq8r4VS/uKjoZWsZArHZLG9uOnRCM8M
	 +tbbV30upsQiO+lvzN1Wa3dfumk1WBVMNhOe4t0C8j7+v+u7D0SgLwFggRMnY+Ppv4
	 j78PP3E0Wi8fN8eDISSNXzxB5NC8dwHs50RV6kThwJQ5FOUjKXNnx8wNGWBgdpuXpF
	 CphgWuxoVP3uLKepFyEloksmre1TXKynCpqd33tVXorTfKlNqLzLpmT8g/E1obRlT3
	 YGWVC5cHC+NQXI9ZzE4HWAGtYSevT6+hZ8DH3+yYVkzICVM7Fpkgn2/9bHiXtyXmLc
	 QG0GlOd2L4C3A==
Message-ID: <1f68fc67-66d8-4db0-8ddb-44737d7ea37e@kernel.org>
Date: Thu, 14 May 2026 09:10:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
 Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>,
 Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
 <afc2202a-2e0b-43e0-9556-06be2da33c83@kernel.org>
 <CANpmjNN0-b0TG2=7SsPpRuubwTWYfoAiYgnnM_5-39SoVfv=Pw@mail.gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <CANpmjNN0-b0TG2=7SsPpRuubwTWYfoAiYgnnM_5-39SoVfv=Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1B95253EC15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13151-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/12/26 14:54, Marco Elver wrote:
> On Tue, 12 May 2026 at 12:37, 'Vlastimil Babka (SUSE)' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
>> On 5/11/26 22:00, Marco Elver wrote:
>> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
>> > to identify the allocation site. _RET_IP_, however, evaluates to the
>> > caller's parent's instruction pointer rather than the actual allocation
>> > site; this would lead to collisions where a function performs multiple
>> > allocations.
>> >
>> > With the generalization to kmalloc_token_t, we now generate the token at
>> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
>>
>> Hm but it means in patch 1 we make things even worse and then fix them
>> again, and also improve what was suboptimal prior to the series.
>> Would it be instead possible to reorder patches 1 and 2 so we improve the
>> current state first, and then introduce typed partitioning without any
>> changes to the randomized one? (aside from changing the previously correcly
>> used cases _RET_IP_ to _CODE_LOCATION_).
> 
> It won't work (it could be made to work if _THIS_IP_ wasn't broken).
> The compiler is supposed to maintain semantics of a static variable in
> a function, even inline functions, and refer to the same static
> variable -- and because kmalloc_type is an inline function, if
> _CODE_LOCATION_ is the non-_THIS_IP_ version, it'd break.

Oh, I see.

> Even if _THIS_IP_ wasn't broken, the other complication is introducing
> the slab.c vs. outside use of kmalloc_type differentiation.
> 
> Both these problems go away if we make this patch 2 (using
> _CODE_LOCATION_ on the outer macro, not in an inline function).
> 
> While I understand that maybe we could have considered this as a
> stable backport, I think it's borderline; the feature isn't broken
> per-se, just slightly lower randomness than perhaps intended if size
> is a constant expression. A minimal fix prior to the macro rework
> currently eludes me.

Fair enough. I wanted to avoid a bisection hazard, but since it's not
feasible and it shouldn't actually break anything (compilation, run), it's
acceptable. Thanks.

