Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8ABD7C00A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Oct 2023 17:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjJJPql (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Oct 2023 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbjJJPqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2023 11:46:37 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0965C6
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Oct 2023 08:46:35 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40684f53d11so59397665e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Oct 2023 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696952794; x=1697557594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsRME75SktuOynY77PzFb87AxR5zi2B5TSAOuz/xU6Y=;
        b=SbfwoU2tPGJC7RwfDCEs6ZwuPPPNSYxQYcZXgDETLc8uPNhB1uNEfzM9F2j4oB9tUg
         oqQf8ZkHva2nQud0FOVwXIrEaBVLsB0ySYfpbsWi3EeyCRHeK3BkWGZLGtTWTDf3tMog
         wYg33lHi+JgB342/2UfG3GCGPt8dkC3IBfxI7U62ZdlBON10qz0aYxpzWPtKTqDnLWtI
         ep8yUxo09yTRbjGPzegYVyv52fjQ/bTvCW77K20TC/jurFvm7UvvIHNO9dFb9IgKsFH0
         xCl/zPd6RYT4A/GTpHJW7qTngtzVzjvf25H3S69p2ejxnmS8WdnBG5kA/BmxfQh8fK7Z
         L6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696952794; x=1697557594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsRME75SktuOynY77PzFb87AxR5zi2B5TSAOuz/xU6Y=;
        b=po6TT3D+W+rkPEjVftX1ptfb4flW6bfy8SA1oIGdUWU8kN0nneCpgNN8KDjMIpxXRH
         27PLQPpmeXhFzf8iebBikC4SQKj5FT/TjbXwlQO+a4B6bT/IJ4N+NVEiWd7sdoE6rbBc
         fvmdCTpNXhbR1Pfim5s1iAZhNTOpwRFF3ToADwdGl5QjKWDDhZrR9xjC5JXoawrTlvtc
         ckUFz4Lb89JGKFYuEpYJbRFnXsT2MKQAdxM72zyYWEHqQx5oG02JPYquz39ld5DhPSgP
         IcpMo+ngn0uGCNqhc0XxTJv/aBmELmlxGVap9hm6pPfZxRxfvlE9pmNX3t7uTvbUOh37
         qAuw==
X-Gm-Message-State: AOJu0YxH7v5ryQPKBBiR3DYzxUoBet4Tir/S7UBpGoTxrf3RR2OiFxnj
        SV0H7EnYicjRVhB1NRYsyEdSIbIwqkAbZoCRQTP5cg==
X-Google-Smtp-Source: AGHT+IFduVmWdQfFCzBsYfMUfgVSOUDKPhtHViKnEgQHh0lN9dk88Ktq93jhS9gBDh5GXqpR4v/Qc0PrVp5QFHxz5Zs=
X-Received: by 2002:a05:600c:2247:b0:405:359e:ee43 with SMTP id
 a7-20020a05600c224700b00405359eee43mr17753164wmm.1.1696952793888; Tue, 10 Oct
 2023 08:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696595500.git.jani.nikula@intel.com> <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
 <CAK7LNAT6MzbcjR7KZMEFUCHkq+WXgTB=Qmp_VD4UC7TvMg+dMg@mail.gmail.com>
 <20231009163837.GA1153868@dev-arch.thelio-3990X> <87o7h66fti.fsf@intel.com> <87h6my6evg.fsf@intel.com>
In-Reply-To: <87h6my6evg.fsf@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 10 Oct 2023 08:46:22 -0700
Message-ID: <CAKwvOdk-h_Bvz9iFN=fMMn14A=8iwoPgSS27iZVmy4auTXCYvA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: drop -Wall and related disables
 from cflags as redundant
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        intel-gfx@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 10, 2023 at 1:50=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 10 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Mon, 09 Oct 2023, Nathan Chancellor <nathan@kernel.org> wrote:
> >> On Sun, Oct 08, 2023 at 12:28:46AM +0900, Masahiro Yamada wrote:
> >>> On Fri, Oct 6, 2023 at 9:35=E2=80=AFPM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>> >
> >>> > The kernel top level Makefile, and recently scripts/Makefile.extraw=
arn,
> >>> > have included -Wall, and the disables -Wno-format-security and
> >>> > $(call cc-disable-warning,frame-address,) for a very long time. The=
y're
> >>> > redundant in our local subdir-ccflags-y and can be dropped.
> >>> >
> >>> > Cc: Arnd Bergmann <arnd@arndb.de>
> >>> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> >>> > Cc: Nathan Chancellor <nathan@kernel.org>
> >>> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>>
> >>>
> >>> I made a similar suggestion in the past
> >>> https://lore.kernel.org/dri-devel/20190515043753.9853-1-yamada.masahi=
ro@socionext.com/
> >>>
> >>> So, I am glad that Intel has decided to de-duplicate the flags.
> >>>
> >>>
> >>>
> >>> I think you can drop more flags.
> >>>
> >>> For example,
> >>>
> >>>  subdir-ccflags-y +=3D -Wno-sign-compare
> >>>
> >>>
> >>> It is set by scripts/Makefile.extrawarn
> >>> unless W=3D3 is passed.
> >>>
> >>>
> >>> If W=3D3 is set by a user, -Wsign-compare should be warned
> >>> as it is the user's request.
> >>>
> >>>
> >>> drivers/gpu/drm/i915/Makefile negates W=3D3.
> >>> There is no good reason to do so.
> >>>
> >>>
> >>> Same applied to
> >>>
> >>>
> >>> subdir-ccflags-y +=3D -Wno-shift-negative-value
> >>
> >> As I point out in my review of the second patch [1], I am not sure the=
se
> >> should be dropped because -Wextra turns these warnings back on, at lea=
st
> >> for clang according to this build report [2] and my own testing, so th=
ey
> >> need to be disabled again.
> >
> > Yeah. The focus is on enabling W=3D1 warnings by default for i915. I ge=
t
> > that the disables we have to add to achieve that also disable some W=3D=
2
> > and W=3D3 warnings. But taking all of that into account requires
> > duplicating even more of Makefile.extrawarn (checking for warning
> > levels, maintaining parity with the different levels, etc.).
> >
> > I guess we could check if KBUILD_EXTRA_WARN does not have any of 1, 2,
> > or 3, but very few places outside of the build system look at
> > KBUILD_EXTRA_WARN, so feels wrong.
>
> This is the simplest I could think of:
>
> # The following turn off the warnings enabled by -Wextra
> ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
> KBUILD_CFLAGS +=3D -Wno-type-limits
> KBUILD_CFLAGS +=3D -Wno-shift-negative-value
> endif
> ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> KBUILD_CFLAGS +=3D -Wno-sign-compare
> endif
>
> Masahiro, I'd like to get your feedback on which to choose,
> unconditionally silencing the W=3D2/W=3D3 warnings for i915, or looking a=
t
> KBUILD_EXTRA_WARN.

KBUILD_EXTRA_WARN looks better to me; otherwise they would be hidden
forever (or nearly).  Suffer some duplication, w/e.

--=20
Thanks,
~Nick Desaulniers
