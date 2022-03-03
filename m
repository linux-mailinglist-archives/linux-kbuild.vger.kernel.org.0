Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17944CB3D3
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Mar 2022 01:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiCCAFV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Mar 2022 19:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiCCAFR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Mar 2022 19:05:17 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02714992D
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Mar 2022 16:04:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id n14so5235091wrq.7
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2022 16:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=EGUemDJqLPj5B1hkkSx83siUMy1VVgYpLmLW+ISOhNuoXtHKsSw2hUGh04Nr1SSJBa
         r1zlSLuTwOVX4majvP3P2eRAehp5T6N3EhkQMRRzPZTVKm7dG9AMpyQkHmmlptVAkH1M
         9qJqcvZhIGwX2krc9gtYqqgwwQlmQpMuIj2tBVKllvQa6ewTZR3bIzSlOMcvz81A9HgK
         U6a1Rlq0X8a/j+BcebndmqCX94BKI7/Pk6tA767h9fKeB1KajrFXzeZtGEtmtGtKzQ82
         MRbBDpAmm2KjoZQU/U/PLkzR0auLS/dAQCdKPVFuvLwFIJNhxluwc4Nr3f7cAO8VDXZ4
         jz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=zNZcf0dWfbcwsjaarYHNpLSdHV0UwYoReMGhw22m7Uk2qSeHntzWn0qf8weuD86mRN
         O6P26w23zx5dzBd2DF8Qcd2+QY6RfW/oRrUkUi5RUWXFGgPwfZN3pzmJMsjtGyAUtFAt
         Yi95aDjx7Ov4vxfFxOtZpeJPN4U+Hn6vcva9FiRy5Ds//y7Td6mmFy6D2K55dhEm6mrn
         tRtwteQhhWYdVtG8+xencYsjehE7fM92EnhkWbJjdyAiiOA7mkVU/B5Oj5cZrMEAWEhZ
         SZF8K5NPdIE9wyo0audrYGVWVTPXZ1Z7Oknuhc6qA2ai8uPIEyYQe3bRwtgwwbZlPJPP
         3Rpw==
X-Gm-Message-State: AOAM5307w8tvIEPeDgu1DVPVJVrglxROT9JVY0AyZNtozNBmEzclErkU
        4KbuZ2DDbMx1IYg4p2zEsviPIXpdJq28G+69e1NwVnJeI2kUIA==
X-Google-Smtp-Source: ABdhPJwNGg4cChj44h6sHunDdkaG9C78703PQ9UZNkp6xZHGYO9BRG6dBg6H3kef6ltm6p6P5d5rhHI0dHWUyV3MtyU=
X-Received: by 2002:ac2:46ef:0:b0:443:3c30:a372 with SMTP id
 q15-20020ac246ef000000b004433c30a372mr19890713lfo.626.1646261686698; Wed, 02
 Mar 2022 14:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
 <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
In-Reply-To: <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Mar 2022 14:54:35 -0800
Message-ID: <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To:     sedat.dilek@gmail.com
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 2, 2022 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Mar 2, 2022 at 10:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > As we change the C language standard for the kernel from gnu89 to
> > gnu11, it makes sense to also update the version for user space
> > compilation.
> >
>
> Overdue.
>
> Can you point me to a lore link where I can easily fetch the full 3/3
> v3 patchset?

Hey Sedat!

$ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@kernel.org/
-o - | git am -3

https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

>
> I would like to give this a try on x86-64 with my latest kernel-config
> (based on the latest kernel-config v5.17-rc5 from Debian/unstable).
>
> What Linux source base do I need?
> Is Linux v5.17-rc6 good enough (patchset applicable) for testing?

I suspect so.
-- 
Thanks,
~Nick Desaulniers
