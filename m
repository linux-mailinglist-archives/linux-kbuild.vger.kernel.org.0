Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9856797FA9
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Sep 2023 02:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbjIHA1r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Sep 2023 20:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbjIHA1n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Sep 2023 20:27:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825F31BD7
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Sep 2023 17:27:38 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2685bcd046eso1079482a91.3
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Sep 2023 17:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694132858; x=1694737658; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThJt1M7ME2yNWaBDeE2oHIMrUhxdt6uGEqSizM4hY4U=;
        b=Yi1raqdTG8+osFWNQ6blpCesbMXMBDwjRo/LP2z2mKT5bIqNufDtq/Po9Tthl/fFcq
         u4RZakRjWU3RqdeFw1gXk8LCbSO3/tEIlArjxJyBshOBXXQrKkZkx3QncRNtZK9l1c0P
         iNiHbzRMAHeTmjR9Kl2W7a3i1VYDiQ5CaI00JOVr7R1f4aRUJGVuIFXViNkg3xKJWJqO
         X8UEjLELwhilyXxbq3ZeLMNBcfW49PFSPQLfGUM2k9mSFzYm7MGazqR2MklFB1SolcCe
         NgC1tise2eugmRHOUw4S18/FdcjxmzUoPx7fm+KV3wVukzZeLo9NN2k4NKGgH46Imsxv
         bxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694132858; x=1694737658;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThJt1M7ME2yNWaBDeE2oHIMrUhxdt6uGEqSizM4hY4U=;
        b=os1OOIT5HtET2QYLj1owSiRZrHEnMP+friblvHILiIZl9/t4+sTW/W9x7+H/0J7aI2
         g+5MzmDOSxqhCtrjbCPF1nQkZD9iA4zVzNtkq0RbvbBkjHSMAiIlUlVHn9rmY4Hw4yRK
         jXRtGKQgyEFEJ7/lm4oJKu5rzb6U6eaBST45ArZr1x1nE1pZrOBM8P6SofCIWD+L1O31
         pRTeac/WEcmdOQ0MofydVhofR0JAtgkGXfOVh/Moxuah8TYk94dn5sPaIh2KAo+OQp/s
         mN+E6TOo83Jck8WIYjjUSjpo58hePe8BTufct3eD0Uwmgaup9IrJr70Rit0nTsNL0uoN
         CvhA==
X-Gm-Message-State: AOJu0YwiVN7fm+9Pa/KQi5RMHTsZAoB6K637sCRp/g4NDtiMZ7RRNB5D
        C1OhIT4iU0Y/VZXp1S9uvdUi9Q/waVUKW9bISGs=
X-Google-Smtp-Source: AGHT+IEiRgG7CWaBBmhsDr//XWv37/F6IHtKs7GWFkrkNjhR9PGvDVL2VW20jFylgOsgsouUxg2+XUkqQXKtfvuYBaU=
X-Received: by 2002:a17:90b:684:b0:267:eeee:ab17 with SMTP id
 m4-20020a17090b068400b00267eeeeab17mr1086045pjz.45.1694132857942; Thu, 07 Sep
 2023 17:27:37 -0700 (PDT)
MIME-Version: 1.0
Sender: annavanessaci@gmail.com
Received: by 2002:a05:6a20:7620:b0:137:6958:9b4e with HTTP; Thu, 7 Sep 2023
 17:27:37 -0700 (PDT)
From:   Olga Jean-Louis <jeanlouisolga6@gmail.com>
Date:   Fri, 8 Sep 2023 00:27:37 +0000
X-Google-Sender-Auth: XKQ8SPGwH2P_Jq5-qkmPshawSPs
Message-ID: <CABpNhj25F8USoDb7DYP=nf+UgPQsM7CbWR3QhrfQNMezkhDxCw@mail.gmail.com>
Subject: Hello, I Am Miss. Olga Jean-Louis.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:1030 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [annavanessaci[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Sir,
Please can I trust you? to assist me to invest my inheritance fund in
your country? and to help me to come over to your country for the
betterment of my life and continue my education. Please Can you help
me?
Best regards,
Miss. Olga Jean-Louis.
