Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A36788022
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Aug 2023 08:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjHYGmw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Aug 2023 02:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242638AbjHYGmj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Aug 2023 02:42:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631B9CF1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Aug 2023 23:42:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so852254e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Aug 2023 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692945755; x=1693550555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/TPy5PPNB4EMsxpIFEVOsKZ2VJzxUxBznQoDOdffI=;
        b=UpxJmUF5ambajGRTOkN70yPHL9WD3P4M00wxtszch4r34Y3zKyy3MNF19DHwqfQgU9
         TXYXZP3K7RtbK4KFKv8BQS0u6JO3qLOS216LBWWumkrYfk71SUfTKETOMXMj/zINbqWX
         vEgDNbqMMHcdcTCYLgjAmu73yBeTjdlxK+kf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945755; x=1693550555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw/TPy5PPNB4EMsxpIFEVOsKZ2VJzxUxBznQoDOdffI=;
        b=NpMTccs5wvBQxnpqBUr22ek1UXQeGnmvoPXBPu8jsZZyVz9BRTqY8ZRgLszhNhjy47
         kS80zcOSvwkSCkytai73mMe42u763cg/rZeTyz4SxL16IpLNsI40yLLIvympGNSHUvSt
         uTZmBTpOn2myENpBCpZO8b8v1PkzrA7m09OBkim3EzbE3J6iV7YXzWK8v69ruB6wlSD4
         MUUNfeshM8eNdC84Vh1Ntd5tGkCH7K0d/dWCdZj9qkvBtUNi8pmZQmInUQgekwyUsrjK
         dLmS2WL8RDKyiCP12HOETWdG8vcMTx7zaJcY24xip4UNvrPY1y/4jUyJKonMBHCLYAxl
         h8Jw==
X-Gm-Message-State: AOJu0YzfaCSykJ9QkH/1Gt2NHL5LrTOt48cyZ7Fsd+JgfLwjgfvrxLBs
        g7buQrmFq5hhbHk9C+wyHtqtVdCEa+DRLp15+RAmZA==
X-Google-Smtp-Source: AGHT+IG6FUhjuS7jGvtYJp+Y5GnZ7JsUtK1au0ormYeBwz788UQ8ga8VspmYencK/Tf/1SwCV45MsdoGiS/GWSizaYU=
X-Received: by 2002:ac2:4c52:0:b0:4fe:7e1f:766a with SMTP id
 o18-20020ac24c52000000b004fe7e1f766amr17087918lfk.24.1692945755226; Thu, 24
 Aug 2023 23:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
 <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
 <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
 <CADDJ8CWdm+cWt4UBTae0sCQ8ZDWhbMuozqqq59R+EtvMHere0g@mail.gmail.com>
 <CAFP8O3+3++awDi9uZueFC_xi+KAud0Ds3k3vdd_ruVngOEOKiw@mail.gmail.com> <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
In-Reply-To: <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
From:   Denis Nikitin <denik@chromium.org>
Date:   Thu, 24 Aug 2023 23:42:23 -0700
Message-ID: <CADDJ8CUfOqKJpoiDurdbm6suZmqmn5qL6EwE_6xXhxh5pdy3Uw@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Fangrui Song <maskray@google.com>, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

>
> Thanks, Fangrui.
>
>
> I'd like the commit log to record the use of REL for
> .llvm.call-graph-profile is intentional.
>
>
> Denis, could you add some more comments?
>

Sure, I will send a new version.

Thanks,
Denis

>
>
> --
> Best Regards
> Masahiro Yamada
