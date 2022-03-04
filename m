Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644214CDBCE
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Mar 2022 19:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241426AbiCDSJx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Mar 2022 13:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240532AbiCDSJw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Mar 2022 13:09:52 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFEF1C60D1
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Mar 2022 10:09:04 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id o8so8157092pgf.9
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Mar 2022 10:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yqxK85bZK7xDyQw2uCXi3loaqdFYPJjcAinZfxqk6do=;
        b=ocz1+Iw2gQLaJb2kUh6BCjlQE8FtpZ7onQytZBB4oTiku41XTQb2azH+A6m4FymENh
         NAhz4xCeV1dpJWdXtIOLKucZqrbpLU3XDDZnZu/knH/ZFLtyGFMioPHgUmN5h2xuI5s6
         CMoiAVi/wR7mULEHHgmDBVlensKUZylG60Y1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yqxK85bZK7xDyQw2uCXi3loaqdFYPJjcAinZfxqk6do=;
        b=PxYi4Cuw3K8dN6oMzbBfN31hT9ySfoy9YpjhTf0AK4pqtJGHRc2ZDbv3R4vOm0PBWc
         8719i9mV/rXmn9trFOmfAnldhzVuUR1b/P64CE8gsZ4JN+wuekODHImuicKQkIreAY/4
         AiO3ZiU1SlzTN3vjFZiqyLXIW1Z60TARJjsB1QgIxZQXJnmirKmsOh4YW5KltobOMwdE
         Ed2lx7PUcev7xBNa7aB2XBwbS+o/Chk6c20uIHSy8xELFstzQxYZO9+lCubK3ENfksCY
         PeqgCkjgw2tzuUl8wat8dyH3LDYpIlKqDbqXDyoT3Zwp7lEKF7/8cJYdkyTaW/SrA/x8
         vU9w==
X-Gm-Message-State: AOAM531mTNsat+k0+Fx9u/Uj2H2BSokLvpIOY0ln8GKYFA/p2Cz6SdHm
        kTbo2Iz07WXDpQ3umQFaOAvSqQ==
X-Google-Smtp-Source: ABdhPJx0NCCGjOT8EpZGR6/1/fL3PG5CbdMIqYeA3vaoHL7EPfBcyJQ0doJAvVQog4jtN8Af1IBekQ==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id j18-20020a056a00131200b004e158c4ddfdmr44651556pfu.65.1646417344203;
        Fri, 04 Mar 2022 10:09:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a00213200b004e17d967d13sm6276262pfj.124.2022.03.04.10.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 10:09:03 -0800 (PST)
Date:   Fri, 4 Mar 2022 10:09:03 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Shuah Khan <shuah@kernel.org>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2] kbuild: Make $(LLVM) more flexible
Message-ID: <202203041005.A3B985C@keescook>
References: <20220304170813.1689186-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304170813.1689186-1-nathan@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 04, 2022 at 10:08:14AM -0700, Nathan Chancellor wrote:
> [...]
> 
> Update and reorder the documentation to reflect these new additions.
> At the same time, notate that LLVM=0 is not the same as just omitting it
> altogether, which has confused people in the past.

Is it worth making LLVM=0 actually act the way it's expected to?

> Link: https://lore.kernel.org/r/20200317215515.226917-1-ndesaulniers@google.com/
> Link: https://lore.kernel.org/r/20220224151322.072632223@infradead.org/
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Looks good; minor .rst nit below...

Reviewed-by: Kees Cook <keescook@chromium.org>

> [...]
> -LLVM has substitutes for GNU binutils utilities. Kbuild supports ``LLVM=1``
> -to enable them. ::
> -
> -	make LLVM=1
> -
> -They can be enabled individually. The full list of the parameters: ::
> +LLVM has substitutes for GNU binutils utilities. They can be enabled individually.
> +The full list of supported make variables: ::

": ::" and "::" yield the same result. I think the latter is more
readable in non-rendered form. *shrug*

-Kees

-- 
Kees Cook
