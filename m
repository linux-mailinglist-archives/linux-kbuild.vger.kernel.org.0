Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993FA7B7127
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Oct 2023 20:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240780AbjJCSiZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Oct 2023 14:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240779AbjJCSiY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2023 14:38:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8E390
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Oct 2023 11:38:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F329C433C7;
        Tue,  3 Oct 2023 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696358301;
        bh=w+hkcQonpgENNslO4mYy+3TWh2m51b6lpYuyG117pFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nfpwablmI3E8fNBEMyFoBVQDb0Usvd4Yo9vw1jLsXSEOmu/8p4vOqD3IkgXjVmvvx
         APzJqXklp7L86yY6csj735WEcyNaGiyn1RiieSMa8pDeJIuiLL+TvgTfpk8lwDVlmp
         XQHPdG0Ka9CJEdJhVbUogBDViGuwklFE3P+apLHvuTX8Ed4SriC98QOB/WehrH7tDz
         o0HO8Hca2nw/rFniuwJYkyxg+hjLi8HkwqqnMr2qC3Pj6MWf2qwEZLN8nCrAptkdkF
         6LTARQsYCsZNKPIoPzaI3tu7D92soIxRTYqKNBcRf9zV7ejz54ul7s+cWT9B++mwYA
         jJzTJlpwpYgmA==
Date:   Tue, 3 Oct 2023 11:38:18 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     masahiroy@kernel.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, ndesaulniers@google.com,
        keescook@chromium.org, samitolvanen@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: Enable
 -Wincompatible-function-pointer-types-strict in W=1
Message-ID: <20231003183818.GA1211904@dev-arch.thelio-3990X>
References: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
 <202310031340.v1vPh207-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310031340.v1vPh207-lkp@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 03, 2023 at 01:53:34PM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on ce9ecca0238b140b88f43859b211c9fdfd8e5b70]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Enable-Wincompatible-function-pointer-types-strict-in-W-1/20231003-062107
> base:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
> patch link:    https://lore.kernel.org/r/20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d%40kernel.org
> patch subject: [PATCH] kbuild: Enable -Wincompatible-function-pointer-types-strict in W=1
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231003/202310031340.v1vPh207-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031340.v1vPh207-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310031340.v1vPh207-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

...

> >> arch/um/drivers/net_kern.c:353:21: warning: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Wincompatible-function-pointer-types-strict]
>      353 |         .ndo_start_xmit         = uml_net_start_xmit,
>          |                                   ^~~~~~~~~~~~~~~~~~
>    13 warnings generated.

I have sent a patch to resolve this, thanks for the report!

https://lore.kernel.org/20231003-um-net-wifpts-v1-1-02888c634ee7@kernel.org/

Cheers,
Nathan
