Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 649754B7684
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Feb 2022 21:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242944AbiBOSUE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Feb 2022 13:20:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241218AbiBOSUD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Feb 2022 13:20:03 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E94119F0C
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Feb 2022 10:19:53 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t21so869158edd.3
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Feb 2022 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=lY9tt/IhIWv9LzXk1s5BH9xemeCbBCE2YYRK5FOvrNE=;
        b=XhiGCPJDX1x5n00gfop8vtHbzQ5XsVZvmshgTu4acZkOhiIVmg/2mfQGC7XefOGSQh
         7QEmeeiaF4k3W7qS2sAFNPenGR196oA+WUOgM2DQXvT/BU9Crqh1zHzDT8I6gukAbcSH
         hGMB/G1SaWUZOj0oRkIv3C5EcIXNTb0NCynacztYe5+s2TPOQ6Pik+hE6AOGmHOJ+CI7
         usS3nTdkUOGZpWn3+lCNPo+9+f46XQIwlfOliH5nHYU4O+b8NWRFq8IrwdEPYd51Ztfo
         CVShgB/CHFN5ZljM+JZt1ah9C79Lfq362kngCQUH5StBUEXRZ4485gF11p4WLnNcO/Ty
         86rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=lY9tt/IhIWv9LzXk1s5BH9xemeCbBCE2YYRK5FOvrNE=;
        b=Tn0Tyr5IfXsdEyX9lhu71MnrwR/xAuZdRDDMPg/dOwhUwgXivoDaPaGaHA5TFprTMj
         8Y4bvOphRNmzIWAJPSUm/4pWrUQ9R+5T5qg+440J0riHi9UMyi/3nhoF3f9pLwekdGMa
         eai+pWODyIz/oVp5B3LhRl4E2Uo939aYxUptV/KqrC7YhlHQO6JcTPJFIvhMXvwu8Je/
         jbU1TIhgwoeMa87FqaRnlNnaSMUyZI8d7lic52Y1lGVmlWQmDuPKFN5o4BeBDsoNvCLf
         LzFBd01WauYXMyASfHw5Zvu8QXvpusX44UaxymNyUQ5PVRKr40oH6sZYbDntI0Ul5ppV
         yQ2A==
X-Gm-Message-State: AOAM531AVldrgVSxuEcE05uWhN+nHZ3bJ2iKwXvfFzpzAcdGL87nM3dX
        JSrFVPXjDRF65m3aQZboatJpyQTJMqXjRIMJVSY=
X-Google-Smtp-Source: ABdhPJyOokKo/hunjO+CnmnpwKZ0ntLwWp2hx7HBUYTkhBb6eeghBzrAkuDAQczr/LskEt8nG1j3pM9F9r9kIb+Z9z0=
X-Received: by 2002:aa7:ce90:: with SMTP id y16mr204238edv.292.1644949191868;
 Tue, 15 Feb 2022 10:19:51 -0800 (PST)
MIME-Version: 1.0
Sender: mrsaliceragnvar@gmail.com
Received: by 2002:a17:907:9491:0:0:0:0 with HTTP; Tue, 15 Feb 2022 10:19:51
 -0800 (PST)
From:   Aisha Al-Qaddafi <aishagaddafi1894@gmail.com>
Date:   Tue, 15 Feb 2022 18:19:51 +0000
X-Google-Sender-Auth: NlQaCYS33jJ-knYs833tgwmUXrw
Message-ID: <CAGHGhXAxG0-TBCBdRxXUbdLcEv_XLE9-+OSKLNf=FQ5a18i=Og@mail.gmail.com>
Subject: Investment proposal,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_60,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,URG_BIZ
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:533 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7304]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aishagaddafi1894[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.6 URG_BIZ Contains urgent matter
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Dear Friend,

With due respect to your person and much sincerity of purpose I wish
to write to you today for our mutual benefit in this investment
transaction..
I'm Mrs. Aisha Al-Gaddafi, presently residing herein Oman the
Southeastern coast of the Arabian Peninsula in Western Asia, I'm a
single Mother and a widow with three Children. I am the only
biological Daughter of the late Libyan President (Late Colonel Muammar
Gaddafi). I have an investment funds worth Twenty Seven Million Five
Hundred Thousand United State Dollars ($27.500.000.00 ) and i need an
investment Manager/Partner and because of my Asylum Status I will
authorize you the ownership of the investment funds, However, I am
interested in you for investment project assistance in your country,
may be from there,. we can build a business relationship in the
nearest future.

I am willing to negotiate an investment/business profit sharing ratio
with you based on the future investment earning profits. If you are
willing to handle this project kindly reply urgently to enable me to
provide you more information about the investment funds..

Your urgent reply will be appreciated if only you are interested in
this investment project.
Best Regards
Mrs. Aisha Al-Gaddafi.
