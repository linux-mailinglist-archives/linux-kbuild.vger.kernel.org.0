Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FDD7C4BDC
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 09:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344868AbjJKHbp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 03:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344641AbjJKHbp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 03:31:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85F398
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697009503; x=1728545503;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=BrYQUkORXNWK96QnfPZBm35az/Tgpuxk/0trKjL9YTs=;
  b=RF5dc+ElvpaQqtcJWs/Ynprsdyi1Cj+JlmN74eVlj/ec8SrQNQd+Q2m5
   rPGI3htFrof7HCJ9bU90MN7EmgBV/8D6Fx0aGRbFJ5FSxgn9begmkrad4
   vExc8iY0L3G6KdlEfkFVFzVqIzrywoanqfqFkzNMaO/wMBIO8tTHRAvBF
   fWQH36b4rO0XBQfqumQYy0rBjWmqJrrU1zsoyv3VX2mHtvw60RxR7mTmm
   jmT/SkWMUSvHh/U0yivULIDTIKglAon8zoohvPQHBZ3Bs0XnV77upGjxQ
   AgVw9n9HIMz0vYKK5fvQJPkUN/vDtzLH+X8WwOhuzsN6TPDm+YlOXe3+h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381850585"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="381850585"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="824064122"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="824064122"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.56.229])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:31:41 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        intel-gfx@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kbuild@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: drop -Wall and related
 disables from cflags as redundant
In-Reply-To: <CAKwvOdk-h_Bvz9iFN=fMMn14A=8iwoPgSS27iZVmy4auTXCYvA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696595500.git.jani.nikula@intel.com>
 <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
 <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
 <20231009163837.GA1153868@dev-arch.thelio-3990X>
 <87o7h66fti.fsf@intel.com> <87h6my6evg.fsf@intel.com>
 <CAKwvOdk-h_Bvz9iFN=fMMn14A=8iwoPgSS27iZVmy4auTXCYvA@mail.gmail.com>
Date:   Wed, 11 Oct 2023 10:31:38 +0300
Message-ID: <871qe162ed.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 10 Oct 2023, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Tue, Oct 10, 2023 at 1:50=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>> This is the simplest I could think of:
>>
>> # The following turn off the warnings enabled by -Wextra
>> ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>> KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
>> KBUILD_CFLAGS +=3D -Wno-type-limits
>> KBUILD_CFLAGS +=3D -Wno-shift-negative-value
>> endif
>> ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
>> KBUILD_CFLAGS +=3D -Wno-sign-compare
>> endif
>>
>> Masahiro, I'd like to get your feedback on which to choose,
>> unconditionally silencing the W=3D2/W=3D3 warnings for i915, or looking =
at
>> KBUILD_EXTRA_WARN.
>
> KBUILD_EXTRA_WARN looks better to me; otherwise they would be hidden
> forever (or nearly).  Suffer some duplication, w/e.

Thanks, sent v2 with this [1].

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1697009258.git.jani.nikula@intel.com

--=20
Jani Nikula, Intel
