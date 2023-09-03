Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2815790B90
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Sep 2023 13:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjICLPo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Sep 2023 07:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbjICLPo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Sep 2023 07:15:44 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2174212D
        for <linux-kbuild@vger.kernel.org>; Sun,  3 Sep 2023 04:15:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68a410316a2so278047b3a.0
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Sep 2023 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693739740; x=1694344540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc553DPy4Af9gG2DZ8elTIxxu5HChknTvh6LevqA5wY=;
        b=ZC83t5fq4IkNaWoLmc734P9LbxAEUQSbSqjGfyqtZetZQo3J9qZ3B3jUDokYHifGnV
         hpP9QEFQXiwdXNueBNtmJDfcwTR9XBQr+xMWI13g+UmvRx84Aa1gFAZD2A87Hn3tQ1Me
         0QS0JEuEHz0wgVpxIdKPW+FYlzFWtKF/mfsyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693739740; x=1694344540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc553DPy4Af9gG2DZ8elTIxxu5HChknTvh6LevqA5wY=;
        b=AW1S+6Ir9VxrPwtOT6RZhdDM1v2j3Jof+aWBQ3vJZ8xcgZZcMAzkzF9eI4/rklPTAb
         Xt3zgYhikaxRSzxHFeRFXr4l0ety/YCdvKA4t8qgheXt1OF4/I4r1D0mtJd7H5iW3p4C
         iPY6Cn1LVB2VAKxq6Y37ThjI3Ujrb2FzRwhEY0AMY1micI1vGIZNY2+SfmZdMtwBxQBo
         qnAeQgBzSh9/WRAqeG1mNCAXsMg1kj5faFzDze5smh8RGEkVwraGKNlQKpvvC24KohlH
         E5ddZyqhg553g3TbY5FCdmtlS6MrFVPf0wXP2cyQHrv37PB39lYqWH5G3wlzLjcR3hdf
         jtJQ==
X-Gm-Message-State: AOJu0Yz8tQQiDPYjkabywQat2jww8VvPFeSi7ik7kguqACqiBftwaYxk
        q59TudT2Agi3fz8ZNpk+f1jwgA==
X-Google-Smtp-Source: AGHT+IH280Ee0uGJE+Wfx6zorOK08XSHJvH3gTM5GBqMcabQhCpwuQw2bdoeS7vLBUTOtaDihxxjAg==
X-Received: by 2002:a05:6a20:4303:b0:148:f16f:113f with SMTP id h3-20020a056a20430300b00148f16f113fmr6647172pzk.12.1693739740468;
        Sun, 03 Sep 2023 04:15:40 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id f4-20020aa782c4000000b0068be7119e55sm5650313pfn.122.2023.09.03.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 04:15:39 -0700 (PDT)
Date:   Sun, 3 Sep 2023 20:15:35 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add warn-unknown-symbols sanity check
Message-ID: <20230903111535.GH3913@google.com>
References: <20230830004937.2938195-1-senozhatsky@chromium.org>
 <CAK7LNAQvFR0dQAFU2YiqxrXJTKcH0-=n0Fea1Q8pc7ZuHHf0zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQvFR0dQAFU2YiqxrXJTKcH0-=n0Fea1Q8pc7ZuHHf0zg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/31 23:56), Masahiro Yamada wrote:
> On Thu, Aug 31, 2023 at 11:15 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Introduce KCONFIG_WARN_UNKNOWN_SYMBOLS environment variable,
> > which makes Kconfig warn about unknown config symbols.
> >
> > This is especially useful for continuous kernel uprevs when
> > some symbols can be either removed or renamed between kernel
> > releases (which can go unnoticed otherwise).
> >
> > By default KCONFIG_WARN_UNKNOWN_SYMBOLS generates warnings,
> > which are non-terminal. There is an additional environment
> > variable KCONFIG_WERROR that overrides this behaviour and
> > turns warnings into errors.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> Applied to linux-kbuild. Thanks.

Thanks.
