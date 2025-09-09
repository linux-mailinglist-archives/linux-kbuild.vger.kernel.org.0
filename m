Return-Path: <linux-kbuild+bounces-8778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E989B4A561
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABAC16ACBE
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BE423ABAF;
	Tue,  9 Sep 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AkETeRDs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AED22D9E9;
	Tue,  9 Sep 2025 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406879; cv=none; b=ldbg/uEmUwEVuheCQK3zqGsQ30Sao66LmzRmPr1KOu+FzgYnXxNlK+SifN5a2kfiYM3o5BoQaybTi3A2ClA25InWAl4jlJm/y3yiGrJmpE0gQaW40ozgZUMGsszyi869wNzCadSl+OYIcgqCzgbrAqkGebl/IBgc7Ks+tyDzhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406879; c=relaxed/simple;
	bh=1L2Bw0FR8UrRxby4BIaBq2hd7YUtE4qsFByn8BNvKdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiURjQYn8H2LhPoq4/KjOJZsYFf7ycXeusFEYlfRu48/OeXs0fQR3HYHSXN3d897X3+qpjLuB5eTo2YTawqom8JqmF991ukCJ+OPwOAvw1Z3Vv/z+M+p2GhVI4r4NH3WIG6H6z0Zbn+gvNbakvIpIEtcN3p/fu2EsPxkk01KJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AkETeRDs; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tUi9+YGmuLz8MduOv6pUfelR4HtcHzXR6NiGUZMk3E0=; b=AkETeRDsJTdI6UKG6HF4BPJb5D
	NmpsuselVIUxvyqPhp0976Uqa6+dKeCYTKNqrqUG7Sjnyl3KQt6opcecyzSOlcl5t9T+Uw3AJJrBk
	1rqvkEpCg37RxJNOvsLxEehluqRq9ekIdY6P51muShRZnh0deroS4nBSFcr/BBfE80mU04qK7HM/u
	0o9/lmKI25eIkyMoGk2/EEpkYkGkaL1xVylA6C/m28W1AYCHKVdU2iGttSdxhKTj73YgpRn0ENU3K
	m4TGddv9xzMGisnCwgebtxzRqANgkTFu0guFUmTIiqXWU37nrSLJRNPaak1o1oWsNRTCk7rO5BCM+
	KzlGyozQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvto3-00000005FzG-1ykX;
	Tue, 09 Sep 2025 08:34:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D2142300579; Tue, 09 Sep 2025 10:34:25 +0200 (CEST)
Date: Tue, 9 Sep 2025 10:34:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, sohil.mehta@intel.com,
	baohua@kernel.org, david@redhat.com, kbingham@kernel.org,
	weixugc@google.com, Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
	trintaeoitogc@gmail.com, axelrasmussen@google.com,
	yuanchu@google.com, joey.gouly@arm.com, samitolvanen@google.com,
	joel.granados@kernel.org, graf@amazon.com,
	vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz,
	kaleshsingh@google.com, justinstitt@google.com,
	catalin.marinas@arm.com, alexander.shishkin@linux.intel.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	corbet@lwn.net, xin@zytor.com, dvyukov@google.com,
	tglx@linutronix.de, scott@os.amperecomputing.com,
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com,
	mhocko@suse.com, ada.coupriediaz@arm.com, hpa@zytor.com,
	leitao@debian.org, wangkefeng.wang@huawei.com, surenb@google.com,
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com,
	rppt@kernel.org, pcc@google.com, jan.kiszka@siemens.com,
	nicolas.schier@linux.dev, will@kernel.org, jhubbard@nvidia.com,
	bp@alien8.de, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
Message-ID: <20250909083425.GH4067720@noisy.programming.kicks-ass.net>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>

On Tue, Sep 09, 2025 at 10:24:22AM +0200, Maciej Wieczor-Retman wrote:
> On 2025-09-08 at 22:19:05 +0200, Andrey Konovalov wrote:
> >On Mon, Sep 8, 2025 at 3:09 PM Maciej Wieczor-Retman
> ><maciej.wieczor-retman@intel.com> wrote:
> >>
> >> >>I recall there were some corner cases where this code path got called in outline
> >> >>mode, didn't have a mismatch but still died due to the die() below. But I'll
> >> >>recheck and either apply what you wrote above or get add a better explanation
> >> >>to the patch message.
> >> >
> >> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
> >> >
> >> >I tried disabling kasan with kasan_disable_current() but thinking of it now it
> >> >won't work because int3 handler will still be called and die() will happen.
> >>
> >> Sorry, I meant to write that kasan_disable_current() works together with
> >> if(!kasan_report()). Because without checking kasan_report()' return
> >> value, if kasan is disabled through kasan_disable_current() it will have no
> >> effect in both inline mode, and if int3 is called in outline mode - the
> >> kasan_inline_handler will lead to die().
> >
> >So do I understand correctly, that we have no way to distinguish
> >whether the int3 was inserted by the KASAN instrumentation or natively
> >called (like in int3_selftest_ip())?
> >
> >If so, I think that we need to fix/change the compiler first so that
> >we can distinguish these cases. And only then introduce
> >kasan_inline_handler(). (Without kasan_inline_handler(), the outline
> >instrumentation would then just work, right?)
> >
> >If we can distinguish them, then we should only call
> >kasan_inline_handler() for the KASAN-inserted int3's. This is what we
> >do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
> >should not be affected.
> 
> Looking at it again I suppose LLVM does pass a number along metadata to the
> int3. I didn't notice because no other function checks anything in the x86 int3
> handler, compared to how it's done on arm64 with brk.
> 
> So right, thanks, after fixing it up it shouldn't affect the int3_selftest_ip().

Seriously guys, stop using int3 for this. UBSAN uses UD1, why the heck
would KASAN not do the same?

