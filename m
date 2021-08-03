Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848523DE407
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Aug 2021 03:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhHCBeU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 21:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhHCBeR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 21:34:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0C2C06175F;
        Mon,  2 Aug 2021 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=6binG8ap9CTuGzImVmNqLKbVkvaarZSfoUBW8rg2IY4=; b=iwraDYHaJ2O6+9hYwZY3Rw/Yez
        lU1/scCe6CzC+mFnm4UKNoCfWQxg1aXzW0X+Y9xd5It4m60JQxHn7DP40f7gH5zXSCsJG+Bfln5x3
        Qu/M2WplZWSKVmjGNefQxguLe1NDpRDILa/Lrv2aMfo8SHa4J4jNX9vd+U+OwINUl0XP97Pqep20N
        C7NuwIMRtlH9qCY6pSLLvgUNalHoZ55jBDtxS6EaMxN9lAM979CY2SoKj2EEjuyEc+WL2gI7ukoTd
        nVoKH5L3o00zWRNzC+s83dUB2xD6dqKAvTdO+jsIoCJJB7kgB6WGjpCGNpTViABpT6ctCqaBxXBP7
        6bwke9Qw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mAjIQ-0045Vd-RY; Tue, 03 Aug 2021 01:32:51 +0000
Date:   Tue, 3 Aug 2021 02:32:42 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
Message-ID: <YQicuh/Qtj0AfxdK@casper.infradead.org>
References: <20210802234304.3519577-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802234304.3519577-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 02, 2021 at 04:43:03PM -0700, Nick Desaulniers wrote:
> +++ b/Documentation/kbuild/llvm.rst
> @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
>  	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>  	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>  
> -Currently, the integrated assembler is disabled by default. You can pass
> -``LLVM_IAS=1`` to enable it.
> +Currently, the integrated assembler is enabled by default. You can pass
> +``LLVM_IAS=0`` to disable it.

I'd drop the "Currently,".  This is presumably going to be the default
going forward unless there's some horrible unforeseen problem.  The
"Currently," implies that we're planning on changing it.

