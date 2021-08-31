Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BF53FCC56
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhHaRbY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbhHaRbX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:31:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30912C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:30:28 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so56007pjt.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RR58B/xYGJafxin5HeHSX4dLzWc56hmmhBLa05Y8cXM=;
        b=AbxW1+lW0iR9IecIcWmDkhs34/VdSO4avGg/BAMtpRoucC0VTQ+bku0ZpnWNCtdKKd
         s04U+9eOwwvYZUIT5xLheScJ37r88IsGEBmXVifrWhSlfnwu7wRjEOv2nS97FgdFwNca
         WWTsln9Gem/D1y8mj8uSkF/n1DgfvLwBwDnfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RR58B/xYGJafxin5HeHSX4dLzWc56hmmhBLa05Y8cXM=;
        b=bpWJHvmfgDvljDUBtJRBM3j1r9eQ3JEqKCGO6ARWH2wVVFkJsZvOnW/SMR0IrsLLwf
         iwVDxN87J6tUtvCX1S799uQfgzEORbc+nK2HERGcPNEI4Dxy54ChwGHr4UnHbJug72bk
         bvyxy+XiCtUqTjsVzMbe/J/OV+/Uc3w5mS0wBPjSRbp3w7XLRH8xt4dPFhGDf2PPe8/Y
         sdy5IeQAyWx0moFbbxHD8SQa0kUsrT5MSQlWJMowHMVqFL64LOx3kusrOH9eNHLDnNv3
         j1bNctfmF9LS97a3kw2+zJjGyu2dHxUStIbZuC/TG72Vhjs4L/y9/Ck3ylGz6PUFyOwZ
         bD2g==
X-Gm-Message-State: AOAM532nKL6tf7u3PdJmaKhZzxHMn6ebWWIx1ArGXbgzhlHsXEsvv4W1
        OE4FMV1kFgd+/mW1wIL1SsU2FQ==
X-Google-Smtp-Source: ABdhPJzn2E3XqZObb7PyG8evez59tKrv/PLIVSkTIsUT6DkRP7iTI6Mib+vjLKFL2rm1r/lNLENCFQ==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id p19-20020a170902b093b029012c0843b55amr5725338plr.83.1630431027801;
        Tue, 31 Aug 2021 10:30:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q3sm21692389pgf.18.2021.08.31.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:30:26 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:30:25 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] kbuild: store the objtool command in *.cmd files
Message-ID: <202108311030.41739E4@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-4-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:54PM +0900, Masahiro Yamada wrote:
> objtool_dep includes include/config/{ORC_UNWINDER,STACK_VALIDATION}
> so that all the objects are rebuilt when any of CONFIG_ORC_UNWINDER
> and CONFIG_STACK_VALIDATION is toggled.
> 
> As you can see in 'objtool_args', there are more CONFIG options
> that affect the objtool command line.
> 
> Adding more and more include/config/* is ugly and unmaintainable.
> 
> Another issue is that non-standard objects are needlessly rebuilt.
> Objects specified as OBJECT_FILES_NON_STANDARD is not processed by
> objtool, but they are rebuilt anyway when CONFIG_ORC_UNWINDER or
> CONFIG_STACK_VALIDATION is toggled. This is not a big deal, but
> better to fix.
> 
> A cleaner and more precise fix is to include the objtool command in
> *.cmd files so any command change is naturally detected by if_change.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yeah, nice solution for this.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
