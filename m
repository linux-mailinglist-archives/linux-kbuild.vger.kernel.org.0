Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE85482743
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jan 2022 11:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiAAKaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Jan 2022 05:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKaP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Jan 2022 05:30:15 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904DDC061574;
        Sat,  1 Jan 2022 02:30:15 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 7so13125570pgn.0;
        Sat, 01 Jan 2022 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=MbDM/nbnWidrpUQUdjjVmtpnfoIK67naFJmdGmdPPIf5idLlCCcIYbUu8k7Ev2uGHS
         PT66d4A1YB7MUR8RG7w0tA8ZZFHcgN3PDFyNSjxu/GUPxMe06eE7KSmB0NtrNzyEYjYE
         6vegYpwdhAABxDppOPWa9cmH30ytjjG4uEiffWsP6vrSlDo47SKHWABJSEBgvMff6hM5
         Bz9VKFwV9cy0UMTQH9aa6OKWjjhx4h9KD4PrxwUKSaUNm8TJ7U+sQHe/MK8H6GR2Vtrv
         U47tYqU6cuAeJ+9r25KtdaXtMstF6rDuYqAYwRTDp5yhHQnRtWzqygR2dYB2Xxg3hbrt
         fwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=qpfIz6SGbgr64i0nzXS+3Kaa+08ANePfzhPgYxUD1Wms7QeUmP05gmjP3ko4IacdJx
         4YgwW4eqWfCf32cZBU2O46UpJiIfvPkXPDJizeiykfdZIWCYGkbeMunEFldJTjiGQDnV
         ku3ayqCTSvcfhbPgN/weWN7EXw8nVBiGX5SqAd0RagbCwp2YPdw3VG6UOGgbI563xwhT
         ftvG2+mNqvDplNw501EAgt1OURVUanyi8yYisg7Mep2LQ9elBinUjUDoeEbvksC1Vpu9
         c34fob9EzLldAMDe65Juy57GLBn2z10qctI+Hw0VftiECsT3DM7mFxhhuz3lLCu1DoNZ
         qP2g==
X-Gm-Message-State: AOAM531BUGTysqB+ieYwW2qKRtsbgRrr2cHQ7WPrut3YMvx4g3dp1BdY
        NhNj95Zt6DcdDKwUVll46NxuRYQw2H6L+GGK
X-Google-Smtp-Source: ABdhPJy9IAtKcYo/Kb+ZTb+tISg8RKSgJyqa3NQSx2sonBXfsr0CgoW856rJ/IVkwKSTLNf3H5Y4mw==
X-Received: by 2002:a63:243:: with SMTP id 64mr33018205pgc.557.1641033015241;
        Sat, 01 Jan 2022 02:30:15 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id u2sm30175378pjc.23.2022.01.01.02.30.07
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 02:30:14 -0800 (PST)
Message-ID: <61d02d36.1c69fb81.e8593.2bf4@mx.google.com>
From:   vipiolpeace@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 12:29:59 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

