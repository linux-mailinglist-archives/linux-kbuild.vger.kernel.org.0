Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02442F699B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 19:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbhANScz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 13:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbhANScy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 13:32:54 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87F0C061575;
        Thu, 14 Jan 2021 10:32:14 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id y128so2671164ybf.10;
        Thu, 14 Jan 2021 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkDWkm7+rWVZYk8MvVS//EXKogbXqdcBArZyL8FNxdM=;
        b=mUUX5puMI8nBttMrblkC5tIrFOQQ+iRww4NO7pijYMjz+7KqaOQdJ6sAaM2VwH+xZH
         xt5lbTz6Tfdfw+iL3zy7liPL3aLW3BMZRP1zf9H/DfnssbzW6kEeONm6Nt17mYGqE8Ir
         vOYVUP8+2jHzTgrsTGt9P0g7c/NF4pwzHgmaZajv52J7IndVGPhwdHo8172daCI/OF0a
         WFcPy/47bEyq3MWe9lg0utZlZ81P9x9ehvzClvae+lA/KTzNYt7sfyvYZc9isNxT1IAy
         HClveohBhINKv8Am+97yxvosavh2Q6Bhrs9Hc5mPp2iEgExHyUpm4zdwLk5hjFv2/rPr
         z2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkDWkm7+rWVZYk8MvVS//EXKogbXqdcBArZyL8FNxdM=;
        b=W8gsMBN+FphJPIAC0DAqfi5zOTwdfwCIQBcIyrsRpIcrIWUclr5GEhTf9xFFBsJgj8
         fxyFIW9nvj39FjJp0vbCSCK32NISAseXqC7UbgFXQrI5ZwILZcMbJge+XIl/pCJ+N+Dj
         UcW3ER08ZafNv/vcZLtDf+dhRgddKtuTTqxMWaQzBo7e+KX+PTtyBQNdrGl0C3MxhRAT
         mlwG05CcurEar4jAT2gUiPGfLnimj4zTY+5vpC64casBQ02mCwM/wNfRVuIZ1sX6Cfqy
         rEwvYrA5+vbvxi6wXWSGYoLtiuGynfu7EhdFsiS4cIj+lB5iZx+VCFsqXteMwkUPZiUZ
         NsZA==
X-Gm-Message-State: AOAM530YYaa37TW4N5mzt8YMaQjVjSps0SqyYvD2JhkBepSgDX4h1LrD
        9y2D4wUf/8KlznskqQiNSb80z7JhFTI8zymwoyI=
X-Google-Smtp-Source: ABdhPJy8ukIRNIUZgZETLWMyY7NRPBEE94Oq69IvViHhxx/SGPq9zp7K9WbXAX+dU4BYlyziEqd94fSUfStQnvJw0UM=
X-Received: by 2002:a25:50a:: with SMTP id 10mr12601986ybf.115.1610649134102;
 Thu, 14 Jan 2021 10:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20210114180709.303370-1-masahiroy@kernel.org>
In-Reply-To: <20210114180709.303370-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 14 Jan 2021 19:32:03 +0100
Message-ID: <CANiq72mMnQBD6eVoNjfjiwz4TrQDz=DSh+gHen=grA3YqsYKmg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: check the minimum compiler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 7:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I unified the similar two scripts, gcc-version.sh and clang-version.sh
> into the new cc-version.sh. The old scripts invoked the compiler multiple
> times (3 times for gcc-version.sh, 4 times for clang-version.sh). I
> refactored the code so the new one invokes the compiler just once, and
> also tried my best to use shell-builtin commands where possible.

Tested v3 with GCC, Clang and an old GCC too:

$ scripts/cc-version.sh gcc-4.6.4
***
*** Compiler is too old.
***   Your GCC version:    4.6.4
***   Minimum GCC version: 4.9.0
***

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
