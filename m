Return-Path: <linux-kbuild+bounces-6059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0927A5CA13
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 17:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD6D3A3C0B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 16:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABA926039B;
	Tue, 11 Mar 2025 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UWzDjPDp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5725E46E
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708858; cv=none; b=nAkmUM1yHJlb3qyFL8biBisP+cGoncOyEiWMaxrUTXtpd0htLo7jZVqq1GscaJxR762Eu8iEe/t3AqQY/p/BFaNJ4GtSkrM5QNjMxctrtmah46bNivWdH/rIhMTuof1gZAY7EtRPGStZSTO1Oz+aIm+JJSIxY6Kv51o8dGGmeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708858; c=relaxed/simple;
	bh=IqikE1i2SuwPolJeXPK6e7H+vK85SDXPGjy7nazvKHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fM3c6bilkxzbLviYle2wkYeQVQtCO7SC+kLjKFv0lwox4zX9fn1OmjddhK7xiLqF2c0vU09iAVHvidI8fipSagoCdgWzkKCO6X5HuwnyhbzpETpTgF8XI1NBJSC9h5LtgZSmWfFk7zVdCGK19bMxwgRnBCrwBHQr+568vyRLiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UWzDjPDp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso12568625e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741708855; x=1742313655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Rz0Bfl3Q6jjOl+k/zk6qCdCbl0b3aJFNCS5LE6D5lg=;
        b=UWzDjPDpUS/h0+/xUEbFD+RNw93d9mjj+1rEpzr3+lIIjczkgA5+rEqUeFE85vU3ev
         m7+ESROWJQH/3YEPQVKkbZvpRslkJ4V4TAlCV2K45GNmO8f8LdSUrObBorkp5lJdxmcH
         JUKl2Y9FZsPaiX65PaBJf0aPQRCN4uLVyK2MUwoLqkJQvRfZ4N9i84aArkUwHAR7euGc
         WRvBHYYvA1QiBInMkqKpV6ExP5yNX3uG9qKgHGZ1TOfniRf9/UeTU/sSbMYf+Zd1DW3F
         Z3qV6ZnXBCAqloYDU1ORcGzb/euJhQYPC1Von7DlP8L4oE9fJc9GnK1njvJTXqYbpLQK
         PQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741708855; x=1742313655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Rz0Bfl3Q6jjOl+k/zk6qCdCbl0b3aJFNCS5LE6D5lg=;
        b=mAydMIFJztpZWVIhkEtoBMn6UrvLo2qDQQzYVSyLI3aNCa4WOjluDAJw9WVC+yX5Ty
         kGmtPr5c2d3pLxu50VxMvUtXjFMfhkSR7KaQxgrMUPyjR08vnxqXL9d3RhfC2TchrlU/
         e04ZQhRtxFfm3/xKDCg5EvN2nFxjAQ11QpHyIgEayacdEDidIL5QkVc8F74XTgNRPq/W
         Tw+Ft5KWZi6ELOAYfx0/m/Am4J2HUKG7KpcKyoF1LwyhNnIDwnspXllb7+ha6lrbogia
         EpEH/Y9h6y2SvGx7fCpT2jR+D0Y3eGZBZwSFJh236KnmM4ScEB5MB13rQ8Wb7UTy+GyR
         V2dw==
X-Forwarded-Encrypted: i=1; AJvYcCUMCRIYW2ATTDzDGjMElb+9KdopDHhnq7GgFmq36RuACTRscuy8SSKUr7HS2HbZMN2FQEs/FcVH5ctoXN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+sWs/+/6uCyBvyevloZpvp2ytPe+39d8dhFticUCHA38YtCe
	25IxDFbC1gFrD+ojy1sW1J/2HhErCCWzt2LGyHDPXJHbcgj1Q7ZwE6Gt4DL0OxAiSchWnjl9+va
	a
X-Gm-Gg: ASbGncvz1/J2AA3RiQXh2+SXdIq4tgOeitK3m3pBF/MdC/CJAiKnhI1v6PiCUDx/I3W
	6qjwVfdEprUy6G9Fhkqw1h0pK+eXj7LzYfo7BlRMOI40tTdn9pFal1t5Quks2XkiGKkpQ+N+UKY
	WHCftKiF31A0ui9ApGZvmeE8c0rbQKtgn8uARZ1KTqj31eTuUwvjJqQNFAg1Sm7pwwrfXinFR6H
	LY/eKSNOT5hj9yFrXKo3hNFQXBWbLLsw4r8xOLOVDv2pIkxtur5LHyFUfIi8BhSdWUTD2+vfBLq
	PuJtLhjHIZuWtbCm/z6Ps9hP2kDUR2xL1vxpB6ydugTPPUMZ
X-Google-Smtp-Source: AGHT+IFDL8flg7bvLP4ZA5yhwIFQLqPiE7+pEyM0NkgCqqaSUxbZ8Iu2kecIY3EVTviLUDeRYu+5jg==
X-Received: by 2002:a05:600c:358f:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43d01be65cfmr61517325e9.16.1741708854652;
        Tue, 11 Mar 2025 09:00:54 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfe1fbbefsm52422055e9.38.2025.03.11.09.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 09:00:54 -0700 (PDT)
Message-ID: <c441a091-d389-4021-a45e-d6fb36ed57c6@suse.com>
Date: Tue, 11 Mar 2025 17:00:53 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-kbuild@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250224132132.1765115-6-ardb+git@google.com>
 <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
 <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
 <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
 <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>
 <Z81j8EguDyz_uesu@gmail.com>
 <CAK7LNATb40pkqXXH+o_CXW6Vf3zavAj8oSeWnpGfXq6SCto4kw@mail.gmail.com>
 <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 07:40, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 03:39, Masahiro Yamada <masahiroy@kernel.org> wrote:
>> I am a bit concerned about having more and more
>> intermediate vmlinux.* files, but maybe only me.
>> I hope vmlinux.unstripped is the only/last one.
>>
> 
> Maybe we should not strip vmlinux at all, but only remove any static
> relocations when packaging? E.g., tar-pkg, etc

Distributions typically have their own package recipes. The idea of
stripping these relocations from vmlinux in one place was that everyone
would trivially benefit from it. I'm not sure what you have exactly in
mind implementation-wise here, but I think this would be useful to keep.

-- 
Thanks,
Petr

