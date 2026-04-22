Return-Path: <linux-kbuild+bounces-12861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u/8pFF5g6WkfYQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12861-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2026 01:57:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A131544BDF6
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2026 01:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9DC9303D719
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 23:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D073603EC;
	Wed, 22 Apr 2026 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNFB+xdW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1232692B;
	Wed, 22 Apr 2026 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776902234; cv=none; b=Tj44MRsjmDqd38oX9PIVyOP2zc5mprkC34o1LEK6sYZr5D694X1GR/znzWsUHrGrJsrE+pISO8kErtMEuEP3n6bX+xXyRgZYJRaD9Y9Xp65t3gY9UCKZVcSy6JRFkMMW6+GXVgMiapS8B7Qii+EWarAhveniz+7dOqhk/UFNK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776902234; c=relaxed/simple;
	bh=h6ggrtCedybWSPNMwswG0DZDcNwcm7cnvs/LOyD/wNQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Y+xNKaq0Fo4jcp1l+xRvyR5jD/mzr8WSdmv7Lf8/NjrQI+9Nu26gdELaEab7NGmoVfLV4Bf65P5nmvw2zyvHgce7f3l29C291eX3ulH8IzjcQatU1g+klQCjbvQDsDjpTj+fF5Zoz3OUtUsdy+DcpDjYWOtKFzpunMCY5YV+t1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNFB+xdW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDB8C19425;
	Wed, 22 Apr 2026 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776902233;
	bh=h6ggrtCedybWSPNMwswG0DZDcNwcm7cnvs/LOyD/wNQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mNFB+xdWLZKpCxXZm4/ECJ7c866xDmRQuYKee2ZmooLdAboj4IF919Yq3Iw0bINsX
	 RA4s2JA6QITi2C8+PeIS8/KussEZgcuvkC/xnNNHlYcTPzfY/A3b0ztWYGAPRFwI7q
	 dFrML80TrDtSrx81rSV0kIXhdCtQo7zA0q26ALnYgDR5M/YJ++seIkDSgNLESZuZoO
	 x0ElHg5+r32UBFskPnb1kuB1/kBSU2lIvB4V/c0IfQCt5g8Tm+EL2o7hCU8m71CPuJ
	 558uJ+lGCcjFbOFFld46ZXtKgYDBP2LW5O7Tcc5SS8XOXouVemuXDANtK9uPhHYsdE
	 QBLGa3JPbkmZQ==
Date: Wed, 22 Apr 2026 16:57:11 -0700
From: Kees Cook <kees@kernel.org>
To: Marco Elver <elver@google.com>
CC: Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 Andrey Konovalov <andreyknvl@gmail.com>, Florent Revest <revest@google.com>,
 Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>,
 Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_slab=3A_support_for_compiler-?=
 =?US-ASCII?Q?assisted_type-based_slab_cache_partitioning?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aejopk23CsntyFOB@elver.google.com>
References: <20260415143735.2974230-1-elver@google.com> <202604210954.84C57E5E0@keescook> <CANpmjNO8CcR56LXAQf4GQhGcbU4MQkRCa7gVvwuAfvVrzEUhQg@mail.gmail.com> <aejopk23CsntyFOB@elver.google.com>
Message-ID: <D3E316B3-9909-408E-85BF-647383810CFF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12861-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A131544BDF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On April 22, 2026 8:26:30 AM PDT, Marco Elver <elver@google=2Ecom> wrote:
>On Tue, Apr 21, 2026 at 09:13PM +0200, Marco Elver wrote:
>[=2E=2E=2E]
>> > And actually, perhaps a global rename of the options so the selection
>> > naming is at the end of the CONFIG phrase, and bundle the on/off into
>> > the choice:
>> >
>> >
>> > choice
>> >         prompt "Partitioned slab cache mode"
>> >         depends on PARTITION_KMALLOC_CACHES
>> >         default KMALLOC_PARTITION_TYPED if !SLUB_TINY && CC_HAS_ALLOC=
_TOKEN
>> >         default KMALLOC_PARTITION_RANDOM if !SLUB_TINY
>> >         default KMALLOC_PARTITION_NONE
>> >
>> > config KMALLOC_PARTITION_NONE
>> > =2E=2E=2E
>> > config KMALLOC_PARTITION_RANDOM
>> >         depends on !SLUB_TINY
>> > =2E=2E=2E
>> > config KMALLOC_PARTITION_TYPED
>> >         depends on !SLUB_TINY && CC_HAS_ALLOC_TOKEN
>>=20
>> There was a comment somewhere else that even introducing
>> PARTITION_KMALLOC_CACHES might confuse users of RANDOM_KMALLOC_CACHES=
=2E
>> I think completely getting rid of and renaming RANDOM_KMALLOC_CACHES
>> has marginal benefit, and will cause friction for existing users (even
>> moreso than already)=2E I see little benefit here, and would prefer not
>> to break user configs more than needed: configs that already set
>> RANDOM_KMALLOC_CACHES, upon rebuild will be prompted to enable
>> PARTITION_KMALLOC_CACHES; if user says Y, then their previous
>> selection (RANDOM) would already be picked and they don't have to
>> rediscover that it exists under a new name=2E
>>=20
>> I can make this change, but only if you're sure the benefit outweighs
>> the downsides here=2E
>
>Upon further reflection, since the transition isn't smooth anyway, I'm
>probably going to rename, but have them all use the PARTITION_KMALLOC_*
>prefix so it's easy to just search for "CONFIG_PARTITION_KMALLOC_"=2E I
>don't see the need for a "NONE" variant - I've seen this pattern
>elsewhere, and then you end up with users reading the =2Econfig and
>concluding "CONFIG_PARTITION_KMALLOC_CACHES is enabled =2E=2E=2E but oh n=
ever
>mind actually it isn't" which I find confusing=2E This could be useful if
>we had a dynamic on/off toggle and the default is NONE, but that's not
>the case here=2E

There is now the "transitional" Kconfig keyword too, which should make it =
easy to move to the new name=2E

For the naming, I tend to prefer the noun-verb (e=2Eg=2E timer_start()) an=
d noun-feature-option ordering (e=2Eg=2E CONFIG_SLAB_FREELIST_RANDOM)=2E Th=
is feature isn't about partition tables, so I don't think the first word sh=
ould be "partition"=2E :)

As far as doing the full isolation later, yeah, that's fine, and I think w=
ith this Kconfig change it's easy to add a new mode=2E

-Kees

--=20
Kees Cook

