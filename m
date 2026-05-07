Return-Path: <linux-kbuild+bounces-13058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHeNCe1e/Gm7OwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13058-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:44:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941134E632D
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 11:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45B2C3046CEC
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DA73BF685;
	Thu,  7 May 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyO8gvHl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCCC39EF27;
	Thu,  7 May 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146733; cv=none; b=M9FxZqxW9g5dsqjhNgeginkdfVGEtUhi1xeULBxl7FADcc1oSvE3UPVsw/cNcTq01vC7LUvaT3p5D5T4oU+hqJE93rKssskEQ9BjUMMfhzl8/+oCNOdL4+JGqzZq8Wd5H6U18+JpGjeLHj/zkn1zhoS2g1Iy892qAgDZlcenl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146733; c=relaxed/simple;
	bh=DeehgTNF5Iahk7h3I13ggfT+xXDlph1I0HFCnVNDg0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew5yOfeHLVZSlEqxhsRFgvnJJ0kUoV7ZptnI3NnUTCOVtBtF5fW+gkhk0ethLnXHaBV/qDr9GdmHPfyGIpN6/avptxaGMl9Fw/PeVIPwlUNAqVuUeQ2b4uJx10CKSWipfW+ERtI154JW2yreeZC9fifxJlkolcFKthZ6DfkIOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyO8gvHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFC9C2BCB2;
	Thu,  7 May 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778146733;
	bh=DeehgTNF5Iahk7h3I13ggfT+xXDlph1I0HFCnVNDg0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyO8gvHlTYz5Ac3kAslP2rYTLBXXjZBXfAg33vMz43SMC73uGVpdjA7lqedr4NbZS
	 r4++aofHVyBihvJdp4Ii6SozxNddx4pbxHH/H5S66/G06kMHKw3BmnBO12S8t41QNT
	 zbOCDErsoabOWxotbveYBwdayaw1VLGyYwMYsXwFRh0pmQVV2TRvS1QKRBgYQqlrTC
	 BK447mA28HbOjWW6piRRG0Q7sfGLGC+m7J+JRqObbZizbiwjc1sH5W3jpNSM/m2o5L
	 IZyp3aaYELVPdN50gxcjZiUr6jEwr8U6T6k5E5+60ZhibIwXnoDZS5mgWDHiSImqCG
	 bEYnJFheuItMg==
Date: Thu, 7 May 2026 17:38:43 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <20260507093843.GA1826581@ax162>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
 <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
X-Rspamd-Queue-Id: 941134E632D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13058-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gnu.org:url]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 03:03:27PM +0200, Marco Elver wrote:
> Bah, this is why it doesn't work:
> 
> >> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
>      272 |                         drm_exec_retry_on_contention(&exec);
>          |                         ^
>    include/drm/drm_exec.h:123:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
>      123 |                         goto *__drm_exec_retry_ptr;             \
>          |                         ^
>    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of
> indirect goto statement
>      304 |                 state->bos = kcalloc(submit->nr_bos,
>          |                              ^
>    include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
>     1173 | #define kcalloc(n, size, flags)         kmalloc_array(n,
> size, (flags) | __GFP_ZERO)
>          |                                         ^
>    include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
>     1133 | #define kmalloc_array(...)
> alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
>          |                                                             ^
>    include/linux/slab.h:1132:71: note: expanded from macro
> 'kmalloc_array_noprof'
>     1132 | #define kmalloc_array_noprof(...)
> _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>          |
>                        ^
>    include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
>      506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
>          |                                                       ^
>    include/linux/instruction_pointer.h:10:41: note: expanded from
> macro '_THIS_IP_'
>       10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
> long)&&__here; })
>          |                                         ^
>    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement
> expression
> 
> 
> Apparently using _THIS_IP_ creates a possible indirect jump target,
> but because it's in a statement expression, it's invalid, so the
> compiler complains. This is obviously nonsense, because the actual
> indirect jump in this gpu driver code would never jump to the
> _THIS_IP_ __here label, but that's what it is.
> 
> Given this pre-existing issue, we probably need to continue using
> _RET_IP_, as before. I tried to fix _THIS_IP_, but it's incredibly
> brittle (e.g. __always_inline function returning address of label
> doesn't work on Clang, but would on GCC).

For what it's worth, both LLVM and GCC consider the generic version of
_THIS_IP_ to be broken (even if it works currently), as the address of a
label is only expected to be used with a computed goto (hence the clang
error above, it just looks for possible computed goto targets):

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44298
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
  https://github.com/llvm/llvm-project/issues/138272

-- 
Cheers,
Nathan

