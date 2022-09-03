Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3F55ABEA7
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Sep 2022 13:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiICLMK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Sep 2022 07:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiICLMJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Sep 2022 07:12:09 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63D06B8CC
        for <linux-kbuild@vger.kernel.org>; Sat,  3 Sep 2022 04:12:08 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id v15so2453644iln.6
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Sep 2022 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=upPQCftHoDomU/3682Givj5uYVRty3lpN8O9J87AHeU=;
        b=W2Cs5pOiDVytUfYn0uizp7RXDbljkNyI8Dhko8tlRlo6JVOF+8fz/ofEnrfCfBet9/
         jAbbj/Xt/+exyVQc5N8y/9JXizhTMmQmgOhTApFevOtz+nJ0Pef7ocFysG02PA7shToK
         NSgXjhtcZK0OXJOQ4KKLz9xd0I59zOgAT18MP5uzBTjP4rM+WEo9wcCmX/hoYhQ0o2SG
         3pWCweraeq3Br/JbNB2c5s1UA8HCX6aGicJ8A2mYtzaVxJNei/W8zhfCsjshUlMr+O35
         4WaQ83rG59DgKd43Kp+CSPKV669mcYyxgcd2MYuc/9I1T09/Twpmqcc5BKaI54iD1ia+
         OU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=upPQCftHoDomU/3682Givj5uYVRty3lpN8O9J87AHeU=;
        b=W6rPxQcW5+NvCGBmJS9DRZAOOZIXw+PHRVbTtnuDDS+LsgsU1j9GN/h9a2dyY/o3vG
         wpuTkCpC8eJZcc5egNyftuawPhk6z9z7Gw66KCFi+ym8WR82pPcnnbA4kWgkF8u9k6qk
         IKlR3wMVcBUJ/Z7wQY7VVCvI2GDWjOZYyu/PA1N/7Syj/gX252NqUaCHeuOUrfCUvALp
         UWW50cwNHVTzoaIRbiqTBNjSd5a16wYT7O7hjSwJpXGT+Z3YG+tTaK+HfV2hAEBqew3C
         GgQ5bWImcpiinSHgxsWoDA0+/kP000YrZBmkJVL+IapeJHDEHAfBcoGSuEJGgAjylJ1l
         9icA==
X-Gm-Message-State: ACgBeo1oAdwg0RhlknmnSf9cPcCWw3g3N6ZQPg9skEM/rdQkDu8f4kxM
        0Wfcj4opru0NAQOzpkgaFySdLuyuTha8GJC+fa0=
X-Google-Smtp-Source: AA6agR5u82IenTTZlNyFhN+CTCwId5d/4S87HXnQ084aLVMqdXXNPWG8SDlMrh+vJAaCKk63KRFDIo/ryHjxL8l7EY4=
X-Received: by 2002:a92:cbc4:0:b0:2e7:147b:6f7 with SMTP id
 s4-20020a92cbc4000000b002e7147b06f7mr21558078ilq.174.1662203527970; Sat, 03
 Sep 2022 04:12:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:2b1d:0:0:0:0:0 with HTTP; Sat, 3 Sep 2022 04:12:07 -0700 (PDT)
Reply-To: Dr_natalia.johnson@proton.me
From:   "Dr .Natalia Johnson" <ttrvcdzwwqz01@gmail.com>
Date:   Sat, 3 Sep 2022 14:12:07 +0300
Message-ID: <CABq-8SQ2TYaFwdvBh6vJMu5L2eYDj+cDubi6s0neFLm7NV2O-w@mail.gmail.com>
Subject: Good Day Friend,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is the information

   My name is Dr .Natalia Johnson from United States of America living
in Italy am 33 years old medical doctor.
    I have important thing to discuss with you.. you can reach out to
me by my private email address (Dr_natalia.johnson@proton.me)

Thanks.

Dr .Natalia Johnson
