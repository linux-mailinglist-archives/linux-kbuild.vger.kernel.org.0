Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C273FCC53
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbhHaRaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhHaRaP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:30:15 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19943C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:29:20 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id n18so17443956pgm.12
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RSq4kkCGUeqxs8n+SbVeKDpIAnqfTK/dU+BVOlRWCbQ=;
        b=edQOTlDqDT3rg8yccC7kgHBg2YISvi1JosO2QyWLRG12JWAAO2UTPrRAHa4j/A6lO0
         QZOcYw3kdpPuaEssqBPEQsrRkrh7/Ydu12GQtjZz2O9wWGCoGmFk8Tc/mFu2EgJKgOzb
         M2Q8l6iPO6Z7bR964yKbhZeAnPK0dO0F0yUlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RSq4kkCGUeqxs8n+SbVeKDpIAnqfTK/dU+BVOlRWCbQ=;
        b=Mh2GOz/Rh65+4yS+MoK7VNWZoDXpvawUfZcwXoxB2Pt9S43qFEHsJaTRvPZLLKj4Mc
         i00odPRTYGYG+rTW4VUt5CYC5oNW2l4E6NcsTcEI1YAg2iheon/hHWoW/lrH/0CNcVP+
         cXIkh2gtObrje7xAkM5F0llGA7f8w5V96qcBG/d8hPz045BAo00azoJPEUrxvhuluq2W
         tzHdJUj2J9vgAn5fLi4/Pq/c3a7ASblt7qKIs34ptW8+4YbI04CHXD6g8hUaSOdrzgvr
         lJfJw03FsqL1Dbhl/UGHzH5rMbe8/TO4U6RtB/awb7071spoinl1eyMweeiq3oxntiBT
         y/9Q==
X-Gm-Message-State: AOAM530LBr2/B5YOqc/SK58vsMHnrirKsCvEeTbPf1DGJyvUPGEKQ4up
        39YPEvZ92y30pV9igOJ8zUem9g==
X-Google-Smtp-Source: ABdhPJyZSsY4kbahuYsfNufjX8KiQBmJMg6lYjJj8BoR6mXwUswD3GgUMlRWIHDMxCt7V3GPAlg2qw==
X-Received: by 2002:a62:7d84:0:b029:3b8:49bb:4c3f with SMTP id y126-20020a627d840000b02903b849bb4c3fmr29686344pfc.49.1630430959576;
        Tue, 31 Aug 2021 10:29:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g17sm1758148pfi.168.2021.08.31.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:29:19 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:29:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] kbuild: rename __objtool_obj to objtool
Message-ID: <202108311029.484811C@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-3-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:53PM +0900, Masahiro Yamada wrote:
> Rename __objtool_obj to objtool, and move it out of the
> 'ifndef CONFIG_LTO_CLANG' conditional, so it can be used for
> cmd_cc_lto_link_modules as well.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yup, seems good.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
