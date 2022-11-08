Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF79620E7B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Nov 2022 12:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiKHLTD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Nov 2022 06:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbiKHLTB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2022 06:19:01 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7317C186EC
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Nov 2022 03:19:00 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id s10so9320101ioa.5
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Nov 2022 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=WfZENGWI8Gki4cfu5FTM5+AmIDxP3MUS/nA6abRf4V6IQTWzEWg7SsTNapD2fFKv4Q
         LST/wpHjwxS4+MxHKqdTh2pjyRMGfqL9Ejgju/o1uosJYkC+2R8r7niD8KOmBmpAYRl/
         NlaZP1ELB9sIwASsi4RzZAc1Nf1JXP308nTv8lQDp4EL5T8yR/w8sKD+vEsXurc13Pyi
         5Andzud2TPEB0IjZBH6sfLstq/ImUhewLKH4gxfSILnXKoGX9g7GxegE+WcFQf4Sz1Lw
         9O+jmvizPq9YAMk2wSBqSRp7SxfmXA90piMVWh2y9AfhhzzVNXpoRo4iiJnubiwPT0rR
         4PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1oIX0Lu3jFWZXVxNPQntM2Fj3qbMNn8z1UsbYrWkRo=;
        b=ASDChxIWL3SL4jQ8l+r/VzEo0jQ+rC2b8RT6FIKuvWq6S6vY7soMTIHgyLW0BUmncP
         B+S3y8OjrgEPjeF2sxrBiHGK7kFF6DIpCwPxQHd5NHd7rJ1sFEMucIHlsfjc7eXqZ1QF
         fcewjGMwk5pAHSSLaIOLIC9XeF3Uv3kZK/i9ayifJ9gkF3DIQ8R240N6TAgX5sfEaclS
         9bjuZElXZ2LU3pULdkkbdbWE6bWGm062Z5/g0HUoF8+mpnZVmvPN+s7kU1kZcscBcjBj
         gZpcNnR9Vhr8fat/pdoyOZ5Qlg1jsswSLlZrvuDb1UzV/yk2nqrgonocw5UJN7iQ6+/r
         vvgQ==
X-Gm-Message-State: ACrzQf2we/RW6Sef7FQcsIMz0TUDyqZsS+CKIKonOnOfktaQTayUj0H5
        +nvkB13iMpgiumfaSZtL9Svrld9zin2KHfSOs+I=
X-Google-Smtp-Source: AMsMyM7rydZwVc70WUuTl1zJ4SYLvA3VBiU3NqRxeOJToxDegaur+FhXeb6ymqfAFpBDQJM8Gh6lsU9A+k5iwIg0r+k=
X-Received: by 2002:a05:6602:164b:b0:6cf:bc3f:fcd5 with SMTP id
 y11-20020a056602164b00b006cfbc3ffcd5mr30190653iow.119.1667906339859; Tue, 08
 Nov 2022 03:18:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:38a9:b0:375:4a9b:180d with HTTP; Tue, 8 Nov 2022
 03:18:59 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik1@gmail.com>
Date:   Tue, 8 Nov 2022 03:18:59 -0800
Message-ID: <CAKfr4JXAt9zqv0qeZwO3it42gt22OzwY0qhgMOSkHWFvxW3drg@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5046]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik1[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-- 
Dear

How are you with your family, I have a serious client, whom will be
interested to invest in your country, I got your Details through the
Investment Network and world Global Business directory.

Let me know, If you are interested for more details.....

Regards,
Andrew
