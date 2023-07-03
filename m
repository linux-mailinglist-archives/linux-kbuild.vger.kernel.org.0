Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEAE7454A9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jul 2023 06:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjGCExU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jul 2023 00:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjGCExT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jul 2023 00:53:19 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A1794
        for <linux-kbuild@vger.kernel.org>; Sun,  2 Jul 2023 21:53:18 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1b06c978946so3795895fac.0
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Jul 2023 21:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688359997; x=1690951997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ztHbORa6Mv8J6IM+MDUzcFkUhEhfmIOo7sS9A86ffo=;
        b=bndAJq8A+Vdp6wNh0ejKVvhR7zVmwOHNfwohtrVdLksPIO4CwkFVT83qAMiL1662Ff
         W1Wn7d0NaZOKS6JdRTimOOi2xjzpOYA2PO8BWhfqGe2DDmcayrF/pqbkK34WlVPe/NaS
         w3Gt9bdcu3pTM4h23U50CvdU2M7FSMd6BGly8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688359997; x=1690951997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ztHbORa6Mv8J6IM+MDUzcFkUhEhfmIOo7sS9A86ffo=;
        b=INPrtE19fyUqsjUFLMn29WmXfDYMmqK8CC04WKRzKalfQWjqCVFlTmKsLYxPmOOhV7
         WoaFncUPikXZ4nEPVa85u57sbT5Jd0KSjFC2zJS5JJtttf6c6VBvsFWYNNFUUROocR0J
         pq4kDgJBe1wwokbxEmgCFuMmlqwUrIYVgvBaLKH7Oa5IsoYALnD8xTKWLRkUdMG1W3qh
         09do31GPWxRIc0QNSmHlbYN6M7wcCXxOvqvnBCAHVvvrjo2kGkGpe4TWlPz6BVv9PAqP
         ccuqSLTNsGpB+G5kA23CmAgLi88+JYAeHfk1aZe/+t8x/gz44HKKFkX/qi5K2xM4zTJD
         OJOA==
X-Gm-Message-State: AC+VfDytGpnBX8++jPmK/43FaQOYTn5TO1kjQQhBW3wk8k65cuDK2m3R
        G+qrCgjN8z44vd5TMuHPfz97If3+Y8EbRq9Dfc8=
X-Google-Smtp-Source: ACHHUZ7frFA8N23p+9rckOQ2Uzl4tXWNGv/mBpEPOwT7VbmXLV6tzXelYqcHMmi9PpujsklDvtGaJw==
X-Received: by 2002:a05:6808:35a:b0:3a1:dd99:8158 with SMTP id j26-20020a056808035a00b003a1dd998158mr8884961oie.6.1688359997213;
        Sun, 02 Jul 2023 21:53:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm14230044pjb.49.2023.07.02.21.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:53:16 -0700 (PDT)
Date:   Sun, 2 Jul 2023 21:53:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LLVM <llvm@lists.linux.dev>,
        linux-kbuild@vger.kernel.org,
        Linux Regressions <regressions@lists.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307022151.105BC33@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
 <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4ea9488c-0f98-89b4-7af3-174cfcdaa02c@alu.unizg.hr>
 <202307022115.D96AB033F@keescook>
 <b27f513d-38a5-5422-ba32-f2ccfdfae909@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b27f513d-38a5-5422-ba32-f2ccfdfae909@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 02, 2023 at 09:38:50PM -0700, Guenter Roeck wrote:
> On 7/2/23 21:30, Kees Cook wrote:
> > I don't understand what tree you're testing. 2d47c6956ab3 is only in
> > Linus's latest tree, which is not 6.4-rc2.
> > 
> 
> Maybe this ?
> 
> $ git checkout -b testing 2d47c6956ab3
> Updating files: 100% (15501/15501), done.
> Switched to a new branch 'testing'
> groeck@server:~/src/linux-staging$ git describe
> v6.4-rc2-1-g2d47c6956ab3

Oh, it's the bisection position -- 2d47c6956ab3 was based on v6.4-rc2.
Got it. Thank you!

-Kees

-- 
Kees Cook
