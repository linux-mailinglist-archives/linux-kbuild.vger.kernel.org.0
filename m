Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349D95501FB
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Jun 2022 04:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383855AbiFRCaN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jun 2022 22:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiFRCaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jun 2022 22:30:13 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2B168993
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jun 2022 19:30:12 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31780ad7535so31025787b3.8
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jun 2022 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=dcwrPtXldcZQuaUTRubP/TsWaJ05MpxYEGzdke58B18=;
        b=iWiJy7mjAoRvps48O4V/9DuAgx2o5BPbyBagNL1VmNJFyJxQJbuuRBMokOqy0xljz1
         qmJ6CbCW+emPjBYvX3+O3hIP69NT724nLvN4ifcCDrcQFXS0boENKH6OKh/GaG7bp5aW
         uSQH8PjQ1bSEe4JEMPfEpjEK+6OPWWZCxChdlqyVVE6I59Dmv3JS7CH/biPLGzObdWHm
         WZu7Azns1PXJ7npjsyJbdqzqO5vJgRgbW1OHAQ1P92ZUpVV2uDviFLGCk14pywaiI1q2
         lzmkqJ/5sdxUf/AY3h2XebT/LgbiWByYxAyUjWwqEuX0VDb72+0bI67cQS2B6ovYqRqK
         FZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=dcwrPtXldcZQuaUTRubP/TsWaJ05MpxYEGzdke58B18=;
        b=IJCcAzIDz322AKRIVxk3QvP1he5CNj2p2RSZh0831bn7aMFM6DX8PRRwT9qZjI7gTi
         4uT+cCkgT7qc7heGMXM9JSJPH8C/9JWOeF6oVweGB4h42DWFJY1vz6mQoFO1OOiOsWec
         gNywf4M5Wo0vbdE14X61eSQc7tT+mcx1DPBUpmPZHGoins32CGLyxGr9RMypI2iwuhKG
         iVWq6xv84iWVq+of7YHXCeAkXPo4Wmld+D/7GgCW99Dqr4utgsR4+6fsw0P5UOET8SOF
         hYhsbkiOWPAfoIN5p7y+x4DA2EBvcCOGMq4EjF606UMQpQi3mwWTGCI3WAt4Rco1bAwh
         42OQ==
X-Gm-Message-State: AJIora9F5XrxYypvHSAr9EGZtKeHoxk1fT5kSArBTnC63koL8Ms70qTF
        lh/+PmwdzrOnA0QuQH2DCpKPXwWoS9sXarkbTK8=
X-Google-Smtp-Source: AGRyM1tBUR8gtZ8zPk9JAJh0JPDEfE8ITJMoNoMKLp8SAdot4FO3bSmGPS0DNM6cQDoyb6LY/AFbBP4sEYSGqGo5lqE=
X-Received: by 2002:a81:1184:0:b0:317:7768:3050 with SMTP id
 126-20020a811184000000b0031777683050mr10554858ywr.368.1655519411273; Fri, 17
 Jun 2022 19:30:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:b381:0:0:0:0 with HTTP; Fri, 17 Jun 2022 19:30:10
 -0700 (PDT)
Reply-To: mrscecillelettytanm@gmail.com
From:   "Mrs.cecille Letty Tan" <smcpeterrobert@gmail.com>
Date:   Fri, 17 Jun 2022 19:30:10 -0700
Message-ID: <CAGzzBQ_MjWN8+xBCT-Rtbzutkdckjvv=Of=cP2BWuUim2PYGQA@mail.gmail.com>
Subject: Hello
To:     smcpeterrobert@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

How are you doing today, I hope you get my message urgently, please.
