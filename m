Return-Path: <linux-kbuild+bounces-9870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23604C8B6BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 19:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEE983590F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 18:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174043126B1;
	Wed, 26 Nov 2025 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kBLIQ2D9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13CC31282D
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181367; cv=none; b=osEH9/huPe871XCMdVVZCdvennSYQjxvAkLipKBo0a4THuv8RxqGYRB3/JQ5x2s46Lavh+/6wgpAAvYxoS+Fq76d05VqgS8DwStJ2K5v7dQykqzjIM81/ajII7a+D2gAif0ygCwoVrvTpPKn91lmMl8fjjFSVO1k8kuI4HrrtpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181367; c=relaxed/simple;
	bh=11+n6ED0oj4GlVfro7776FjNWhcM74GpNCK3Tx4RzU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHuPO1LfXwvBgkhnjXTlEy3XvfotclcliaaVlWXkwrcOstV7J+p430R2oWbGbz56J3UJjjxyDJOa+Moykfs1O8ZjBxpnbRRfa2Rs5Iju1AiPCdsMZ2qvVy14qI2MGQq6htneVfPlBOIuiSZ1BMcVDtejF7XVFjDZ4JJqq9CZ3lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kBLIQ2D9; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <102a3220-2490-4c81-b2c9-6b107d6e4aff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764181351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5lnVEmMjTQunScWht2/TigkN5EtXsb7CslpuxT4iIY=;
	b=kBLIQ2D9+46RfxQscZxA2XbmkNw2KlF45o/VXrEzwlTmpM/33kdUcRiUsJBdDj4WKBihIA
	5060+ffqWI7XBRJMtqScZzGWXxvPTLBi0saW50GcRGyBtl4CVkGy8IZij/jN1OID6IS8WJ
	lg1zYeyciryXqWZaKfJnBXABvuxWlXI=
Date: Wed, 26 Nov 2025 10:22:21 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 4/4] resolve_btfids: change in-place update
 with raw binary output
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
 <CAErzpmvaHxLdooTsHt=YKbz9NDw+LXB8462kRrkzbdp-zJ-=2Q@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAErzpmvaHxLdooTsHt=YKbz9NDw+LXB8462kRrkzbdp-zJ-=2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 8:46 PM, Donglin Peng wrote:
> On Wed, Nov 26, 2025 at 9:29 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> [...]
>> +
>> +gen_btf_data()
>> +{
>> +       info BTF "${ELF_FILE}"
>> +       btf1="${ELF_FILE}.btf.1"
>> +       ${PAHOLE} -J ${PAHOLE_FLAGS}                    \
>> +               ${BTF_BASE:+--btf_base ${BTF_BASE}}     \
>> +               --btf_encode_detached=${btf1}           \
>> +               "${ELF_FILE}"
>> +
>> +       info BTFIDS "${ELF_FILE}"
>> +       RESOLVE_BTFIDS_OPTS=""
>> +       if is_enabled CONFIG_WERROR; then
>> +               RESOLVE_BTFIDS_OPTS+=" --fatal_warnings "
> 
> In POSIX sh, +=is undefined[1], and I encountered the following error:
> 
> ./scripts/gen-btf.sh: 90: RESOLVE_BTFIDS_OPTS+= --fatal_warnings : not found
> 
> We should use the following syntax instead:
> 
> RESOLVE_BTFIDS_OPTS="${RESOLVE_BTFIDS_OPTS} --fatal_warnings "

Hi Donglin, thanks for taking a look.

These and a couple of other bugs have been caught by CI [1].
I am working on v2.

I changed the script to #!/bin/bash and will run the shellcheck 
before submitting the next revision [2], when it's ready.

[1] https://github.com/kernel-patches/bpf/actions/runs/19689674975
[2] https://github.com/kernel-patches/bpf/pull/10370

> 
> [1] https://www.shellcheck.net/wiki/SC3024
> 
> Thanks,
> Donglin
>> [...]



