Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F36178934A
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Aug 2023 04:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjHZCLX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Aug 2023 22:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbjHZCLG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Aug 2023 22:11:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C84213C
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 19:11:02 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bf0b24d925so11988035ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 19:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693015861; x=1693620661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPWOoWHt/lH4WZuEsQTLkWu8LDmhoXr7davIxjOLtkI=;
        b=DYWqSLJYFDjmEujdJUyGZPDzMJjpVBwoy7u5P5SftCojipzDzVp+MoAs37/sTqFTmv
         l0hRK8ca+uD2v+6uIPDFgh1ahunDrIGkRbPx1Kt8wMNpl7JHPG0wGX7/C7ebp9cIrLKp
         YtmQmH/EVts6Lqi4xkMFTzsD3wj+8G7Msjies=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693015861; x=1693620661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPWOoWHt/lH4WZuEsQTLkWu8LDmhoXr7davIxjOLtkI=;
        b=L21DV0Bs6NY+zztnyAB+HKpt7Xbhl6N80pRM9fABr3btYHZjuD/MYF521OVa81McDd
         tUJscwnss9d/5okcdcxQQj3x3cGhtAORQHpF2lW8jJowuGy0WQ+O4Yg7N+4Kbr13V99I
         qXZejHkHKg9e2CaRRlOGKYDlUyhTu4awnJMJVpXlRSVo5KE9SdL5ORjwGYR/MVbvt5ek
         BKYiDYtboj+XcDmc3iqg1eFoOY7dSgsbWqQ8wSa2HWQY7jttUwCzriOHlTppU8PRroWK
         FG04SadjMYEJwJsra5Ag2BWBr+qIMkRdO/TTAX4PiS5FpgY7Ml6Zow6XVhjYXLm4T30o
         7iHA==
X-Gm-Message-State: AOJu0YwA8zBToFKuRJakNCamgayk6EVE5lU4uBnrsKFqmNiKKC3lfckk
        TEfzZYbeKRycn+HeycVLacKKYw==
X-Google-Smtp-Source: AGHT+IHpBCxlFP0TP8hz8qcnoHMpUgTDoTcIalcAmgrOSVftHbTNvctFIaJkH4ok0Cx2UliiJOscPQ==
X-Received: by 2002:a17:902:ee4d:b0:1b8:c580:5fb9 with SMTP id 13-20020a170902ee4d00b001b8c5805fb9mr17204374plo.14.1693015861498;
        Fri, 25 Aug 2023 19:11:01 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id d20-20020a170902c19400b001b66a71a4a0sm2473498pld.32.2023.08.25.19.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 19:11:00 -0700 (PDT)
Date:   Sat, 26 Aug 2023 11:10:54 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ying Sun <sunying@nj.iscas.ac.cn>,
        Jesse T <mr.bossman075@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230826021054.GE3913@google.com>
References: <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
 <20230820024519.GK907732@google.com>
 <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com>
 <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com>
 <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
 <CAAFQd5DeDEhPUQScXB67v9giiV=G33L-YDdtF4e-+UcmBXG6jA@mail.gmail.com>
 <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATj-jnOLMkgzz=3MfqWgUjKF-MwSKQkr4hW0g7+tEsXUw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/26 10:10), Masahiro Yamada wrote:
> 
> I am considering how to implement it.
> 
> One way is to add env variables as a new request arises.
> 
> Sergey is doing two things by one option.
> 
>    KCONFIG_WARN_UNKNWON_SYMBOL : warn unknown symbol in input .config
> or defconfig
>    KCONFIG_WARN_TO_ERROR       : turn warnings into errors
> 
> Another way is to handle those as command line options.
> 
>   -Wunknown-symbol
>   -Werror             (associated with W=e)
>   -Wall               (associated with W=1)
> 
>   $ make W=1e olddefconfig
> 
> will work to sanity check.

Sounds good. Being able to choose whether those sanity checks are
warnings or errors is quite handful.

I don't have preferences as to implementation. Env variables seem to
have very clear and descriptive names. Command line options look fine
too. I'd probably prefer command line args.
