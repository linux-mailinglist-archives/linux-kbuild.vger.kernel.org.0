Return-Path: <linux-kbuild+bounces-9329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C65AC1DA5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 00:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8367B4E2C3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 23:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AF02F1FD2;
	Wed, 29 Oct 2025 23:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="im3LP7Wh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF22E0B59;
	Wed, 29 Oct 2025 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761779593; cv=none; b=hmrDkmTLKOrR7Y/X4SxTuh/C88wJItpUmqFr+Jii49rIgWMHkX9HmFqqasaVOFiqHglVg9GddiOUPtA2LPF7iokPNcR3Z8J8lAasc9JiBT1jmyor3uQW9JBkWfuit+IEe4nJd+/Cr5aQKmzb6FWI2ZXLfaGJubD5ANNUEILHeU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761779593; c=relaxed/simple;
	bh=z4SnXRipUzz35y/BzThyGakaFJrTo847VpmitD4DBYQ=;
	h=Date:From:To:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DtYgxJnNtLEm9P+YoPUQJGLQJziQaAuaQe+0GeiZFBKfal1QOydZ41IyJdcJKZBKPsJ/KLqT2LFrrxq+kBRpC9Jr/lgCHgYD0Kz8+pUJgQhngUFzsE5FOBhH9Vl0WcKyyvz47NNZTA1/aQeySH7sto8TW4K6+t5dGmQFukVebyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=im3LP7Wh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A30C4CEF7;
	Wed, 29 Oct 2025 23:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761779592;
	bh=z4SnXRipUzz35y/BzThyGakaFJrTo847VpmitD4DBYQ=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=im3LP7Wh6PwlT0Uu4EFypO7HRZK3HCj/cZx1dZQ6EVD75bjhnAw2+T3Ml0qTTPVH4
	 2VAAAUaPpjfKb+je7NI4Wfo1AhVCe3/XyQOFVeK15Lu/uNgRGGyHbqQUpPLiCw+piC
	 qVOPw5OaKjEApJmT/RyYG0NdSjlS7qVmJofNHRn8=
Date: Wed, 29 Oct 2025 16:13:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, xin@zytor.com,
 peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org,
 nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com,
 bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com,
 kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com,
 wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com,
 fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
 ubizjak@gmail.com, ada.coupriediaz@arm.com,
 nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com,
 elver@google.com, pankaj.gupta@amd.com, glider@google.com,
 mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org,
 thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com,
 jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com,
 mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com,
 vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
 ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev,
 ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com,
 maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org,
 rppt@kernel.org, will@kernel.org, luto@kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/18] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20251029161310.61308a6b61b1423feb655d2a@linux-foundation.org>
In-Reply-To: <20251029150806.e001a669d9dad6ff9167c1f0@linux-foundation.org>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
	<20251029150806.e001a669d9dad6ff9167c1f0@linux-foundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Oct 2025 15:08:06 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> However patches 1&2 are fixes that have cc:stable.  It's best to
> separate these out from the overall add-a-feature series please - their
> path-to-mainline will be quite different.
> 
> I grabbed just those two patches for some testing,

x86_64 allmodconfig:

/opt/crosstool/gcc-13.2.0-nolibc/x86_64-linux/bin/x86_64-linux-ld: vmlinux.o: in function `pcpu_get_vm_areas':
(.text+0x101cc0f): undefined reference to `__kasan_unpoison_vmap_areas'



