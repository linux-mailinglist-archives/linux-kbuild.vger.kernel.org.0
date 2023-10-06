Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3477BBD6C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 19:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjJFRCf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 13:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFRCe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 13:02:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF143AD
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 10:02:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E759C433C7;
        Fri,  6 Oct 2023 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696611753;
        bh=HIXbEAQXZMXkQa+jO400Hayzx5KeK6Nh8H1aDdCu7/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bnwRqAYU0jPW/TY0l2yFi4v4toPK3o3abv0TSN5DduVTRkgxmnD5xT2MIG1eV1huc
         zy9WkyDOuKtaPK2e9RnAdHIaGovn6fMwbj5W0PwyCttIPFYn3ZtIbxh9HsN/Acaygl
         D0BLlzCcKDeC+F/LlcEQSowH/hus6uhq92xPhwYH+NEUahnRWFCwqrP1f+qGqWcanN
         JdOhnrwt9V/6B/vbDGir1FnhhyzUYROPnKzD3N1KKbUn9tPEZl5zcsR3UT89aFKKqt
         eQZS73dvzgGWspb7BiDMruZq8Dyb2QC395a/gcIBUeVGzztx/NuqpupgMkqbqFR9Vn
         QsT/WA8Y9M8Nw==
Date:   Fri, 6 Oct 2023 10:02:31 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915: drop -Wall and related disables from
 cflags as redundant
Message-ID: <20231006170231.GB3359308@dev-arch.thelio-3990X>
References: <cover.1696595500.git.jani.nikula@intel.com>
 <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 06, 2023 at 03:34:46PM +0300, Jani Nikula wrote:
> The kernel top level Makefile, and recently scripts/Makefile.extrawarn,
> have included -Wall, and the disables -Wno-format-security and
> $(call cc-disable-warning,frame-address,) for a very long time. They're
> redundant in our local subdir-ccflags-y and can be dropped.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Yeah, this seems totally reasonable. I always assumed the intention of
-Wall was to re-enable some warnings that the rest of the kernel had
turned off but I think we are getting better about auditing what
warnings are explicitly turned off and getting some of those turned back
on for the whole kernel, so I expect this to basically be a no-op.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/i915/Makefile | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index dec78efa452a..623f81217442 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -5,22 +5,20 @@
>  
>  # Add a set of useful warning flags and enable -Werror for CI to prevent
>  # trivial mistakes from creeping in. We have to do this piecemeal as we reject
> -# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
> +# any patch that isn't warning clean, so turning on -Wextra (or W=1) we
>  # need to filter out dubious warnings.  Still it is our interest
>  # to keep running locally with W=1 C=1 until we are completely clean.
>  #
> -# Note the danger in using -Wall -Wextra is that when CI updates gcc we
> +# Note the danger in using -Wextra is that when CI updates gcc we
>  # will most likely get a sudden build breakage... Hopefully we will fix
>  # new warnings before CI updates!
> -subdir-ccflags-y := -Wall -Wextra
> -subdir-ccflags-y += -Wno-format-security
> +subdir-ccflags-y := -Wextra
>  subdir-ccflags-y += -Wno-unused-parameter
>  subdir-ccflags-y += -Wno-type-limits
>  subdir-ccflags-y += -Wno-missing-field-initializers
>  subdir-ccflags-y += -Wno-sign-compare
>  subdir-ccflags-y += -Wno-shift-negative-value
>  subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> -subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  
>  # Fine grained warnings disable
> -- 
> 2.39.2
> 
