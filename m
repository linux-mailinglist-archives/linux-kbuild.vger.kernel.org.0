Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34775977DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Aug 2022 22:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241960AbiHQU0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Aug 2022 16:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241956AbiHQU0V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Aug 2022 16:26:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411B3A98FE
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2022 13:26:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t22so13482639pjy.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2022 13:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=voGEdX63KoW+ZibFVnZJzdsesBOjZP2It8KT+faXmbQ=;
        b=Cl+T9KLC4EJmcz1MyKRqJ76dq4omiP8QcIYqcj9jXcpGW1Oj9XAbG0YqZGHvjN3feL
         DEZk0TIvBJiJlgBQY/wa5KrN3ksWyFi6If4yOSjmSNPXnL+a2luAQmTKADLXOJC7Ssb2
         owbs/RFNuCJUTsb6vTH7Fhkx4YGcwAZOVIpsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=voGEdX63KoW+ZibFVnZJzdsesBOjZP2It8KT+faXmbQ=;
        b=pXTGRg6/Ts7CyxNEJvMie2/LqOKjQ5WqIK8EvJzEMPAspUCC9SO+Q3gzNMm1IEnvzB
         sZTyKZmmJ3YZxqCXps6M2ssbSGI+0IYcoYZ3da4yKLed862HpoAGkjiZpwvll8/L8mwF
         ZBA7UFfdCsqoU5IYHpQgOeQB5RydN7tHFXSk+Ysm0LlHY+ph3+rL5NrbbL++WZHieo89
         4qmn6o28IcwtFs6Ww/AQxYBp7i6HO6JUQ1lLTm+IjP7RIZRHAPz5wD1Vsq8po88TqpoP
         pNvIl2PO2tYmH2/vfmS7X5qSGrYaveFHaqwZraFCmHETkTiXfkYMIVEjvmsixLMYUslZ
         PH/g==
X-Gm-Message-State: ACgBeo197ypvDhbNv1GQn/Dbglueu1Z8IwGdjMArS3vmY8bLVPhHJVkg
        ojpdiQpRStpwOdjgk2e9RpCzGg==
X-Google-Smtp-Source: AA6agR7DmWypmAe26bnZT4xLDkF12MzBgKNyqwHl8eKku2vWvA2CYPpAgoCIiRzzcwD8rH6xOts1Vg==
X-Received: by 2002:a17:90b:4c4b:b0:1f7:11f:8e8e with SMTP id np11-20020a17090b4c4b00b001f7011f8e8emr5362650pjb.98.1660767973734;
        Wed, 17 Aug 2022 13:26:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090a2ec800b001f2fa09786asm1956585pjs.19.2022.08.17.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:26:13 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:26:12 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Daniel Xu <dxu@dxuuu.xyz>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v9 23/27] Kbuild: add Rust support
Message-ID: <202208171324.FB04837@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-24-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805154231.31257-24-ojeda@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 05, 2022 at 05:42:08PM +0200, Miguel Ojeda wrote:
> Having most of the new files in place, we now enable Rust support
> in the build system, including `Kconfig` entries related to Rust,
> the Rust configuration printer and a few other bits.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Douglas Su <d0u9.su@outlook.com>
> Signed-off-by: Douglas Su <d0u9.su@outlook.com>
> Co-developed-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
> Signed-off-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
> Co-developed-by: Antonio Terceiro <antonio.terceiro@linaro.org>
> Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
> Co-developed-by: Daniel Xu <dxu@dxuuu.xyz>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> Co-developed-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Co-developed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

It'd be nice to split this up into maybe per-target patches, but given
how long this has been getting developed, I'd prefer to avoid blocking
on that, and just get this series landed so we can move to incremental
fixes/additions.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
