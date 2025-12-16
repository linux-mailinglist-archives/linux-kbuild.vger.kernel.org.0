Return-Path: <linux-kbuild+bounces-10122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07CCC51D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 21:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E073F3032131
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 20:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518772DEA87;
	Tue, 16 Dec 2025 20:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EOSBR9jD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3BE272E54
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765917732; cv=none; b=AZaUs9Eu3+ylNdQpcNOk4LYyW25koCRbvyUNnbeufF4Tcdn+7fsoExmT9FhoEKAPkzr7ZZDe63x0WwTtj9sejYSU1WIEGeWURvl1sErKlL4y8YzL1iXcAIa26/A5rd7vapbm7DhXZATMUXlOu42j95JCW5k4Bov3UJ0k+s19+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765917732; c=relaxed/simple;
	bh=kYRZPQVIXaPZPvBqjFrVHSe3OQvXSms9kx6HAz+Sc6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fj9R0LcusShMTKwaCmwytGU2DGEcmCNSDSYKHVfLRGRSRkfkFlzqau1yMbgnW2XMUcxeL2nOymAN2JLu0LixTzs5Rg9SlStVqYg//lOjD5b5v6NWl4BzxG+fVNjP+otdf8W9l4rJWqYcsS/+eP0Dv5Nqqw6jYBkS17A1qkEB494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EOSBR9jD; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <cecb6351-ea9a-4f8a-863a-82c9ef02f012@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765917714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NI/FBGNehU9YUSYgyB/T6XjjzQJetB/bgxtbGtuRsyA=;
	b=EOSBR9jDAYi3b1D0UmXpcjapzKWvFni01k2gkpJj7cMWZ5nKYil9hpl5OoaBz8zFEiJ6Pu
	FficCWLudBTHev9OhiQRCHRtdJD0My8wh2lpkccQ+0NAJGbkW5zDVSrXoMQJPlKnCJqNIp
	mQpWb8uvFo6YjSIG5D406m+IA6x0XIg=
Date: Tue, 16 Dec 2025 12:41:44 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 4/4] resolve_btfids: change in-place update
 with raw binary output
To: kernel test robot <lkp@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng <dolinux.peng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
 dwarves@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20251127185242.3954132-5-ihor.solodrai@linux.dev>
 <202512061213.85NHVN2W-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <202512061213.85NHVN2W-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/5/25 9:08 PM, kernel test robot wrote:
> Hi Ihor,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/resolve_btfids-rename-object-btf-field-to-btf_path/20251128-025645
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20251127185242.3954132-5-ihor.solodrai%40linux.dev
> patch subject: [PATCH bpf-next v2 4/4] resolve_btfids: change in-place update with raw binary output
> config: arm64-randconfig-004-20251205 (https://download.01.org/0day-ci/archive/20251206/202512061213.85NHVN2W-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061213.85NHVN2W-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512061213.85NHVN2W-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: .tmp_vmlinux1.btf.o is incompatible with aarch64elf
> 

I was able to reproduce this error.

It happens only when cross-compiling with LLVM (which we don't do on
BPF CI, btw) because of this line in gen-btf.sh:

	echo "" | ${CC} -c -x c -o ${btf_data} -

The purpose of this command is to produce an "empty" linkable ELF
file. The .BTF section is objcopied into it, and then it's linked
into the vmlinux.

Before the changes in this patch, the "empty" ELF was produced with
objcopy --strip-all on .tmp_vmlinux1, which is a slower operation.

ld.lld fails, because ${CC} without the flags is just clang in this
case, and it emits an ELF for host arch, which of course can't be
linked. It can be fixed with:

	echo "" | ${CC} ${CLANG_FLAGS} -c -x c -o ${btf_data} -

${CLANG_FLAGS} contains a correct clang --target when cross-compiling.

I'll use this in the upcoming v4 of the series.

