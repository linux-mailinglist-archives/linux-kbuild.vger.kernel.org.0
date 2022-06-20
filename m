Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0C9552210
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jun 2022 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244327AbiFTQRv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jun 2022 12:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241345AbiFTQRu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jun 2022 12:17:50 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E675B225
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jun 2022 09:17:49 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id u9so9691312ybq.3
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jun 2022 09:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=AxZOLWWV2zJmAf07Z/UkIXx+4I8hu7YPuvmoKiDADCc=;
        b=U0/2b0RX7+hPvEuEfcLh7SiaBS/KC0Xcgl1hLC4HlqyAX7kugHskeo+QLx0l4Zw+Ap
         pVt41v6yW3cCZ3Trn3Rx41yd41gBbWYaDwm1kXTamUG+au4UnaYiIdcXyrEASN8N0WHR
         xZvAun6pb9JZT+BiGqiQBRE8LTDkXUM60cAQbPW4JI84PKTMcgd/LMij2BkioRHPsDx2
         xxEyREX3n69FThJSewJRqCboJlGNym4NVry8eug6D+vu5wi+U7cns3lfhJHcDX5e4EuN
         blEHWR+/DUd4P9NCcGUZSKlgeUYAOoxlNq+vpVDzxHl7Xu76VKPjauJduf8Zz6n5mJAp
         YkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=AxZOLWWV2zJmAf07Z/UkIXx+4I8hu7YPuvmoKiDADCc=;
        b=Qj+CjUGfQlspEavNmg9Y5A/xrAnQVe/q7fSTmM4SdHLBv0vdH76Eb+IjlJ8kx1Iad4
         mLJUwBHKWbnWJMLPwXD3/vbn3FZ0jjtmFNWWhi3rE6oXzP4utPvLPwAC9wnN/9T+9GMu
         o7f+IuwRVZtghFcFWw1Hpuy1i2f6+Uz17JciTjxnnVWQc5rdjiUjGKS9TE+ijPnu4Ynz
         XTCtXpjc2lp2BZBDYMNpqfI28H1SyBsIJ2owjwVI34cpr1dqEPwsOE4zYTm8lFxxn0ue
         ePYy5e2Sn1XdSqBBdbiNqeZi4c4k7kbSbYzm44eZezyCt2/MmoGl+DFEhakHpG0EC7iE
         4R1g==
X-Gm-Message-State: AJIora8Pf3EL1tzkcU4rVZlF6xkLw2Unc67YbjZ1/zeYBr8W4NEnYtKD
        sVb/rrXfeawLRBlBOjajyeNVtVKM5oMnRd7uYN8=
X-Google-Smtp-Source: AGRyM1vtrvON52CmZb7/BHiGcUsLqt+vl3QS9N9E5VjD2jK0cNFGJ78psZjE9bMk3ywPw/7AVd+akyFZ4YG6NyhOc9Y=
X-Received: by 2002:a25:84c9:0:b0:669:1e22:bd85 with SMTP id
 x9-20020a2584c9000000b006691e22bd85mr5306425ybm.647.1655741869021; Mon, 20
 Jun 2022 09:17:49 -0700 (PDT)
MIME-Version: 1.0
Sender: adonald323@gmail.com
Received: by 2002:a05:7000:c21c:0:0:0:0 with HTTP; Mon, 20 Jun 2022 09:17:48
 -0700 (PDT)
From:   Dina Mckenna <dinamckenna1894@gmail.com>
Date:   Mon, 20 Jun 2022 16:17:48 +0000
X-Google-Sender-Auth: J1z6Q9USvjKhsY3IrbbvHjo0Fp8
Message-ID: <CANHbP4P=ex8+zmRf6FizstaaWvt3ty2P=NOuVcvRmNbidK5_Zg@mail.gmail.com>
Subject: Please need your urgent assistance,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5926]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dinamckenna1894[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adonald323[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello My Dear.,

Please do not feel disturbed for contacting =C2=A0you in this regards, It
was based on the critical health condition I found myself. =C2=A0My names
are Mrs. Dina Mckenna Howley. A widow and am suffering from brain
tumor disease and this illness has gotten to a very bad stage, I
 married my husband for Ten years without any child. =C2=A0My husband died
after a brief illness that lasted for few  days.
Since the death of my husband, I decided not to remarry again, When my
late husband was alive he deposited the sum of =C2=A0($ 11,000,000.00,
Eleven Million Dollars) with the Bank. Presently this money is still
in bank. And My  Doctor told me that I don't have much time to live
because my illness has gotten to a very bad stage, Having known my
condition I  decided to entrust over the deposited fund under your
custody to take care of the less-privileged ones therein your country
or position,
which i believe that you will utilize this money the way I am going to
instruct herein..

However all I need and required from you is your sincerity and ability
to carry out the transaction successfully and fulfill my final wish in
implementing the charitable project as it requires absolute trust and
devotion without any failure and I will be glad to see that the bank
finally release and transfer the fund into your bank account in your
country even before I die here in the hospital, because my present
health condition is very critical at the moment everything needs to be
process rapidly as soon as possible.

It will be my pleasure to compensate you as my Investment
Manager/Partner with 35 % percent of the total fund for your effort in
 handling the transaction, 5 % percent for any expenses or processing
charges fee that will involve during this process while 60% of the
fund will be Invested into the charity project there in your country
for the mutual benefit of the orphans and the less privileges ones.
Meanwhile I am waiting for your prompt respond, if only you are
interested for further details of the transaction and execution of
this  humanitarian project for the glory and honor of God the merciful
compassionate.
May God bless you and your family.

Regards,
Mrs. Dina Mckenna Howley..
written from Hospital..
