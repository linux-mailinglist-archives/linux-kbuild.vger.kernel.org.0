Return-Path: <linux-kbuild+bounces-10540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9894AD188F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 12:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1ECEB3002BA3
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 11:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7D138BF6A;
	Tue, 13 Jan 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Xu0+QRmj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C514285068;
	Tue, 13 Jan 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304897; cv=none; b=jEYLq31E42DszZl/Og1Bn4uOmh+FWnONXdDRxTzNnrTcztu/qnLjNnNFBa/q62Qxo6qi6qk8XGekW78Kq0PTpRJfzdSO5XIreu4yp0fYO/42fLRIkxYrR3ZFrGPiOLI8hbz45ZNAVK4pqswm2xTbdZQ2Wy9jhAVqSQzkVst2U58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304897; c=relaxed/simple;
	bh=/KMIFQGR4Bul37gWLEtJAePhpTN+maF3gId13DkHyMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsHFNz+/8nHE0mmeL4oBp7hvDCZwCmuqei7puPHomrV9nuRxbIIJLKqfpsU2TYQ6aRQP9Wb3EYGRhWTIT2FRBs6fuWLLkoljdZXdLPhwpbLOZWGc8J48JG1EFyV7zykeo+v7dSFF2JKdFCo7DjJxMIG6ZQaR/Nkj0vECWrYHV0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Xu0+QRmj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5470340E0028;
	Tue, 13 Jan 2026 11:48:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TuovWBZKXyO3; Tue, 13 Jan 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768304892; bh=rTbY8atxjKRjBA0y7/TdrF1D3ojAC1i7Hfmy4BpGVjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xu0+QRmjVzNBeP/SFAjZtAYJhh21/UMZZySy8yfoIPEBTM4uIy81JkjyYzMDkN+01
	 n+8yvHO7z7BYTqramqSmlCga3GRnbhy7+aaGT9vruZ8fLyV2f6AyRnKg7EVljfIqK6
	 lOHOIMZuDODjGpIdo4Qc2uqTKS9WoZmSXSetNTKJ/hoXL1K3f0EuVcGvghZ6XV2pje
	 uSZa2REx13fy9H2mVCdKrJtb02uLGMEYUONgSqVGTtnI9OLu8V1NSDwPz7de71ETiO
	 wBA9CcU/Bzp1kCBtzPupRc/pF1vb5GoIkk9j8U0lmI827DrbA0GGCKA9XqcU1poQqb
	 uKIrf9KzbJYRxhJHXaSxcxLN52HneYEXBmDHVmSOgslImgxuumZkdJAvl4SVmu9BMy
	 1ZNoNFr194LKYfVF+BxPzd5FSH2shoVaru+f41SJ+nEeSwAX29dBPVqqHxxnEo7Uua
	 yy30+t1ym5n601GoZV5F76xpQhfo7AV29Y9mu3rWjfyxDPhVrHt53rWfTxzQ6bG+11
	 UXsjKFSGRi/2UG/gm5Kh3HFtjczcjwwRG/cn6wYOMivXrevjw8nosm4zMs55sut6HD
	 wAi/LWh0YyOYKy54CB2fW1apZheJfHlztDFVkJvkT1BYdgWEEW46JWy3RDdAcDDsHR
	 FcYQ/RrS/jrxs8yaH2eXQqk8=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 78B1A40E0194;
	Tue, 13 Jan 2026 11:47:06 +0000 (UTC)
Date: Tue, 13 Jan 2026 12:47:05 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, corbet@lwn.net,
	morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com,
	ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com,
	maciej.wieczor-retman@intel.com, maz@kernel.org,
	catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org,
	jackmanb@google.com, samuel.holland@sifive.com, glider@google.com,
	osandov@fb.com, nsc@kernel.org, luto@kernel.org,
	jpoimboe@kernel.org, Liam.Howlett@oracle.com, kees@kernel.org,
	jan.kiszka@siemens.com, thomas.lendacky@amd.com,
	jeremy.linton@arm.com, dvyukov@google.com, axelrasmussen@google.com,
	leitao@debian.org, ryabinin.a.a@gmail.com, bigeasy@linutronix.de,
	peterz@infradead.org, mark.rutland@arm.com, urezki@gmail.com,
	brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
	andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
	vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
	samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
	surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
	yuanchu@google.com, ada.coupriediaz@arm.com,
	dave.hansen@linux.intel.com, kas@kernel.org,
	nick.desaulniers+lkml@gmail.com, david@kernel.org, ardb@kernel.org,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <20260113114705.GJaWYwubl3yCqa1POx@fat_crate.local>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>

On Mon, Jan 12, 2026 at 10:29:57AM -0800, Andrew Morton wrote:
> The review process seems to be proceeding OK so I'll add this to
> mm.git's mm-new branch, which is not included in linux-next.  I'll aim
> to hold it there for a week while people check the patches over and
> send out their acks (please).  Then I hope I can move it into mm.git's
> mm-unstable branch where it will receive linux-next exposure.

Yah, you can drop this one and take the next revision after all comments have
been addressed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

