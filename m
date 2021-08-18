Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F1C3F0D15
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhHRVFK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhHRVFK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:05:10 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49A2C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:04:34 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 7so3458446pfl.10
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IABWnr1aCDsDwxBBopzlg3HkRiMd7COJyG2pUzXE8/s=;
        b=Zqem0CoZzHLfKbevjQtLba+oPmNjxfqaUhbg758CCWbVL3Wrgsd0LChYumYDgT8nHV
         qXI38/TU57+DVyPDVWoD9EBR93b3G6c4a+oZmh44MnpRWPQD3Y87jvx77ewvhtyv0Y9m
         2cY4BXqC4SNIlGg0H/SqUG3+Xxrnmj9F9H2ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IABWnr1aCDsDwxBBopzlg3HkRiMd7COJyG2pUzXE8/s=;
        b=OIfLEb02oNVyEVs4osJVOUIMV80+UI7tVmDdDnUetpJPFuvZql2yYmAcdR3053Vk90
         VRO0wI5DHfRFANGhV3rNHZOOEaY1agSNdOQGHIiJG4psIQWCLdJgpi28teLjDrYBv2GK
         t4ewzG/JwjEzyyTlg7VZR+xpe7v7iAYguzN5VSBkUl0ToSopRKHYdBxbf5n5/8JTdOWP
         +aEzJwk2D+ZT8uYvNySFRY0kPJKyGlal2WFzhTQwjItPt92N/O2/+gE1cWHABhzn/yZD
         Pr32Y0Gxv133OuzWqpDruu+uj7n/9xiv2eF4Q860pdnjGvvmgmb6ALWHldH6sa9h930R
         8YFw==
X-Gm-Message-State: AOAM533JlQO77MvOZfvkNNq9uFRhS/SmICuloBnmlH1ZNlVOTg9IKlja
        1lj19seApngGQDqDwW5kpbnZag==
X-Google-Smtp-Source: ABdhPJzPYdmt1qIf1rGmc2u4in8hFFk0iRvjXLJ/SLffXJm1J8kmYOU3/WVPFV9cKWaMBooTd5z2+Q==
X-Received: by 2002:a63:f656:: with SMTP id u22mr10801321pgj.392.1629320674444;
        Wed, 18 Aug 2021 14:04:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f5sm687890pjo.23.2021.08.18.14.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:04:33 -0700 (PDT)
Date:   Wed, 18 Aug 2021 14:04:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/5] Compiler Attributes: Add __alloc_size() for better
 bounds checking
Message-ID: <202108181404.B5E8739C3C@keescook>
References: <20210818050841.2226600-1-keescook@chromium.org>
 <20210818050841.2226600-2-keescook@chromium.org>
 <d326fbfc-dc96-b6e9-6fd8-31df3eb9f1cb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d326fbfc-dc96-b6e9-6fd8-31df3eb9f1cb@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 11:04:32AM -0700, Nathan Chancellor wrote:
> On 8/17/2021 10:08 PM, Kees Cook wrote:
> > GCC and Clang can use the alloc_size attribute to better inform the
> > results of __builtin_object_size() (for compile-time constant values).
> > Clang can additionally use alloc_size to informt the results of
> > __builtin_dynamic_object_size() (for run-time values).
> > 
> > Additionally disables -Wno-alloc-size-larger-than since the allocators
> > already reject SIZE_MAX, and the compile-time warnings aren't helpful.
> 
> In addition to what Miguel said, it might be helpful to mention that this
> warning is GCC specific, I was a little confused at first as to why it was
> just being added in the GCC only block :)

Yes, good point. I'll call it out in particular.

> Otherwise, the attribute addition looks good to me. I will add my tag on v2.

Thanks!

-- 
Kees Cook
