Return-Path: <linux-kbuild+bounces-11962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI5XBIMuuGnhZgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11962-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:23:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4629D455
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5145F3028EB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2053346A0;
	Mon, 16 Mar 2026 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fEhzCv2N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F551332EBB
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677803; cv=none; b=lJ+ey6lgS26zAqzfZgu27yX838bpg0N646ykKbOqBlrKbTDqrSFUiMUw/iX07NdAXO9sMEVO3OKZufvM9JAdfT00FMRAAM4GaQIj7wyjUVsRq7dXTEfu9E6T6KcAcZzXXVWQSCSIMi9smDV4QEolQ8jES1XTQJ4zTOVmb/DF+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677803; c=relaxed/simple;
	bh=XwMJB8RHHvUhH/cZpiA4UN/3HmQRSD+owhzGHAnIW5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i5Zu1Hw0OirCUtKWWAoAr3i04rCEdoa5F5hbou5BRlZ211N4rIB9H9GijZ5QZ4QhyV0FRnN4SXb0RCcUA0yLKgOZTcJj7lxSHzQ1uRPnnoSfJNIykqx6ruFqHx9Zn2zS2epUvbdQKJws4ka40tnsZnSByYlkMD37zNmpJpfTpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fEhzCv2N; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773677790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfUyA8FXap7FNQKwzw+IyJSbOMuEyJIojfw+PE3m8/I=;
	b=fEhzCv2NC7ppyGlL+Dh0AsoUcCFzfEjoWteogjOIfI2Ka5M/pVgAa/MWCmBScQJFBaGpHH
	Nq//NXTy5/1cethqEl6YNO7RgzXEqhWZFe9TC+3Ovfnl0S/9czc0pi+ZKqarKWIBC3tMpa
	YXmBKnSshXDGusv1WqcEHpGC6qHhGHY=
Date: Mon, 16 Mar 2026 09:16:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: build failure after merge of the kbuild tree
Content-Language: en-GB
To: Nicolas Schier <nsc@kernel.org>, Mark Brown <broonie@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 KBuild Mailing List <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abgRRX3PH9IaExi8@sirena.org.uk> <abgph5Gk1G8UgG2E@levanger>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <abgph5Gk1G8UgG2E@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11962-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: AFE4629D455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/26 9:02 AM, Nicolas Schier wrote:
> Hi Mark,
>
> On Mon, Mar 16, 2026 at 02:18:45PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the kbuild tree, today's linux-next build (arm64 perf)
>> failed like this:
>>
>> Auto-detecting system features:
>> ...                                   libdw: [ on  ]
>> ...                                   glibc: [ on  ]
>> ...                                  libelf: [ on  ]
>> ...                                 libnuma: [ on  ]
>> ...                  numa_num_possible_cpus: [ on  ]
>> ...                               libpython: [ on  ]
>> ...                             libcapstone: [ on  ]
>> ...                               llvm-perf: [ on  ]
>> ...                                    zlib: [ on  ]
>> ...                                    lzma: [ on  ]
>> ...                                     bpf: [ on  ]
>> ...                                  libaio: [ on  ]
>> ...                                 libzstd: [ on  ]
>> ...                              libopenssl: [ on  ]
>> ...                                    rust: [ on  ]
>>
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>>    PERF_VERSION = .gbc1f864a1976
>> 52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
>> 0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
>> Building: arm64 allnoconfig
>> Makefile:2254: *** extraneous 'endif'.  Stop.
>>
>> Presumably caused by commit
>>
>>    6a76b3c06a1d3 (kbuild: Reduce the number of compiler-generated suffixes for clang thin-lto build)
>>
>> though I don't immediately see how.  I have used the version from
>> next-20260313 instead.
> thanks for the report.  Unfortunately, I cannot reproduce that anyhow;
> but I pushed to kbuild/kbuild-for-next at 12:36 UTC, might that have
> been a bad point in time?  Do you have your merge somewhere around where
> I can fetch it for investigation?

I guess it probably due to my bad suggestions (sorry I should have tested before
sending out).

else
CC_FLAGS_LTO := -flto=thin -fsplit-lto-unit
+if CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=false)
+endif
endifIt should be else
CC_FLAGS_LTO := -flto=thin -fsplit-lto-unit
+ifdef CONFIG_LTO_CLANG_THIN
+KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=false)
+endif
endif

>
> Kind regards,
> Nicolas


