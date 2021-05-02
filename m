Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F7E370E9D
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 20:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhEBSui (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 14:50:38 -0400
Received: from gate.crashing.org ([63.228.1.57]:45049 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230036AbhEBSui (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 14:50:38 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 142IbL6B028576;
        Sun, 2 May 2021 13:37:21 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 142IbKUo028575;
        Sun, 2 May 2021 13:37:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Sun, 2 May 2021 13:37:19 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502183719.GG10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 02, 2021 at 12:15:38AM +0900, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]
> 
> I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

Both of these are GCC version 5.  GCC 5.1 is the first release of that,
GCC 5.2 the second, etc.  Everyone should always use an as new release
as practical, since many bugs will be fixed, and nothing else changed.

See <https://gcc.gnu.org/develop.html#num_scheme>.

So, this means everyone using GCC 5 should be using the GCC 5.5 release!

If there is something about 5.1 that makes it produce bad kernels on
some arch, make that arch's Makefile complain?  Same with binutils etc.


Segher
