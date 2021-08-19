Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D1D3F15D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 11:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhHSJKy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 05:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhHSJKy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 05:10:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75588C061575;
        Thu, 19 Aug 2021 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BB3eovbADGqKgiTpHYPV8MhbF7KZE2vZESe22SutjKY=; b=tp3WS7v9Zygm06TNajk0XqWnMz
        P2wYtvT4QuFvfFTmN/8k8gp+4KF2M5gfWZgHY1qlmfZ5ZKFNDdPtaUQ/ZAITnfsHIiuJIhdmvmhM3
        y+8puRoYQbF00lMdH4buZMdWpwjEpUwPbB6f43Fzn2l2TUYpO+FcsuI2yV2onNNphqZuEcab1NcSc
        0qhveoNcWu+0IOuenNwujlGQNwntv29LRT2cp0k2p39R4arOotTp9GfUrHxpyd6s++TlM2gB7Dqa4
        d4j8H4d5Or3QMdJO09MToT/Kr6Bznnd5dZHY3ICdmdvphXMv+oMZ+XdRkYnJZlW+Zl7lm9jKQQ/zk
        pl2PXQCA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mGe2o-004qz3-9B; Thu, 19 Aug 2021 09:09:24 +0000
Date:   Thu, 19 Aug 2021 10:09:02 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/5] Add __alloc_size() for better bounds checking
Message-ID: <YR4frlpfJQonPuKp@infradead.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818050841.2226600-1-keescook@chromium.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 10:08:36PM -0700, Kees Cook wrote:
> Hi,
> 
> GCC and Clang both use the "alloc_size" attribute to assist with bounds
> checking around the use of allocation functions. Add the attribute,
> adjust the Makefile to silence needless warnings, and add the hints to
> the allocators where possible. These changes have been in use for a
> while now in GrapheneOS.

Can you explain how this attribute helps?  Should we flow it through
other allocating functions?
