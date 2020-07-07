Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DADD21734A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 18:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgGGQFi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 12:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgGGQFg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 12:05:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6921C08C5E1
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 09:05:36 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m22so9842195pgv.9
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2020 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BauIxngYcl8jd5OtL8hzkCrhdMv4YPyYU2tM2gh0/zA=;
        b=Kh7nComzMNl6xsg1nwO6fTiV+447hKNoK6M36Sv6NGey7FnS2nbTYWy8lHEpSDOcWo
         4SZpHdhE0vPOCZrLWLvUJOXmOSR8Gz0owQI+bbcY+s+LsNbCgXfdxmGINNOc3+OKJSEQ
         2u6uTR/n4oEx4IA4WPkbLFvCRTsqJQgdkA4/RHz0JUrD5DCmtPUS6lEOlEKwOu+XAqvh
         gr91UwjGRhE2Bo40UIkl4Z5vIAwl8OKTz32MsAM4e2vgnAlsinZ/e9QSyBdyERrQzk4E
         y2Omj76am6hjUTfQD5hz2Tiyvs2LsHeHNRlGxwsexsoYrijIaIiXs/D6btrWCA81JdA6
         s9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BauIxngYcl8jd5OtL8hzkCrhdMv4YPyYU2tM2gh0/zA=;
        b=h1RvLX/uUswbsSfAus0e0pZcHhei5vwtHvwTg1n5y/WB4aeFeExfJWkKe6gKC487nB
         FhpcBtaxlCHr3Q39SMxxstoUUMXL31S3HzoO6CVtNbqEKnQaiuSdsN6qM0IZAcgn5OuO
         8D1BkyFODyMMdtyM9XLZIudE+PR8vrWsrqz6AjnKOEiwxfYjOjwt1gFNCriV0lHcaBhx
         Ip45F/1oh44lkSJcwV8xD11RsupXeF65qvcxckMFRh+dfd8n7PiFvfMh5eHoggtIDXX0
         n9NXC2oJ0EZhkPQCa4C3OlIUnsLYOGrIwb/lTzON4xqN7s1MAFg3eiPiq8CkvF/hijZj
         doZg==
X-Gm-Message-State: AOAM533TnYg+emxGAW390ftdePTFP520Ev/68MLkdiOvDPo+irAC79xS
        l3gEZxK/vvpfACauqYhiOFqaFQ==
X-Google-Smtp-Source: ABdhPJzJoQVw/SVeuV11W977gCqEtq+6LHotqK+2sy2PsCIQUHIzgnZiA2b8Kfx/70bokWXpdDZzGg==
X-Received: by 2002:a63:5110:: with SMTP id f16mr44344138pgb.377.1594137935802;
        Tue, 07 Jul 2020 09:05:35 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
        by smtp.gmail.com with ESMTPSA id j17sm1222342pgn.87.2020.07.07.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:05:34 -0700 (PDT)
Date:   Tue, 7 Jul 2020 09:05:28 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, X86 ML <x86@kernel.org>
Subject: Re: [PATCH 00/22] add support for Clang LTO
Message-ID: <20200707160528.GA1300535@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <CAK7LNASvb0UDJ0U5wkYYRzTAdnEs64HjXpEUL7d=V0CXiAXcNw@mail.gmail.com>
 <20200629232059.GA3787278@google.com>
 <20200707155107.GA3357035@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707155107.GA3357035@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 07, 2020 at 08:51:07AM -0700, Sami Tolvanen wrote:
> After spending some time debugging this with Nick, it looks like the
> error is caused by a recent optimization change in LLVM, which together
> with the inlining of ur_load_imm_any into jeq_imm, changes a runtime
> check in FIELD_FIT that would always fail, to a compile-time check that
> breaks the build. In jeq_imm, we have:
> 
>     /* struct bpf_insn: _s32 imm */
>     u64 imm = insn->imm; /* sign extend */
>     ...
>     if (imm >> 32) { /* non-zero only if insn->imm is negative */
>     	/* inlined from ur_load_imm_any */
> 	u32 __imm = imm >> 32; /* therefore, always 0xffffffff */
> 
>         /*
> 	 * __imm has a value known at compile-time, which means
> 	 * __builtin_constant_p(__imm) is true and we end up with
> 	 * essentially this in __BF_FIELD_CHECK:
> 	 */
> 	if (__builtin_constant_p(__imm) && __imm <= 255)

Should be __imm > 255, of course, which means the compiler will generate
a call to __compiletime_assert.

> Jiong, Jakub, do you see any issues here?

(Jiong's email bounced, so removing from the recipient list.)

Sami
