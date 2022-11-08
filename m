Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D132621075
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Nov 2022 13:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbiKHMZz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Nov 2022 07:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbiKHMZy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2022 07:25:54 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831964FFA3
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Nov 2022 04:25:53 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id o8so10098510qvw.5
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Nov 2022 04:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=jCYo8RYwbrzkYOVj5WJhufPxwk0UsnU4PISt7mt4ZNohQ9iZwPaaAhSViexeI0Z+dP
         S2YVDLAfG6OY7EinrHw2tgpAjGr/Cwwwkmmi39vBEkd++H4pWVZylBAgV5XMo0T+mep/
         iyXisD4zrZT7Y6nFutY95kKPXlip4yzo2fxRTVzTWCBCMD+2ZH6og7L3TeBoF8RoHQg3
         MHdfkTAkCYdUbdD6IIuN2GZCYkKcgzZpoGkiBjrjoYA+tghpmm8mBGjfH7YeVZO/fFTV
         shL0M562/AGZT5C8bUJ7b0pNxUX9GJGIVb8Swo+bJo6/N9JyznkDfZqNJ84203qGMdlk
         EGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=Z7jLQnyE1qdSk81F2on+iks8DAeUojr1NC4pM7Cn5Ij1bgZq85kkZ6rVnzJjgN07c3
         tv86ro71kcbYV22Tyv++blYbEu3TTyEmi8yTpcGrO0g6tbrjKufiJ+BxgfUWpqdg1mOH
         YwxWF4+bQrxa0Sg+JmTFphKW//jZKjmBMD4dDBLLfSruGDttj6pmIASCEaU1znpVi83r
         d16O8N9nJvcNA0sbkz/OU7CLzlAi4WSm5Y7KBkkoQCOx4tWBLZJdH2vWP0OpKNkK2zC7
         VJn9lb0Ytu7MYxyTii+k64PbSMQefbn40CGeQeJLmJE9IGyO7pGjSiugKGAPRM+8SJrq
         uygw==
X-Gm-Message-State: ACrzQf3gOuH2h31GnNA7ovlkEfanFuisAUFMHjoPKE429+z6oFhL84nL
        iis3bdbF7HhvF8cxB9Ir9Ui0krgP6uwh8l7bSAo=
X-Google-Smtp-Source: AMsMyM4enNp/AjKT4tfs0jEImNeET3uerfTgVTfte8XjbOEn2WA2ZRt9BjEVgvhE/yDkDoQCRS1cgyqvGVC029Z6UTg=
X-Received: by 2002:a05:6214:c41:b0:4bb:92b0:3873 with SMTP id
 r1-20020a0562140c4100b004bb92b03873mr50115550qvj.76.1667910352645; Tue, 08
 Nov 2022 04:25:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:2f8a:b0:4bb:6e86:8303 with HTTP; Tue, 8 Nov 2022
 04:25:52 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   Mr Abraham <mr.abraham2021@gmail.com>
Date:   Tue, 8 Nov 2022 12:25:52 +0000
Message-ID: <CAJ2UK+YrtzYn9_zOXMtnYaO0eGg4gorFMzUobrJ_z5o18RFL7Q@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4993]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mr.abraham2021[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mr.abraham2021[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
