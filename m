Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3367F2ACB93
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Nov 2020 04:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbgKJDTH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Nov 2020 22:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbgKJDTG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Nov 2020 22:19:06 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E14C0613CF
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Nov 2020 19:19:06 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id w14so7484643pfd.7
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2020 19:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27ykW6WMBpdjPMmYk+TEkpv4ofG2LVLk39veK8STtAM=;
        b=XsFFeqcHcwErTDab8bcJJxnRZmdrfwAAmAxnX+0//0jp/RkNoXCmKM8hfyW7U5g8YY
         wehgfKm1eruNJkdwnQxX/6RNlrNe6CP3uC9uMuIcChKg7gmdAwILZVQXBK3QxQME/vGY
         n9bBZbqKsp3rUj7gjL3n2idnQJIzZFT2jQDMtCEsHtuxaEBlgAGdozKhGraOM+DNtPKU
         1TYIu8MdisQa5tafuex26ZLInGgdddCQESLcztFd9caJZ9PszasLRkfq4/Txf1N1n6Z0
         s8KzSi9dTkyd/sKQMAPCsqQUdj936ITZXkP6f+AREgqbuvxOMRr0Qudq4LaTJaYBzxn8
         l8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27ykW6WMBpdjPMmYk+TEkpv4ofG2LVLk39veK8STtAM=;
        b=F9TCcVGdW2oj15KYt72HQXCP/9wwzqgUMbN8RoG2JwWAULHPEzbyykPjiLIO2xQFi4
         WiGYqSRgwF4/IyfGUvhi6ZcJwhzFyxAL/I2i9L8uT5KnQ1SOdrIA51wqZVPPefasV/o+
         YUE2WV1Mnc9FSMQj8iy2Ey/OiowHBDjeqfqt5SC9y0ys8vFqKKaGlPsyRvHpJ/3HRk3K
         ucHo5Yoh3V7TcQP0CbZcY0tuyVmtNZzo18VU3+zSZhsDcsAAGP6M7vJlI0Q1JbRa2NyX
         6MRZGMaamWmJvy9ZId8qkJCfSssEF/QAZK9akfcaFrEctUph2yWSTyLruyxcT+xQnGXB
         YRYg==
X-Gm-Message-State: AOAM531pS6TohYqsaZPnxcqC+PpALlzB+WQlDOP9oYAq1QJW10u74+oQ
        3p8+2/8BJiDtDLMgxkOFxikoEHypvcmQxiUS9tQFJQ==
X-Google-Smtp-Source: ABdhPJw1gHS3sV2n+GuuNrA63YxT/QiulRGIL8Dn09J7EAZtkgIEcv7I2sFS4tI7OV3X2dr4+8t654iME8/HuHneKZ4=
X-Received: by 2002:a17:90a:4881:: with SMTP id b1mr2684359pjh.32.1604978345526;
 Mon, 09 Nov 2020 19:19:05 -0800 (PST)
MIME-Version: 1.0
References: <CAG48ez2baAvKDA0wfYLKy-KnM_1CdOwjU873VJGDM=CErjsv_A@mail.gmail.com>
 <20201015102216.GB2611@hirez.programming.kicks-ass.net> <20201015203942.f3kwcohcwwa6lagd@treble>
 <CABCJKufDLmBCwmgGnfLcBw_B_4U8VY-R-dSNNp86TFfuMobPMw@mail.gmail.com>
 <20201020185217.ilg6w5l7ujau2246@treble> <CABCJKucVjFtrOsw58kn4OnW5kdkUh8G7Zs4s6QU9s6O7soRiAA@mail.gmail.com>
 <20201021085606.GZ2628@hirez.programming.kicks-ass.net> <CABCJKufL6=FiaeD8T0P+mK4JeR9J80hhjvJ6Z9S-m9UnCESxVA@mail.gmail.com>
 <20201023173617.GA3021099@google.com> <CABCJKuee7hUQSiksdRMYNNx05bW7pWaDm4fQ__znGQ99z9-dEw@mail.gmail.com>
 <20201110022924.tekltjo25wtrao7z@treble>
In-Reply-To: <20201110022924.tekltjo25wtrao7z@treble>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Nov 2020 19:18:54 -0800
Message-ID: <CAKwvOdnO2tZRcB69yJ+FTj+qGpzCasxecCPQ0c5G9Wwn6Wd12w@mail.gmail.com>
Subject: Re: [PATCH v6 22/25] x86/asm: annotate indirect jumps
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jann Horn <jannh@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 9, 2020 at 6:29 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Also, any details on how to build clang would be appreciated, it's been
> a while since I tried.

$ git clone https://github.com/llvm/llvm-project.git --depth 1
$ mkdir llvm-project/llvm/build
$ cd !$
$ cmake .. -DCMAKE_BUILD_TYPE=Release -G Ninja
-DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt"
$ ninja
$ export PATH=$(pwd)/bin:$PATH
$ clang --version
-- 
Thanks,
~Nick Desaulniers
