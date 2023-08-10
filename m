Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1485D7780EF
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Aug 2023 21:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbjHJTCw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Aug 2023 15:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbjHJTCw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2023 15:02:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A2726BC
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Aug 2023 12:02:51 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26814e27a9eso759407a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Aug 2023 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691694171; x=1692298971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lTerh5FxUXJzMDiiz5BJKMRyeOamjSvHt07GYvi4Kg=;
        b=f2pud/Zq/O2/8ChznoUK0UDXJDmdCRhJJEZv29JuSYcWMG/Grl9pkgwwczumeiLG94
         rZLnyqSOCc4OO8NBBRh0J1E0SEOtNwucMp3uatZhTctkiVaoUJekdeX8xeZrVwEmNdUL
         hvSgiPnPVl11YFgixBmJB98oJQcTrJa7I0iCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691694171; x=1692298971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lTerh5FxUXJzMDiiz5BJKMRyeOamjSvHt07GYvi4Kg=;
        b=BeLkel0SFI+Tvcafxa9e9LeKG+2cjeUDb5u6BlPtawPEiJG9xDyUWV77Ii+5aUnpIT
         GynsF/E7OM8JPumsIWGXtcVWL8Qh+zSHvZoOQh7bGnAhaVd5/rYO8MJ0aSXY8Va1uUje
         /akBMMicb49wY9fOXMxE+3pDeO8CSBwG9BZT+EY3FyZcbnXMM4ppdjlhpzaCIXU7OUnx
         cyF/vkQSv5kkJmVjZsBx9e3ckZBnTCA0nb/dIGepd5PP77XNyem6Czo/dpbVgWgBEQcg
         Haj6mgquVc8y/8vIRVzOLFg5Q3pPQ2llRbex5rDRbJ6Z3ktpqiGWIHGsqp+CTA0+onYo
         PCpQ==
X-Gm-Message-State: AOJu0Ywr6O6haQQ2fVivNXKdPmsOXI2DG0ww4HSScCKKd+ZK2fd+x25J
        prakx56/XqA7IaPnH5P/vPlSDw==
X-Google-Smtp-Source: AGHT+IGsKoIFUtQIb3ztR/ylg1Yc1GphO+I2cp9J318HeLWvDHfxA13IVrTJXjmBlxGkIlxH0DSlHA==
X-Received: by 2002:a17:90a:6f05:b0:268:6ed5:117c with SMTP id d5-20020a17090a6f0500b002686ed5117cmr2547722pjk.18.1691694171237;
        Thu, 10 Aug 2023 12:02:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c30-20020a17090a492100b0026094c23d0asm1985840pjh.17.2023.08.10.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:02:50 -0700 (PDT)
Date:   Thu, 10 Aug 2023 12:02:50 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 17/17] [RFC] Makefile.extrawarn: turn on
 missing-prototypes again
Message-ID: <202308101202.EA83B53@keescook>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-18-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810141947.1236730-18-arnd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 10, 2023 at 04:19:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Over the years we went from > 1000 of warnings to under 100 earlier
> this year, and I sent patches to address all the ones that I saw with
> compile testing randcom configs on arm64, arm and x86 kernels. This is a
> really useful warning, as it catches real bugs when there are mismatched
> prototypes. In particular with kernel control flow integrity enabled,
> those are no longer allowed.
> 
> Move the options out of the W=1 section to have them enabled by
> default.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm sure there are still regressions with CONFIG_WERROR when this gets
> turned on, but it's getting very close, so it might be best to already
> enable this in linux-next but wait one extra merge window to have it in
> mainline while the last fixes trickle in.
> ---

Thanks for chasing all of these down!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
