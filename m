Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B2B4EB5B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Mar 2022 00:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbiC2WQc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Mar 2022 18:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236271AbiC2WQb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Mar 2022 18:16:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062C11877D7
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 15:14:48 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso2355278wmn.1
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=VePRrWTC+QJ6RXxz7wzXzhNW15EexdQ9UonD9dGLRiZUuIh2WwUO3RqmfVfSRhfXkL
         F5xmBE8GzURGnyHWYQZlbfRgSTGRQFsIYFo84JYrVD64qP1N0TUREIud7huKwACgycxb
         e7IwtVza2R2SgoiVbpW1LCfguhm4+bRL2sZcb6kN32dz6eQyhs5F1i+a7ZrInVG8hHIp
         QdQpRN3++wEgF6Yyx+nX0e/pex7nBqvNHivYyXc2k1ruidvlkR28yWUUvr0hPzXwuNWu
         chjFiPJclRr0nw14yiOjI4y596XvMtqG+Okx7OdBeiv1bqWNzy6fafs//+wKUNr8z+x7
         J1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=5VhzHO6Tp04fFw1FDo7iwcfIJ656rLI2ZQPxGtMGLNKqBU1Y8lKDPO2aaNdWDbNEBd
         jxPaQH/CYLRWbpkgApneLF4UmIRDydQZl2PzqVGInNYqNfUpTySuKvCN1bdDtZASwTYC
         2erUYRxL1wcucegmESaknlIazaHOBsxxUFQXjWnYCfVP6leZNiJRaEqWDkiXYw9vGgy3
         CWa9/0zvLx5bfLGADrE+L/E0fTKKs5Ate/C62QcCjkuFETwbc0WzudXUkerwxtO57vXT
         ydzYbMT4rApNiZr51YPtJW2z88i9A/plTupgGKBiQ4hs/5jzipeKZ2aPgLPkDIYXI2E8
         Ndig==
X-Gm-Message-State: AOAM532t4m2ajrdSum5tZ1Lb0Vfzs51XpNaU/wxeBlPtjjZx0RkZ+Bv4
        fLP0PX+DwLm93nLsk/9DAgo=
X-Google-Smtp-Source: ABdhPJweo8RBgJYlXlOjZwfFr7Fgt9fHE4v690RQ+zo7VDnz0/0sQ7IaPuc4uk9Uh7gGZuyyZ4YBEw==
X-Received: by 2002:a05:600c:3016:b0:38c:8786:d3b6 with SMTP id j22-20020a05600c301600b0038c8786d3b6mr1538898wmh.135.1648592086610;
        Tue, 29 Mar 2022 15:14:46 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.172])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b0038cda9f92fasm3436653wms.0.2022.03.29.15.14.38
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:14:43 -0700 (PDT)
Message-ID: <624384d3.1c69fb81.6baa0.eeb0@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:14:35 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
