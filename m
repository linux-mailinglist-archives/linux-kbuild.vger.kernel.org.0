Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CC9482781
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jan 2022 13:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiAAMGp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Jan 2022 07:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiAAMGp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Jan 2022 07:06:45 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACE7C061574;
        Sat,  1 Jan 2022 04:06:45 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id z9-20020a17090a7b8900b001b13558eadaso32904763pjc.4;
        Sat, 01 Jan 2022 04:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=LNL6JENTQ3y3OD/oMRYXxu/MXjHusj/9ULIEHgjy7h8klK+vSfsoMoU5y3DpxMaJCZ
         /ZG90K0LvhAdX8+5nKGWCPUR/XK/GTHxvqNurLt+trdjjDdc37VobtafzbtJfbX5J/95
         89oAbYy7PlKCqDidhSnt9Cenzz1F4EsHM3iDulFhycUcGsUyaLqvXhz2y90P1jXHuUCf
         UkZvZkLIDb/G/uxopGPoCe0PWqQ+K6Fgx/rOQe9KgCbMLLnQYvKgr06Zb05yqSMDWuLw
         UG96bhnf+yE8WNoDcSyQPwTyIvkpMzLTJl+lrt6m7uzasdWYTQroWZcwMDS4C1BVbOAI
         +svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=MFS8PZ8plWmxqeE2yQPSGvIsmpZnCHOrN6iCql+3AktO4qNMDN8YmMMTygIHrxPzqO
         fHjM/0jkK7BNlHfJcgknThd7AaIPO7GNfRb8+6jKOdq32B9l7RISIcnZqgmtJR5WpUgN
         KBGDNK9TRxr6jHDn7mcgHOlZGC8MXNTiOn83LVZqGvi3V36rK3k1YtEi6QWrbdaSjRW3
         s+vS3LbLF6jmE96BYWmrqll0YxgM+fMuSTXvZrx73sHvQ4cBGbzKgnyyRWlm+NQMwo9t
         7ZmcMZFfmcNzDU4mu+jSHWN+KEVJEiyTQoyGTdAs1hiLnNrN4qtlzbqDJYXl8lCO1PJo
         uq4g==
X-Gm-Message-State: AOAM532fjiiWY6Q/d3jO77Up98lq1qyxfWW0O0rxOt7llnzEXamrjDqK
        H9fmL1QpqmvIEH07oCGt6RU=
X-Google-Smtp-Source: ABdhPJy60o0DeYU+q49yzt9QEuAa2gdFoptJnsmLOgIJb0zC2nH8tj5VwXD2L6G/wNnRkQPp1OJmtw==
X-Received: by 2002:a17:902:6908:b0:149:b26a:b9b5 with SMTP id j8-20020a170902690800b00149b26ab9b5mr3898433plk.169.1641038804941;
        Sat, 01 Jan 2022 04:06:44 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id kb1sm33652672pjb.45.2022.01.01.04.06.36
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:06:43 -0800 (PST)
Message-ID: <61d043d3.1c69fb81.e9f32.a184@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:06:28 +0200
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

