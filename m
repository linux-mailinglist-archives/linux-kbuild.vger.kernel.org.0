Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBD77BE6AB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 18:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377245AbjJIQil (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 12:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377291AbjJIQik (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 12:38:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70746AF
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 09:38:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EF2C433C7;
        Mon,  9 Oct 2023 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696869519;
        bh=MSbNJzxR5Uxb0K+7ztElxHBM3Hj8ixSJi5qLk0iBaMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QGwJpxqDz0aWM/BosmKez3lWAzKO+tIizIY36faOYAH58uTLnp/LRvmv+60FlDGVe
         j+nJdg6GSQNkrt2VQyGWEgLwrD8L9SERIVo2+5HUKmwIUtodiwZ6jnCQsc8ShIslMn
         6kkKaaC7DRHQ/B5LgLHxL/mCEleCGkegj26CeiHwZGAUXnmeUbYw4NvJ0Ps/jt5v8A
         uoDLD68YHxnJ/ztUMTWuuJVCLSR5Z4dy6qIYEi1mEWwH5PSODGxwFCcWfmj32QBYsl
         GmaRQP3mNh23EAW9bZCm31L9FDMjQet0Sx7tqfFJ89tjtX7gxxXAyWGgJICUSLOGZD
         cmCfoaJPEy/RA==
Date:   Mon, 9 Oct 2023 09:38:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] drm/i915: drop -Wall and related disables from
 cflags as redundant
Message-ID: <20231009163837.GA1153868@dev-arch.thelio-3990X>
References: <cover.1696595500.git.jani.nikula@intel.com>
 <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
 <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 08, 2023 at 12:28:46AM +0900, Masahiro Yamada wrote:
> On Fri, Oct 6, 2023 at 9:35 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >
> > The kernel top level Makefile, and recently scripts/Makefile.extrawarn,
> > have included -Wall, and the disables -Wno-format-security and
> > $(call cc-disable-warning,frame-address,) for a very long time. They're
> > redundant in our local subdir-ccflags-y and can be dropped.
> >
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> I made a similar suggestion in the past
> https://lore.kernel.org/dri-devel/20190515043753.9853-1-yamada.masahiro@socionext.com/
> 
> So, I am glad that Intel has decided to de-duplicate the flags.
> 
> 
> 
> I think you can drop more flags.
> 
> For example,
> 
>  subdir-ccflags-y += -Wno-sign-compare
> 
> 
> It is set by scripts/Makefile.extrawarn
> unless W=3 is passed.
> 
> 
> If W=3 is set by a user, -Wsign-compare should be warned
> as it is the user's request.
> 
> 
> drivers/gpu/drm/i915/Makefile negates W=3.
> There is no good reason to do so.
> 
> 
> Same applied to
> 
> 
> subdir-ccflags-y += -Wno-shift-negative-value

As I point out in my review of the second patch [1], I am not sure these
should be dropped because -Wextra turns these warnings back on, at least
for clang according to this build report [2] and my own testing, so they
need to be disabled again.

[1]: https://lore.kernel.org/20231006174550.GC3359308@dev-arch.thelio-3990X/
[2]: https://lore.kernel.org/202310070011.Fji48IBk-lkp@intel.com/

Cheers,
Nathan.
