Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7413F0AB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 19:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhHRR7S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 13:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbhHRR7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 13:59:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7030C0613D9
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 10:58:42 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so5671760pje.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=04ISnfQR+B0rcb/OFZEw0eB8ueZIQ4PQaRknilR6Dg0=;
        b=EE/CeXz6vjyMo7KPeu/SD6vdsPUTn6pv377B+z4KyjkKSzcySCd1XXhWCcxj+Tl1IO
         CA0Sz/mnQ8UO+5bK8u6Jo6/o/VKVzgMCTtk4WgGjjfWLiLoazibPnBOcWoxbe8CDSsZZ
         MdLvNCLJQnT1c+yXXYW211ZokJKEMcckrSHvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=04ISnfQR+B0rcb/OFZEw0eB8ueZIQ4PQaRknilR6Dg0=;
        b=lHsflA7DpLkQkOxakoO4ojQ770bJ0BjHktbGONuD8lgO1E9y+aKk2s882IsPD9kAt4
         gQUk2CPGqGg+1D3dVz7LJSyEYCHTdDe89cWdueVpiBQG/uQ5Ws/X3ILOUf4LoyehsC6d
         h+5ypAur5+Shs4eh7+tvzhjihhNCuwZDlagJs8BFYpeq9lLZZ3Ztq4TXdQSe8mN8YoTH
         73TGN2EFaPbr98rmGqgYL4OP6SzFrWWJREjQ/Se2blTz5uPluqwAOLpWRS605ar1wqlq
         gfojDj41kuWQDPPGomRF5dNaHsauH+3lx41OnfhwBhPr6XlP4pCfeLsOXuYntPQWGQRG
         czqQ==
X-Gm-Message-State: AOAM5334pYCl5JQ+M1JCe9Twf5x3f2g3eeiggX2KvUmd4p/vbyl3Mkyq
        wBjF54Y/dOyx9l+faBD/BLdtJg==
X-Google-Smtp-Source: ABdhPJyn5Rv2eflBuhy2ANoLJGXS/ATWvZlnQTzageP+62HeXM8nszkA+frPBp3vkUeigBBlAWpT/A==
X-Received: by 2002:a17:90a:458c:: with SMTP id v12mr10748262pjg.50.1629309522461;
        Wed, 18 Aug 2021 10:58:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o1sm411141pfd.129.2021.08.18.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 10:58:41 -0700 (PDT)
Date:   Wed, 18 Aug 2021 10:58:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/5] Compiler Attributes: Add __alloc_size() for better
 bounds checking
Message-ID: <202108181058.2BE1508@keescook>
References: <20210818050841.2226600-1-keescook@chromium.org>
 <20210818050841.2226600-2-keescook@chromium.org>
 <CANiq72=ym5ubiXgwt=xyyOSxnPFqgfArJsPyV9juOuwWN+PqCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=ym5ubiXgwt=xyyOSxnPFqgfArJsPyV9juOuwWN+PqCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 03:07:48PM +0200, Miguel Ojeda wrote:
> On Wed, Aug 18, 2021 at 7:08 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Clang can additionally use alloc_size to informt the results of
> 
> Typo.
> 
> > Additionally disables -Wno-alloc-size-larger-than since the allocators
> 
> Disables -Walloc-size-larger-than?
> 
> > already reject SIZE_MAX, and the compile-time warnings aren't helpful.
> 
> Perhaps a bit more context here (and/or in the comment in the
> Makefile) would be nice: i.e. why are they not helpful (even if
> rejected by the allocators).

Thanks for the review! I'll get this all fixed for v2.

-- 
Kees Cook
