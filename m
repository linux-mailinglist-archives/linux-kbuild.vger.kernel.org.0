Return-Path: <linux-kbuild+bounces-6854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD82AA6899
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 04:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A181465A74
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 02:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D60214C5B0;
	Fri,  2 May 2025 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="Fc1qC7aS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6B645;
	Fri,  2 May 2025 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151540; cv=none; b=c4m8CV9Ll9/5mTska5+lz/9JR4bQSxcyybESXg+VV1AKY6wsnuL9PoTfvc0W61A6LJZAHfWuWQ6Lcmk/cUg1xfvGiX+th9yjzdbyhHVHiY2lQ2EJaQzv6WB6u6Du9fslKjhw95j54CiCmvZGCqlzC3VrSqcUT9BPHvGTao8w8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151540; c=relaxed/simple;
	bh=c0cGhG8cCRHhkj5lOTHFPXYoTGvhT7+MTcGKfsE3i34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBypmRY+GaprQVN0VSXx9uqqtLiZydL5+B4W3Ih/7vaJnht8iSpLSfnsUmH7xwJ3iatrTU5K4InsCh7r4hqYXC/xtfLmrt9wueD9vEDUbbC1Po+8griQtwTzAxrnMEyeK+Vnm0y80XziPcUCilXoH67Mc0MEvUqWtZABGRJu/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=Fc1qC7aS; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HzPvW63p7SCCviLq1oWntd4WoqlH63dq9E/tJ3Fmf1M=; b=Fc1qC7aSW41wppN9Y4FzbklqWH
	XXTrTUeOlaPe0w0Fv3Eug2/jdtUwXmAmTl23ABdH9Wpz1vptd2/pJ7kHP4m7eDaNn9CF9negAFnis
	yfL6wb5T+hAOKVYrMB+XI17YNzin42Fi2EK8vJ6GRzzNY6J4/HhIlO7Wc4dY5L02yr6cF67SUeZ8B
	crjh9b50DmZhJM+24EkJtWsWUdMafNeOpuPBKAkZZNQIequB1kZU7KVEERTpNz0NdMrLVMK9kFff9
	WUE7PFj4lL5E9kNneB1JAGUMEVTv8THr+oIi7nC+ODhIDLCSYvYHeCpgU+Uc9cK1Rd0DvWw7d8V9a
	Y3Crj/AA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfmQ-0000000F4VW-2B4i;
	Fri, 02 May 2025 02:05:34 +0000
Date: Fri, 2 May 2025 03:05:34 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <20250502020534.GU2023217@ZenIV>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
 <20250502012449.GA1744689@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502012449.GA1744689@ax162>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, May 01, 2025 at 06:24:49PM -0700, Nathan Chancellor wrote:

> > How long has that been valid? Because this is certainly new to the
> > kernel, and sparse does complain about this initializer.
> 
> As you noted, brace initialization for scalars appears to always be
> valid (at least in my testing) but as Al points out, empty braces for
> scalars is only supported in GCC 13+ and Clang 17+ (I think [1] was the
> clang commit), so that is not going to fly...

From some digging around it looks like
	* {} for compounds had been an extension for quite a while
	* C++11 got it into standard, with semantics defined as "same
value you get for static-duration variables of that type without an
explicit initializer".  For scalar types as well, with the same
semantics.
	* On C side that happened (again, with scalar types allowed)
in 2022; N2912 is the first draft with that change already merged,
N2913 is the corresponding editor's report, saying that change in question
(N2900) got merged in January/February virtual meeting.
	IOW, C23 has it, no previous versions do.  For C17 this syntax
is an error, and AFAICS you need at least -std=c2x or -std=gnu2x to have
it acceptable.


We can make sparse accept it (either unconditionally or with sufficient
-std in arguments), but that won't do a damn thing for cc(1).  Does
clang (any version) really accept it with -std=gnu11?

