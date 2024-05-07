Return-Path: <linux-kbuild+bounces-1803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A268BE255
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 14:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82D5E1F22300
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 12:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83687158A2D;
	Tue,  7 May 2024 12:40:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486946CDB1;
	Tue,  7 May 2024 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085611; cv=none; b=hH/Jtuk8bhmEIRRuUemAQpSdUR1o+oS+/u5y1XpZTtfkt3sVqmuOwz+a7RFgiCi46dogGdjA/JIodosOGgbXkHOMRThPrGKP1ZqKJQgVBc2gaS2ntz/gyiBiLX+lFAqzZ3gxVhwuJrlwWxu3tUxpymvJ4LDSmeVlQtXVgaTa6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085611; c=relaxed/simple;
	bh=qZ8b0oykuOVN2jQ+TYiBmJil/Vb9AlVKBML2Yxhc79U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPEBilfCYR2mDkVlGMK12qf6ovMBlnh8xTDpM2McdDEZWbVn7csaTpbZILfSdRUfZITKuexBMzhyO01s7r5ubAOVwX4zXUHSiXZGAfjuZWa72G5uQv9vKyhNNJPBss8sT3QlO6ytn9DfdOjbVNPuIP7O1ueEBNaTaSp1OqlA1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 14:34:10 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 019A880666;
	Tue,  7 May 2024 14:34:10 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id E2121181132; Tue,  7 May 2024 14:34:09 +0200 (CEST)
Date: Tue, 7 May 2024 14:34:09 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 1/2] riscv: make image compression configurable
Message-ID: <ZjofwZDHYg8yYKeK@buildd.core.avm.de>
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
 <20240504193446.196886-2-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240504193446.196886-2-emil.renner.berthing@canonical.com>
X-purgate-ID: 149429::1715085250-25CCED52-3CFB73E6/0/0
X-purgate-type: clean
X-purgate-size: 897
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sat, May 04, 2024 at 09:34:38PM +0200, Emil Renner Berthing wrote:
> Previously the build process would always set KBUILD_IMAGE to the
> uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) and
> unconditionally compress it into Image.gz. However there are already
> build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
> Image.zstd, so let's make use of those, make the compression method
> configurable and set KBUILD_IMAGE accordingly so that targets like
> 'make install' and 'make bindeb-pkg' will use the chosen image.
> 
> Tested-by: Björn Töpel <bjorn@rivosinc.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
> Changes in v2:
> - Rebase on riscv/for-next
> - Use boot-image-$(CONFIG_..) := assignments rather than ifeq train
> ---

Looks good to me.

Reviewed-by: Nicolas Schier <n.schier@avm.de>

