Return-Path: <linux-kbuild+bounces-6020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62378A57C15
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77AD518915D7
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301281EB5C8;
	Sat,  8 Mar 2025 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="tS1cZDZB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133821DDA2F;
	Sat,  8 Mar 2025 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741452500; cv=none; b=LA5b0imN6DSHt/sy+IsEVNQOZVahoSQNU3WR6baAsRcA9MZpRzUm88wBrSk4lB3T8rm+ktJzpLh7UTdtV215WNMQoVkZ5LfUFKW4ANzdqOyUWHkmv4C95WASxAGarmjOKuU5MGQBgO3kAFW54X7A99EXzIyIaFPbYV11kdAdLZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741452500; c=relaxed/simple;
	bh=Mzmh5uAz152L3wEs5lzf3u7CR7G/1Lm/gkTq9VRgpO0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=i4pWP+xVa9F/1a4kc694vcD8zvafikRvVlmHkJMvDbEnzXYiHrP1Pvm1S8qhjRWpdTnW2mSMeIhvcydai0LhSKU/HjbqzH3LETn6gHQPdhIIzrXAeg/L3jp1E4CVU3m9NWtVFoqOdXeQxoZWEHXKCuXQ4z0mi1almRT/RUfT1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=tS1cZDZB; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 528GljFO860265
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 8 Mar 2025 08:47:46 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 528GljFO860265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741452467;
	bh=cfYhmh7hfT5eY8aPopfdC0CAHsTKij6RMoNpyAJXLyw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=tS1cZDZBo0yCSEy2CS5qx0cx2UoMq/+C8W+deWU0PPVgknO4WH+5PzdM3yPSrqPka
	 a7xpbb98dIC7Iwt8vLwbkNGozQlIh/EQ5NqnA/vJl9hQAqqlxu2ij6g0LW5Ti7FlfR
	 NDE2JOaqlzbsPrj9TuZXrrSdRSrcdhSHY38C/8eVXK7CUK/ld9yDwRNy5K3CNx/OiL
	 QlAp+FmCpon2Z8PMwz3bm0UxZpMUGNa9t0aAmim+KC4hC8zXcIejmLRQYcLnV58Tsm
	 uc0wxuwWEkBGTltvny/tXX7jqGHROsqdocpHEnMDk6jbjrM8rOkf+35jy22YwmOYiK
	 PscFjRrnMkIkg==
Date: Sat, 08 Mar 2025 08:47:44 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>
CC: Masahiro Yamada <masahiroy@kernel.org>, "Xin Li (Intel)" <xin@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, nicolas@fjasle.eu, sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
User-Agent: K-9 Mail for Android
In-Reply-To: <20250308164151.GFZ8xzTwiNd1JVcMHT@fat_crate.local>
References: <20250308040451.585561-1-xin@zytor.com> <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com> <FAE530F5-B657-4C72-8D69-7ABA2D3209A9@zytor.com> <20250308164151.GFZ8xzTwiNd1JVcMHT@fat_crate.local>
Message-ID: <DC1CB322-2527-4F6A-8EC4-A76DD35CB564@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 8, 2025 8:41:51 AM PST, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Sat, Mar 08, 2025 at 08:01:56AM -0800, H=2E Peter Anvin wrote:
>> Unfortunately it seems users haven't been following that :(
>
>If by "users haven't been following that" you mean they've been doing
>
>make kselftest
>
>in order to run selftests and *that* thing builds headers, then yes, you'=
re
>right=2E
>
>Oh look:
>
>PHONY +=3D kselftest
>kselftest: headers
>	   ^^^^^^^^
>        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>
>:-P
>

That's not the only one=2E Point being that users have been using it so it=
 is better to make it official than breaking it=2E

