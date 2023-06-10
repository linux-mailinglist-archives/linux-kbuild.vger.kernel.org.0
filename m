Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45EA72A97B
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 08:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjFJGtp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Jun 2023 02:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjFJGtn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Jun 2023 02:49:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EAD3A8D;
        Fri,  9 Jun 2023 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686379781; x=1717915781;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=UiBaKKuIu48RRz7kin0VOWL4SjKi6DsOcDmvTbBe48o=;
  b=GE5xsn8mMwhzkAcFerl9x7GXUERULvHJazT6PubSlF3LpV3RjvF0QHWJ
   Ma6YG308e0EdyupMJcYuysosj1g+5hx78RmsIuSkbKfL1zzrhbzi1oHPJ
   h2GSvyKCRyuESotwpzWZxpxxdoRWtmD0JRxkACsj5P02ijpIwxwHUqCXO
   5y0paXnufyDhg75xjNQcs40u0GHIRgf55oA8kxXnjFkfMb0giEjy4r9/z
   RfMbzyq0COBMl+WIcLr0jgEuDLsqRe6zh7S9skOqJ8HZN9qVzcn4qMs/r
   40JYSF61zNAcM98az+lBy/3qNZjTbuQHq3S3CCehKpFhZDney6Z4DnqKG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360220140"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="360220140"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 23:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="661001719"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="661001719"
Received: from mnovakov-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.60.33])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 23:49:34 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Tao Zhou <tao.zhou1@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
        linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
        Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        James Zhu <James.Zhu@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amd/amdgpu: enable W=1 for amdgpu
In-Reply-To: <CAK7LNAQArK=+Qy+yQU2qB-0pCKyWugsQ=VGXUzLUf+tPow5M_w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230609164207.430377-1-hamza.mahfooz@amd.com>
 <20230609201754.GA3961359@dev-arch.thelio-3990X>
 <CAK7LNAQArK=+Qy+yQU2qB-0pCKyWugsQ=VGXUzLUf+tPow5M_w@mail.gmail.com>
Date:   Sat, 10 Jun 2023 09:49:31 +0300
Message-ID: <875y7vrev8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 10 Jun 2023, Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Sat, Jun 10, 2023 at 5:17=E2=80=AFAM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> + Masahiro and linux-kbuild
>>
>> On Fri, Jun 09, 2023 at 12:42:06PM -0400, Hamza Mahfooz wrote:
>> > We have a clean build with W=3D1 as of
>> > commit 12a15dd589ac ("drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
>> > SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef"). So, let's enab=
le
>> > these checks unconditionally for the entire module to catch these erro=
rs
>> > during development.
>> >
>> > Cc: Alex Deucher <alexander.deucher@amd.com>
>> > Cc: Nathan Chancellor <nathan@kernel.org>
>> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>
>> I think this is fine, especially since it will help catch issues in
>> amdgpu quickly and hopefully encourage developers to fix their problems
>> before they make it to a tree with wider impact lika -next.
>>
>> However, this is now the third place that W=3D1 has been effectively
>> enabled (i915 and btrfs are the other two I know of) and it would be
>> nice if this was a little more unified, especially since it is not
>> uncommon for the warnings under W=3D1 to shift around and keeping them
>> unified will make maintainence over the longer term a little easier. I
>> am not sure if this has been brought up in the past and I don't want to
>> hold up this change but I suspect this sentiment of wanting to enable
>> W=3D1 on a per-subsystem basis is going to continue to grow.
>
>
>
> I believe this patch is the right way because
> we will be able to add a new warning option to
> scripts/Makefile.extrawarn without fixing any code.
>
> I remember somebody argued that drivers should be
> able to do
>   subdir-ccflags-y +=3D $(W1_FLAGS)

Personally, I think this would be the viable way to make the kernel free
of W=3D1 warnings. Make it clean driver and subsystem at a time, with
constant progress. Currently, there's haphazard fixing of issues, with
new ones creeping back in, because kernel-wide W=3D1 is too verbose for
most developers. It's whac-a-mole.

> However, if a new flag, -Wfoo, emits warnings
> for drivers/gpu/drm/{i915,amd},
> you cannot add it to W=3D1 until fixing the code.

Or adding -Wno-foo where it breaks, until fixed.

> If many drivers start to do likewise,
> W=3D1 warning will not be W=3D1 any more.

I don't know, is the goal to fix the warnings, or keep adding stuff to
W=3D1 so that it'll always emit warnings? :p


BR,
Jani.

> Another good thing for hard-coding warning options
> is you can lift up a warning flag one by one.
>
>
> Let's say you fixed the entire DRM subsystem so
> it is -Wunused free now.
>
> Then, you can move -Wunused to drivers/gpu/drm/Makefile,
> while other warning options stay in drivers Makefiles.
>
>
>
>
>
>
>
>>
>> Regardless, for clang 11.1.0 to 16.0.5, I see no warnings when building
>> drivers/gpu/drm/amd/amdgpu/ with Arch Linux's configuration or
>> allmodconfig.
>>
>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>> Tested-by: Nathan Chancellor <nathan@kernel.org>
>>
>> > ---
>> >  drivers/gpu/drm/amd/amdgpu/Makefile | 13 ++++++++++++-
>> >  1 file changed, 12 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile
>> > index 86b833085f19..8d16f280b695 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> > +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> > @@ -40,7 +40,18 @@ ccflags-y :=3D -I$(FULL_AMD_PATH)/include/asic_reg \
>> >       -I$(FULL_AMD_PATH)/amdkfd
>> >
>> >  subdir-ccflags-y :=3D -Wextra
>> > -subdir-ccflags-y +=3D $(call cc-option, -Wunused-but-set-variable)
>> > +subdir-ccflags-y +=3D -Wunused
>> > +subdir-ccflags-y +=3D -Wmissing-prototypes
>> > +subdir-ccflags-y +=3D -Wmissing-declarations
>> > +subdir-ccflags-y +=3D -Wmissing-include-dirs
>> > +subdir-ccflags-y +=3D -Wold-style-definition
>> > +subdir-ccflags-y +=3D -Wmissing-format-attribute
>> > +# Need this to avoid recursive variable evaluation issues
>> > +cond-flags :=3D $(call cc-option, -Wunused-but-set-variable) \
>> > +     $(call cc-option, -Wunused-const-variable) \
>> > +     $(call cc-option, -Wstringop-truncation) \
>> > +     $(call cc-option, -Wpacked-not-aligned)
>> > +subdir-ccflags-y +=3D $(cond-flags)
>> >  subdir-ccflags-y +=3D -Wno-unused-parameter
>> >  subdir-ccflags-y +=3D -Wno-type-limits
>> >  subdir-ccflags-y +=3D -Wno-sign-compare
>> > --
>> > 2.40.1
>> >

--=20
Jani Nikula, Intel Open Source Graphics Center
