Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE39A0952
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 20:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfH1SRY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 14:17:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35835 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfH1SRY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:17:24 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so1072048wmg.0;
        Wed, 28 Aug 2019 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gwd3eZyhGra4vRNIIEht3m+fofsrn3t+q1IGOiidRPk=;
        b=TTIo+0optHj3u5YwkzlBxu0RdDVR4vE92MoIW4kxbEMiAA1dprqkOjeYaZ6r1lioKQ
         hCSW1RQfNM9F0COF4NbNjCyf3fYY43eoRLgJlA/CTgbjkBEftHJMvVb4smrcy4WHzoFV
         0s3tmT4AIItZzHLdmJvgTXV0iauHoThAq9kRaf1KP3ZGEeE26TvVKJ+rpk401cyhtZyf
         ReSquyUvoSqa+bLKSNA89mwjBdHCNH58fh5giDclS5Aw9YTBe8oZB8WAYEy9Poz4+J9f
         /RVQyetXt7Gdu4gtLwthHqZmFh0lC8IpGgirZ0/8YoQbSEtGIb2hQC4NvAohu2E++C/x
         2qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gwd3eZyhGra4vRNIIEht3m+fofsrn3t+q1IGOiidRPk=;
        b=cpsPG9g4u4kG1qr3y7ufrj7IuPz1p9f+IRjCosHn1GydveoThxmTpzHqksfYcIMPRU
         8fi0ocjnyvpEHGyYijONHGQjTFbxASxCanCbODZX/irKl3COR9RxO/Vz0Y5vkJnP02/3
         QXclsnh0/qUKsAima64PCzV+N7ohnqq/oPu7tBypMRXZLMSUXpA97qya8iBSyHDxapV0
         sSVCKe5V73XgI5h1A3YD9tWXRtHog1y4hG8zsRGsxW2aYS3muB2V+G94Fy/ZPsJCB1Da
         lEGkpNjv6WZXXrm2k1q5vL8gKOEXv1Lust6kYYVVcWpuWfkSAP4QYDpa3airxV9TAiBL
         se0A==
X-Gm-Message-State: APjAAAXDFrco7PUyExUSK3/Z5twN2t4z+UnnXlApnFgMOEUmB1ZMI8hJ
        1IPggqO0jWKEzYHb/lDwa2o=
X-Google-Smtp-Source: APXvYqwxIJymu4cQI6iKhnBrBH3S46XWZYQvB+qHMkAb4pGsWqJFt3qqyCqdrYn2dJOFkK2QrJuAKw==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr6761639wmc.7.1567016241750;
        Wed, 28 Aug 2019 11:17:21 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id g65sm144417wma.21.2019.08.28.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 11:17:21 -0700 (PDT)
Date:   Wed, 28 Aug 2019 11:17:19 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Message-ID: <20190828181719.GA127646@archlinux-threadripper>
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828055425.24765-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 02:54:24PM +0900, Masahiro Yamada wrote:
> Instead of the warning-[123] magic, let's accumulate compiler options
> to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> easier to understand what is going on in this file.
> 
> This commit slightly changes the behavior, I think all of which are OK.
> 
> [1] Currently, cc-option calls are needlessly evaluated. For example,
>       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
>     needs evaluating only when W=3, but it is actually evaluated for
>     W=1, W=2 as well. With this commit, only relevant cc-option calls
>     will be evaluated. This is a slight optimization.
> 
> [2] Currently, unsupported level like W=4 is checked by:
>       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
>     This will no longer be checked, but I do not think it is a big
>     deal.
> 
> [3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
>     Wsign-compare, Wformat-zero-length) are shown by any of W=1, W=2,
>     and W=3. With this commit, they will be warned only by W=1. I
>     think this is a more correct behavior since each warning belongs
>     to only one warning level.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
