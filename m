Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AA33383D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhCLCqD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhCLCpa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:45:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16C4C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:29 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so10046419pjq.5
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kwV+ZEKg/XUTXzjIOI98K3vszan57O9kTgEQIPUcyY=;
        b=jjgy6DIlMrFWse7xf7SeVmNo6/eGcfxozbDUHSMQIaAkUvtKpYHpt1Nwc6YY8mktC0
         QvA45UlbJ3LdLEcjQJRShs+Mi+w+YtXcAlxhMbLCprgTfdm3QxYC9CKRfKXx0lp5VKN/
         0rig3eJkC3MeuhK1bHFBrPGYFC3oy4KEA3qQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kwV+ZEKg/XUTXzjIOI98K3vszan57O9kTgEQIPUcyY=;
        b=fZtgj5dWLmbJfPRD6uvEY/N4fuGGajP6Qu5WY3d7yNTN1GHgF8a6w4798Ll+KmoRyC
         8lU4HC1Iz2dVGTCAuqsd9qyfzaTqHD7Rx8oWY3QxpjHl2YuOgX54hWKjGmJUeF0RKUOt
         QquU3bZvDz/GDxhWHRbu9GivE83kovLV41Q55ZaFOW4m/+alKaGY5Wsqlr4VLG+oy//V
         9cX8toqQs/W2dnNTPE9K914aLS0ngvrNoMNnZJLmW0o2OeptUQQC+dut2YnMUOznYcxc
         tw1FN8UVPty6CTskq3AjFdVHnAvATwdkemZHP+oECw8H0HK7CQrzEHHA43ePWfUox/iG
         xN1A==
X-Gm-Message-State: AOAM530E0zuJ4CiBbeKnL8MxqGNlbxfN6neLNQcjP6Ru4ZDf2N4mlLf8
        OI79QP6sOBNIYWZGhPlRx1iybg==
X-Google-Smtp-Source: ABdhPJwDCBrjoyl24XQocrPBFT0JUae7XRtchBVIiOME05IAIHkeYXy2xsIRiO8vA4pM0qb+BqLZfg==
X-Received: by 2002:a17:90a:d507:: with SMTP id t7mr12125260pju.54.1615517129325;
        Thu, 11 Mar 2021 18:45:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h7sm3684714pfo.45.2021.03.11.18.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:45:28 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:45:27 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/17] lib/list_sort: fix function type mismatches
Message-ID: <202103111845.A61BBB44A5@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-10-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-10-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:11PM -0800, Sami Tolvanen wrote:
> Casting the comparison function to a different type trips indirect
> call Control-Flow Integrity (CFI) checking. Remove the additional
> consts from cmp_func, and the now unneeded casts.
> 
> Fixes: 043b3f7b6388 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
