Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2D1423596
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Oct 2021 03:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhJFBtL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 21:49:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhJFBtL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 21:49:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D00A611CC;
        Wed,  6 Oct 2021 01:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1633484838;
        bh=Xt+wZ6PkpbqGmpCET0SN48ylqvwvPAINuGHGp2TK1uY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IxA2DMOOXNCn02Sbwsru0IXmgNMs9rv4nMcyqr06+2YctzkpKzNPO6CCXPdKM1Np0
         t7lmbu0FEO37bLus65CjV0G166hksDhs7XFigmUyv4IM9aFkaL9zjCRpK2rOMsWEqX
         EkL6cytWknEjtB//VUBv0jEX19efvyxzhNHUIrns=
Date:   Tue, 5 Oct 2021 18:47:17 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andy Whitcroft <apw@canonical.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tejun Heo <tj@kernel.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 4/8] slab: Add __alloc_size attributes for better
 bounds checking
Message-Id: <20211005184717.65c6d8eb39350395e387b71f@linux-foundation.org>
In-Reply-To: <20210930222704.2631604-5-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
        <20210930222704.2631604-5-keescook@chromium.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 30 Sep 2021 15:27:00 -0700 Kees Cook <keescook@chromium.org> wrote:

> As already done in GrapheneOS, add the __alloc_size attribute for regular
> kmalloc interfaces, to provide additional hinting for better bounds
> checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> optimizations.

x86_64 allmodconfig:

In file included from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/gfp.h:6,
                 from ./include/linux/mm.h:10,
                 from ./include/linux/mman.h:5,
                 from lib/test_kasan_module.c:10:
In function 'check_copy_size',
    inlined from 'copy_user_test' at ./include/linux/uaccess.h:191:6:
./include/linux/thread_info.h:213:4: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
  213 |    __bad_copy_to();
      |    ^~~~~~~~~~~~~~~
In function 'check_copy_size',
    inlined from 'copy_user_test' at ./include/linux/uaccess.h:199:6:
./include/linux/thread_info.h:211:4: error: call to '__bad_copy_from' declared with attribute error: copy source size is too small
  211 |    __bad_copy_from();
      |    ^~~~~~~~~~~~~~~~~
make[1]: *** [lib/test_kasan_module.o] Error 1
make: *** [lib] Error 2

