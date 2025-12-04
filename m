Return-Path: <linux-kbuild+bounces-10001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18591CA50FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 20:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16956300B908
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 19:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BF8344050;
	Thu,  4 Dec 2025 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UcxlHrcg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BE33FE18
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764875137; cv=none; b=Vs5DQxWqn+0aP9wKG1l2MUpxYloPAfsddH5LnsysvBzzms4lxLW41hObJSiYc44AGfK7DwCXLPsJJhqLwbmGS9NU6+GvgobcWONigKka6vVRMkuEp/AH6gsen5eZ+u9svD/i1QKLDnvryDeXA9CrIM9LSi+Qh7s5dZJ7kqfYBa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764875137; c=relaxed/simple;
	bh=vrRZhWSLEMc/WMLnekKX0VoTY806Bb8zLAWdWzKD1TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehu9zoET0+p9twv4sHEI3D7G9su7gBz8pVoFrh0X2gNi2Ft64OHlV3cNIjAONYYpY2qmFoUqkOJHD4haBN1O/aRanAWfhe2L6wRNRskdEppodukclD4sGmG26ZGL2fVZo/r9hiHpEVATrtpzzdmX33OJem3mKTDNsFl55kh3+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UcxlHrcg; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <131b4190-9c49-4f79-a99d-c00fac97fa44@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764875121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fd7z8hCbWgtDKmMPY2PrW8eDGrbySIVxu9EPmfBj/CU=;
	b=UcxlHrcg4l3JH/oQ5nd6CFdsy4iUXAQXOm17a65nE5VyclI0xOLUR2eEaPEDHSnxjcb8Pe
	/5BrEezM2yJhtcC+5SOSKA3QeFMzreRtCwuLytfQoWp/KGRtcBVYDKBZXmHYfz0doIdi7/
	kkCVb1ClhCwToYF28NVw2HeiXrrtsDE=
Date: Thu, 4 Dec 2025 11:04:45 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 4/4] resolve_btfids: change in-place update
 with raw binary output
To: Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
 <20251127185242.3954132-5-ihor.solodrai@linux.dev>
 <de6d1c8f581fb746ad97b93dbfb054ae7db6b5d8.camel@gmail.com>
 <e8aacbc8-3702-42e9-b5f0-cfcd71df072e@linux.dev>
 <763200e4f55197da44789b97fd5379ae8bf32c08.camel@gmail.com>
 <79031f38-d131-4b78-982c-7ca6ab9de71e@linux.dev>
 <707080716569c7de7c3cb5869b67d62b55a96b68.camel@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <707080716569c7de7c3cb5869b67d62b55a96b68.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/4/25 10:06 AM, Eduard Zingerman wrote:
> On Thu, 2025-12-04 at 09:29 -0800, Ihor Solodrai wrote:
> 
> [...]
> 
>> Ok, it seems you're conflating two separate issues.
>>
>> There is a requirement to *link* .BTF section into vmlinux, because it
>> must have a SHF_ALLOC flag, which makes objcopying the section data
>> insufficient: linker has to do some magic under the hood.
>>
>> The patch doesn't change this behavior, and this was (and is) covered
>> in the script comments.
>>
>> A separate issue is what resolve_btfids does: updates ELF in-place
>> (before the patch) or outputs detached section data (after patch).
>>
>> The paragraph in the commit message attempted to explain the decision
>> to output raw section data. And apparently I did a bad job of
>> that. I'll rewrite this part it in the next revision.
>>
>> And I feel I should clarify that I didn't claim that libelf is buggy.
>> I meant that using it is complicated, which makes resolve_btfids buggy.
> 
> So, pahole does the following:
> - elf_begin(fildes: fd, cmd: ELF_C_RDWR, ref: NULL);
> - selects a section to modify and modifies it
> - elf_flagdata(data: btf_data, cmd: ELF_C_SET, flags: ELF_F_DIRTY);
> - elf_update(elf, cmd: ELF_C_WRITE)
> - elf_end(elf)
> 
> What exactly is complicated about that?

Take a look at the resolve_btfids code that is removed in this patch,
as a consequence of switching to read-only ELF.

Also consider that before these changes resolve_btfids had a simple
job: update data buffer of a single section, importantly, without
changing its size.

Now let's say we keep "update in-place" approach (which I tried to do,
btw). In addition to previous .BTF_ids data update, resolve_btfids may
need to either add or update .BTF section changing its size (triggering
reorg of sections in ELF, depending on the flags) and add .BTF.base
section. There is also a question of how to do it: do we elf_update()
multiple times or try to "batch" the updates?

All of this is possible, but the alternative is much simpler:

    ${OBJCOPY} --add-section .BTF=${ELF_FILE}.btf ${ELF_FILE}

Why re-implement our own incomplete version of objcopy if we can just
use it to deal with the details of the ELF update?

Note also that even in pahole "add .BTF section" is implemented via
llvm-objcopy call. My guess is: to avoid the headache of figuring out
correct libelf usage.


> 
> [...]


