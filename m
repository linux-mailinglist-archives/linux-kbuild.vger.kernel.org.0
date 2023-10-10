Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6557BF5D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Oct 2023 10:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442752AbjJJI3i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Oct 2023 04:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442787AbjJJI3h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2023 04:29:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F54C4
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Oct 2023 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696926575; x=1728462575;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=A2D0SqTWwvlaPS6v06qytKXFVey++gNz9DKsZnREo9c=;
  b=B1Qq0H9F87YmSoVWNZSNicBlozJRf4tFzl5YnJPoiw3GVJcgtJBXGD7Q
   grAy+JjiSAGzbkCoy6PCTy3M40ZTabywegv0t3We33wocnlK7HGc6JiKi
   GArPeOE/D7w7PCbnf9bB32ovYsXw1tVRRNa1SUM5GFRgk5L2dsYt/OytD
   OUlbNKYv+LeobkwQgdhVFmyYtsVB1EC+3legq3AYh7LwvR3Ysu5nc+JfR
   KSuT79lWpaLrXTeVR3iuHtT8HDmlCxegJArNgNvVug1QVQ64gZ07o28oV
   MWLWyWebnNPSAC6162oEGGqpS529C0BA8t++BaPR6P5tqjJr1lA3f4zIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470604982"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="470604982"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869587507"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="869587507"
Received: from pors-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.42.155])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:29:32 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] drm/i915: drop -Wall and related disables from
 cflags as redundant
In-Reply-To: <20231009163837.GA1153868@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696595500.git.jani.nikula@intel.com>
 <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
 <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
 <20231009163837.GA1153868@dev-arch.thelio-3990X>
Date:   Tue, 10 Oct 2023 11:29:29 +0300
Message-ID: <87o7h66fti.fsf@intel.com>
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

On Mon, 09 Oct 2023, Nathan Chancellor <nathan@kernel.org> wrote:
> On Sun, Oct 08, 2023 at 12:28:46AM +0900, Masahiro Yamada wrote:
>> On Fri, Oct 6, 2023 at 9:35=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>> >
>> > The kernel top level Makefile, and recently scripts/Makefile.extrawarn,
>> > have included -Wall, and the disables -Wno-format-security and
>> > $(call cc-disable-warning,frame-address,) for a very long time. They're
>> > redundant in our local subdir-ccflags-y and can be dropped.
>> >
>> > Cc: Arnd Bergmann <arnd@arndb.de>
>> > Cc: Nick Desaulniers <ndesaulniers@google.com>
>> > Cc: Nathan Chancellor <nathan@kernel.org>
>> > Cc: Masahiro Yamada <masahiroy@kernel.org>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>>=20
>> I made a similar suggestion in the past
>> https://lore.kernel.org/dri-devel/20190515043753.9853-1-yamada.masahiro@=
socionext.com/
>>=20
>> So, I am glad that Intel has decided to de-duplicate the flags.
>>=20
>>=20
>>=20
>> I think you can drop more flags.
>>=20
>> For example,
>>=20
>>  subdir-ccflags-y +=3D -Wno-sign-compare
>>=20
>>=20
>> It is set by scripts/Makefile.extrawarn
>> unless W=3D3 is passed.
>>=20
>>=20
>> If W=3D3 is set by a user, -Wsign-compare should be warned
>> as it is the user's request.
>>=20
>>=20
>> drivers/gpu/drm/i915/Makefile negates W=3D3.
>> There is no good reason to do so.
>>=20
>>=20
>> Same applied to
>>=20
>>=20
>> subdir-ccflags-y +=3D -Wno-shift-negative-value
>
> As I point out in my review of the second patch [1], I am not sure these
> should be dropped because -Wextra turns these warnings back on, at least
> for clang according to this build report [2] and my own testing, so they
> need to be disabled again.

Yeah. The focus is on enabling W=3D1 warnings by default for i915. I get
that the disables we have to add to achieve that also disable some W=3D2
and W=3D3 warnings. But taking all of that into account requires
duplicating even more of Makefile.extrawarn (checking for warning
levels, maintaining parity with the different levels, etc.).

I guess we could check if KBUILD_EXTRA_WARN does not have any of 1, 2,
or 3, but very few places outside of the build system look at
KBUILD_EXTRA_WARN, so feels wrong.

BR,
Jani.


>
> [1]: https://lore.kernel.org/20231006174550.GC3359308@dev-arch.thelio-399=
0X/
> [2]: https://lore.kernel.org/202310070011.Fji48IBk-lkp@intel.com/
>
> Cheers,
> Nathan.

--=20
Jani Nikula, Intel
