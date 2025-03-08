Return-Path: <linux-kbuild+bounces-6019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827FA57C08
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE8B3B0ED7
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AE47E0E4;
	Sat,  8 Mar 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IOfFjElN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B31E00A0;
	Sat,  8 Mar 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741452128; cv=none; b=RAggZXxjR71S6lrXAvL1oA7sf8rXYJKM+jC9T5WWE/Z28g/uEJg7JF7hiDm6v30DPu/rChArYLDENLry/MiJOx7b8H7iD8NFn9BUeBB0I6pgjJ/x5MCLVCmzWkQhwKo8lWs30GSCwB8Ghkm2gcYbHA7eiKZ/A5yPCANMyv0tnX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741452128; c=relaxed/simple;
	bh=5YQi/yppGT60Qz5ERFnjZXkM8JJB66wQMozBsyrzPnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f609XuNFicbpd3/Lj75LFplfUt98Swgd/2u2rUDy1iQIHVxkB8tSAARhccAG8twqdOZ9NzXvfF2u9ZZROcYYxJbxpOPxvZyafsusnUzqFe84ytPYfUWqtZk8VldCcfO9eCHhLPoyyEWqVfTKQTx6mQbpfGz3JTW2Kd2zw0uhS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IOfFjElN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B11CA40E01D1;
	Sat,  8 Mar 2025 16:42:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cWGCF3pVqs9c; Sat,  8 Mar 2025 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741452120; bh=o575BGKSgdAGPxICB7ydHGX62H0Z4HV7YhrHC7x8t2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOfFjElNS5hEZyQFQ53RZfjNC/MClho1UrzY971aAUYE3RqV2frIZttdyzWtMtVTi
	 Ptmss/GLFwyJ8HIc57fgH9ZvgJVyuhcp3KBFG48xwbAHA/bADupuU0kwgVZLLqTC++
	 fhAAzT8iNdkzWbQlHlh+f2FR6sV7vPU5qu2su+yeKMtgi/U5s95o39yaWaR8IE8Xse
	 oFES3vbHiqL8Rnx9zzz04lj/Hva8absMthaLsG3C86VJ7qz1J/1ONcplB55r6mARf1
	 wOMG6uC7xTsGQdF9OaghUbrWuOdJov4aO6wPaVU706WZFd7e7hSw6dY5riRMd4bEoy
	 UQqf+aBt139qdbDXXKRhi6gyyCcGl6ptmt5T0agBruHhcEQd5NVgEJtbnM6mV92i8B
	 lSyY46bt/4A/hhnobSVqvch0ATXyYxZtteLvFBrxeCtxfNU1+j6mWWGwbZudeR3WHX
	 ppnGIBBReJwf+8usiCof7LKMbdb54p/wyj5iBgWEHY9u6aD2vbPaUVhWiduAV0vEMl
	 KUilmEBg87vop1WhHEcS0pSWcZumaJcr7jTVrFyiymNMGKEB2pCq5z/DVX3L/Lf3UO
	 yRMwX5s1LRRnOlxHeA4/XA/49Rf4Qo/nb6c5xj8GNAetpGyx406NpS+Ql3P5pmX/25
	 hkA45755cidg0h3XsrEYHHx8=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8020A40E01A0;
	Sat,  8 Mar 2025 16:41:52 +0000 (UTC)
Date: Sat, 8 Mar 2025 17:41:51 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
Message-ID: <20250308164151.GFZ8xzTwiNd1JVcMHT@fat_crate.local>
References: <20250308040451.585561-1-xin@zytor.com>
 <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <FAE530F5-B657-4C72-8D69-7ABA2D3209A9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FAE530F5-B657-4C72-8D69-7ABA2D3209A9@zytor.com>

On Sat, Mar 08, 2025 at 08:01:56AM -0800, H. Peter Anvin wrote:
> Unfortunately it seems users haven't been following that :(

If by "users haven't been following that" you mean they've been doing

make kselftest

in order to run selftests and *that* thing builds headers, then yes, you're
right.

Oh look:

PHONY += kselftest
kselftest: headers
	   ^^^^^^^^
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests

:-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

