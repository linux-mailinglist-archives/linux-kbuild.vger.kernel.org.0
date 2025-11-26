Return-Path: <linux-kbuild+bounces-9854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B6C87907
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 01:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB083B0B9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 00:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A212B9B9;
	Wed, 26 Nov 2025 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mC/f8CEs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D9F50F
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 00:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764116185; cv=none; b=dLpc6ek/vtYdG0t61gU8ZG9LwhX/qfyhsTwZsyTIrC53A1gB2sjGNFdSboiEkVaQp9sD2mLPPczOIryaCGFc4SZMLJPI5zvXE//sjAm60sObsRcFFJskLcH5OcBYlFK9ZRC3+sgBUPdYF1ukEqBUxY/Sjqzpr/IIyr2C0T2YkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764116185; c=relaxed/simple;
	bh=YA9qwV4XBiNOk3eL5MT3K8N/3agpG0aUPfqyJDtmfhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwHn5+1Zwbo0wRVQjcI0iyK+fZHZcy3LC7mIINpr6a3LYFYxuPwP1/0SWAEjiV+6BwcE0YFGmiFTD/XQsF8w04Fi5kUdKL9pe1pVHUZ37oMUMq+gX+KWp12UKsma0glAHuIJmCxO0qeFFliOZyfw3wfnxVOpobRrNlAIKBN1h+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mC/f8CEs; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dGKq82bs9z9t1n;
	Wed, 26 Nov 2025 01:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764116180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpfrYYt9VH4ZHSXHnX2GiOC1U7mFKdrkL0zGl1+vDMk=;
	b=mC/f8CEs0exMjehgw6nAaEeOlXMtx+WqfBqRr+bObAy3mO6/QhmxFE5qFKWKW06aySKzDe
	d3+uruqIbuLvos3KtE4LW2WnITLzv/KuF3d11+F0Npo26LYI7I02+jSBvhwKhQWKr45qFo
	nTAB7ltcJxa6ECX67hwX9BgcXovM7DevUpgmeWoSsxs+cKhF6SfRNVxz1Kbo2S/adENBl2
	OvBcaVDKmWQ/kzRt/lJ9qjtcElwjuH0/Vsii2ypMdHTtdjKY8v9bkWFP0BObbaC1Fzy52d
	nbH+5gO3IozMXwp6cV/DCK+HCbugEAyJUgko+EVRwfCWtbf8C8OMb2p+qZdPaw==
Message-ID: <7e955a64-2fe6-4b8e-b49e-c3f827029b2b@mailbox.org>
Date: Wed, 26 Nov 2025 01:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20251123.131330.407910684435629198.rene@exactco.de>
 <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
Content-Language: en-US, de-DE
From: Erhard Furtner <erhard_f@mailbox.org>
In-Reply-To: <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b5caa0122b17562bad9
X-MBO-RS-META: poewz48d1z6n4r6wgh4otp7nj5ig8b7u

On 11/23/25 15:57, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 23/11/2025 à 13:13, René Rebe a écrit :
>> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
>> save/restore symbols, that the linker generates on demand into the
>> .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
>> too. They are needed for the amdgpu in-kernel floating point support.
> 
> Would have been interested to know with which version of GCC the problem 
> started.

I can reproduce the modpost errors on GCC 15.2 and GCC 11.5.

Same kernel .config builds ok with CLANG 20.1.8 however.

> By the way you seem to fix the problem for modules, but does it also 
> work when amdgpu is in kernel ? I would have expected a need to add 
> functions in arch/powerpc/lib/crtsavres.S as well, just like following 
> commits:

If I build amdgpu statically into the kernel I don't get the modpost 
errors, the build finishes successfully. Only building amdgpu as module 
leads to these errors Rene reported.

Regards,
Erhard

