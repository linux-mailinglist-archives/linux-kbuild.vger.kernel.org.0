Return-Path: <linux-kbuild+bounces-3618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB197BF3C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 18:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7444DB21740
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 16:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE181BA867;
	Wed, 18 Sep 2024 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="cuqEiajb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A8210EC;
	Wed, 18 Sep 2024 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678028; cv=none; b=kASMR0bp6qAaePd7+RznT7K7uECI3Bo22jPNZjWjruaSiFa0M7jI5c7xxvPecmOUNKKE2BhcFso9S+MH7dfArwO6xoa+nGK6kNLTsSEIOgWkKt83zvS4a1mXZno3Kgv9KR/EAIlIzVDymKLq1z1+Yem+cIGdduxY8HVnuKdZnbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678028; c=relaxed/simple;
	bh=H6jEy3S2soA4UWdYI1P+sfM2FneK0YaShjCSVyJIbjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzWS/4s4x4zkfg0pFnCxF0lq4ZJnzm+KaaY7b/+xByBWuvWDaSr/9fMnE+XUuVGdupIiKPchrPDCT8TtMdVIY8+vehF1nOBS0gg2lqkgtQe/bK0hpYi9DRVN+xkGbeEpAX+5eBDLmIqJq2HXxVspd5ESW7WBjGMU3mtvTKcyxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=cuqEiajb; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726678023; bh=H6jEy3S2soA4UWdYI1P+sfM2FneK0YaShjCSVyJIbjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuqEiajbmj9+7FskkzlZ0hx6C66rDYVZIWFdBV6DPFQPikkq5LMoZtteUQ7VgaJTl
	 iE5gd0K6TrOJDiHWPvUQl0Cv4uZHgJMiZBpywo3IRf3LVxCNrMp7eTBlLjw2Im5Zgb
	 UCp3PWZLbER168iSKh8SJOsZNyxx8UseEowOF1x0=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 18:47:03 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id CC11E8074A;
	Wed, 18 Sep 2024 18:47:03 +0200 (CEST)
Date: Wed, 18 Sep 2024 18:47:02 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 05/23] kbuild: doc: describe the -C option precisely for
 external module builds
Message-ID: <ZusEBkr-KY1Mx_OS@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-6-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-6-masahiroy@kernel.org>
X-purgate-ID: 149429::1726678023-74EB6D67-E7A942BB/0/0
X-purgate-type: clean
X-purgate-size: 1692
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:33PM +0900, Masahiro Yamada wrote:
> Building external modules is typically done using this command:
> 
>   $ make -C <KERNEL_DIR> M=<EXTMOD_DIR>
> 
> Here, <KERNEL_DIR> refers to the output directory where the kernel was
> built, not the kernel source directory.
> 
> When the kernel is built in-tree, there is no ambiguity, as the output
> directory and the source directory are the same.
> 
> If the kernel was built in a separate build directory, <KERNEL_DIR>
> should be the kernel output directory. Otherwise, Kbuild cannot locate
> necessary build artifacts such as the .config file, etc. This has been
> the method for building external modules based on the kernel compiled in
> a separate directory for over 20 years. [1]
> 
> If you pass the kernel source directory to the -C option, you must also
> specify the kernel build directory using the O= option. This approach
> works as well, though it results in a slightly longer command:
> 
>   $ make -C <KERNEL_SOURCE_DIR> O=<KERNEL_BUILD_DIR> M=<EXTMOD_DIR>
> 
> Some people mistakenly believe that O= should point to a separate output
> directory for external modules when used together with M=. This commit
> adds more clarification to Documentation/kbuild/kbuild.rst.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=e321b2ec2eb2993b3d0116e5163c78ad923e3c54
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kbuild.rst  | 5 +++++
>  Documentation/kbuild/modules.rst | 9 ++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

