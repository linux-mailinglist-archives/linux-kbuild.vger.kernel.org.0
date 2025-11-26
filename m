Return-Path: <linux-kbuild+bounces-9880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F19C8C654
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 00:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41AC14E3400
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 23:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1B3016EC;
	Wed, 26 Nov 2025 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IwEpBWXs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B5301460
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201507; cv=none; b=ubhj2NCaUT+NobrKsdEUpfhQlm7NdZqkTMnXiYIG++Ajnv1GdQpLjLRqFGAoebHCajs3Up2/LiwCWwtRfkT5mj2V8bqeg5kypbB8YVBrSvboJoOuNwaKMDTTSlUT/s2ZmualDpuhnvE1s2vIUdPVqkO0EhUVgcwjRKx9ifURQrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201507; c=relaxed/simple;
	bh=fqModIZQ9weIdajfx2Law3kUMrQJn4OXAAZVino9I3I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UPy7doY0eZ5vKptrAko75H8bIopU9vP/Z5w7dhhGXDmJyJPYV9VWBLRtr37ScOVBGZIYpNo3Fut3JRXqxTyDyEGazf3p+KtnA49UxjfRfe/rKY7OGcgNm6z+rWuPC5IST5OvYfLzcfXt2Wo+vmQHVwJDbjutkrwE16KRa5jNdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IwEpBWXs; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <9ac1ab7b-1412-4e81-a993-df95c372c4d8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764201493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJsW4MSL8jrZwt1mHNooy6P3uX9Y7YjgeSxiW1DH7p8=;
	b=IwEpBWXs+DaXxkfjq3hjka/S3m0r2fZlwZ+szIi+PQl7KYPQWdNo4SztZ6Ydhqos6rIPFk
	02AAmEFhJcA6ctotzRhsdeuP88y8ZQNFc9s02+L0Oad83N5La54CNUlhB6Ptyv+2y/y45Q
	wKnFL64HtnAY512PdUCeMEAXs+8Fty0=
Date: Wed, 26 Nov 2025 15:58:01 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 4/4] resolve_btfids: change in-place update
 with raw binary output
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
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
 bpf@vger.kernel.org, dwarves@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Alan Maguire <alan.maguire@oracle.com>
References: <20251126012656.3546071-1-ihor.solodrai@linux.dev>
 <20251126012656.3546071-5-ihor.solodrai@linux.dev>
 <CAErzpmt7ER171hAjQ2SwbmC9R3dVsKHj02B8VM5gKMViP1iFqA@mail.gmail.com>
 <6b61c22b-d38c-47c1-8b8f-a37e44866644@linux.dev>
Content-Language: en-US
In-Reply-To: <6b61c22b-d38c-47c1-8b8f-a37e44866644@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 11/26/25 11:13 AM, Ihor Solodrai wrote:
> On 11/26/25 5:03 AM, Donglin Peng wrote:
>> On Wed, Nov 26, 2025 at 9:29 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>>
>>> [...]
>>>
>>> For the kernel modules creating special .bpf.o file is not necessary,
>>> and so embedding of sections data produced by resolve_btfids is
>>> straightforward with the objcopy.
>>
>> The Makefile for the bpf selftests also needs be updated too:
>> https://elixir.bootlin.com/linux/v6.18-rc7/source/tools/testing/selftests/bpf/Makefile#L708
>>
>> This results in the self-test for resolve_btfids failing:
>>  $./vmtest.sh -- ./test_progs -t resolve_btfids -v
>> ...
>> test_resolve_btfids:PASS:id_check 0 nsec
>> test_resolve_btfids:FAIL:id_check wrong ID for S (0 != 3)
> 
> Good catch, thanks.
> 
> I remember I noticed this at some point, and then forgot...
> 
> Interestingly this test passes on CI [1]: 
> 
> 2025-11-26T03:09:52.0908317Z #366     reg_bounds_rand_ranges_u64_u64:OK
> 2025-11-26T03:09:52.0925114Z #367     resolve_btfids:OK
> 2025-11-26T03:09:52.3904190Z #368/1   res_spin_lock_failure/res_spin_lock_arg:OK
> 
> I'll take a closer look.

I figured out why this test was flaky.

Even though I removed elf_update() call from resolve_btfids, the ELF
was opened with:

    elf = elf_begin(fd, ELF_C_RDWR_MMAP, NULL);

And the buffers which resolve_btfids writes to are from Elf_Data
returned by elf_getdata(). And so the file might actually get written
to in-place, which is why the resolve_btfids test passed for me with
no changes to the selftests.

I switched ELF_C_RDWR_MMAP to ELF_C_READ_MMAP_PRIVATE, and then the
ELF reliably remains intact (and the test fails). From libelf.h:

  ELF_C_READ_MMAP_PRIVATE,	/* Read, but memory is writable, results are
				   not written to the file.  */

It makes sense to use this for what resolve_btfids is doing.

I'll fix selftests/bpf/Makefile in the next revision.


> 
> [1] https://github.com/kernel-patches/bpf/actions/runs/19690981192/job/56406840021
> 
>>
>>
>>> [...]
>>>
> 


