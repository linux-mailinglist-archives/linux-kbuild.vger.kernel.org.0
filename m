Return-Path: <linux-kbuild+bounces-13324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h1YGBuCHFGqwOAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13324-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 19:33:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A55CD652
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 19:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FF7E300CE49
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 17:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FFD2D8364;
	Mon, 25 May 2026 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EwMekC7i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517B28726E
	for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779730397; cv=none; b=QF+FgSrp6+Jt99QRcT/xIMe0N3nuOrqy4EX7aZJOb/O3m39AsxRk9nQW9PAEhuW0hF2JJMr6iuiPPdobLOdf1l8RGjOY0uk56gYBGqQMUCa9EeSqYs8+Z0hc5+t5FVZEKR2S99llR/EktLYz5Ioct5oVAC/cnLJ9epXN7FpQcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779730397; c=relaxed/simple;
	bh=KS4jzXcYEGWyhvQcyiid+k+SW44m4Tzp76dkHlQp0vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StACW5+/NfPJaJujqAvJvfkTnpoCpoElcRp4EJp5NM7u66cWLln4DiayOkGmFSvV5cOj7TtXuFgYu30U0I3kbuMO7zk4IwyPYIpapYcCF5dy1FwsOURPty5RhxARsSNwe4OOGSuO3XI0Y1R5VM6is/EztTvCCg5tW+VExHtlYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EwMekC7i; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so41094905e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779730394; x=1780335194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ke3902//gigT30lDRSKJbeulpB5AsGLO9vF808ols74=;
        b=EwMekC7iNvhGWbs6+8J1AnlXa+qE4hswY+dZQjQGPGUlb7tnhG+gB9RrN1V412Vbjq
         PVuuRzaFeCQ1wRZFaG/ZUw0h67KO022n2Q59w13GNbFk+VZ1THRkhPBMJj5PfsYw+6n+
         8Y4QA2ZUPxeb+ViqYakrSqg/WAgOaelWlEnDZTPko1U46k2JT4SZWrjOmuFDA5AO3qNZ
         GWHHPscJVxRljc0eu3UW4ZVgUUD8M8JodazqA3TwWkjTH2CDnpqjJu7FqwsOPp5iFK9U
         /0qH6xYoZqDJwh3da9U3CfK2Yfct3FioJLOsz/xD1cU2a2+CbJZr1zlJ6yBDg3O42LVk
         BQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779730394; x=1780335194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke3902//gigT30lDRSKJbeulpB5AsGLO9vF808ols74=;
        b=DfusNX35tIOVqsPN2bLQWRKRxBSUaU57q+Rrhiow2VNrX1SvBr29JxfwdExxBpNFY5
         ET2Af0o4zQSWtasRzbpKgqMxqlE2BRYZYODU6W72JUm5n/hJGS4CwgESwDQF2N0BQeOe
         jLE0FFo+2HHFl00OuAsFKbzk8JJGuqCt5Rsp4A8sx38mGPXcemsMfO6OkJ4gQLxDN/X8
         bVzT2/HdfG/oK1DhLc2/Id1Y5PyjNiWlIwQb/rLO1fTUhiLVSbVILctNguJq2R6ZBGkN
         KiEqzpQoPS6cvQZvE/REq5MrhZczA+VQMGGgHMCli4PwHyLMe6s5Qie0sZqWL8mTMvls
         NgLw==
X-Gm-Message-State: AOJu0YwLRGC9IjzxfN9JBF1JINH420Ga3FkmHM4TBY6EUoXX/PTZK+hd
	k4CbCyfMxeG+Y73JVi09QlNmycJbYf6RvNNrNV/L+Ye+hWtzJTlm5XwuNu8Sq6n+v2AA8TAZctf
	+YqMntHYhczWd
X-Gm-Gg: Acq92OGLZZEfZ90ycQNhe29xEmQsBqheuJzg8httpJ0VavR9bDATcKdVz5C6g6+/nw8
	AqqMdaeEEKUQby/aBLZouRUk0RvqRgcj2PPBVi5f5KPmTGtnmJbZpDPn+8AdiizFvbBrWOe+TqV
	nHYZXzvl9iXfMtJGMM/xyDVJ6f45dtjHfAsrx3kDunY3UN7pttAxSY4Kzsu3x48X/e9kMTVSm13
	3gKwXesIWrixBosRrRbnGyyN/9+snuEkgr2R5x3j0/Qd4I/y+meeun7Wd8pFBWvNggonsbh/N+d
	ol5O2TkBRMznJ869baoR6iiy3vHae2R846KMyyAgVqDkHxceejTo5ecARU0bCMCcueez13tPe4X
	F2CXgbjK0/KcsVJaN7Sr4+ibEr43qJbV904t7zQv78siGzSan/lGNYVVHtxOzKnza5Ao/IRb1DM
	9AG49oVyXCOtZruwJLVZKNpCJUJ6UubYlmPqtpmYFamDVEpSztVLl/jh97NkB/KaJd0nTAYS/b9
	gE0aPvimxCIrTTPRUW1FygywVUcoa8L4ZxHChFhoeV9HNB+cs4NDfuXRUMYOAgErengaktbi5Jz
	jEU/
X-Received: by 2002:a05:600c:154d:b0:490:44eb:c1d7 with SMTP id 5b1f17b1804b1-49044ebc367mr241188825e9.30.1779730393854;
        Mon, 25 May 2026 10:33:13 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048f70f55sm76151265e9.17.2026.05.25.10.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 10:33:13 -0700 (PDT)
Message-ID: <c135351a-d7cc-467b-a0c0-bea735fe850a@suse.com>
Date: Mon, 25 May 2026 19:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration1~
To: Wentao Guan <guanwentao@uniontech.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>,
 masahiroy <masahiroy@kernel.org>
References: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
 <20260525080229.1570905-1-guanwentao@uniontech.com>
 <26c47a0e-7a9b-473a-818d-455e68476dd1@suse.com>
 <tencent_23032AC04EF146C803D19A6D@qq.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <tencent_23032AC04EF146C803D19A6D@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13324-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 6A0A55CD652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/26 3:41 PM, Wentao Guan wrote:
>> On 5/25/26 10:02 AM, Wentao Guan wrote:
>>>> Additionally, many distributions already switched to gendwarfksyms last
>>>> year. Unless someone provides a good reason to keep genksyms around,
>>>> I expect it will be deprecated soon and eventually removed. It would be
>>>> more valuable to show whether the same optimization is worthwhile for
>>>> gendwarfksyms.
>>> I see gendwarfksyms use crc32 from <zlib.h>, which from zlib1g-dev and zlib1g.
>>
>> Ah, I forgot about this, so gendwarfksyms should already be well
>> optimized. I think that is the most important thing.
> 
> Which way do you prefer? There are two ways now:
> 1. this work,
> 2. import zlib like gendwarfksyms and remove the huge crctab,
> but need make sure any arch do not cause performance regression?
> (Assert the user libs precompile with +crc32 is right?)
> I do some early tests show that:
> 1) zlib in x86 fast than genksym software
> 2) zlib in arm64 debian precompile slow than genksym software(crc32 not in armv8)
> 3) zlib in arm64 recompile with +crc32 same speed with genksyms hardware

I think it would be useful to first have more data showing that the CRC
calculation in genksyms is a hot path and contributes significantly to
the overall kernel build time.

-- 
Thanks,
Petr

