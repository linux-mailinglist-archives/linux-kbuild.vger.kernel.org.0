Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464A33F1B81
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 16:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhHSOTq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 10:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbhHSOTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 10:19:44 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5C2C06179A;
        Thu, 19 Aug 2021 07:19:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x10so9376580wrt.8;
        Thu, 19 Aug 2021 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m7+BP1bcT0EhLLn/h4/nBsVXxgUv4mRHVL2f79asbyo=;
        b=sJy0lKg4BujeOZG0aEbYvf4mp/tF9x+Df2SvQ9OkbJh504JB91e3TnLbF5pWafsRB9
         qTa3Vh1S3B+Uo75DbUR4dUF8Xvo+ggTL8faS9fN8zfe3vaM7d1oVs238noo4X3zgx6Rg
         hhUmG7sb27ka01VNC8ZeoVKag8AuEpRQFMG9dzCtRywDlYtQOAe1Alza2XyPZv0FS+OY
         GeSam7wB44VJgkyn0QPFrabVwZM4goVDKFZgPqTwpuV+oswgHlgU+fvDn+xjz7Hm6XQh
         LJvptuVExrPI2LiHYfX+vGeik2BDciC5ulfQeGtOTspVxHq49dSnoRHeAXPI5UQi+SHB
         iyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m7+BP1bcT0EhLLn/h4/nBsVXxgUv4mRHVL2f79asbyo=;
        b=hEdXI8v5jYA5yA853lIwH4B/+wZiNMoHuDg0TKlA9xnlKLMcyHWJDb79pyTiYjAcF5
         HvsBOCagshJuN4Y+S4KPum3pvOOmThZESYswsLNni4O6b0LmGujYB3eYq4g5avAUs8Pw
         1PMSrrL87BrNF9hzp2D52Yx0GrqubAy2FOnmiiQh4KfsqOj62CXOPdN5VBZpDvLZNHdk
         RQGE9+EqdEjqjnGkadc8Nx7emyo20LpXxjmHncj2FArth/eCMn2hT+q4wMnV7SMaNZTm
         JkCSKmoLf5Bm++KKSmj22Py1MvIeB3T6o6jLyiB80cUym+o8szev7RYQG0PVXlquR9Mt
         TIzA==
X-Gm-Message-State: AOAM530Lpdnke7M70LG5bLhL5yfkOkeomzFENeG8ppyVPGD3HMoM1ogS
        OE7qegguGZ5dkvvru3b/yMoqRYqALaDMASS1kFw=
X-Google-Smtp-Source: ABdhPJyN6zYenSjVuAKWPnzofP6Qn3wLKEzMdJkZP/gyaa1Ge6UdNlqJBnLJorYcQ+Ks4iJmZS7uMzovp9cRb3CzaEA=
X-Received: by 2002:adf:a29c:: with SMTP id s28mr4132793wra.318.1629382743247;
 Thu, 19 Aug 2021 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210818050841.2226600-1-keescook@chromium.org> <YR4frlpfJQonPuKp@infradead.org>
In-Reply-To: <YR4frlpfJQonPuKp@infradead.org>
From:   Daniel Micay <danielmicay@gmail.com>
Date:   Thu, 19 Aug 2021 10:18:47 -0400
Message-ID: <CA+DvKQL6pLfK1vRzaOkEWR7DQLgTh=WZTka2L5yuS8Lf_1ZmoA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add __alloc_size() for better bounds checking
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, Linux-MM <linux-mm@kvack.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It tells the compiler the function will either return NULL or an
allocation of the size specific by the parameter referenced by
alloc_size. It could also be used for functions resembling allocation
functions which aren't actually allocating. The compiler will use it
for optimization so it's extremely important that it's only used
correctly. It only really has a use on the top-level API used
externally.

The compiler uses it for __builtin_object_size which is primarily used
by FORTIFY_SOURCE and also internally by -fsanitize=object-size which
will be available for the kernel via UBSan to find bugs or as
hardening in the trapping mode. There are currently compatibility
issues (undefined out-of-bounds accesses) blocking using
-fsanitize=object-size beyond fixing those relatively benign issues to
allow using it elsewhere.

For example, it will know that kmalloc(n) returns either NULL or an
allocation of size n. A simple sample program with calloc in
userspace:

    #include <stdlib.h>
    #include <stdio.h>

    int main(void) {
        char *p = calloc(64, 1);
        if (!p) {
            return 1;
        }
        printf("%zu\n", __builtin_object_size(p, 1));
        return 0;
    }

It will also detect an out-of-bounds access via the allocation with
-fsanitize=object-size including with a runtime value as the index.

It's not as useful as it should be yet because __builtin_object_size
must return a compile-time constant. Clang has a new
__builtin_dynamic_object_size that's allowed to return a value that's
not a compile-time constant so it can work for kmalloc(n) where n is a
runtime value. It might not be quite ready for use yet but it should
be able to make it a lot more useful. GCC also seems open to adding it
too.
