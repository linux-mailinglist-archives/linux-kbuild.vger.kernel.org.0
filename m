Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCFE653EA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Dec 2022 12:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiLVLCM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Dec 2022 06:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235363AbiLVLCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Dec 2022 06:02:11 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8203C1AF08
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2022 03:02:09 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-143ffc8c2b2so2106533fac.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2022 03:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=V8EeoIflJ8BqQv82VajRABlvUkLfuqIl07Q4X6ErGYUKn3XCZJfjwVITHDUZrkFeZe
         kMGKje+ok1sQ+bVkW+RfikLzK3YNf+wVVnW41ZN+6FEM7YlLcDYBIuCrHNAVlOn1LEY+
         0hyt7VsukIt4V54v6IODnaFzR5SEGpA9Ob1Xb8et0lyhRok7hwNEVLiqjD9lVoMWt8Jp
         4Dfb3Tl752dn/rFJz6xZWIpazZ7f9sRE6ACLsrM9AG/aKvD2E7STZWrw7py3qt2MUalg
         MpZfSLA9FHsg7Y50rzRae6v2dtfrSxoY0ozcI3x5/ufM3IY2LYPdQztHB6uG8fqQQlQT
         lFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=i16apLQRoZq9Vk7h7qiU0atoBl/FwZf5culi7zh+XSdKy/1P2nvHzXi1SlJ1j9fVK9
         aZuniaNinbGEH4XZ2elHkbxUMNbb8L1ZCbOkv18ZokiiNnlEDqUxT3jtejEiNCBYJOkR
         2axLrQbMbo5+RWgNM5RmMH8yQ1TASzLngL36MpbbfKgxMAnBc9h/XWpJ+TrlzMSPqf09
         Fu/TLp3rx6Jzzrpwj0RIIb9pMrGR6Rr2i620V1u7TGZij3gpidWQB6D8qiy3kyFfq0BW
         mqBAtrG2VeovNwn601KwDf8wTFZxk9DqQYXGuF2waWHK9135XCqx4N+uNQFXRuefkP9x
         x4+Q==
X-Gm-Message-State: AFqh2kpCOwCiOnypsJbt0pyoDbkp+WnzW6IdBo8SL7VHtA6miwv6HcxS
        txVHhBaSUJcRClKmJAnWU1gIxQLmHY4x+4hCB90=
X-Google-Smtp-Source: AMrXdXv1yKoO9OaENHm+x41tsb187xYXgL5lP8p1t/MSlcCArR2u1fbu+4ZruYssOdO4peSyC+fryGocEIi8yz1uEH4=
X-Received: by 2002:a05:6870:2dc7:b0:142:3bc5:a105 with SMTP id
 op7-20020a0568702dc700b001423bc5a105mr306915oab.15.1671706928881; Thu, 22 Dec
 2022 03:02:08 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:7502:b0:df:ef52:64dd with HTTP; Thu, 22 Dec 2022
 03:02:08 -0800 (PST)
Reply-To: subik7633@gmail.com
From:   Susan Bikram <redw07882@gmail.com>
Date:   Thu, 22 Dec 2022 03:02:08 -0800
Message-ID: <CAND8bML6s7sy=nyLg=Savdshi5vZv8XGdK+MbbVzPA3=LApiTQ@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
