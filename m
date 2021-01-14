Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7EB2F5BC1
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 08:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbhANHzo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 02:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbhANHzo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 02:55:44 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E57C061575;
        Wed, 13 Jan 2021 23:55:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h205so6730628lfd.5;
        Wed, 13 Jan 2021 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pP/ngkC2SUBvu5ZyykKyP1Wg6ESrX20r51brPw8EwXQ=;
        b=TzY9Q2KP6JTchYjg9Kiwl+HUS4cUiIuPDf6Bt4DxgC/mUAD7urumN/er4+4H6kea2o
         5D6ZXs5SUQ4QRowzfjaYFpP5AX1xq5ict92POI8QFdfGwJQXRO/NjUp1UZwLqAuXlPzP
         aqSKKHz737D9zGk7iVm4Paw0noFzR3PbeJl9S3M2Eyk82mMrxI9IWKRLCQiGeAtU4+Uv
         WAy8Chd03tclC/Ey/0YpntLXbd9JmiA80V4pmWfpkNpBQQJlwrc3a5+d/Ow5HsQNFk10
         NrV7aqjPqiyQpAnJpJQDuNcSxfC8ktwWHbD4PpRaDxaRMlBCpHT4Fr2U2p/gmwqdFIsp
         WVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pP/ngkC2SUBvu5ZyykKyP1Wg6ESrX20r51brPw8EwXQ=;
        b=PJwklCy+SntJL8bx5Z4a9adTmboyaa6dXLNsf703LCPJMGmFtwKdmYhV/B9tLJttzS
         Y6YVw6Ai05LZkztqRtL9tENell0vKZzR8L5/9D/u2qf0KHmy/xeETLTknWY7zM9MQnO3
         SLHaiqA9d38KAB7+ee+mPfwPsoquUdoof/LCTed9WOGPwX6KEhDoEbyGU4HhMDC7172C
         zAZwNcwCWBh6q0zSFx3ayyyoKOJKZwSsBW3ixI+qKJHBTadJJ01ABJi/6MvQ4l51fcbs
         VsXkUWOHgLflWEW689R6ysUjqaFcjAp080vJXiLhEuVe6IUyVH13LtO8F50+YRtYD+cW
         TfKg==
X-Gm-Message-State: AOAM533EuOcKpJ0y8jM7n1+ZHtigy0ievYfCi4tj/F219tMFsTimgULx
        2XRIjrrPv05aw627AhVGXmJoCsqKWdpkKUmjuNs=
X-Google-Smtp-Source: ABdhPJwJlynOZL4zvvuKRWSDOV1NV4x9Chd95rncr4YiH5Yfdx6QFK7BJDKsJUUjYRxCDSwIZO/kNCmv9kz2dqYdf0Y=
X-Received: by 2002:a19:8557:: with SMTP id h84mr2571151lfd.201.1610610902380;
 Wed, 13 Jan 2021 23:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org>
In-Reply-To: <20210114042420.229524-1-masahiroy@kernel.org>
From:   Ilie Halip <ilie.halip@gmail.com>
Date:   Thu, 14 Jan 2021 09:54:51 +0200
Message-ID: <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

> +       #elif defined(__INTEL_COMPILER)
> +       /* How to get the version of intel compiler? */
> +       ICC     0               0               0

According to Intel documentation[1], this should do the trick:

    ICC     __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
__INTEL_COMPILER_BUILD_DATE

I don't have the compiler installed, but I tested this on godbolt[2] and
looks fine to me. What do you think?

[1] https://software.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/macros/additional-predefined-macros.html
[2] https://godbolt.org/z/E5PE6f

I.H.
