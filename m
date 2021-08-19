Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B397C3F0F0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbhHSAFe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhHSAFd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:05:33 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDDFC061764;
        Wed, 18 Aug 2021 17:04:58 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id h18so4110286ilc.5;
        Wed, 18 Aug 2021 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w17ydvcuCGlYzYZkPwnAY4ViNmy/ZwOBneYqz+ZoO9o=;
        b=UKWjEQsSNw2BiJaPXnsaKyIU35+0H7oF+FRz1HAZHped4dWFoAoEswBymXyg9g+ZmR
         lLgZ584UzUxwkfkBhRxRVwwnaRHGg0jNtB1sY4a1jdAximJXprJ5gdG1sKPVuOFc9vzo
         Yl+iLuVLguWxYPC+XYuEB4jotG1psQpoebbH4erIe1/gG5+s+RdontydGlEHpJ5sHM8l
         0lzF8oduiIWkTD+r1705FS43bUdOiRLER842LY6juo60h/3+4m7wWrfLhDmJMIgKupwh
         t3V3qeGsGKAKffUp5+ini0NDqGGV4RPbCmQaNPoZ6Gb202C50tNrMk5z7REcCFLmAZNi
         ppvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w17ydvcuCGlYzYZkPwnAY4ViNmy/ZwOBneYqz+ZoO9o=;
        b=WivQBj5aZOcb4mwiDOjVzoHVn1Vr8uwlgf13+Ij93hLyjtZhIzpygR+S1h8xHD3AIq
         CuY+UnD4IFhhqIlkk+aI6zx8xwuc4IrHRj0acJa+Cphgmk1llkBvHnJLEtKuElE9Ic1c
         lBGUU77KjCa0K4wtjJjLYQfCPjgD90Zvy+8SUFPosvNsXEUyi//cMzDuN+ejhSJFBls9
         IX2pE5FWusPfrQsMhrHGLI52T8ava9NWJn2eVP5K4E+cva1Q2mcf8taPdBeC630Vg3eh
         CAqve6it0LnpPKdm05q6ms5S/MhvuXgqPzAZhF+ofKRD6dCOA1weZ+pzLka4w0KXiKW6
         05BA==
X-Gm-Message-State: AOAM533WVLXPJA30gWzbb6Ok9cbwuSnhHaNK7FW70VvNNzd02A8yA17/
        ZTqljZgJl30mLoGfCtUnmdHbn16z4XJr1t2XUZc=
X-Google-Smtp-Source: ABdhPJzs981tvNw4QbYs/FWQ28bLGWZcK6FUriao+c1cHCcwbhXdwJhHYjp/IVOkFYOsK9nqcg2y/T/TO2k+bBkQhTM=
X-Received: by 2002:a92:da11:: with SMTP id z17mr7915420ilm.176.1629331497973;
 Wed, 18 Aug 2021 17:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210818214021.2476230-1-keescook@chromium.org> <20210818214021.2476230-2-keescook@chromium.org>
In-Reply-To: <20210818214021.2476230-2-keescook@chromium.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 19 Aug 2021 02:04:46 +0200
Message-ID: <CANiq72krkjtmwwZOebbVnPismTPoe2y+vCXuOXbBwE=1-BS2hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Compiler Attributes: Add __alloc_size() for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
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

On Wed, Aug 18, 2021 at 11:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> GCC and Clang can use the "alloc_size" attribute to better inform the
> results of __builtin_object_size() (for compile-time constant values).
> Clang can additionally use alloc_size to inform the results of
> __builtin_dynamic_object_size() (for run-time values).
>
> Because GCC sees the frequent use of struct_size() as an allocator size
> argument, and notices it can return SIZE_MAX (the overflow indication),
> it complains about these call sites may overflow (since SIZE_MAX is
> greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
> isn't helpful since we already know a SIZE_MAX will be caught at run-time
> (this was an intentional design). Instead, just disable this check as
> it is both a false positive and redundant. (Clang does not have this
> warning option.)

Thanks!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
