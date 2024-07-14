Return-Path: <linux-kbuild+bounces-2504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54F9309DF
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 14:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37DD6B21074
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 12:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685506E613;
	Sun, 14 Jul 2024 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="YWKv6Mtr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911D8F5C;
	Sun, 14 Jul 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720959237; cv=none; b=hA8PwBKIT+GlrPXHDHHnYSeywunK/YJXKq+nY37oQm7XkPPcp9yCVg5vFhbY9XuO4Ecx1ZeeoH2/IEVq0SKi1zsCRit8TXDthqkMf0EbQvsvFC2pqyUWd0YugFH3s2hGnJchak3QHs13LaWZlsyMI8eHMnYdVnAqUd3JDRmf29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720959237; c=relaxed/simple;
	bh=gAoILYv37xkB5P91uGQmdeyt0K2wQQvTn3nam4BAk54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZee5tnZVcGQBDu567kKrw8hPWUqWiRg9C0TC58BV6dY80hqkXMui1974bZMHhpTj+qdyy6wJ6xM/iv8D3uVnOJi/oqMK9ysmT5XXcrnxC+hwF4BC7aADkak2KIkgVeNtTZN51eIRYzMGuJqoUaJfQWKJEMkb4uiIBmXzgHIFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=YWKv6Mtr; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 42C4038A399D;
	Sun, 14 Jul 2024 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720959232; bh=gAoILYv37xkB5P91uGQmdeyt0K2wQQvTn3nam4BAk54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWKv6Mtr6HpRcKQbX922yleEE6km7IxjhqiYboH8P/kASFz1cXbjvIMTkQbazsWs1
	 oPM54b8eTIzxvy5NDhiEk33O0ZMKR6KniSSb/knNc4EXongbqa93x1swoaRumYLzrr
	 t6UUVjWqgkf+A1niskGt6Ms3Vt0ATuZzPM0EItDCttRPj9WGxrbWlpcs07XUBt49Zb
	 pmze7bJfXINVZmUg56dJB3/bFxtCkp2BS+2hsIvy3T2afItMejuoxLrQ0JhCHahCpq
	 FdxC/AivuJWLee+JlWphV3lVk0hIsjWtFSYennQtttJd1iUdvc9Mce/hGBf9OQAjTX
	 xmjOYl6R3knzZeLiUln3zX262S/F2kwVfg4xt034dvoCxsy0F4w2NRMgTxDH1+XdyF
	 izejiMc1lIxk67tFFsCWL0pe1vMmS2nLmsqFV+PScnCHHc9+ztVj7l4QZYhP60IHQS
	 1yBHuO1rer+MbOAiaxVQlvvcfH3bpapCMoAJfiNjPBJwUb2WmHPZRkwPLqJJW0vY7a
	 BS2clvoeza5tH7T8P2RpY4LwzNgWhut4/EhNkB+HD7jSNJvCuQwv/IFYjKDmUgTrG/
	 LSotwgfKXXMZtTqXh/ygoTpS6lZEEmfLepet0VkHLd8Jtvx37yYfy8Qhb3mkaCFh1Q
	 vQpBC9nvU7w4xCXZFGpbeuXc=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FBxerkmRPHKp; Sun, 14 Jul 2024 12:13:10 +0000 (UTC)
Received: from xtex (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 12:13:10 +0000 (UTC)
From: xtex <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject:
 Re: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
Date: Sun, 14 Jul 2024 20:12:58 +0800
Message-ID: <2146419.9o76ZdvQCi@xtex>
In-Reply-To: <20240714085751.176357-3-xtex@envs.net>
References:
 <20240714085751.176357-1-xtex@envs.net>
 <20240714085751.176357-3-xtex@envs.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Reviewed-by: Nicolas Schier <nicolas@jasle.eu>
Link: https://lore.kernel.org/linux-riscv/Zcfp8fn7o74K08g0@fjasle.eu/




