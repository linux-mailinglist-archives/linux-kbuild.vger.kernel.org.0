Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6960A538DC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 May 2022 11:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245269AbiEaJeN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 May 2022 05:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245263AbiEaJeL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 May 2022 05:34:11 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4323DA45
        for <linux-kbuild@vger.kernel.org>; Tue, 31 May 2022 02:34:10 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso903817wma.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 May 2022 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=T4el4Ue5w8GMV0gbkTqusU63CSEH0+g225x/jpSlXdM=;
        b=g6IcS3PMAJZPZmtSDAUoMdS0kr1Myq9fW7JCwh+MQndFIEuoawPbGTQqHe7AH2oPrK
         vw8VdziFGG9CUhSCKwlDgzT/K4dldRPgpsDfyjJ7qbHELDdA+BmguZn1DIhmJaPkTZYv
         2YgVAfro7gby8bZq7MIVJjflC6puM4AS0LobUATvDYT+BGUJgqTMIuEo9WrpKNFH8tUP
         U1t4LXkEtDrg7UIoo6tACH1gopVsUw9l+5m47/tCtfECfvmW8nFZw9fyRlZqV+arKILm
         gZRBweJ2vMfIzn+qZDZmVADM0ArWgo2kP8PzqNy0CLIWuwYtQvtrDqGbUNelsM+SR+KY
         6KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=T4el4Ue5w8GMV0gbkTqusU63CSEH0+g225x/jpSlXdM=;
        b=0jqVZdAuoypwnfjEMMUCXEj/6SmUF5OTUSTVssJ100tqTtayqVFG/mdfwkUM3q8R6x
         bu2FQDbzS+MFuq33qM6Fc6Rpu1feGMf8lpbGh8Pe7pnUkr7gzvbfzYC3uR6piOsOsGY/
         sEDkByGLgPbaskwXa6ZUTV86Esgj7jl9pkskco22QL9f1ocRjqsvJ+EumTaYizy1ThFb
         XmM6QOq4fLL81SQIH4/ZYtoc5B6ez+oimdiqiVO7+dCm2kUknKRTNl118SdRMYJ4YAt6
         lZ+PXisfUSHZ1j4sn1mXQiBwSmMk/fe2gVjApeLA+A5NofjThDxAwbvD/chMOzC1BoyY
         TUqA==
X-Gm-Message-State: AOAM5309VLtr/ZRGHhv69f05wggi/SOZYc6EnQL2xJDsEsRFC91UjwW4
        pYSenz3Hp2/71xdIcqS/WDRokJ2RsbTgkgVJLGSUZF0TsNw=
X-Google-Smtp-Source: ABdhPJwAboKm20wdlu5t8klFV864AwRStQ4J0xmivrWD3CpNfFjEKyZ5ccTTdUMX7ThXJfO+f8nujpSzysw9paroWgg=
X-Received: by 2002:a05:600c:34c7:b0:397:73ae:a096 with SMTP id
 d7-20020a05600c34c700b0039773aea096mr22441362wmq.171.1653989648703; Tue, 31
 May 2022 02:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:600c:1d91:0:0:0:0 with HTTP; Tue, 31 May 2022 02:34:08
 -0700 (PDT)
From:   "Hanni Kasprzak." <hannikasprzak@gmail.com>
Date:   Tue, 31 May 2022 10:34:08 +0100
Message-ID: <CAGJcbYMDH1SHs2Hqi+78dWskar9QRzRqZisN+eS9vSXUc98Vcg@mail.gmail.com>
Subject: CONFIRM
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-- 
Norrebrogade 44
800 Aarhus c
Denmark.

Dear Sir,

Good day, First let me apologize if this email does not suit your business
or personal ethics. I am Hanni Kasprzak .I have been diagnosed with
Esophageal cancer and I am currently undergoing treatment in Denmark.

It has defiled all forms of medical treatment and now I have a few months
to live and I want you to help me distribute my funds to charities. If you
are Interested please mail me back for more detailed information.

Your immediate response to my direct email: hannikasprzak@gmail.com will be
appreciated

Best Regards,

Hanni Kasprzak.
