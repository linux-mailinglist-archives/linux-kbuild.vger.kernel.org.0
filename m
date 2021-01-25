Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEC3302E9F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 23:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732909AbhAYWD5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 17:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733206AbhAYWDt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 17:03:49 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A612C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jan 2021 14:03:09 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id o20so9230027pfu.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jan 2021 14:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9uTkelnkgdH1/h1qSEC3+KB2ZZOMZMIqxRYnkoanZM4=;
        b=e48pg2fnQuL945QN5H8Vqv7bjX7l4CQIY5iNiZMX75XZLI2m+HxbhLqfsgNifpr/SZ
         qaR8nCtuU+N+h4snOkvPLNyDR8PxaMl8kXfvWPiXP/auSxLP+ru06vivV0yQ5r/mJqDh
         Pq1GsRCAqqvXIL7IvnbcFpPZJMU3JssEpiHKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9uTkelnkgdH1/h1qSEC3+KB2ZZOMZMIqxRYnkoanZM4=;
        b=bhHkEyMkqTFkclhcc6lT1RPBWLCvEvItb8+jrAzeYEhP1Ea/bnGFnSlxtzPuhHBGnH
         +3Vu96oTvuIr/qRls4CZyTgIlEXLrE8+Te8b0qDpbx/8ac3jYwyrpwXTZ5d+95Ax4LVK
         uEzt528OHC9CBYXrodEuZEUVTB04+P3TYADFrXn2AYCxokNnAofdYiSsrizpk0fUFL97
         cHq3HnEw/6izPQ9Qh+N7ZMcIw9YtCbc3BpBz7JwzmhnzLVAIeVNb08wWQVy3RuHBP06+
         fbBTJpp+Nq5xSki/IajzVUvuxsqQEV1gOqWW38F99qoFrcgIdakxTrcbfoSRqiyWIDIt
         VvvQ==
X-Gm-Message-State: AOAM532WxiWxVi2oEbTbX+Ibb78UAmcgJWW18nAulcFK1X4E+eQEImVT
        E6xLh34Ne23AN8XvRrHikLh1Iw==
X-Google-Smtp-Source: ABdhPJxELKHojiOS5LE+ZaEcSNUqh2aAeWOTc0igtRFBcAtlACI3x+7qSajwJcaRvf2ETtq/yQ/s3A==
X-Received: by 2002:a63:5d5f:: with SMTP id o31mr2597849pgm.295.1611612189024;
        Mon, 25 Jan 2021 14:03:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a131sm18614270pfd.171.2021.01.25.14.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:03:08 -0800 (PST)
Date:   Mon, 25 Jan 2021 14:03:07 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <202101251401.F18409FDD1@keescook>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 02:42:10PM -0600, Josh Poimboeuf wrote:
> When a GCC version mismatch is detected, print a warning and disable the
> plugin.  The only exception is the RANDSTRUCT plugin which needs all
> code to see the same struct layouts.  In that case print an error.

I prefer this patch as-is: only randstruct needs a hard failure. The
others likely work (in fact, randstruct likely works too).

Masahiro, are you suggesting to be a hard-failure for all plugins?

-- 
Kees Cook
