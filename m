Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1EA748567
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jul 2023 15:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjGENvh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Jul 2023 09:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjGENvg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Jul 2023 09:51:36 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC10FC
        for <linux-kbuild@vger.kernel.org>; Wed,  5 Jul 2023 06:51:35 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-635fa79d7c0so3360616d6.1
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Jul 2023 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688565094; x=1691157094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5apOaiMx4aHIZYDygISPCljy09Kxleg9B14ZIbs1TQc=;
        b=DFv69jAa169oZfdZVANCwMoJwKhBzuhXr9LtAQ+/ducYplJpEivdLI15TUVCJJIgCk
         4gMpt5mxVar7H9MIK9MfcWga5voAtXzzxQytb9FoGJcm1GqS1nCRU0x711NJCsFOajbT
         BgiE0hj9Mv1KRRll8RabNAmDNpRdrV4O+Sbzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688565094; x=1691157094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5apOaiMx4aHIZYDygISPCljy09Kxleg9B14ZIbs1TQc=;
        b=Tq0WYPwxSwKIqqsfweW71TQ78TNRP6U2zphWE8aBZtsWoBKfmfXBVbG79HBOt+9ZrS
         MP5dsElQ+Ry3xmWATYcBLtrNaMRsNu2wMGE+B1icypN2hiZUx++DDHwXTAjkeiuowolg
         EBmiTKdog8j85EZWT8SaGwchwvj98BC/1Nu5UIENrwBjzZ6kdDnDC569M4NfxeMWGZf9
         kCLh1QbpbAZAPA5Rbd/uC+3KdwMsLLFFNhATTZ1CWKHICcxoFxsALgK+sGMsDEQe3r0A
         M9TFB+ZqmTDOFhdvKr8Hnb8ShIiKEqC7ynox6V7kvSd3H76VU12V7krwhvffViPhEXx6
         8Iag==
X-Gm-Message-State: ABy/qLbLVW407YRHbejOlQ6Za9MpUleGRMpsSMJAYOJ8QQV1bWiwlEoG
        ZjmbnzylYyNu4afjSEKojnWyhHqZIcEuHvf0cUY=
X-Google-Smtp-Source: APBJJlFrKdsk6Z8ftHE3yyBe2+9DSPUpRZhSBsBN9RBGN3Cz04IANS28RNL0R7F8wuJWvLbLm9a9Ug==
X-Received: by 2002:a0c:f4c8:0:b0:616:5755:ca5d with SMTP id o8-20020a0cf4c8000000b006165755ca5dmr2612844qvm.4.1688565094514;
        Wed, 05 Jul 2023 06:51:34 -0700 (PDT)
Received: from nitro.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id eb9-20020ad44e49000000b006263c531f61sm13526728qvb.24.2023.07.05.06.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:51:33 -0700 (PDT)
Date:   Wed, 5 Jul 2023 09:51:22 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Willy Tarreau <w@1wt.eu>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Overly aggressive .gitignore file?
Message-ID: <20230705-91-oregon-tribune-77e07e@meerkat>
References: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
 <20230704211509.GA21834@1wt.eu>
 <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
 <20230704213415.GA21872@1wt.eu>
 <CAHk-=wjPEjrB7eCukREhWu-0qfjbFD-K8sk1TYYRgeHzYr1tuQ@mail.gmail.com>
 <20230704215600.GA22271@1wt.eu>
 <CAHk-=whMytacPBHfKKi8GYdgfadNy5LA-1TDHrTtz22eJr2B1Q@mail.gmail.com>
 <20230704222758.GB22271@1wt.eu>
 <20230705004129.GI1178919@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230705004129.GI1178919@mit.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 04, 2023 at 08:41:29PM -0400, Theodore Ts'o wrote:
> For whatever it's worth, I always run "b4 am -o /tmp/m ...", so all of
> the .mbox files end up in /tmp/m.  Similarly, I'll always run "git ty
> -o /tmp/e ..." so all of the thanks file end up in /tmp/e.  And that
> way I inspect the b4 output files before I run "git am -s /tmp/m/..."
> or "git send-mail /tmp/e/...".

I *have* considered auto-cleanup of stale .mbx/.cover files using the same
logic we use with "b4 ty" to recognize when a series has been already applied.
I can turn this on as an experimental feature in the current master and see if
this is at all useful.

-K
