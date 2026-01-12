Return-Path: <linux-kbuild+bounces-10525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A4CD14C71
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 19:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DD1630185CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 18:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CE13876A9;
	Mon, 12 Jan 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zzVnZrOK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE43644A6;
	Mon, 12 Jan 2026 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242601; cv=none; b=kBDEUeCWC0KFS6B4dbajhAr12xSZjQxopi+WyeOic6nHai/gfMfQSk2/X6sVr+NBVtdsVSjXZQFJk+3zroi4Cp+ZgmvczO0Em2VgJOO/idWenkfKfI+9Ou9s1E9DDimeIfWxx/QwMY7e7QaDezSQdprl/3SQNTNh1o9UZWKrcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242601; c=relaxed/simple;
	bh=pb/tVCd1nrZorzc3OQJ5GZ/GnwX25D91HAoQwYjWh9A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kSzj5ESjVnZ9AvbyZcK5JP4HkpEe4T9h6jt4NGulSeH+HiXEFP+MP9JvF1p4ZV2/1tVfSFGRUiIQJUVgQ5KhKBC9ORARRwZhwxraFvgEgvQODlOw2ol2fpqFxAH0ClB4N8kDNK7bR62cq35TImJqpSaAi/b0ld5+u21vC/6a3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zzVnZrOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1E7C116D0;
	Mon, 12 Jan 2026 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768242600;
	bh=pb/tVCd1nrZorzc3OQJ5GZ/GnwX25D91HAoQwYjWh9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zzVnZrOKkI5LQ7+XAL7zuJbCgfgnfqQ6c//ayo6FMiYjPMM5GN0thTTLoC0v3HytI
	 0hd6ThWdQnfX/79qVJ7TSOIicNp0Obgssj6CPfZw/oqr+6R06NeTUnIJO72B3djMq8
	 W03ZnqF6oZOrCYz2QoGo82heKOjO3ypVyeIonYME=
Date: Mon, 12 Jan 2026 10:29:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com,
 vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org,
 catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org,
 jackmanb@google.com, samuel.holland@sifive.com, glider@google.com,
 osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com,
 thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com,
 axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 bp@alien8.de, ardb@kernel.org, justinstitt@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 17:26:29 +0000 Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> The patchset aims to add a KASAN tag-based mode for the x86 architecture
> with the help of the new CPU feature called Linear Address Masking
> (LAM). Main improvement introduced by the series is 2x lower memory
> usage compared to KASAN's generic mode, the only currently available
> mode on x86. The tag based mode may also find errors that the generic
> mode couldn't because of differences in how these modes operate.

Well this is a hearty mixture of arm, x86 and MM.  I guess that means
mm.git.

The review process seems to be proceeding OK so I'll add this to
mm.git's mm-new branch, which is not included in linux-next.  I'll aim
to hold it there for a week while people check the patches over and
send out their acks (please).  Then I hope I can move it into mm.git's
mm-unstable branch where it will receive linux-next exposure.

> [1] Currently inline mode doesn't work on x86 due to things missing in
> the compiler. I have written a patch for clang that seems to fix the
> inline mode and I was able to boot and check that all patches regarding
> the inline mode work as expected. My hope is to post the patch to LLVM
> once this series is completed, and then make inline mode available in
> the kernel config.
> 
> [2] While I was able to boot the inline tag-based kernel with my
> compiler changes in a simulated environment, due to toolchain
> difficulties I couldn't get it to boot on the machine I had access to.
> Also boot time results from the simulation seem too good to be true, and
> they're much too worse for the generic case to be believable. Therefore
> I'm posting only results from the physical server platform.
> 
> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86.

OK, known issues and they are understandable.  With this patchset is
there any way in which our testers can encounter these things?  If so
can we make changes to protect them from hitting known issues?

