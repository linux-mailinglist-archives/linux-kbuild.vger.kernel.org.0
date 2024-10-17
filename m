Return-Path: <linux-kbuild+bounces-4160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A89A19C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 06:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74549284AB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 04:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1B313A41F;
	Thu, 17 Oct 2024 04:41:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E5C224CC;
	Thu, 17 Oct 2024 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729140105; cv=none; b=cXEGWJeHkGJw72ckPLa1raAFK5DtXQ8hTWXxDmR0SxWrIOUnAWXd/WrQmLAvGT06ImmCHZRjJeBhhyXZU9iysJbTjLu2jpvBieEML47fEkDuRC8cQbC8dByynzyT80EsC/AaxC9Amf3QZ0IivKBscfVX9gkYhg+y6LsHY4rifkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729140105; c=relaxed/simple;
	bh=ao336pkzJ1vCCnqcKARdbwKuHQux4BznZ203PT2NfU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVXj5mU+ZYSPZZn4xPlnPKFE6tL2+a4r+GlS0HmbPllbNsnytXED+TaNwLPE2iMlqul3bNGdTehpBL01hN2rsJk2N41k7TvLH4aDdLB4ZQfrdduI/QwMqNF7Ix8RToPAhPeqNxr8jMuqclbZRQR5y6a1mPkVDE9FhtDISxPa2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XTZt75P4mz9sPd;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MMm0su871D5; Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XTZt74G4dz9rvV;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DC5D8B770;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fWKN7eEXBxpc; Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from [192.168.233.183] (unknown [192.168.233.183])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 45AE88B764;
	Thu, 17 Oct 2024 06:41:34 +0200 (CEST)
Message-ID: <526fe185-7077-4b51-8ce1-9ef994aa7025@csgroup.eu>
Date: Thu, 17 Oct 2024 06:41:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Matthew Maurer
 <mmaurer@google.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Helge Deller <deller@gmx.de>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
 gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev,
 marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev,
 linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/10/2024 à 01:21, Luis Chamberlain a écrit :
> On Tue, Oct 15, 2024 at 04:22:22PM -0700, Matthew Maurer wrote:
>> So, the basic things I can think of to test here are:
>>
>> 1. The kernel can still load the previous MODVERSIONS format
>> 2. The kernel can load the new MODVERSIONS format
>> 3. If we artificially tweak a CRC in the previous format, it will fail to load.
>> 4. If we artificially tweak a CRC in the new format, it will fail to load.
>> 5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
>> load modules with long symbol names, with MODVERSIONS enabled.
>>
>> Is there anything else you were thinking of here, or are those the
>> kinds of checks you were envisioning?
> 
> That sounds great. Yeah, the above would be great to test. A while ago
> I wrote a new modules selftests in order to test possible improvements
> on find_symbol() but I also did this due to push the limits of the
> numbers of symbols we could support. I wrote all this to also test the
> possible 64-bit alignment benefits of __ksymtab_ sections on
> architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> ppc64le, parisc, s390x,...). But come to think of it, you might be
> able to easily leverage this to also just test long symbols by self
> generated symbols as another test case. In case its useful to you I've
> put this in a rebased branch 20241016-modules-symtab branch. Feel free
> to use as you see fit.

By reading this, I discovered that was initially added to powerpc by 
commit 271ca788774a ("arch: enable relative relocations for arm64, power 
and x86") and then removed due to problem with modules, see commit 
ff69279a44e9 ("powerpc: disable support for relative ksymtab references")

Wouldn't it be better to try and fix modules and activate again 
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS on powerpc ?

Christophe

