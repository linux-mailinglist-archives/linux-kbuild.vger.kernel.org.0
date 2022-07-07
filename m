Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E4956A826
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jul 2022 18:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbiGGQcz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jul 2022 12:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbiGGQcy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jul 2022 12:32:54 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB08F564C2
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Jul 2022 09:32:53 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id az35so9171788vkb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jul 2022 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=bY+oGaLUEA8DxG31Yw5r5GmnViCkGbf5DnsdM4ZJmw1AKHXP3EXEMy1+apKgIyEJgJ
         /qHzbPJg5sQnmApePJ4diPT1W7Hn6Qp8YyzBG6/Vj298fMnYmJj1goKRBatg6qpiwgso
         87XR5fOavQA9e0KdZ9j0ev8CBLc5MdIov6vGGjbx139EiVVem/U58WTpINN5kpzYuHFn
         ZaGZwPli2ywtcO32dJK2aoFn0wEXqoVq0A24Z0AFzE5kWKx+soAKGorteoKc0SLZBkXT
         FRlT83SSI2PA7LHI1bCOUTYWSiFxA2hXjWKu8lWmk61dizHdczqayTPpYyitGzAYjXPR
         koTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=4IF4kmcbf//sB697OeESIb1jncgQLtLuXRdk6+3hAqtpLaUVPFHmLqgf+Jy6PpACOp
         vH8mxTKJ7s70vuRvy26ocdvmM0JOcHXzBR3kigjJ38xwERwtZLMcK/DkBMYCAkLoH6xf
         h9A/s0NwQASF0ystV4oPTEpIw9qNMAuuQ6QiR6Jl3mwWFC+RFBJm8kl1pfBFDqwL3Zb1
         9K3aZnkwPDQVX6pUUQzoEYlAzjIXJTLnVRVvJPFp9wlhypzDwVT9cPS82059hcB09O/S
         oKcjZa7jWDrFEVQF+CIEBB2y6mabTSVxmcpasjG9O6uc3DEQ4PfwGUHhDMHdU6piRQ2f
         h6HQ==
X-Gm-Message-State: AJIora8iy/DqRG+QCMCPuT0UP7jpYsz/vedqtUEHZcnAVLyE2lDucCCV
        SFoMGgW6UmtmTtEtnY2kTDeCSL93x2pAZO1xWsI=
X-Google-Smtp-Source: AGRyM1tfqjXOS219tQ/EVg5krIhCOzR828cNVFo/UfB2t/nV0hig5nH4ealejpal6V8913LiCZdO/8U5uXfvK1v2pP4=
X-Received: by 2002:a1f:c781:0:b0:370:73e4:712e with SMTP id
 x123-20020a1fc781000000b0037073e4712emr26805080vkf.37.1657211573027; Thu, 07
 Jul 2022 09:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:8fcf:0:b0:2c9:ec1f:8800 with HTTP; Thu, 7 Jul 2022
 09:32:52 -0700 (PDT)
Reply-To: nas2ri@yahoo.com
From:   e <eeeaa258@gmail.com>
Date:   Thu, 7 Jul 2022 09:32:52 -0700
Message-ID: <CANwOEui3PRN2rUzWasv9tJ5B+dxjEsaK-JpejGPPYYzZVN2WyA@mail.gmail.com>
Subject: =?UTF-8?Q?=C2=BFEst=C3=A1s_ah=C3=AD_para_hablar_conmigo_para_obtener_m=C3=A1s_?=
        =?UTF-8?Q?informaci=C3=B3n_sobre_la_transferencia=2C_por_favor=3F?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [eeeaa258[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [eeeaa258[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


