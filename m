Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0659019EAAD
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2020 13:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgDELXT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Apr 2020 07:23:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39777 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgDELXT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 07:23:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id y20so776863wma.4;
        Sun, 05 Apr 2020 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=++OTLTHO6pZmlPvj4+1ebFX76n5BSiNRzUwAt171S60=;
        b=pBMxRCDQ+6OYKpca9KTdffjF7MDFfBzUDO0mfOTyb1Y792rGSVZl0rVXBfokqmFFxQ
         tZC8NHWuEaVQuLhaR0UPr37zS3KqzZa6AeIjXGvk1/pl6NiZ88+GQ9M/lH/K+9QKxJ2k
         lHDb7Xc80hYgFqt/aAG5chGEX234+P4IWG108uWvNtoxJUpNVEqq5U6f0bM0TsGr97Td
         ZYtY2Rc31CE55Vl/t5nT4zJFPX3qEWH5tpHD+X3wZzYJ5PkuazzaHfbx3u3atsfiKRDB
         /Czg1+/n9r808SEf/diU/crouy0UEM03CRvn6/goNy0EQiIKKg15difPWtUAD7GWr2V7
         8TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=++OTLTHO6pZmlPvj4+1ebFX76n5BSiNRzUwAt171S60=;
        b=M1Lg/OEapHmkYUCbMCiRNe0/ymdTEFgecsoF+7tBb/UNjMcY1YDjkrD37QTm9c9c7a
         xLLM4IA4SoxLcJmFX9v9XqdYrKL4EiVhJfEcSUG8eSASZ5g50EZLUJQ8mWx6ZoPEscQg
         ulksgYUdQfCPbuOqjEnuqH2WjjnAFw7uRzIxB1zfVHqmjlPo/+V5W8CKOfBczjsF23b7
         zLVfbOmJx3SfJMHbR8MG1aWJsC7Cid7lCWxIsN/xKH77/TPy4b6qF3ir9x5Y1w16dbTo
         JW9zj9+BBW+nAf9oOvnx1Jfp6g9oMeY83ZX6M1cgDJvv+3xTUnDPWQqgWYpw5IZipVNK
         W/ug==
X-Gm-Message-State: AGi0PublmDEQemOe+U5y4xqVomrV9Q7JH2/awTVYCCuCx19WNl4YyWmc
        pxeDkJFReWj7Q7/04OsPNc/YYsMsz/KCSdTzQd8=
X-Google-Smtp-Source: APiQypJiCMiuGNRkP3l7wYbSOEm2ozIhKmP02xKPVdsj9im69awhxZlGr3aKKxLo4tQbv0M/WxfescTBrnSctifG/pg=
X-Received: by 2002:a7b:c850:: with SMTP id c16mr1357236wml.108.1586085797152;
 Sun, 05 Apr 2020 04:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
In-Reply-To: <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 5 Apr 2020 13:23:33 +0200
Message-ID: <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kbuild@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 4:24 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > When doing Clang builds of the kernel, it is possible to link with
> > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > discover this from a running kernel. Add the "$LD -v" output to
> > /proc/version.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>

Please feel free and add:

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

When I looked at the original patch of Kees I wondered why
$(KBUILD_CFLAGS) is passed, but Masahiro has a patch for that...

  "[PATCH] kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h"

...see [1].

I have tested with both patches in linux-kbuild.git#kbuild against Linux v5.6.

- Sedat -

[1] https://patchwork.kernel.org/patch/11473667/
