Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9184B209735
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 01:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgFXXhg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 19:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388031AbgFXXhc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 19:37:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8092FC061795
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 16:37:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so2043965pjc.4
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mo7Dwe07kJhP63QLmOzciNFvW218NBaVIlEPp4HbWlg=;
        b=ghe0LNHZStIXrutzWngNn1w8HnVKxzkKAANg+f3UNbpWa1VXDLTQLRRUxQiw0ETxf1
         8IwO0ripMH+IKCR86WNY+ysG11jZ8MVO51xum9mEa475UtB+fdRpajYIKrof1LeRnhfw
         q/KZy9ALnBT7rcr/zSWyqYTnZ3OeY5pBxENZEDhKneGeIxS3jxNDb3T6z60V1Qc+Vdy6
         OTaykXWX6WKsBL92+Zu8AYSrqkunkoROSncALDdIHd5jRSMEYzkTx2v4nRNz4Z77j4S9
         tRCzT7qVWnXl4XZ9bSsfQVqiYUdUQyfJWFL+rlMfK7ACBBFVz6umkgQZxUMxIfkAgDuf
         rFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mo7Dwe07kJhP63QLmOzciNFvW218NBaVIlEPp4HbWlg=;
        b=Iw2DDNT/mYiIkfGXPbOwY2tVXZ8iFyIXQ3E8a1oNVpKbxgJbc0qUAUb7MutD7fN1pQ
         UvKBo5KmMMJjcIkz+CAwJtwP8KeClbhd0aqVcPtlBgIxCpEwuSz8c+Esr3fSRRJQoOBT
         SZCSwgwy1P/th0yfv6B5pGUQws3jiAV01GqBiovL9CXc0w00Yn34kLI5O9EeqjjlUh+5
         5HMLIQ6oV75cYrgloOaDx/bS4iVqKVl7l3a4sTxZVNDPFqXA4dnA59PnGbNOkzXMm9Ho
         7CvpKaLpMzDCf8lG5STDUtwpd8Ke40BxNqs0QqJXwDVRA68IhmKapcY7N64XfNnytfLz
         p0AA==
X-Gm-Message-State: AOAM532dqEZpYNEXuHt3gF/eNJAgVRcVuiG7Ct+cD7/Vb3YkPfg9ssrH
        Iq/KQRngckqB7+mCreXebTb+BQ==
X-Google-Smtp-Source: ABdhPJzbL+A8YRu6cQqMhEnH4JVMHPuZevDUkJdMyUg1rfNtOurVArWJG2BoYxI9g7/QXZLvtzZHnQ==
X-Received: by 2002:a17:90a:9d8b:: with SMTP id k11mr267919pjp.10.1593041850610;
        Wed, 24 Jun 2020 16:37:30 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id c9sm21338811pfr.72.2020.06.24.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 16:37:29 -0700 (PDT)
Date:   Wed, 24 Jun 2020 16:37:24 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, George Burgess IV <gbiv@google.com>
Subject: Re: [PATCH 06/22] kbuild: lto: limit inlining
Message-ID: <20200624233724.GA94769@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-7-samitolvanen@google.com>
 <20200624212055.GU4817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624212055.GU4817@hirez.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 11:20:55PM +0200, Peter Zijlstra wrote:
> On Wed, Jun 24, 2020 at 01:31:44PM -0700, Sami Tolvanen wrote:
> > This change limits function inlining across translation unit
> > boundaries in order to reduce the binary size with LTO.
> > 
> > The -import-instr-limit flag defines a size limit, as the number
> > of LLVM IR instructions, for importing functions from other TUs.
> > The default value is 100, and decreasing it to 5 reduces the size
> > of a stripped arm64 defconfig vmlinux by 11%.
> 
> Is that also the right number for x86? What about the effect on
> performance? What did 6 do? or 4?

This is the size limit we decided on for Android after testing on
arm64, but the number is obviously a compromise between code size
and performance. I'd be happy to benchmark this further once other
concerns have been resolved.

Sami
