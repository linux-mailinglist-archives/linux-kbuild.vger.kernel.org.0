Return-Path: <linux-kbuild+bounces-8784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485EB4A67F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 11:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50D4A17A2DE
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A14276054;
	Tue,  9 Sep 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FEfgeDR9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232191DF738;
	Tue,  9 Sep 2025 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408646; cv=none; b=O2s3ujQXDIRASPNTYnjszxMAFNF8c+3XuOg9Ykwiwl0mCh8PL90qDRtKzZ1mWixHD8H+rD/EomRCiWq86IenVwtT8CUms1gRxX+XXznKHfzkSqInL57vNWjd0vfWYvwBRnvVT0LlhFBgAtUV7ZT7kzzUjABleXQXNUZcNClOPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408646; c=relaxed/simple;
	bh=0iQP6QtWjadeXzFLApRz1DQriDBa3su8a1ZXwzaArMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkBDsrbA6pAGckc1r1mt0bDq70oe2Q8YV7hMVkIhYUbri8NSBwQb3gpymZWLLc/XUCxyzxHFgF3rfDGEx18IfXqBLhM8EBWGSKkDGhGOK/HTeChFW+KggUOel/o1GXz3VeOFvLnmzDYCaVWpJwU7/Ot+Ty5JiXojSQ/Ixv7F+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FEfgeDR9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NpXa+vu5fBKULSWcWQHqLrFFROyEpt4qyTDAIt4nodE=; b=FEfgeDR9N3y94fqc91GS8X3CKX
	JAKsAe00a802RdsTP3D0LCjDvhpJ0uVCmfDe0Kh7wY8VRtiqWYEziNPcsQpoYyq+PjBzkVByulS3+
	2jUKwEa0JuXfuUcldWyx/kb9A4eiOEPkAY5940SKPO736tP9QyxTzS23gMm0NmEwDIFs5f5okjwLa
	tU+gRrluo4Jz15EadIcek/1ZVQ6LxoFYFa/aE5jsPV2lBHM3zQOUha0m3/Y87k8gh3fYaap5ZvWk1
	QLn6DE/5QDIjE9uYvzmHOv/SQcCN3I+wK143A/Hyd0K8+dFvY91nMO8KVottGkQzV08agpNh0MY10
	B6+GrbjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuGc-00000005GfF-2QAJ;
	Tue, 09 Sep 2025 09:03:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A7C8F300399; Tue, 09 Sep 2025 11:03:57 +0200 (CEST)
Date: Tue, 9 Sep 2025 11:03:57 +0200
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
Message-ID: <20250909090357.GJ4067720@noisy.programming.kicks-ass.net>
References: <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
 <20250909083425.GH4067720@noisy.programming.kicks-ass.net>
 <20250909084029.GI4067720@noisy.programming.kicks-ass.net>
 <xeedvhlav5rwra4pirinqcgqynth2zrixv7aknlsh2rz7lkppq@kubknviwhpfp>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xeedvhlav5rwra4pirinqcgqynth2zrixv7aknlsh2rz7lkppq@kubknviwhpfp>

On Tue, Sep 09, 2025 at 10:49:53AM +0200, Maciej Wieczor-Retman wrote:

> >Specifically, look at arch/x86/kernel/traps.h:decode_bug(), UBSan uses
> >UD1 /0, I would suggest KASAN to use UD1 /1.
> 
> Okay, that sounds great, I'll change it in this patchset and write the LLVM
> patch later.

Thanks! Also note how UBSAN encodes an immediate in the UD1 instruction.
You can use that same to pass through your meta-data thing.

MOD=1 gives you a single byte immediate, and MOD=2 gives you 4 bytes,
eg:

  0f b9 49 xx -- ud1 xx(%rcx), %rcx

When poking at LLVM, try and convince the thing to not emit that
'operand address size prefix' byte like UBSAN does, that's just a waste
of bytes.

