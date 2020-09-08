Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924A9262394
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Sep 2020 01:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbgIHX2q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Sep 2020 19:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgIHX2o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Sep 2020 19:28:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC7EC061755
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2020 16:28:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f18so463149pfa.10
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2020 16:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jUriBxBgOoiBsn5aO7jNWcqqf+vaiVxUYWRnLqNR1jM=;
        b=E/YiH9PD3ihV0IVAR5rz+kH+b53wXLSIKmpoiOzCUGIjKpPkUvepTJzZ9+NUfPet6f
         GjaxzmgrBjNjqjo0f2ixc8d1ESWRgiXmk3RC5UCTuoEZePHlVeleHkJJVCXbHB4Iy0lP
         zLqt5AipHKpsckEr1GfvlWy6tszT/wsVnsbnykJcDboXcXvM/ADW0EnFJR3kQ6JqRDJF
         dSHe06Qm/HcGK8ogoctsoW5WtSXiP+swQULLf66N1XBjDhEHsTBRP9zhxOTsHLpYe4Th
         9lAz0y/0D5FyUST+gVXhf1nWDMBty0024ty3DlA3ziBDE0uWDvAZu1LLk2dJzbpawFdm
         KS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jUriBxBgOoiBsn5aO7jNWcqqf+vaiVxUYWRnLqNR1jM=;
        b=p9WlmC/FyQ7yO6eftA0jJQK0/ypyDBs/V4Omgy7iEC35vkbXnDpTSSnC+SULqPfQWl
         LHKIzy01DfZgXRQDHGbfc4dNrVqqInbpyddHgMnyw2ULUBWJBI/Tci9rsVzdUIDtQ+bC
         6+9jPU6u/tOEgzIZn0uXKb9PzZ0vv2ImRa0/3z41Qi3HZOfkQoa8Ri3p0Xm1psekR0Ai
         ziKB82UskKFWgQEfPktA/MH5yAkBxia7zhTZMSKbnaaS2krxilMcn+99SbKMN+CkpGSX
         CjyaWrhhdWqOXIIwRRSLAWpFgdPIWKFUgPHH1S9Gqv9P/X3SPJ3hyqg0FJ1VudloLtP/
         15PA==
X-Gm-Message-State: AOAM531YVZcIha+FNQOFRcnDjh8N8wiUZLZglK+zNKChSU9JONhJ8nGM
        jS2cIfw85LZN2QL3ftalyXSJHw==
X-Google-Smtp-Source: ABdhPJxtrczatAsJe/2asERi0zZusFb9ssrn7lKjqOGwCxb8YO5oCcKiBSLXYms184w0IymH7gdSoA==
X-Received: by 2002:a17:902:b108:b029:d0:cbe1:e770 with SMTP id q8-20020a170902b108b02900d0cbe1e770mr1342847plr.23.1599607722874;
        Tue, 08 Sep 2020 16:28:42 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
        by smtp.gmail.com with ESMTPSA id w192sm465817pfd.156.2020.09.08.16.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 16:28:42 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:28:35 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 27/28] x86, relocs: Ignore L4_PAGE_OFFSET relocations
Message-ID: <20200908232835.GE1060586@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-28-samitolvanen@google.com>
 <202009031546.4854633F7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009031546.4854633F7@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 03:47:32PM -0700, Kees Cook wrote:
> On Thu, Sep 03, 2020 at 01:30:52PM -0700, Sami Tolvanen wrote:
> > L4_PAGE_OFFSET is a constant value, so don't warn about absolute
> > relocations.
> > 
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> 
> Any other details on this? I assume this is an ld.lld-ism. Any idea why
> this is only a problem under LTO? (Or is this an LLVM integrated
> assembler-ism?) Regardless, yes, let's nail it down:

With the LTO v1 series, LLD generated this relocation somewhere in the
.init.data section, but only with LTO:

  $ arch/x86/tools/relocs --abs-relocs vmlinux
  WARNING: Absolute relocations present
  Offset     Info     Type     Sym.Value Sym.Name
  ffffffff828e7fe0 0000000100000001 R_X86_64_64 0000000000000111
  L4_PAGE_OFFSET

It actually looks like this might not be a problem anymore with the
current ToT kernel and the v2 series, but I'll do some more testing to
confirm this and drop the patch from v3 if it's no longer needed.

Sami
