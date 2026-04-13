Return-Path: <linux-kbuild+bounces-12771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL+gJoez3GkDVgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12771-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 11:12:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC63E9A83
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 11:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF2453001591
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 09:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20033B0AEE;
	Mon, 13 Apr 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="gX2F4IR0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576A391E54
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071554; cv=none; b=sgmiP6/cNJlj7wqs3US32lf7YqB1U7Vy7k0qxHJqQo/b3ZR1Ra6JLvxHX6tTA4nbQ2vmoN5OAKOXGC8TdLGDC6MWDcVDDatv42rq1bsqvFIkyGSPcag9UzDK4+mdO80JdTIOZD8BKZompz1zGrz+qm2xhmnonDamMACBZV8YWJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071554; c=relaxed/simple;
	bh=cNyOcdD1At7wnlIwjxhIPGzdzjCJwTTcP7kRRd2dopQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRzXj14l55HdlfJE4fvyANwt8apq0qjmmhahREBmx01vXyPW5FFqIDqHecPpKZnb8Jdhe5yZJLpe93+6FUxwd6IYnKbaTi3eDNUOLPZ4THmyH/zO8nOiZjDO8DRIC2ubv2uxk1ILPh+cd/QE0kmcoiHfZakGsDZqDFyHbMX/mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=gX2F4IR0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2652811f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1776071551; x=1776676351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wYAkHe+0nhxgxglZC9fyMeO5mQCpQVjxetgICVf5mic=;
        b=gX2F4IR0mvVRGxcK49OjdsiU/x2AXJ6mXJKfo0PrZk+f9Wz291cp99wNJyM2ehXLKq
         mJlvZQeO0qdaWKyIhKCE4fk+Ttavj63LyZGXqXl8TejkQSAFhHHwbiAK1PGOY7HIchvU
         rOULZHb4rrd+GSMDNTJOrxEeHE9fcDmDOBWgkVsfqeTr1LD/SeZSHWzo1xfWiNpWWEln
         MYCYhdcuzKUZBY3INpo2W6KY6Ac9RmHw8XvkkxzBZnD7+giZzekO1WAXLxms2k459rr6
         XSwlSr0m/tCllzwfW1svjoMsYEfC37LRRWxT0E0UpFa6EttS8PuIKvjdJTf7q5gASraB
         ikDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071551; x=1776676351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYAkHe+0nhxgxglZC9fyMeO5mQCpQVjxetgICVf5mic=;
        b=drmciT7XR/deBRWJOIIdYsSy0p9QasXa0NOskRXsCSLtaMfZe/pK/urDKIT3X2Ep9M
         vFmezWglNrgMoDvaEzQrcT4FsIZXTtIbtN8yuBtvNY2grXrYIcE5dtQMbIw03NJkAZ77
         6BtajYe8tN7kD6AqxJ1X43h7sIxhpnggQo5/E9S+rpOgILYDDtKjpPfGcl3TrIkJlQLr
         lJYTjT8tyNHVN78ZHNbaR/S/m3cCYG1Hp4hB7ltoXKTKPtqXciuaSL11WXGPtAkIuVqI
         uI3zHxYrBLTogTDWXRQyZiOXD91iiYAKCt1ZlCgzga3734d3ywU93QhfxNHaD5MqDoTr
         oTWw==
X-Gm-Message-State: AOJu0Yy8geVOFBy+7EBCHgL6TVhEn15aYd4unKbgUue2ReXHi2TrXQCU
	yWuURpg473pYn4GG5wqZuKA2I/8W7TOhDN6XcpxZ1t0DXyhVDKABsn6n70ZBYS/GgY8=
