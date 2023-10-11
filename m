Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F9A7C5EC0
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 22:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbjJKUyV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 16:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbjJKUyU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 16:54:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F376E90
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 13:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697057659; x=1728593659;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=QNf3Q7ICUXumxY53qJthomE1Ml2suVDO5yj6WJnjsFU=;
  b=NTGsnnX+JdfuC9OUpv4KLysNohaAIm25GtluEQzDdANT+dEi5IER7WYD
   8ntBFZBCU+Sb5vMz3Cv7Hfn+9tTFBUZFsUc54ULe79C9Yn1sowUsI6gv5
   is7rFDtiwrsCHkskeCpbwSXvT9BJ7QviIXbHYyAA3W415zuf9ccoyjqOM
   dnfzMMjb5MjVF2U1qfEnNkv51ydetg30SviB/7LK8vl67L9E3QCTMu/KE
   rKKF6IZTSYMS06ffDFa70DtJ7LUpRKLXidnp8z+IMLLpnQKxNCu+fl223
   L1QuhCo3lYFsnHdB4VMQtx4HPXytXatOvE1Cpkq6OLtyW0x8L+RDExNFm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3352203"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3352203"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897794990"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="897794990"
Received: from lpaczyn-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.57.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:52:29 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915: enable W=1 warnings by default
In-Reply-To: <CAK7LNAQ1K4X6=jW1b8cyS9vs_hpn+YGzF2qw7YTFawo-bs_9gQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1697009258.git.jani.nikula@intel.com>
 <69a812273091b6535ddc7f9346289d71bb30f43d.1697009258.git.jani.nikula@intel.com>
 <CAK7LNAQ1K4X6=jW1b8cyS9vs_hpn+YGzF2qw7YTFawo-bs_9gQ@mail.gmail.com>
Date:   Wed, 11 Oct 2023 23:54:13 +0300
Message-ID: <87wmvs3moa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 11 Oct 2023, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Oct 11, 2023 at 4:29=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> We enable a bunch more compiler warnings than the kernel
>> defaults. However, they've drifted to become a unique set of warnings,
>> and have increasingly fallen behind from the W=3D1 set.
>>
>> Align with the W=3D1 warnings from scripts/Makefile.extrawarn for clarit=
y,
>> by copy-pasting them with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it
>> easier to compare in the future.
>>
>> Some of the -Wextra warnings do need to be disabled, just like in
>> Makefile.extrawarn, but take care to not disable them for W=3D2 or W=3D3
>> builds, depending on the warning.
>>
>> v2: Add back some -Wextra warning disables (Nathan)
>>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the reviews everyone...

...though we missed some s/KBUILD_CFLAGS/subdir-ccflags-y/ in v2. Fixed
while applying.

BR,
Jani.


--=20
Jani Nikula, Intel
