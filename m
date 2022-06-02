Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C883053C016
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jun 2022 22:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239263AbiFBU4Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jun 2022 16:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239204AbiFBU4Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jun 2022 16:56:16 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC8D34B84
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Jun 2022 13:56:14 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ec42eae76bso64018857b3.10
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jun 2022 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=d+MLllrTnVLTVuNtzK3RkWrOuNSSWMmwIaiBnbLtjnI=;
        b=bP2Bg9kPaoZeUOZTwDrCf0TcA+yFfRTyMPXiyBc1hgaOcOhU/7J6HXpUJAtG0vGXe2
         HdiVuKHQ73+Sw6+AW2z0L7B1Zsq49m0EOs8HolvzyvIAHihXph0OX/EBNR9r+H2kwGg5
         t0Tv6/pTSym6LNcptuCtK0UtS6rHSK3/p0HDzjbM35P+QVVx1b9hFaP01w4lpi2w19ri
         CpgzaJ6JCIMU59184vXDSaP/UrOHUA/1xCZF0mJMj12N/l7Bbr0PLi7jJ04MvIc6tYCG
         tcjfS5PI7JJFlAWRY4yMBNBphwLp9KqnO6CQ1HYhKtGa7S81lqwsIX6SVwOghQ5lGL5L
         qKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=d+MLllrTnVLTVuNtzK3RkWrOuNSSWMmwIaiBnbLtjnI=;
        b=nqaKI8Y4Ima3Xu5wmoLOJ5qWtttDzYqmqMFn4IFnoF+caRL/qKTcahvX+Ucg+WDOg3
         CSZM1kMmdtq3iThsf8un/Dz6iwHixR0jlJD+O+VcQ6I6eMr5CIstcYuEY1GPOeKoSIn1
         Rpt/Z5Dya9K8re+9Jjh/FGo7wJRu8w8LYLVSwRp8RxA5S2Gf9HmPT9pCIhqfPdETdVS2
         OilJ3wGjXjZMRy5kSjq2fve+7ti7ANjlS+9QqFJqFj5qAzHLnMJYDiTSTtVKhONnd2hx
         dA5GC2YqydaT9RjFw97YtHxPMrkDf+uovvmk4CpJ5cTprik2yUZHDFrMskwTvOiNkpxY
         haTw==
X-Gm-Message-State: AOAM533rjpUU+cKpY2QKl+wx6hWklXFfEwkpzsqxuPB/N+OC+iqTt23A
        Rut/iS0H0+/mv0earE1E0YVoJYeOyMjdgzh0zSo=
X-Google-Smtp-Source: ABdhPJzz4CIFTzLwRd4bDwRghcuq8KmAMJuf1ZQNKj3c2Lo/OmAL2dCZKUleJ315pEcSs8xxcj3S1aQ8FnTEFw1HYHw=
X-Received: by 2002:a81:1358:0:b0:30c:2e28:4050 with SMTP id
 85-20020a811358000000b0030c2e284050mr7698599ywt.206.1654203372355; Thu, 02
 Jun 2022 13:56:12 -0700 (PDT)
MIME-Version: 1.0
Sender: bbchitex6@gmail.com
Received: by 2002:a81:d447:0:0:0:0:0 with HTTP; Thu, 2 Jun 2022 13:56:11 -0700 (PDT)
From:   "Mr.Patrick Joseph" <patrickjos09@gmail.com>
Date:   Thu, 2 Jun 2022 13:56:11 -0700
X-Google-Sender-Auth: 2x_0MgxYCCazRZg9th9WovhcOhY
Message-ID: <CADX4xg+gCaCydEs1Tz5F-66oRNkS3vNJUkBVhip+COD_if2nGA@mail.gmail.com>
Subject: I expect your urgent reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Friend,

I apologize for contacting you this way, I am writing you this mail to
solicit for your cooperation in a very confidential business
transaction of $16.5 million. However, it is not authorized by the
rules guiding our bank for a citizen of Burkina Faso to make the claim
of the fund unless you are a foreigner, I ask you can we work
together, I will be pleased to work with you I propose a 40% of the
total amount to you after receiving the funds successfully, and I
assure you that this transaction is 100% risks free. Reply me as soon
as possible so that I will let you know the next steps and procedures
to follow in order to finalize this transaction immediately.

I expect your urgent reply

Regards.
Mr. Patrick Joseph.
