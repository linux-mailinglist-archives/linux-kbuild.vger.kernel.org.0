Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8422C0326
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 11:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgKWKVy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 05:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbgKWKVx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 05:21:53 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F594C061A4F
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 02:21:53 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id bo9so16736193ejb.13
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KicNkypOIaNLZNofAMT0/dbRVfdiQb0EG7yDuWE5ulA=;
        b=TDVt/xqwo7FGjOiB50CURiRd4zX8Glpc/xzed4IR3D50NS0EqlijbKWHNsEmT9A92f
         opeYzaDlby6Pgpezpy0Z6eYOPQW6ipaIAyEAtip0SZR01YDtd+SICLsxoZ+9krn8s+et
         lULt1gHvEOthv2285g8UdKxZGn8PuitA3T+FAGLQ/qKxFihLT0OrTedRRYXRz8VblfZD
         a1sXohEAJiNhEPF+raDuSX6Ta4nQGnI6siEeVnxshXZXFTiwE+mIarl4EbBFaSYp4ZqT
         zvmMqJJexFfo+5+oFHJeofxyxcmA2hqWZAvCeahk9touSv1o0xYBPyhqFNpgNP0LgZcR
         CU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KicNkypOIaNLZNofAMT0/dbRVfdiQb0EG7yDuWE5ulA=;
        b=Til7NM6ZSajfnAijeea74ZXiaxZQBuMTGnxoarYZCgDHTurOxIjYuokEsluVHwX0mX
         zbpmbrLfLa6/vko33OP6AgwxenpWZ51UGduYW73UrcXUGyjTFbcLr9HzXDOntYggr3Zt
         NO4ad+qR/dlRCeMoVwZYkSmdK7gRlMRKe5gRav6Zm/UPThymH/8xwUdLpnKyeME954xp
         l/fMJ22egKHuryZB4NwYpuKfPOec9SuiHnEWnugcTdtqBREjZdxc7PVS+xycDI0sm/cp
         ZnfBzyrvEdOYjase1RGxWFFtQmYmsRw/qcj+u4qkJa4jXr05xl0neoXrJxFYQwqx2AO7
         xCFQ==
X-Gm-Message-State: AOAM533f3itSsp1GtT9fMvqC65ywD7oxv5On0Zq7+jkSKixsDRN5mfoq
        I9qHT6fbGlluLkDWNdI2hL4CgA==
X-Google-Smtp-Source: ABdhPJxFSYMYi0puK0drxRNruUpOKNZHKEgE3EPEQ608H69x9iUkj+1IRAw3SWeiVlPLVEVUtEhq+A==
X-Received: by 2002:a17:906:8058:: with SMTP id x24mr44772875ejw.272.1606126911958;
        Mon, 23 Nov 2020 02:21:51 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:acac:b2ef:c7d:fd8a])
        by smtp.gmail.com with ESMTPSA id k3sm4725861ejd.36.2020.11.23.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:21:51 -0800 (PST)
Date:   Mon, 23 Nov 2020 10:21:49 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 15/17] KVM: arm64: disable LTO for the nVHE directory
Message-ID: <20201123102149.ogl642tw234qod62@google.com>
References: <20201118220731.925424-1-samitolvanen@google.com>
 <20201118220731.925424-16-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118220731.925424-16-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hey Sami,

On Wed, Nov 18, 2020 at 02:07:29PM -0800, Sami Tolvanen wrote:
> We use objcopy to manipulate ELF binaries for the nVHE code,
> which fails with LTO as the compiler produces LLVM bitcode
> instead. Disable LTO for this code to allow objcopy to be used.

We now partially link the nVHE code (generating machine code) before objcopy,
so I think you should be able to drop this patch now. Tried building your
branch without it, ran a couple of unit tests and all seems fine.

David
