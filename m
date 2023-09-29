Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437877B343B
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Sep 2023 16:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbjI2OG0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Sep 2023 10:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbjI2OGZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2023 10:06:25 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0977B1AE
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 07:06:24 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-65b05a45046so56118466d6.2
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695996383; x=1696601183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1Xb6/JdWi+Gm2zCwL2CbD8VY1Bh4rRC3O4UR/n/oiI=;
        b=uUClNBpQfbI6iDWPLeDQxy8pNQlW2g8GsA2k3aOPq3+1Q8hUVU6wtSDvfnE8m28NV7
         9yowYITwdqDJv9b5nsl1y2yh28HCZ9kYyj7cD8HLKH8PpCQJn5xvQml2i1wlib+ggp5/
         Lb/HhJPJg8CVku+ccoJo+ezzh/E+IMlOenKnrJU65WB0XYGeZxSPha0d3VOy0s5DXT+r
         A6AdpUzMjMXs7JTUMYaEH+9fROV4OFk6BcUKf1KxRiZH+vztg34e1mMWjMUMp4zK6LWs
         A4sZvMj80D1AdF1ZYt13H03rXonGroOQK+2vmifwwvIeN+fRe/i6GIJzcO9ef9xhrG0d
         dB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996383; x=1696601183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1Xb6/JdWi+Gm2zCwL2CbD8VY1Bh4rRC3O4UR/n/oiI=;
        b=bO5fvVunmyG/nlgJus/NO8SXXFLax6lPrtdmQRK5L8L5iKsfCoNcGwVGSx2AN+tQaE
         +ruTBzJ6n5gP8cEWX00ATDfxgbOaj4C3+s/p7yFn3nwdEr3TANYJpugXaRvBSoeEqaGY
         Rf4OnJ4OWqfFY+7Yo97oGG5Ncjh958IsAlvtXyDGpbD+HqVZiowyrvsaIGBIkOUMHOVq
         /fMDq1c+EsF2cN9zDwtbVDbc9HNaxtIIBSYuedTUSjeSJjKwDSWgTVUIPMdBFXB0y80R
         ZpFOigeNOKBAdkvFJc9EFEBQXwtUHG67ussHzj0ijx6UdtWPhiM25hnOSOP9yl78oj+G
         VGMw==
X-Gm-Message-State: AOJu0YxB1Cd5yLfy1k5bkKG4PAX0XSE+A/4DgMrBur4fMjth+bn6VpdB
        md9vxpWwaxul+O1zhGm+ElY4EbRIyws79+NhUlKLaw==
X-Google-Smtp-Source: AGHT+IGqz8qj2DE+Vfn/7gI0HBb5U5qoik8FjRizk8QN7UC21V3bQ4x5xTGmKs2+BhUVKTgunPRJ1auc8M82HaQ+0Bs=
X-Received: by 2002:a0c:a791:0:b0:65b:e04:e0a2 with SMTP id
 v17-20020a0ca791000000b0065b0e04e0a2mr3663653qva.28.1695996382933; Fri, 29
 Sep 2023 07:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230928041600.15982-1-quic_jiangenj@quicinc.com>
In-Reply-To: <20230928041600.15982-1-quic_jiangenj@quicinc.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 29 Sep 2023 16:05:42 +0200
Message-ID: <CAG_fn=V9FXGpqceojn0UGiPi7gFbDbRnObc-N5a55Qk=XQy=kg@mail.gmail.com>
Subject: Re: [PATCH] kasan: Add CONFIG_KASAN_WHITELIST_ONLY mode
To:     Joey Jiao <quic_jiangenj@quicinc.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     kasan-dev@googlegroups.com, quic_likaid@quicinc.com,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(CC Masahiro Yamada)

On Thu, Sep 28, 2023 at 6:16=E2=80=AFAM Joey Jiao <quic_jiangenj@quicinc.co=
m> wrote:
>
> Fow low memory device, full enabled kasan just not work.
> Set KASAN_SANITIZE to n when CONFIG_KASAN_WHITELIST_ONLY=3Dy.
> So we can enable kasan for single file or module.

I don't have technical objections here, but it bothers me a bit that
we are adding support for KASAN_SANITIZE:=3Dy, although nobody will be
adding KASAN_SANITIZE:=3Dy to upstream Makefiles - only development
kernels when debugging on low-end devices.

Masahiro, is this something worth having in upstream Kconfig code?

> Signed-off-by: Joey Jiao <quic_jiangenj@quicinc.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
