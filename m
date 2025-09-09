Return-Path: <linux-kbuild+bounces-8779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947AB4A59F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D29F57B6350
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6D6253F12;
	Tue,  9 Sep 2025 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MBHVmkYE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD3253351;
	Tue,  9 Sep 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407238; cv=none; b=Id6O12IEyvBrvnV174ltVDuUMUL0K5Zwdz0PjOHsCe/EDkPtk/l7bwgnxcpo6Zzsa96/4W0ZjRx464Tv9f9o1hH8zlglvbuuSaswafJWquNmtBwazRAYTW/vkwHhzPMMWCEeyfprvsxy7mlUZ8lAaBy9SVByfGW1FMxkeS63z4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407238; c=relaxed/simple;
	bh=rU1hPeYBWmAN30SXjn32qou4sTCaSW2iF1PGOJ+cIK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7WwTJzJEDURtjJQABHU9PtaId24zA9/2TVDi5eETfMZc9vOr4wM8QdgDo/OW4tq6ui7L8M7QHFG8cZE8Rk1vXp2Wf4dB8YQcvevW6EjTdMQev1kmPefwlXz+cxjG7BSFvysu5AoXR3wCGoHiK0ji6Lbx0hp624mmqwfyxHGvbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MBHVmkYE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EoUcqt6OXqlU+JdoRus3vWmyIypwXpaqFZjRiXTD7KI=; b=MBHVmkYEd0s33w4HDnRrScBGWK
	7ka0nv6T/lMA7WcFajL8j5eR/F1lEPT3HHe0/qQaXKg6cu+eOZY3VMYML9R7GsnwMKwjavuiK3rm3
	w9eA2cXuoey9UoNeDuRcsl67SFXaLXiPCH/9QEkPoLgLkPhbh/xGqtRKb0GYPPmIv0K1QC/4mg7QI
	wK/jTHDDRQm19IVoiiqhU8DjydiZypghHgXG/fm8pn2NuTS1br9FO8BFOCYpMaPkv9eYcjIbfpQD0
	LeAOVtWlB1+JDmWlHcFU1zdERFUa2j/r3IMUho/bpoKJ5GRAHGstaCri0szq+tx3hy+wDFGNr+sFY
	DW942Gaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvttw-00000005G3k-25Ih;
	Tue, 09 Sep 2025 08:40:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D4F4F300579; Tue, 09 Sep 2025 10:40:29 +0200 (CEST)
Date: Tue, 9 Sep 2025 10:40:29 +0200
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
Message-ID: <20250909084029.GI4067720@noisy.programming.kicks-ass.net>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
 <20250909083425.GH4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909083425.GH4067720@noisy.programming.kicks-ass.net>

On Tue, Sep 09, 2025 at 10:34:25AM +0200, Peter Zijlstra wrote:
> On Tue, Sep 09, 2025 at 10:24:22AM +0200, Maciej Wieczor-Retman wrote:
> > On 2025-09-08 at 22:19:05 +0200, Andrey Konovalov wrote:
> > >On Mon, Sep 8, 2025 at 3:09 PM Maciej Wieczor-Retman
> > ><maciej.wieczor-retman@intel.com> wrote:
> > >>
> > >> >>I recall there were some corner cases where this code path got called in outline
> > >> >>mode, didn't have a mismatch but still died due to the die() below. But I'll
> > >> >>recheck and either apply what you wrote above or get add a better explanation
> > >> >>to the patch message.
> > >> >
> > >> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
> > >> >
> > >> >I tried disabling kasan with kasan_disable_current() but thinking of it now it
> > >> >won't work because int3 handler will still be called and die() will happen.
> > >>
> > >> Sorry, I meant to write that kasan_disable_current() works together with
> > >> if(!kasan_report()). Because without checking kasan_report()' return
> > >> value, if kasan is disabled through kasan_disable_current() it will have no
> > >> effect in both inline mode, and if int3 is called in outline mode - the
> > >> kasan_inline_handler will lead to die().
> > >
> > >So do I understand correctly, that we have no way to distinguish
> > >whether the int3 was inserted by the KASAN instrumentation or natively
> > >called (like in int3_selftest_ip())?
> > >
> > >If so, I think that we need to fix/change the compiler first so that
> > >we can distinguish these cases. And only then introduce
> > >kasan_inline_handler(). (Without kasan_inline_handler(), the outline
> > >instrumentation would then just work, right?)
> > >
> > >If we can distinguish them, then we should only call
> > >kasan_inline_handler() for the KASAN-inserted int3's. This is what we
> > >do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
> > >should not be affected.
> > 
> > Looking at it again I suppose LLVM does pass a number along metadata to the
> > int3. I didn't notice because no other function checks anything in the x86 int3
> > handler, compared to how it's done on arm64 with brk.
> > 
> > So right, thanks, after fixing it up it shouldn't affect the int3_selftest_ip().
> 
> Seriously guys, stop using int3 for this. UBSAN uses UD1, why the heck
> would KASAN not do the same?

Specifically, look at arch/x86/kernel/traps.h:decode_bug(), UBSan uses
UD1 /0, I would suggest KASAN to use UD1 /1.

