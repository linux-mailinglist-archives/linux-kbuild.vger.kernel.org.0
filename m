Return-Path: <linux-kbuild+bounces-10157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 134DCCCD08B
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 18:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13C73300DB9D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 17:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2FD2DEA9B;
	Thu, 18 Dec 2025 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CvAf7SCy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AFB257830
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080484; cv=none; b=RcydfhEnUaCO4d8Z5Hn828c3/FB3x36pl2+vqHbkwIk+NWZ5L3ByZVX58DhTh6FtAVmhcqpbYHB2p6IjYp8ZzR1uFJ4tVzuqIfUL2iQzv9D1HaYnQHhFtAlSIqLjmMX7cNwGXi+x0xzkl/ie8sWCPvEKMcU6F6WRZI2pMLcL27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080484; c=relaxed/simple;
	bh=BlQDc676DFnVF6OGF97FiYjC0Ujy2FI8SBN0U50Q4qI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WCjBx304+iX5yohm/OgIvIMsFEpeRZM81fadaAWzKl23XSefVOuEva04HrjVFuWwg+xVWWw/WIfJ8Ar47cj3BCDJUSwuteu1L8lV8P03oJoFKWI21UFR55blCU2TCr3k5sYDFzriopfvCum4PSxBi4LFlAr8OSQDI8iw7WZn0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CvAf7SCy; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <914f4a97-f053-4979-b63a-9b7a7f72369a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766080480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwIbyE2OIjwa5Pd/qUk27uqrSWv5qGUPTN23vG586Hs=;
	b=CvAf7SCy+fRbUb6yHAXH6qzFLDgRc1cws58QAMCNN+woKBE4uNIlxLRJeleWIw8waMVTXF
	hQavKFA2ihbxYvP5rX2ScxczSozHtMeLFkMIghTRYJ4K/68TnsO9fJZgolpxbFJmW2Zns/
	HHmWfJO/kKGlMbyIafxKXUe9UDZeArE=
Date: Thu, 18 Dec 2025 09:54:20 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 8/8] resolve_btfids: Change in-place update
 with raw binary output
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alan Maguire <alan.maguire@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko <andrii@kernel.org>, Bill Wendling <morbo@google.com>,
 Changwoo Min <changwoo@igalia.com>, Daniel Borkmann <daniel@iogearbox.net>,
 David Vernet <void@manifault.com>, Donglin Peng <dolinux.peng@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nicolas Schier <nsc@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev
References: <20251218003314.260269-1-ihor.solodrai@linux.dev>
 <20251218003314.260269-9-ihor.solodrai@linux.dev>
Content-Language: en-US
In-Reply-To: <20251218003314.260269-9-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/17/25 4:33 PM, Ihor Solodrai wrote:
> [...]
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index 840a55de42da..b8569d450ed9 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -1,5 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +gen-btf-y				=
> +gen-btf-$(CONFIG_DEBUG_INFO_BTF)	= $(srctree)/scripts/gen-btf.sh
> +
> +export GEN_BTF := $(gen-btf-y)
> +

Ugh... GEN_BTF is not used anywhere in v4.
Looks like I forgot a `git add` at some point.

I'll wait a bit before sending a v5, in case there is more feedback.

>  pahole-ver := $(CONFIG_PAHOLE_VERSION)
>  pahole-flags-y :=
>  
> @@ -18,13 +23,15 @@ pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=enc
>  
>  pahole-flags-$(call test-ge, $(pahole-ver), 130) += --btf_features=attributes
>  
> -ifneq ($(KBUILD_EXTMOD),)
> -module-pahole-flags-$(call test-ge, $(pahole-ver), 128) += --btf_features=distilled_base
> -endif
> -
>  endif
>  
>  [...]

