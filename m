Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C0D3EFDD0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 09:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238482AbhHRHhx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 03:37:53 -0400
Received: from mga07.intel.com ([134.134.136.100]:49516 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238231AbhHRHhw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 03:37:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="280011578"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="280011578"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 00:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="462650649"
Received: from pl-dbox.sh.intel.com (HELO pl-dbox) ([10.239.159.39])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2021 00:37:12 -0700
Date:   Wed, 18 Aug 2021 15:31:26 +0800
From:   Philip Li <philip.li@intel.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
Message-ID: <20210818073126.GA1648816@pl-dbox>
References: <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
 <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
 <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
 <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com>
 <202108171602.159EB2C7EA@keescook>
 <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
 <20210818042720.GA1645557@pl-dbox>
 <d19dd1f7-3898-227a-3d7d-25cddb0434d0@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d19dd1f7-3898-227a-3d7d-25cddb0434d0@embeddedor.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 11:45:48PM -0500, Gustavo A. R. Silva wrote:
> 
> 
> On 8/17/21 23:27, Philip Li wrote:
> 
> >> Philip, how often is the kernel test robot's clang version rebuilt? Would it
> >> be possible to bump it to latest ToT or at least
> >> 9ed4a94d6451046a51ef393cd62f00710820a7e8 so that we do not get bit by this
> >> warning when we go to enable this flag?
> > Got it, currently we do upgrade in weekly cadence (but it may fall behind sometimes),
> > and the one we use now is clang version 14.0.0 (https://github.com/llvm/llvm-project 
> > 2c6448cdc2f68f8c28fd0bd9404182b81306e6e6)
> > 
> > We will ugrade to the head of llvm-project master today.
> 
> Thanks, Philip. We really appreciate it.
you are welcome. Per the upgrade in this noon. Now we start to use below commit to
do further clang build test (which is after the required 9ed4a94d6451)

commit d2b574a4dea5b718e4386bf2e26af0126e5978ce
Author: Marco Elver <elver@google.com>
Date:   Tue Aug 17 16:54:07 2021 +0200

    tsan: test: Initialize all fields of Params struct

Thanks

> --
> Gustavo
