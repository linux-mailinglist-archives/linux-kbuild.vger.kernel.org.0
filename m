Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9D924E45B
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 03:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgHVBGf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 21:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgHVBGf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 21:06:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCE3C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 18:06:34 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g33so1788584pgb.4
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 18:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QvEU7Ij1K+X8291+Yrk9PiVxlfdObr5ZQisT4NFhZNE=;
        b=efIZt6zUmqOZ9nGEWAH3HLXnOkJ1XKpvNGcZTjACHZa4oj0oZW+VdMx5lXDBAjkVMC
         JSMsmPLyn1gwCYwDhmA9M8136Q4b7dj6gnXfKBY07V2jLg8+KzFvi9kvbyknT9w/xV/K
         uH40SAmaF7ZxDtqU5rxUW2M74ao5un4AYrW/212KebK17mHZH/2+xBQxE3WlWlv9SVlV
         F96VwFhZme/tqpuFFcAiRIaJfRoQwtLdaFWF0dZTDSmAFE71AOGUbZKZgVQVmlE7H50J
         51t1SPiCQCJSLXqfOKLE3BagBlThhXWQWRnk4W8y6VvEMVac8SbS14OTGfyadzs2i2yh
         MmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvEU7Ij1K+X8291+Yrk9PiVxlfdObr5ZQisT4NFhZNE=;
        b=Rx+X70lb7PUXct7IHgiEIR3p6zt6HVG2DVRaqKhiBqVuvhHchBJv60mvjuRnVIICQb
         xmYqNMmBz/9kFlFJAV4EreS84eGP5o3IRLQJJ4yD98h8vn48lkkNlhOAvwIBZLeOKYQl
         btQ7b2zIwjod0vteGHcgFvKTqgFWZbaMSx4VGUcykgugzpNhz72Ynou7NW/nLpQu2dVY
         0pApqDeNZmB9wT1KmPIKSd76svxWCzKmeBAcQAjyb3J0o9H9aQBLJ4/dYC+8CaZjBjRJ
         THzfoQPHe/YVWyrmOYM8cMwRKD8wKna+pJi19FUQJF6y4aR2gCurFkHvSXg8aLWW8iNE
         b+rA==
X-Gm-Message-State: AOAM530ZLg9fIIMwml/udpVmA1Q7p8vBDrH1y2DuIByITbOeAoCr1P2i
        nOEFXEtZ2xYzapa1sGRFZc4fsLHJb3zlSRKlaNqXnQ==
X-Google-Smtp-Source: ABdhPJxS+man2Ode7yHztpLxdSiuVXjRfbwMrX0R4e4rHnjteiqRne9BSmci4DzM/oYX2ZZVEoLXnxUmHXTswiNJq9E=
X-Received: by 2002:a05:6a00:14d0:: with SMTP id w16mr4506224pfu.39.1598058393938;
 Fri, 21 Aug 2020 18:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org>
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 18:06:22 -0700
Message-ID: <CAKwvOdkUfOnzWH1d7-qAP-PFvkLeahoA8jZdkZEp4-PNFXL_JA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kbuild: clang-tidy
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I improved gen_compile_commands.py,
> then rebased Nathan's v7 [1] on top of them.
> To save time, I modified the Makefile part.
> No change for run-clang-tools.py
>
> "make clang-tidy" should work in-tree build,
> out-of-tree build (O=), and external module build (M=).
>
> This version keeps the previous work-flow.
> You can still manually run scripts/gen_compile_commands.json
>
> 'make compile_commands.json' or 'make clang-tidy' is handier
> for most cases. As Nick noted, there is 3 % loss of the coverage.
>
> If you need the full compilation database that covers all the
> compiled C files, please run the script manually.
>
> [1] https://patchwork.kernel.org/patch/11687833/

Thank you for the work that went into this series.  The only reason I
started focusing on compiling the kernel with Clang 3.5 years ago was
that I simply wanted to run scan-build (clang's static analyzer,
enabled by this series) on the kernel to find bugs to start
contributing fixes for.  Turned out compiling the kernel with Clang
was a prerequisite, and I've been distracted with that ever since.
Thank you both for completing this journey.

>
> Masahiro Yamada (8):
>   gen_compile_commands: parse only the first line of .*.cmd files
>   gen_compile_commands: use choices for --log_levels option
>   gen_compile_commands: do not support .cmd files under tools/ directory
>   gen_compile_commands: reword the help message of -d option
>   gen_compile_commands: make -o option independent of -d option
>   gen_compile_commands: move directory walk to a generator function
>   gen_compile_commands: support *.o, *.a, modules.order in positional
>     argument
>   kbuild: wire up the build rule of compile_commands.json to Makefile
>
> Nathan Huckleberry (1):
>   Makefile: Add clang-tidy and static analyzer support to makefile
>
>  MAINTAINERS                                 |   1 +
>  Makefile                                    |  45 +++-
>  scripts/clang-tools/gen_compile_commands.py | 245 ++++++++++++++++++++
>  scripts/clang-tools/run-clang-tools.py      |  74 ++++++
>  scripts/gen_compile_commands.py             | 151 ------------
>  5 files changed, 361 insertions(+), 155 deletions(-)
>  create mode 100755 scripts/clang-tools/gen_compile_commands.py
>  create mode 100755 scripts/clang-tools/run-clang-tools.py
>  delete mode 100755 scripts/gen_compile_commands.py
>
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
