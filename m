Return-Path: <linux-kbuild+bounces-6749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BAA9DAD4
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 14:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5138464C61
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CEA1F949;
	Sat, 26 Apr 2025 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMuCLQgI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493F2F24;
	Sat, 26 Apr 2025 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672243; cv=none; b=u6KaEFM7g80GUFmv9h3wupu0b9Y3LJgCyAfiWh4v99qJ4ClnFSpRhIawUg4oXWLSM4TOPzlw3fISqys7CcpT9jwgl1dV9fXKklyB/z/1DZO84UdhBYI1F5OlVVkkOvines/nXp30K+y+xWHbrHNvXqnz1Znqlqf8b2N7fv8YhrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672243; c=relaxed/simple;
	bh=7vnqcVl5ngC2WnVfizhAsL0Eks4mJZUDw7HzflzBWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UP+XWldd5mYrw1m5vbjXpsjSJs8rFJ4DI9kz6QqFDdKXjr9Topep/49RpwMJk5PXL2zrJqXBR7CgH/jNP+ql77/P5hFfnaoYsIRUtM/ClvRAzpiXmCkfBagu1KAy6M6KxtDOAVQDRfpwEb5dx6OGzXLMVvH0aZRydiXVJfyA7tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMuCLQgI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C96C4CEE2;
	Sat, 26 Apr 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745672242;
	bh=7vnqcVl5ngC2WnVfizhAsL0Eks4mJZUDw7HzflzBWOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oMuCLQgIKpLjI+JSbeLr/pxzfWwb4AEqiajhWDjJ/K96eva/VELbmm37Yk2ZYZe7f
	 Vg8A7Dl7Zjgf0mc7kjwMiQsm6b4ZS8madUWixIRihiSiQHWNz1WFL2AzHeqi4DiCsk
	 PHZYuNER9j2uOXc3BwGq5lOe1SI2GXaW3+4KCI30zojnYZbA22oh7wHXDMX8OaTsGI
	 Z+SlxlyLJgNW2M9Mthj/eOHUwv3c1hbqEBkLT1AJ3PhOOygFj23ihq/kTCdsWN/fTV
	 ZRjA2efx9Xlpg9m3Yefh/iwXUkWMxLAiPY1+IB629NYJbT/wo3xJK0guh7q46WQ23R
	 NFvCyAbiZe0pQ==
Date: Sat, 26 Apr 2025 20:57:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, airlied@gmail.com,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, masahiroy@kernel.org,
 mripard@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <20250426205708.4f90a83d@sal.lan>
In-Reply-To: <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
	<22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Akira,

Em Sat, 26 Apr 2025 11:39:05 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Bothering with might-become-incompatilbe-in-the-future python environment
> variables in kernel Makefiles looks over-engineering to me.
> Also, as Mauro says in 3/4, it is incomplete in that it does not cover
> the cases where those scripts are invoked outside of kernel build.
> And it will interfere with existing developers who want the benefit of
> bytecode caching.
> 
> I'm not precluding the possibility of incoherent bytecode cache; for example
> by using a shared kernel source tree among several developers, and only
> one of them (owner) has a write permission of it.  In that case, said
> owner might update the tree without running relevant python scripts.
> 
> I don't know if python can notice outdated cache and disregard it.
> 
> In such a situation, setting PYTHONPYCACHEPREFIX as an environment
> variable should help, for sure, but only in such special cases.
> 
> Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?

Patches 1 and 2 are, IMO, needed anyway, as they fix a problem:
KERNELDOC environment is not used consistently.

Now, patch 3 is the one that may require more thinking.

I agree with Andy that, when O=<dir> is used, nothing shall be
written to source dir.

There are a couple of reasons for that:

1. source dir may be read only;
2. one may want to do cross compilation and use multiple output
   directories, one for each version;
3. the source dir could be mapped via NFS to multiple machines
   with different architectures.

For (3), it could mean that multiple machines may have different
Python versions, so, sharing the Python bytecode from source dir doesn't
sound a good idea. Also, I'm not sure if the pyc from different archs
would be identical.

With that, there are two options:

a. disable cache;
b. set PYTHONCACHEPREFIX.

We're currently doing (a). I guess everybody agrees that this is
is not ideal.

So, ideally, we should move to (b). For Spinx, the easiest solution
is just to place it under Documentation/output, but this is not
generic enough: ideally, we should revert patch 3 and set
PYTHONCACHEPREFIX when O is used. Eventually, we can apply my
patch for Documentation/output, while we craft such logic.

Regards,
Mauro


