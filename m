Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA033F044E
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 15:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbhHRNIe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 09:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234949AbhHRNIe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 09:08:34 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4535C061764;
        Wed, 18 Aug 2021 06:07:59 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id j18so2663248ioj.8;
        Wed, 18 Aug 2021 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tNPb1/FPZA9eF7X+TOOmGLZvE3KZSt2M0L0KXp9Ah8=;
        b=SZR+b95l8v5SjC4+pZiDHCcUX+iSblqmeJVM/s+LIVGE0d9M2XKc2eZf83W/VLtwau
         YV/K9Pr2J8jSXAxTCvF5wwLMSc8jy1rwlr0TiM5c7lmyNSdybD34PCPJXGRbWfhZMG40
         /C6GhCo91LCITlZissWVpybP/AUB/Vxecy/5aPbNqmmtACa6T3ivbL83rlLU3G5A+LHf
         rF5ztA12/gyeoarYk+PXsv3UmoYrmUnCp2ROMX5zee5xAr6Nuyif0vq/u6LOeT5ZwcFQ
         9nDpp76bChkZFsI29y0uFkDoajLUMgEmcBWrOeUi7mBItCPNEDeNoZVodoxXcFWFPjjQ
         +5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tNPb1/FPZA9eF7X+TOOmGLZvE3KZSt2M0L0KXp9Ah8=;
        b=esHKS4zOKWUtbvnXepqXXupcI78LuYQzUmph82znxiddHHyjgbilmw88o7LjHteUY6
         58D1RHrUOCxdmBfUs3Uk67y2ABSJb30LxabPFV97K9AZi6dIn2GSyYcyNc3t11cWwY2+
         UPjFndSx2KqnwzaN8Gjzx6TjYtLMKwKgSsiny0VmjLmIIy3Bek3cdZjJsS9qtF4qikcX
         s0GZrJt32q5SrdikBbk2hM4RTzIRXJFKtdWXLasUij33wimK6YwAMny/+IVa6Xoy3UIw
         lBHAbH4g0cF6jSyX1RxSohmbDspW4y4xoD0eFOenVkM1bhRrkK+Gktyec7N+e0Il+4Fb
         ihGw==
X-Gm-Message-State: AOAM532nJ9DGjAVKErKHMbbzG71W0VrtVnhAn9sykFP3DBGn2vBBWOlZ
        irC0fM+Xxwhr+qghcwYhFZQcZGd2yaP1DyjE9cE=
X-Google-Smtp-Source: ABdhPJwNu2W+2PWsc1G3Nxzpq/lkQoh4zDm3Fav5536uGTKbeL3hSVC+lNuNBiMw408aS96WJUW43MyH/xRVFiXPkoM=
X-Received: by 2002:a05:6602:2c05:: with SMTP id w5mr6948405iov.91.1629292079292;
 Wed, 18 Aug 2021 06:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210818050841.2226600-1-keescook@chromium.org> <20210818050841.2226600-2-keescook@chromium.org>
In-Reply-To: <20210818050841.2226600-2-keescook@chromium.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 18 Aug 2021 15:07:48 +0200
Message-ID: <CANiq72=ym5ubiXgwt=xyyOSxnPFqgfArJsPyV9juOuwWN+PqCQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] Compiler Attributes: Add __alloc_size() for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 7:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> Clang can additionally use alloc_size to informt the results of

Typo.

> Additionally disables -Wno-alloc-size-larger-than since the allocators

Disables -Walloc-size-larger-than?

> already reject SIZE_MAX, and the compile-time warnings aren't helpful.

Perhaps a bit more context here (and/or in the comment in the
Makefile) would be nice: i.e. why are they not helpful (even if
rejected by the allocators).

Cheers,
Miguel
