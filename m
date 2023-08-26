Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F097893F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Aug 2023 07:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjHZFxj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Aug 2023 01:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjHZFxb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Aug 2023 01:53:31 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F40C26A5
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 22:53:28 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bdca7cc28dso13432465ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 22:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693029208; x=1693634008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8a8yRHibxZaMQvp8EuhSuU+8SaRLddJ0DMHrupkDBok=;
        b=GjP+E8MXeN21Nul3dWASH87dmTBT6gsSnR60OTl16V9oleYd7rPu9Z3KvsUuectm4G
         9A7AbakZbHykqI2zkLqfFnNVIzrQjl14tbuV4vjAT6d7qFKQ2ucP0tao/lhQq7eI4WUW
         67OxTAvIdz24IBVov+9wc4hEo3/y2uNOy7T2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693029208; x=1693634008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8a8yRHibxZaMQvp8EuhSuU+8SaRLddJ0DMHrupkDBok=;
        b=Tiao25ilyFYxaS4DBd86Xl2hCJnUeuqu9u0TD2flrzn1cfqJivV1E8XJpE052mlguK
         z515nDdm5JTlsqutXZE9pQv2YPgxjimsaXKWAc3tDwBshenO6yYDTuNFWTQGbwNUk2ww
         zLb43AqCiqDQIHPP90Mte/mQLe4itPr0qLh4Qzzhrjx0yuDpwKNqdZlEBoFBDOxxZO6s
         cPw/ZxSX7/Axa6/1ttKDC2RG3zSkITcJGdCWmSF2DRD3ZgfBZO9JMOwQjvpH6ZprchsM
         grAh051Ug03cYpfrgXfCdfQIJsGivv5u7Q2QQoSXnoq1wkHAS4UDy087VtNGAOZXK+Ry
         TqbA==
X-Gm-Message-State: AOJu0YyBTtNfJnvMyKXc6fbWU1hPk7ng0deyfqZzObC+NZrovURTShd6
        M4b5AKvF9DJUVEjBeAoUkbX2HQ==
X-Google-Smtp-Source: AGHT+IF++SrkXFK38Qj/F9y/LukAEEKLFdwReys5NfnrdSUHs8pNQlTgTge+TbQzhGVzZyJoZBj/Yw==
X-Received: by 2002:a17:902:e5cd:b0:1b0:f8:9b2d with SMTP id u13-20020a170902e5cd00b001b000f89b2dmr23972880plf.29.1693029207746;
        Fri, 25 Aug 2023 22:53:27 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001b694140d96sm2776475plg.170.2023.08.25.22.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 22:53:27 -0700 (PDT)
Date:   Sat, 26 Aug 2023 14:53:21 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ying Sun <sunying@nj.iscas.ac.cn>,
        Jesse T <mr.bossman075@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230826055321.GF3913@google.com>
References: <20230820024519.GK907732@google.com>
 <CAK7LNAS9KC1GjPgadMEivSpy4TMYU8mQ+BrtfJpNs2kvhK18yA@mail.gmail.com>
 <20230820072119.GM907732@google.com>
 <20230820073332.GN907732@google.com>
 <CAK7LNARTZXvWD8PrA3bC+Ok7LK85qO=pkMs4kOPGn90OBooL6w@mail.gmail.com>
 <20230822061203.GA610023@google.com>
 <CAK7LNAS0qEZk+xAq84=7SuJSQz5F3dNBjYKPoeKTd_caq-QMKg@mail.gmail.com>
 <20230824012027.GD3913@google.com>
 <CAK7LNATvDBwN7X8X0mVqcQn6dKxGFhkgt9Qb5CZ6p+6Eafxd0w@mail.gmail.com>
 <CAK7LNARMOpzpr6E6XG-ro5dUgFWMP9r5rqET1WquOvvsckbKyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARMOpzpr6E6XG-ro5dUgFWMP9r5rqET1WquOvvsckbKyA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/26 14:38), Masahiro Yamada wrote:
> > I am fine with implementing both.
> >
> > But, I'd like to implement them as separate options.
> > (one option for warn unknown symbols,
> > another for for turning warnings into errors)
> >
> >
> >
> > As I replied to Tomasz, I am considering about
> > env variables vs command line options associated with W= option.
> 
> 
> 
> With a little more thought, the command line option approach
> would require more code changes and efforts.
> 

Sounds good.

> So, I am OK with adding new env variables.
> Could you add two env variables?

Absolutely.

> I think
> 
> the first two hunks (show warnings for symbols not found in Kconfig)
>         -> KCONFIG_WARN_UNKNOWN_SYMBOLS
> 
> the last hunk (turn warnings into errors)
>         -> KCONFIG_WERROR
> 
> (You can suggest a better naming if you have, but I guess
> KCONFIG_WARN_*  will be consistent in case
> more warning requests come up.)

Looks good.

I'll send a patch in the coming days.
