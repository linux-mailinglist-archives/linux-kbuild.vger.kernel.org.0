Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDD9E6BFC33
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Mar 2023 19:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjCRS5n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Mar 2023 14:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjCRS5m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Mar 2023 14:57:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D752364C
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Mar 2023 11:57:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eh3so32345274edb.11
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Mar 2023 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679165855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM/qm8tuy+CwBAqdkEhnw/YF3C8EgxLtBG2rYLxmTn8=;
        b=C2HKbOxszTOLB8zwDKq4Xwkd/0BDSEw4SlkXlsMVJC3C660t8LX1mcpFAurCNZWw5X
         6IGYZSk0iHYU+hsQ8mw1KMSbFq6f8bEunsNJoVnjmu5fnVD9O0A2F0K/cky0WPpgz7/5
         pJterdgDAjO8JCz0P3cVg95mtqK5lnkC86qS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679165855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM/qm8tuy+CwBAqdkEhnw/YF3C8EgxLtBG2rYLxmTn8=;
        b=ciclTjdfGMqmpiNPhlhqU9kUx1ECyp3CzoNS+PKtdGdR7iXgJ6HBKBnuZZFdAcXjtS
         zG86K/IWAwlbT5GOMdo9lusUZ+bpoAXBbHU4AKNXOPQDG4echz30ETh5x6sbdF6RBNEH
         BofRDt8OJ06HnRLQiYGg/mHe/KtFmZQBDQpCJd2gYjWRvzXhdBBUDiKr/Msk+MLM/rnT
         /xnwpvLRlB5FVZPJT13VBdPgE0rgynrbISGt+rjktk/yXXfx9af14oNtkTg2MPB2cwFB
         MQ2hLWRb0TNTezPfUOBuryhMLYXDJItSiByj/YeGolgpqcEi3WW2XRgO7Acj4hrkLqxt
         KKUw==
X-Gm-Message-State: AO0yUKV/G7PrbRCswLkHcSiKRuOAoyc+TToF7xHvr0VLOd1RPfGEZfi0
        wNoHZvYVmrLkoK/Va5XSOJ2xtjdlQjZV/JPJivJsZg==
X-Google-Smtp-Source: AK7set/V1J9PosSGD6D8hRwqwSAJP9OPT9K6vNMuLK/t8TK9WbGICbw1aP8Fwmz5b3DpnHEMm2cUvg==
X-Received: by 2002:aa7:c0d1:0:b0:4fb:98e2:3df8 with SMTP id j17-20020aa7c0d1000000b004fb98e23df8mr7450561edp.27.1679165854910;
        Sat, 18 Mar 2023 11:57:34 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b004c09527d62dsm2689077edf.30.2023.03.18.11.57.34
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 11:57:34 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id cy23so32317052edb.12
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Mar 2023 11:57:34 -0700 (PDT)
X-Received: by 2002:a17:906:cc9a:b0:931:6e39:3d0b with SMTP id
 oq26-20020a170906cc9a00b009316e393d0bmr1622308ejb.15.1679165853857; Sat, 18
 Mar 2023 11:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNARH1PPARMD31mECPFs86j8o1MSDTrwahdavDm-C3Dg_sA@mail.gmail.com>
In-Reply-To: <CAK7LNARH1PPARMD31mECPFs86j8o1MSDTrwahdavDm-C3Dg_sA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Mar 2023 11:57:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJeNev2qR+ZjX_UKc-XTrsnae0cUV+RqaE_rMprKL_Ng@mail.gmail.com>
Message-ID: <CAHk-=wiJeNev2qR+ZjX_UKc-XTrsnae0cUV+RqaE_rMprKL_Ng@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.3-rc3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 18, 2023 at 8:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Please pull Kbuild fixes.
> This removes scripts/list-gitignored.
> I hope you will be happy with it.

Woohoo. Looking good.

Thanks,
          Linus