X-Gm-Gg: AeBDievg+IJ3OUOFxDqvmAOKjW+54hUZMFpDQDWh4BhsCTiz0XiePfwJK2zDeqW1gSk
	2uvep0/7O3NYPWi9wyvDzKQgKEXZWzg/Yfyvz9S0BbfSopTJB84kjIdTW4SeLb5gQjs3a7ncjH2
	DYwSxNbq/l/HrVeBSAIYBqD2LOx4MTGCW/K4mzK/Q38vfsJvmNh+kICzHTE6W/UH/nHa/vQQJy1
	pLVIKV1R+o1EWa+NeWlO/FCaV53I2wYMsLRJGD4q7y8Bzc4lzgrSGLoV6WvcMYi5S3tBX+2DxOh
	H1YJhGl5MKSx6HYRvcwHNjt2IrTMI0cnUxsf6A4WeZzjGj5Dg6jDRa73MpDMaN/IxeZkg/mLXCk
	eIO3CRwL4MhYULF6u75YSwy4Mcb3yCSXCUzqVzielf9hS/NfrxGVZvFD5wWtN3AKi0wb7lXLmO7
	p2R8GD0x/9GNfcMU78In9n3sSHAvdAOM4JWmnWv5wA5wDzKXoE8GuWaKCEAUrfQJofs6eS7pHSp
	3qOP5qau2lJGfuO0IVTQVQExZqFnLoI6j6om1E3R0iC7xNk6xgT07WY
X-Received: by 2002:a05:6000:2407:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-43d70de1ff2mr7663163f8f.30.1776071550746;
        Mon, 13 Apr 2026 02:12:30 -0700 (PDT)
Received: from ?IPV6:2003:fa:af26:200:51a:ef03:a698:a1fc? (p200300faaf260200051aef03a698a1fc.dip0.t-ipconnect.de. [2003:fa:af26:200:51a:ef03:a698:a1fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm11823405f8f.10.2026.04.13.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:12:30 -0700 (PDT)
Message-ID: <7bdb13b9-83db-47f3-89d9-c609f3c3dbc6@grsecurity.net>
Date: Mon, 13 Apr 2026 11:12:28 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: builddeb - avoid recompiles for
 non-cross-compiles
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
References: <20260402145116.1010901-1-minipli@grsecurity.net>
 <20260408221301.GB3963285@ax162>
Content-Language: en-US, de-DE
From: Mathias Krause <minipli@grsecurity.net>
Autocrypt: addr=minipli@grsecurity.net; keydata=
 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
 RzDVkdgPJkL/NFTKZHo5foFXNi89kA==
In-Reply-To: <20260408221301.GB3963285@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[grsecurity.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[grsecurity.net:s=grsec];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[grsecurity.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12771-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minipli@grsecurity.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DBC63E9A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.26 00:13, Nathan Chancellor wrote:
> On Thu, Apr 02, 2026 at 04:51:16PM +0200, Mathias Krause wrote:
>> Commit e2c318225ac1 ("kbuild: deb-pkg: add
>> pkg.linux-upstream.nokernelheaders build profile") changed how
>> install-extmod-build gets called, making it always rebuild the host
>> programs below scripts/ if HOSTCC wasn't specified with its full triplet
>> on the make command line. That is, apparently, needed to fix up commit
>> f1d87664b82a ("kbuild: cross-compile linux-headers package when
>> possible") for cross-compiles. However, in the much more common case of
>> non-cross-compile builds this will lead to unnecessary rebuilding of
>> host tools including gcc plugins. This, in turn, will lead to a full
>> kernel rebuild on the next 'make bindeb-pkg' which is unfortunate.
>>
>> Avoid that by only triggering the rebuild of host tools for actual
>> cross-compile builds.
>>
>> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
>> Fixes: e2c318225ac1 ("kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile")
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> 
> Yeah, this seems like a reasonable workaround. I think this also helps
> avoid some weirdness I have noticed when building Debian packages with
> LLVM (as CC becomes gcc, always triggering the same logic since HOSTCC
> will be clang).
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can you carry this via the kbuild tree, which seems to be the most
fitting one, according to MAINTAINERS?

Thanks,
Mathias

