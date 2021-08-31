Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F643FCC70
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhHaRld (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhHaRld (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:41:33 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C139C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:40:38 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q68so17469135pga.9
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e/lUs9VS8bNgCXkzAQ/A30iyRP/vIeFClAIrbPDNOgI=;
        b=ZWnE9DLc5a3Pa1cGrFEN7ht1umKjyp6cbkI2fIUDeGIPpB4NhXrDe+1d+3Abq5xJpB
         MnaJzTOhqBQOS1sKVtnXSB4OXSPlzmws6IzQtORVj6iJI+gL0y7ywcSoHsBZp58wJEEU
         CtbR/pjcQrghNCOhneHmolHtAe8C60P+JeR+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e/lUs9VS8bNgCXkzAQ/A30iyRP/vIeFClAIrbPDNOgI=;
        b=W7AEb0Nwc0iHPUTgQA58lGaUr/wGVs0MB5YlEYPVVBgUYyzygYLvDLWo7JOdBeTGJx
         8tfA036bMowtB/hpucHRtvrMi2fvndC4+iTeHiM4AlVpavvAopMCZ2MIBSXATHTQiedQ
         geEe804kJxLnxqleXYVHgrDQ3gJA/NkPcetbcIyDxRKVJKufzdXTUh8SH+tTfDe933/r
         4mUYeAqBb0+lKyTycG4LtgZeO6iYYJ1GTD/JQd7GfxMiYqXdvvWLTcN2ce5Okaq0jDEl
         Aps7as27lQiQfJDksE3JfuVBMMxu4Ja/fmIqDlFl2C3BrzyLDHegQWp5zfCRBjETEQ8I
         +E0Q==
X-Gm-Message-State: AOAM5320bSazQHlGodNloiIIgfGUn1Ss+DCIKltNVvO0Y3mSXzk4MpQI
        uigR/1TKD+TdXO9KmaJN0k9PUg==
X-Google-Smtp-Source: ABdhPJxEG61eVtEAivxMrdrhjEufs+36L8qK6bTIGFUMSD3vVgnPevrjXFvj0CakLIPE3k9vvkQUfA==
X-Received: by 2002:a62:483:0:b0:3e2:8b7:8208 with SMTP id 125-20020a620483000000b003e208b78208mr29498588pfe.42.1630431622847;
        Tue, 31 Aug 2021 10:40:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gk8sm1239537pjb.49.2021.08.31.10.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:40:22 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:40:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/13] kbuild: rebuild modules when objtool is updated
 for CONFIG_LTO_CLANG
Message-ID: <202108311040.1F8E65CC5D@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-11-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-11-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:40:01PM +0900, Masahiro Yamada wrote:
> We rebuilt objects when objtool was updated, but only for non LTO
> builds.
> 
> For CONFIG_LTO_CLANG, the objtool step is postponed by the link time,
> and nothing happens even if objtool is updated.
> 
> Add the proper objtool dependency to the pre-modpost module link
> for CONFIG_LTO_CLANG.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
